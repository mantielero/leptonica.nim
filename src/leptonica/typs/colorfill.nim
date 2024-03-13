import pix_internal, environ, arrayy
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
##  \file colorfill.h
##
##  <pre>
##   Contains the following struct
##       struct L_Colorfill
##
##   This accumulates color information, linked to location, within a
##   set of tiles that (mostly) covers an input RGB image.
##  </pre>
##
## ------------------------------------------------------------------------*
##                             Colorfill data                              *
## ------------------------------------------------------------------------
## ! Colorfill data

type
  L_Colorfill* {.importc: "L_Colorfill", header: "colorfill.h", bycopy.} = object
    pixs* {.importc: "pixs".}: ptr Pix
    ## !< clone of source pix
    pixst* {.importc: "pixst".}: ptr Pix
    ## !< source pix, after optional transform
    nx* {.importc: "nx".}: LInt32
    ## !< number of tiles in each tile row
    ny* {.importc: "ny".}: LInt32
    ## !< number of tiles in each tile column
    tw* {.importc: "tw".}: LInt32
    ## !< width of each tile
    th* {.importc: "th".}: LInt32
    ## !< height of each tile
    minarea* {.importc: "minarea".}: LInt32
    ## !< min number of pixels in a color region
    boxas* {.importc: "boxas".}: ptr Boxa
    ## !< tile locations
    pixas* {.importc: "pixas".}: ptr Pixa
    ## !< tiles from source pix
    pixam* {.importc: "pixam".}: ptr Pixa
    ## !< mask tiles with components covering
    ## !< regions with similar color
    naa* {.importc: "naa".}: ptr Numaa
    ## !< sizes of color regions (in pixels)
    dnaa* {.importc: "dnaa".}: ptr L_Dnaa
    ## !< average color in each region
    pixadb* {.importc: "pixadb".}: ptr Pixa
    ## !< debug reconstruction from segmentation

