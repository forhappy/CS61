/**********************************************************************
 
BETA User Space spinlocks for POSIX systems lacking this functionality.
Copyright (C) 2003-2006 Michael M. Lampkin 
Contact at michael.lampkin<at>ieee.org

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
version 2 along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301

**********************************************************************/

#define _POSIX_C_SOURCE 200112L
#define _XOPEN_SOURCE 600

#define SPINLOCK_SPIN_MAX 50

#include <errno.h>
#include <pthread.h>
#include <sched.h>
#include <string.h>
#include <unistd.h>

/**
 Need this "unique" value that we can use to take any spinlock
 that has been initialized and identify attempts to call init
 multiple times without corresponding calls to destroy.  A hard
 coded value should be fine though still a 1 in 4 billion chance
 of collision with random data in un-inited spinlock.
**/

static long int spin_magic = 0x2FCD51F9L;

/**
  The spinlock structure which should NEVER be manipulated
  by user code.

  owner:
    a pthread_t var indicating the current owner of the
    spinlock or filled with 0's if not owned

  mutex:
    the primary mutex that any incoming threads will spin on
    and attempt to obtain.
    
  magic:
    a field to hold a sentinel value indicating if the spinlock
    is initialized.
   
**/

typedef struct
{
  pthread_t       owner;
  pthread_mutex_t mutex;
  long int        magic;
} 
spinlock;

/**
 Function: spinlock_init

 Description:

   Initializes and allocates system resources to a
   spinlock structure.

 Parameters:

   spin - a pointer to the spinlock structure to
     be initialized.

   pshared - either PTHREAD_PROCESS_PRIVATE or
     PTHREAD_PROCESS_SHARED.  If the system does not
     support process shared mutexes or an unknown value
     is given then defaults internally to a private type
     with no error.
**/

int spinlock_init( spinlock * spin, int pshared )
{
  int result;

  pthread_mutexattr_t attr;

  /* If already inited... race condition with destroy */

  if ( NULL == spin )
  {
    return EINVAL;
  }

  if ( spin_magic == spin->magic )
  {
    return EBUSY;
  }

  ( void ) memset( & spin->owner, 0, sizeof( pthread_t ) );

  /* Set our process sharing attribute - default to PRIVATE */

  result = pthread_mutexattr_init( & attr );

  if ( 0 == result )
  {
    if ( 0 < sysconf( _SC_THREAD_PROCESS_SHARED ) )
    {
      if( PTHREAD_PROCESS_SHARED == pshared )
      {
        result = pthread_mutexattr_setpshared( & attr, pshared );
      }
      else
      {
        result = pthread_mutexattr_setpshared( & attr, PTHREAD_PROCESS_PRIVATE );
      }
    }
  }

  /* Need to add this to prevent recursive mutex default on some sys */

  if ( 0 == result )
  {
    result = pthread_mutexattr_settype( & attr, PTHREAD_MUTEX_ERRORCHECK );
  }

  /* The following is a race against simultaneous calls to init */

  if ( 0 == result )
  {
    result = pthread_mutex_init( & spin->mutex, & attr );
  }

  if ( 0 == result )
  {
    spin->magic = spin_magic;     
  }

  ( void ) pthread_mutexattr_destroy( & attr );

  return result;
}

/**
 Function: spinlock_destroy

 Description:

   Releases system resources allocated to a spinlock
   structure during initializion.

 Parameters:

   spin - a pointer to a previously initialized but
     not destroyed spinlock.
**/

int spinlock_destroy( spinlock * spin )
{
  int result;

  if ( NULL == spin || spin_magic != spin->magic )
  {
    return EINVAL;
  }

  if ( 0 != ( result = pthread_mutex_destroy( & spin->mutex ) ) )
  {
    return result;
  }

  ( void ) memset( & spin->owner, 0, sizeof( pthread_t ) );

  /**
   A return of EINVAL on destroy means another thread is
   also destroying.  Ignore it.
  **/

  spin->magic = 0;

  return 0;
}

/**
 Function: spinlock_lock

 Description:

   Attempts to acquire exclusive access to the specified
   spinlock.  If the spinlock is already owned then begin
   spinning until ownership is obtained.

 Parameters:

   spin - a pointer to an initialized spinlock.
**/

int spinlock_lock( spinlock * spin )
{
  pthread_t self;

  int result;

  int spin_count;

  if ( NULL == spin || spin_magic != spin->magic )
  {
    return EINVAL;
  }

  self = pthread_self( );

  if ( 0 == memcmp( & spin->owner, & self, sizeof( pthread_t ) ) )
  {
    return EDEADLK;
  }

  for ( ; 0 != ( result = pthread_mutex_trylock( & spin->mutex ) ) ; )
  {
    if ( EBUSY == result )
    {
      ++ spin_count;

      if ( SPINLOCK_SPIN_MAX == spin_count )
      {
        ( void ) sched_yield( );

        spin_count = 0;
      }
    }
    else
    {
      /* Destroy occurred on us... */

      return EINVAL;
    }
  }

  ( void ) memcpy( & spin->owner, & self, sizeof( pthread_t ) );

  return result;
}

/**
 Function: spinlock_trylock

 Description:

   Attempts to acquire exclusive access to the specified
   spinlock.  If the spinlock is already owned by another
   thread then return immediately.

 Parameters:

   spin - a pointer to an initialized spinlock.
**/

int spinlock_trylock( spinlock * spin )
{
  int result;

  if ( NULL == spin || spin_magic != spin->magic )
  {
    return EINVAL;
  }

  if ( 0 == ( result = pthread_mutex_trylock( & spin->mutex ) ) )
  {
    ( void ) memcpy( & spin->owner, & self, sizeof( pthread_t ) );
  }

  return result;
}

/**
 Function: spinlock_unlock

 Description:

   Releases exclusive ownership of the specified
   spinlock.

 Parameters:

   spin - a pointer to an initialized spinlock.
**/

int spinlock_unlock( spinlock * spin )
{
  int result;

  if ( NULL == spin || spin_magic != spin->magic )
  {
    return EINVAL;
  }

  ( void ) memset( & spin->owner, 0, sizeof( pthread_t ) );

  return pthread_mutex_unlock( & spin->mutex );
}
