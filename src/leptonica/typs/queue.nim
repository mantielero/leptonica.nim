import environ, stack
## ====================================================================*
##  -  Copyright (C) 2001 Leptonica.  All rights reserved.
##  -
##  -  Redistribution and use in source and binary forms, with or without
##  -  modification, are permitted provided that the following conditions
##  -  are met:
##  -  1. Redistributions of source code must retain the above copyright
##  -     notice, this list of conditions and the following disclaimer.
##  -  2. Redistributions in binary form must reproduce the above
##  -     copyright notice, this list of conditions and the following
##  -     disclaimer in the documentation and/or other materials
##  -     provided with the distribution.
##  -
##  -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
##  -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
##  -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
##  -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
##  -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
##  -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
##  -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
##  -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
##  -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
##  -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
##  -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
## ====================================================================

## !
##  \file queue.h
##
##  <pre>
##       Expandable pointer queue for arbitrary void* data.
##
##       The L_Queue is a fifo that implements a queue of void* pointers.
##       It can be used to hold a queue of any type of struct.
##
##       Internally, it maintains two counters:
##           nhead:  location of head (in ptrs) from the beginning
##                   of the array.
##           nelem:  number of ptr elements stored in the queue.
##
##       The element at the head of the queue, which is the next to
##       be removed, is array[nhead].  The location at the tail of the
##       queue to which the next element will be added is
##       array[nhead + nelem].
##
##       As items are added to the queue, nelem increases.
##       As items are removed, nhead increases and nelem decreases.
##       Any time the tail reaches the end of the allocated array,
##       all the pointers are shifted to the left, so that the head
##       is at the beginning of the array.
##       If the array becomes more than 3/4 full, it doubles in size.
##
##       The auxiliary stack can be used in a wrapper for re-using
##       items popped from the queue.  It is not made by default.
##
##       For further implementation details, see queue.c.
##  </pre>
##
## ! Expandable pointer queue for arbitrary void* data

type
  L_Queue* {.importc: "L_Queue", header: "queue.h", bycopy.} = object
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< size of allocated ptr array
    nhead* {.importc: "nhead".}: LInt32
    ## !< location of head (in ptrs) from the
    ## !< beginning of the array
    nelem* {.importc: "nelem".}: LInt32
    ## !< number of elements stored in the queue
    array* {.importc: "array".}: ptr pointer
    ## !< ptr array
    stack* {.importc: "stack".}: ptr L_Stack
    ## !< auxiliary stack

