#include <${1:`!p
import os
snip.rv = os.path.splitext(snip.fn)[0]`}.h> 
#include <stdlib.h>

struct ${1/.*\///}_priv {
	$0
};


struct ${1/.*\///} * create_${1/.*\///}() 
{
  struct ${1/.*\///} * self = malloc(sizeof *self);

  if (!self) {
    return NULL;
  }

  self->p = malloc(sizeof *self->p);

  if (self->p) {
    free(self);
    return NULL;
  }



  return self;
}


void destroy_${1/.*\///}(struct ${1/.*\///} * self) 
{
  if (self) {
    free(self->p);
  }
  free(self);
}
