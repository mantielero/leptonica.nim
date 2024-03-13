import pix_internal, environ
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
##  \file bmf.h
##
##      Simple data structure to hold bitmap fonts and related data
##
## ! Constants for deciding when text block is divided into paragraphs
## ! Split Text

const
  SPLIT_ON_LEADING_WHITE* = 1 ## !< tab or space at beginning of line
  SPLIT_ON_BLANK_LINE* = 2   ## !< newline with optional white space
  SPLIT_ON_BOTH* = 3

## ! Data structure to hold bitmap fonts and related data

type
  L_Bmf* {.importc: "L_Bmf", header: "bmf.h", bycopy.} = object
    pixa* {.importc: "pixa".}: ptr Pixa
    ## !< pixa of bitmaps for 93 characters
    size* {.importc: "size".}: LInt32
    ## !< font size (in points at 300 ppi)
    directory* {.importc: "directory".}: cstring
    ## !< directory containing font bitmaps
    baseline1* {.importc: "baseline1".}: LInt32
    ## !< baseline offset for ascii 33 - 57
    baseline2* {.importc: "baseline2".}: LInt32
    ## !< baseline offset for ascii 58 - 91
    baseline3* {.importc: "baseline3".}: LInt32
    ## !< baseline offset for ascii 93 - 126
    lineheight* {.importc: "lineheight".}: LInt32
    ## !< max height of line of chars
    kernwidth* {.importc: "kernwidth".}: LInt32
    ## !< pixel dist between char bitmaps
    spacewidth* {.importc: "spacewidth".}: LInt32
    ## !< pixel dist between word bitmaps
    vertlinesep* {.importc: "vertlinesep".}: LInt32
    ## !< extra vertical space between text lines
    fonttab* {.importc: "fonttab".}: ptr LInt32
    ## !< table mapping ascii --> font index
    baselinetab* {.importc: "baselinetab".}: ptr LInt32
    ## !< table mapping ascii --> baseline offset
    widthtab* {.importc: "widthtab".}: ptr LInt32
    ## !< table mapping ascii --> char width

