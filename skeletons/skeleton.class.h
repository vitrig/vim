#ifndef ${1:`!p
if not snip.c:
	import random, string
	name = re.sub(r'[^A-Za-z0-9]+','_', snip.fn).upper()
	rand = ''.join(random.sample(string.ascii_letters+string.digits, 8))
	snip.rv = ('%s_%s' % (name,rand)).upper()
else:
	snip.rv = snip.c`}
#define $1

struct ${2:`!p
import os
snip.rv = os.path.splitext(snip.fn)[0]`} {
	struct $2_priv p;
	$0
};

/**
 * create_$2 - creates $2
 * 
 * Returns instance of $2} 
 */
struct $2 * create_$2();


/** 
 * destroy_$2 - $2 destructor
 * 
 * @self: instance of $2
 */
void destroy_$2(struct $2 * self);


#endif /* end of include guard: $1 */
