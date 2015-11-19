#include <${1:`!p
import os
snip.rv = os.path.splitext(snip.fn)[0]`}.h> 

struct ${1/.*\///}
	$0
};


struct ${1/.*\///} * create_${1/.*\///}() 
{
  struct ${1/.*\///} * self = malloc(sizeof *self);
  self->p = malloc(sizeof *self->p);

  return self;
}


void destroy_${1/.*\///}(struct ${1/.*\///} * self) 
{
  if (self) {
    free(self->p);
  }
  free(self);
}
