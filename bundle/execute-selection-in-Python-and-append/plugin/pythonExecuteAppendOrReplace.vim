python << EOL
import vim, StringIO,sys

PYTHON_START="```py"
PYTHON_END="```"




def separate_input_and_python_code(r):
  before = []
  after = []
  python = []
  token_reached = False

  it = iter(r[:])
  for line in it:
      if line == PYTHON_START:
          token_reached = True
          break
      before.append(line)

  for line in it:
      if line == PYTHON_END:
          token_reached = True
          break
      python.append(line)

  after.extend(list(it))

  if not token_reached:
      """If no PYTHON_START or PYTHON_END was reached, then all lines are python"""
      return [], [], r[:]

  return before, after, python

def execute(r):
  lines_above, lines_below, py = separate_input_and_python_code(r)
  lines = lines_above + lines_below
  content_above = '\n'.join(lines_above) + '\n'
  content_below = '\n'.join(lines_below) + '\n'
  content = content_above + content_below
  exec('\n'.join(py) + '\n')

def PyExecAppend(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  execute(r)
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r.append(output[:-1]) # the -1 is to remove the final blank line
  redirected.close()

def PyExecReplace(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  execute(r)
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r[:] = output[:-1] # the -1 is to remove the final blank line
  redirected.close()
EOL
command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)
command -range Pyea python PyExecAppend(<f-line1>,<f-line2>)
