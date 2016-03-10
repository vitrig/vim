#ifndef __${1:`!p
if not snip.c:
	import random, string, os
  fn, ext = os.path.splitext(snip.fn)
	name = re.sub(r'[^A-Za-z0-9]+','_', fn)
	snip.rv = name
else:
	snip.rv = snip.c`}__`!p
if not snip.c:
	rand = ''.join(random.sample(string.ascii_letters+string.digits, 8))
	snip.rv = ('%s' % rand).upper()
else:
  snip.rv = snip.c`
#define __$1__`!p
if not snip.c:
	snip.rv = ('%s' % rand).upper()
else:
  snip.rv = snip.c`

class $1 {
public:
  $1();
  ~$1();
  $0
};

#endif 
