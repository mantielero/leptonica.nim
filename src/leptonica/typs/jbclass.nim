import arrayy, environ, pix_internal
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
##  \file jbclass.h
##
##        JbClasser
##        JbData
##
## !
##  <pre>
##  The JbClasser struct holds all the data accumulated during the
##  classification process that can be used for a compressed
##  jbig2-type representation of a set of images.  This is created
##  in an initialization process and added to as the selected components
##  on each successive page are analyzed.
##  </pre>
##

type
  JbClasser* {.importc: "JbClasser", header: "jbclass.h", bycopy.} = object
    safiles* {.importc: "safiles".}: ptr Sarray
    ## !< input page image file names
    `method`* {.importc: "method".}: LInt32
    ## !< JB_RANKHAUS, JB_CORRELATION
    components* {.importc: "components".}: LInt32
    ## !< JB_CONN_COMPS, JB_CHARACTERS or
    ## !< JB_WORDS
    maxwidth* {.importc: "maxwidth".}: LInt32
    ## !< max component width allowed
    maxheight* {.importc: "maxheight".}: LInt32
    ## !< max component height allowed
    npages* {.importc: "npages".}: LInt32
    ## !< number of pages already processed
    baseindex* {.importc: "baseindex".}: LInt32
    ## !< number components already processed
    ## !< on fully processed pages
    nacomps* {.importc: "nacomps".}: ptr Numa
    ## !< number of components on each page
    sizehaus* {.importc: "sizehaus".}: LInt32
    ## !< size of square struct elem for haus
    rankhaus* {.importc: "rankhaus".}: LFloat32
    ## !< rank val of haus match, each way
    thresh* {.importc: "thresh".}: LFloat32
    ## !< thresh value for correlation score
    weightfactor* {.importc: "weightfactor".}: LFloat32
    ## !< corrects thresh value for heaver
    ## !< components; use 0 for no correction
    naarea* {.importc: "naarea".}: ptr Numa
    ## !< w * h of each template, without
    ## !< extra border pixels
    w* {.importc: "w".}: LInt32
    ## !< max width of original src images
    h* {.importc: "h".}: LInt32
    ## !< max height of original src images
    nclass* {.importc: "nclass".}: LInt32
    ## !< current number of classes
    keepPixaa* {.importc: "keep_pixaa".}: LInt32
    ## !< If zero, pixaa isn't filled
    pixaa* {.importc: "pixaa".}: ptr Pixaa
    ## !< instances for each class; unbordered
    pixat* {.importc: "pixat".}: ptr Pixa
    ## !< templates for each class; bordered
    ## !< and not dilated
    pixatd* {.importc: "pixatd".}: ptr Pixa
    ## !< templates for each class; bordered
    ## !< and dilated
    dahash* {.importc: "dahash".}: ptr L_DnaHash
    ## !< Hash table to find templates by size
    nafgt* {.importc: "nafgt".}: ptr Numa
    ## !< fg areas of undilated templates;
    ## !< only used for rank < 1.0
    ptac* {.importc: "ptac".}: ptr Pta
    ## !< centroids of all bordered cc
    ptact* {.importc: "ptact".}: ptr Pta
    ## !< centroids of all bordered template cc
    naclass* {.importc: "naclass".}: ptr Numa
    ## !< array of class ids for each component
    napage* {.importc: "napage".}: ptr Numa
    ## !< array of page nums for each component
    ptaul* {.importc: "ptaul".}: ptr Pta
    ## !< array of UL corners at which the
    ## !< template is to be placed for each
    ## !< component
    ptall* {.importc: "ptall".}: ptr Pta
    ## !< similar to ptaul, but for LL corners


## !
##  <pre>
##  The JbData struct holds all the data required for
##  the compressed jbig-type representation of a set of images.
##  The data can be written to file, read back, and used
##  to regenerate an approximate version of the original,
##  which differs in two ways from the original:
##    (1) It uses a template image for each c.c. instead of the
##        original instance, for each occurrence on each page.
##    (2) It discards components with either a height or width larger
##        than the maximuma, given here by the lattice dimensions
##        used for storing the templates.
##  </pre>
##

type
  JbData* {.importc: "JbData", header: "jbclass.h", bycopy.} = object
    pix* {.importc: "pix".}: ptr Pix
    ## !< template composite for all classes
    npages* {.importc: "npages".}: LInt32
    ## !< number of pages
    w* {.importc: "w".}: LInt32
    ## !< max width of original page images
    h* {.importc: "h".}: LInt32
    ## !< max height of original page images
    nclass* {.importc: "nclass".}: LInt32
    ## !< number of classes
    latticew* {.importc: "latticew".}: LInt32
    ## !< lattice width for template composite
    latticeh* {.importc: "latticeh".}: LInt32
    ## !< lattice height for template composite
    naclass* {.importc: "naclass".}: ptr Numa
    ## !< array of class ids for each component
    napage* {.importc: "napage".}: ptr Numa
    ## !< array of page nums for each component
    ptaul* {.importc: "ptaul".}: ptr Pta
    ## !< array of UL corners at which the
    ## !< template is to be placed for each
    ## !< component


## ! JB Classifier

const
  JB_RANKHAUS* = 0
  JB_CORRELATION* = 1

## ! For jbGetComponents(): type of component to extract from images
## ! JB Component

const
  JB_CONN_COMPS* = 0
  JB_CHARACTERS* = 1
  JB_WORDS* = 2

## ! These parameters are used for naming the two files
##  in which the jbig2-like compressed data is stored.

const
  JB_TEMPLATE_EXT* = ".templates.png"
  JB_DATA_EXT* = ".data"
