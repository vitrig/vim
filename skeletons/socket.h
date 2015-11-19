#ifndef __socket__XI7YBTDV
#define __socket__XI7YBTDV


struct socket
  struct socket_priv p;
  
};

/**
 * create_socket - creates socket
 * 
 * Returns instance of socket} 
 */
struct socket * create_socket();


/** 
 * destroy_socket - socket destructor
 * 
 * @self: instance of socket
 */
void destroy_socket(struct socket * self);


#endif /* end of include guard: __socket__XI7YBTDV
*/
