{.experimental:"codereordering".}
import environ
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
##
##  Modified from the excellent code here:
##      http://en.literateprograms.org/Red-black_tree_(C)?oldid=19567
##  which has been placed in the public domain under the Creative Commons
##  CC0 1.0 waiver (http://creativecommons.org/publicdomain/zero/1.0/).
##
##  When the key is generated from a hash (e.g., string --> uint64),
##  there is always the possibility of having collisions, but to make
##  the collision probability very low requires using a large hash.
##  For that reason, the key types are 64 bit quantities, which will result
##  in a negligible probabililty of collisions for millions of hashed values.
##  Using 8 byte keys instead of 4 byte keys requires a little more
##  storage, but the simplification in being able to ignore collisions
##  with the red-black trees for most applications is worth it.
##

## ! The three valid key types for red-black trees, maps and sets.
## ! RBTree Key Type

const
  L_INT_TYPE* = 1
  L_UINT_TYPE* = 2
  L_FLOAT_TYPE* = 3

## !
##  Storage for keys and values for red-black trees, maps and sets.
##  <pre>
##  Note:
##    (1) Keys and values of the valid key types are all 64-bit
##    (2) (void *) can be used for values but not for keys.
##  </pre>
##

type
  RbType* {.importc: "Rb_Type", header: "rbtree.h", bycopy, union.} = object
    itype* {.importc: "itype".}: LInt64
    utype* {.importc: "utype".}: LUint64
    ftype* {.importc: "ftype".}: LFloat64
    ptype* {.importc: "ptype".}: pointer

  L_Rbtree* {.importc: "L_Rbtree", header: "rbtree.h", bycopy.} = object
    root* {.importc: "root".}: ptr L_RbtreeNode
    keytype* {.importc: "keytype".}: LInt32

  L_Amap* = L_Rbtree

##  hide underlying implementation for map

type
  L_Aset* = L_Rbtree

##  hide underlying implementation for set

type
  L_RbtreeNode* {.importc: "L_Rbtree_Node", header: "rbtree.h", bycopy.} = object
    key* {.importc: "key".}: RbType
    value* {.importc: "value".}: RbType
    left* {.importc: "left".}: ptr L_RbtreeNode
    right* {.importc: "right".}: ptr L_RbtreeNode
    parent* {.importc: "parent".}: ptr L_RbtreeNode
    color* {.importc: "color".}: LInt32

  L_Amap_Node* = L_RbtreeNode

##  hide tree implementation

type
  L_Aset_Node* = L_RbtreeNode

##  hide tree implementation
