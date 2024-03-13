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

## !
##  \file morph.h
##
##  <pre>
##   Contains the following structs:
##       struct Sel
##       struct Sela
##       struct Kernel
##
##   Contains definitions for:
##       morphological b.c. flags
##       structuring element types
##       runlength flags for granulometry
##       direction flags for grayscale morphology
##       morphological operation flags
##       standard border size
##       grayscale intensity scaling flags
##       morphological tophat flags
##       arithmetic and logical operator flags
##       grayscale morphology selection flags
##       distance function b.c. flags
##       image comparison flags
##  </pre>
##
## -------------------------------------------------------------------------*
##                              Sel and Sel array                           *
## -------------------------------------------------------------------------

const
  SEL_VERSION_NUMBER* = 1

## ! Selection

type
  Sel* {.importc: "Sel", header: "morph.h", bycopy.} = object
    sy* {.importc: "sy".}: LInt32
    ## !< sel height
    sx* {.importc: "sx".}: LInt32
    ## !< sel width
    cy* {.importc: "cy".}: LInt32
    ## !< y location of sel origin
    cx* {.importc: "cx".}: LInt32
    ## !< x location of sel origin
    data* {.importc: "data".}: ptr ptr LInt32
    ## !< {0,1,2}; data[i][j] in [row][col] order
    name* {.importc: "name".}: cstring
    ## !< used to find sel by name


## ! Array of Sel

type
  Sela* {.importc: "Sela", header: "morph.h", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of sel actually stored
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< size of allocated ptr array
    sel* {.importc: "sel".}: ptr ptr Sel
    ## !< sel ptr array


## -------------------------------------------------------------------------*
##                                  Kernel                                  *
## -------------------------------------------------------------------------

const
  KERNEL_VERSION_NUMBER* = 2

## ! Kernel

type
  L_Kernel* {.importc: "L_Kernel", header: "morph.h", bycopy.} = object
    sy* {.importc: "sy".}: LInt32
    ## !< kernel height
    sx* {.importc: "sx".}: LInt32
    ## !< kernel width
    cy* {.importc: "cy".}: LInt32
    ## !< y location of kernel origin
    cx* {.importc: "cx".}: LInt32
    ## !< x location of kernel origin
    data* {.importc: "data".}: ptr ptr LFloat32
    ## !< data[i][j] in [row][col] order


## -------------------------------------------------------------------------*
##                  Morphological boundary condition flags                  *
##                                                                          *
##   Two types of boundary condition for erosion.                           *
##   The global variable MORPH_BC takes on one of these two values.         *
##   See notes in morph.c for usage.                                        *
## -------------------------------------------------------------------------
## ! Morph Boundary

const
  SYMMETRIC_MORPH_BC* = 0
  ASYMMETRIC_MORPH_BC* = 1

## -------------------------------------------------------------------------*
##                         Structuring element vals                         *
## -------------------------------------------------------------------------
## ! SEL Vals

const
  SEL_DONT_CARE* = 0
  SEL_HIT* = 1
  SEL_MISS* = 2

## -------------------------------------------------------------------------*
##                   Runlength flags for granulometry                       *
## -------------------------------------------------------------------------
## ! Runlength Polarity

const
  L_RUN_OFF* = 0
  L_RUN_ON* = 1

## -------------------------------------------------------------------------*
##          Direction flags for grayscale morphology, granulometry,         *
##                  composable Sels, convolution, etc.                      *
## -------------------------------------------------------------------------
## ! Direction Flags

const
  L_HORIZ* = 1
  L_VERT* = 2
  L_BOTH_DIRECTIONS* = 3

## -------------------------------------------------------------------------*
##                    Morphological operation flags                         *
## -------------------------------------------------------------------------
## ! Morph Operator

const
  L_MORPH_DILATE* = 1
  L_MORPH_ERODE* = 2
  L_MORPH_OPEN* = 3
  L_MORPH_CLOSE* = 4
  L_MORPH_HMT* = 5

## -------------------------------------------------------------------------*
##                     Grayscale intensity scaling flags                    *
## -------------------------------------------------------------------------
## ! Pixel Value Scaling

const
  L_LINEAR_SCALE* = 1
  L_LOG_SCALE* = 2

## -------------------------------------------------------------------------*
##                       Morphological tophat flags                         *
## -------------------------------------------------------------------------
## ! Morph Tophat

const
  L_TOPHAT_WHITE* = 0
  L_TOPHAT_BLACK* = 1

## -------------------------------------------------------------------------*
##                 Arithmetic and logical operator flags                    *
##                  (use on grayscale images and Numas)                     *
## -------------------------------------------------------------------------
## ! ArithLogical Ops

const
  L_ARITH_ADD* = 1
  L_ARITH_SUBTRACT* = 2
  L_ARITH_MULTIPLY* = 3      ##  on numas only
  L_ARITH_DIVIDE* = 4        ##  on numas only
  L_UNION* = 5               ##  on numas only
  L_INTERSECTION* = 6        ##  on numas only
  L_SUBTRACTION* = 7         ##  on numas only
  L_EXCLUSIVE_OR* = 8

## -------------------------------------------------------------------------*
##                         Min/max selection flags                          *
## -------------------------------------------------------------------------
## ! MinMax Selection

const
  L_CHOOSE_MIN* = 1          ##  useful in a downscaling "erosion"
  L_CHOOSE_MAX* = 2          ##  useful in a downscaling "dilation"
  L_CHOOSE_MAXDIFF* = 3      ##  useful in a downscaling contrast
  L_CHOOSE_MIN_BOOST* = 4    ##  use a modification of the min value
  L_CHOOSE_MAX_BOOST* = 5

## -------------------------------------------------------------------------*
##             Exterior value b.c. for distance function flags              *
## -------------------------------------------------------------------------
## ! Exterior Value

const
  L_BOUNDARY_BG* = 1         ##  assume bg outside image
  L_BOUNDARY_FG* = 2

## -------------------------------------------------------------------------*
##                          Image comparison flags                          *
## -------------------------------------------------------------------------
## ! Image Comparison

const
  L_COMPARE_XOR* = 1
  L_COMPARE_SUBTRACT* = 2
  L_COMPARE_ABS_DIFF* = 3

## -------------------------------------------------------------------------*
##     Standard size of border added around images for special processing   *
## -------------------------------------------------------------------------

let ADDED_BORDER* {.importc: "ADDED_BORDER", header: "morph.h".}: LInt32

## !< pixels, not bits
