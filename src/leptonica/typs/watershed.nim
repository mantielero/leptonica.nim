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
##  \file watershed.h
##
##      Simple data structure to hold watershed data.
##      All data here is owned by the L_WShed and must be freed.
##
## ! Simple data structure to hold watershed data.

type
  L_WShed* {.importc: "L_WShed", header: "watershed.h", bycopy.} = object
    pixs* {.importc: "pixs".}: ptr Pix
    ## !< clone of input 8 bpp pixs
    pixm* {.importc: "pixm".}: ptr Pix
    ## !< clone of input 1 bpp seed (marker) pixm
    mindepth* {.importc: "mindepth".}: LInt32
    ## !< minimum depth allowed for a watershed
    pixlab* {.importc: "pixlab".}: ptr Pix
    ## !< 16 bpp label pix
    pixt* {.importc: "pixt".}: ptr Pix
    ## !< scratch pix for computing wshed regions
    lines8* {.importc: "lines8".}: ptr pointer
    ## !< line ptrs for pixs
    linem1* {.importc: "linem1".}: ptr pointer
    ## !< line ptrs for pixm
    linelab32* {.importc: "linelab32".}: ptr pointer
    ## !< line ptrs for pixlab
    linet1* {.importc: "linet1".}: ptr pointer
    ## !< line ptrs for pixt
    pixad* {.importc: "pixad".}: ptr Pixa
    ## !< result: 1 bpp pixa of watersheds
    ptas* {.importc: "ptas".}: ptr Pta
    ## !< pta of initial seed pixels
    nasi* {.importc: "nasi".}: ptr Numa
    ## !< numa of seed indicators; 0 if completed
    nash* {.importc: "nash".}: ptr Numa
    ## !< numa of initial seed heights
    namh* {.importc: "namh".}: ptr Numa
    ## !< numa of initial minima heights
    nalevels* {.importc: "nalevels".}: ptr Numa
    ## !< result: numa of watershed levels
    nseeds* {.importc: "nseeds".}: LInt32
    ## !< number of seeds (markers)
    nother* {.importc: "nother".}: LInt32
    ## !< number of minima different from seeds
    lut* {.importc: "lut".}: ptr LInt32
    ## !< lut for pixel indices
    links* {.importc: "links".}: ptr ptr Numa
    ## !< back-links into lut, for updates
    arraysize* {.importc: "arraysize".}: LInt32
    ## !< size of links array
    debug* {.importc: "debug".}: LInt32
    ## !< set to 1 for debug output

