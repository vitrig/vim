" ===========================
" File: VimPyServer.vim
" Description: A Python server to remote control Vim from telnet or netcat,
"   without X-windows nor vim-server.
" Author: Victor Polo de Gyves Montero <degyves@gmail.com>
" License: BSD
" Website: http://github.com/degyves/VimPyServer
" Version: 0.2.1
" ===========================

function! CloseVimPyServer()
python3 << endpython
print('Closing telnet server...')
telnetServer.shutdown(socket.SHUT_RDWR)
print('Telnet server -> Bye!')
endpython
endfunction

function! CloseBuf(port)
python3 << endpython
port=int(vim.eval('a:port'))
connections[port]["open_files"] -= 1

if connections[port]["open_files"] <= 0:
  connections[port]["connection"].close()
  del connections[port]
endpython
endfunction

function! OpenVimPyServer()
python3 << endpython
import vim
import socket
import sys
from _thread import *
HOST='127.0.0.1'
PORT=9879
try:
  env_Port = vim.eval("g:VimPyServer_port")
  print("Using "+ str(env_Port) +" as VimPyServer port.")
  PORT=int(env_Port)
except vim.error as msg:
  print("Using default VimPyServer port: "+str(PORT))
try:
  env_Host = vim.eval("g:VimPyServer_host")
  print("Using "+ env_Host + " as VimPyServer host.")
  HOST=env_Host
except vim.error as msg:
  print("Using default VimPyServer host: "+HOST)
telnetServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

connections={}

def start_client_connection(clientConnection, address):
    try:
      exCommand = clientConnection.recv(4096)
      exCommand = str(exCommand, 'utf-8')

      commands = exCommand.split("|")

      for command in commands:
        print(command)
        reply = b'Received ex-command: ' + exCommand.encode('utf-8')
        vim.command('redir @a')
        vim.command(command.strip())
        vim.command('au BufDelete <buffer> call CloseBuf({})'.format(address[1]))
        vim.command('redir END')
        result = vim.eval('@a')

        connections[address[1]]["open_files"] += 1

      #clientConnection.send(reply)
      #clientConnection.send(b'Result:')
      #clientConnection.send(result.encode('utf-8'))
    except Exception as e:
      print('Error on client VIM-PyServer: ' + str(e))

    try:
      #clientConnection.close()
      pass
    except Exception:
      sys.exc_clear()

def start_server():
  while True:
    try:
      clientConnection, address = telnetServer.accept()
      print('Connection received from ' + address[0] + ':' + str(address[1]))
      # clientConnection.send('VIM telnet server. Received data will be\n')
      # clientConnection.send('interpreted as ex-command. Be cautious.\n')
      connections[address[1]] = {
        "connection": clientConnection,
        "open_files": 0
      }
      start_new_thread( start_client_connection ,( clientConnection, address ) )
    except Exception as e:
      print('Error on client VIM-PyServer: ' + str(e))
      sys.exc_clear()
try:
  telnetServer.bind((HOST, PORT))
  #Only 1 connection allowed.
  telnetServer.listen(1)
  start_new_thread( start_server  ,() )
  print('*** Vim-PyServer created on ' + HOST + ', port ' + str(PORT) + ' ***' )
  print('Be cautious, as ANY data received is treated as ex-mode command!' )
  print('Also, starting and ending carriage return or line feed will be deleted')
  print('For example, running from another shell:')
  print('    echo "e ~/.bashrc" |nc localhost 9876')
  print('will be interpreted on the VIM client as:')
  print('    :e ~/.bashrc')
except Exception as e:
  print(('VIM-PyServer exists! (another vim?) on: '+HOST+', port '+str(PORT)))
  print('Error: '+str(e) )
  sys.exc_clear()
endpython
endfunction

function! VimPyServerMessageToClient( message )
python3 << endpython
import vim
import socket
import sys
HOST='127.0.0.1'
PORT=9875
MESSAGE=''
try:
  env_Host = vim.eval("g:VimPyClient_host")
  print("Using "+ env_Host + " as VimPyClient host.")
  HOST=env_Host
except vim.error as msg:
  print("Using default VimPyClient host: "+HOST)
try:
  env_Port = vim.eval("g:VimPyClient_port")
  print("Using "+ str(env_Port) +" as VimPyClient port.")
  PORT=int(env_Port)
except vim.error as msg:
  print("Using default VimPyClient port: "+str(PORT))
try:
  env_Msg = vim.eval("a:message")
  print("Using "+ env_Msg +" as VimPyClient message.")
  MESSAGE=env_Msg
except Exception as e:
  print("Using default VimPyClient message.")
def start_client():
  try:
    telnetClient = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    telnetClient.connect((HOST, PORT))
    telnetClient.sendall( MESSAGE )
    telnetClient.close()
  except Exception as e:
    print('Error on client VimPyServer: ' + str( e ))
    telnetClient.close()
start_client()
endpython
endfunction

if !has('python3')
	echo "No python detected. VimPyServer will not start."
else
	"if !exists("g:VimPyServer_autostart")
	"	autocmd VimEnter * call OpenVimPyServer()
	"else
	"	if g:VimPyServer_autostart != 0
	"		autocmd VimEnter * call OpenVimPyServer()
	"	else
	"		echo "VimPyServer not started"
	"	end
	"end
end

function! g:CheckIfVimperatorVimPyServer()
	if exists("g:vimperatorVimPyServer")
		if g:vimperatorVimPyServer>=1
			call VimPyServerMessageToClient('End Vimperator mode\n')
			let g:vimperatorVimPyServer=0
		endif
	endif 
endfunction

if !exists("autocommands_VimPyServer")
	let autocommands_VimPyServer = 1
	au BufWritePost * call g:CheckIfVimperatorVimPyServer()
endif

