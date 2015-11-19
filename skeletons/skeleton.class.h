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


struct $1 {
	struct $1_priv * p;
	$0
};

/**
 * create_$1 - creates $1
 * 
 * Returns instance of $1 
 */
struct $1 * create_$1();


/** 
 * destroy_$1 - $1 destructor
 * 
 * @self: instance of $1
 */
void destroy_$1(struct $1 * self);


#endif /* end of include guard: __$1__`!p
if not snip.c:
	snip.rv = ('%s' % rand).upper()
else:
  snip.rv = snip.c`
*/
