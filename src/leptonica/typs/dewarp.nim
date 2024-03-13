{.experimental:"codereordering".}
import environ, arrayy, pix_internal
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
##  \file dewarp.h
##
##  <pre>
##      Data structure to hold arrays and results for generating
##      horizontal and vertical disparity arrays based on textlines.
##      Each disparity array is two-dimensional.  The vertical disparity
##      array gives a vertical displacement, relative to the lowest point
##      in the textlines.  The horizontal disparty array gives a horizontal
##      displacement, relative to the minimum values (for even pages)
##      or maximum values (for odd pages) of the left and right ends of
##      full textlines.  Horizontal alignment always involves translations
##      away from the book gutter.
##
##      We have intentionally separated the process of building models
##      from the rendering process that uses the models.  For any page,
##      the building operation either creates an actual model (that is,
##      a model with at least the vertical disparity being computed, and
##      for which the 'success' flag is set) or fails to create a model.
##      However, at rendering time, a page can have one of two different
##      types of models.
##      (1) A valid model is an actual model that meets the rendering
##          constraints, which are limits on model curvature parameters.
##          See dewarpaTestForValidModel() for details.
##          Valid models are identified by dewarpaInsertRefModels(),
##          which sets the 'vvalid' and 'hvalid' fields.  Only valid
##          models are used for rendering.
##      (2) A reference model is used by a page that doesn't have
##          a valid model, but has a nearby valid model of the same
##          parity (even/odd page) that it can use.  The range in pages
##          to search for a valid model is given by the 'maxdist' field.
##
##      At the rendering stage, vertical and horizontal disparities are
##      treated differently.  It is somewhat more robust to generate
##      vertical disparity models (VDM) than horizontal disparity
##      models (HDM). A valid VDM is required for any correction to
##      be made; if a valid VDM is not available, just use the input
##      image.  Otherwise, assuming it is available, the use of the
##      HDM is controlled by two fields: 'useboth' and 'check_columns'.
##        (a) With useboth == 0, we use only the VDM.
##        (b) With useboth == 1, we require using the VDM and, if a valid
##            horizontal disparity model (HDM) is available, we also use it.
##        (c) With check_columns == 1, check for multiple columns and if
##            true, only use the VDM, even if a valid HDM is available.
##            Note that 'check_columns' takes precedence over 'useboth'
##            when there is more than 1 column of text.  By default,
##            check_columns == 0.
##
##      The 'maxdist' parameter is input when the dewarpa is created.
##      The other rendering parameters have default values given in dewarp1.c.
##      All parameters used by rendering can be set (or reset) using accessors.
##
##      After dewarping, use of the VDM will cause all points on each
##      altered curve to have a y-value equal to the minimum.  Use of
##      the HDA will cause the left and right edges of the textlines
##      to be vertically aligned if they had been typeset flush-left
##      and flush-right, respectively.
##
##      The sampled disparity arrays are expanded to full resolution,
##      using linear interpolation, and this is further expanded
##      by slope continuation to the right and below if the image
##      is larger than the full resolution disparity arrays.  Then
##      the disparity correction can be applied to the input image.
##      If the input pix are 2x reduced, the expansion from sampled
##      to full res uses the product of (sampling) * (redfactor).
##
##      The most accurate results are produced at full resolution, and
##      this is generally recommended.
##  </pre>
##
## ! Dewarp version for serialization
##  <pre>
##  Note on versioning of the serialization of this data structure:
##  The dewarping utility and the stored data can be expected to change.
##  In most situations, the serialized version is ephemeral -- it is
##  not needed after being used.  No functions will be provided to
##  convert between different versions.
##  </pre>
##

const
  DEWARP_VERSION_NUMBER* = 4

## ! Data structure to hold a number of Dewarp

type
  L_Dewarpa* {.importc: "L_Dewarpa", header: "dewarp.h", bycopy.} = object
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< size of dewarp ptr array
    maxpage* {.importc: "maxpage".}: LInt32
    ## !< maximum page number in array
    dewarp* {.importc: "dewarp".}: ptr ptr L_Dewarp
    ## !< array of ptrs to page dewarp
    dewarpcache* {.importc: "dewarpcache".}: ptr ptr L_Dewarp
    ## !< array of ptrs to cached dewarps
    namodels* {.importc: "namodels".}: ptr Numa
    ## !< list of page numbers for pages
    ## !< with page models
    napages* {.importc: "napages".}: ptr Numa
    ## !< list of page numbers with either
    ## !< page models or ref page models
    redfactor* {.importc: "redfactor".}: LInt32
    ## !< reduction factor of input: 1 or 2
    sampling* {.importc: "sampling".}: LInt32
    ## !< disparity arrays sampling factor
    minlines* {.importc: "minlines".}: LInt32
    ## !< min number of long lines required
    maxdist* {.importc: "maxdist".}: LInt32
    ## !< max distance for getting ref page
    maxLinecurv* {.importc: "max_linecurv".}: LInt32
    ## !< maximum abs line curvature,
    ## !< in micro-units
    minDiffLinecurv* {.importc: "min_diff_linecurv".}: LInt32
    ## !< minimum abs diff line
    ## !< curvature in micro-units
    maxDiffLinecurv* {.importc: "max_diff_linecurv".}: LInt32
    ## !< maximum abs diff line
    ## !< curvature in micro-units
    maxEdgeslope* {.importc: "max_edgeslope".}: LInt32
    ## !< maximum abs left or right edge
    ## !< slope, in milli-units
    maxEdgecurv* {.importc: "max_edgecurv".}: LInt32
    ## !< maximum abs left or right edge
    ## !< curvature, in micro-units
    maxDiffEdgecurv* {.importc: "max_diff_edgecurv".}: LInt32
    ## !< maximum abs diff left-right
    ## !< edge curvature, in micro-units
    useboth* {.importc: "useboth".}: LInt32
    ## !< use both disparity arrays if
    ## !< available; only vertical otherwise
    checkColumns* {.importc: "check_columns".}: LInt32
    ## !< if there are multiple columns,
    ## !< only use the vertical disparity
    ## !< array
    modelsready* {.importc: "modelsready".}: LInt32
    ## !< invalid models have been removed
    ## !< and refs built against valid set


## ! Data structure for a single dewarp

type
  L_Dewarp* {.importc: "L_Dewarp", header: "dewarp.h", bycopy.} = object
    dewa* {.importc: "dewa".}: ptr L_Dewarpa
    ## !< ptr to parent (not owned)
    pixs* {.importc: "pixs".}: ptr Pix
    ## !< source pix, 1 bpp
    sampvdispar* {.importc: "sampvdispar".}: ptr FPix
    ## !< sampled vert disparity array
    samphdispar* {.importc: "samphdispar".}: ptr FPix
    ## !< sampled horiz disparity array
    sampydispar* {.importc: "sampydispar".}: ptr FPix
    ## !< sampled slope h-disparity array
    fullvdispar* {.importc: "fullvdispar".}: ptr FPix
    ## !< full vert disparity array
    fullhdispar* {.importc: "fullhdispar".}: ptr FPix
    ## !< full horiz disparity array
    fullydispar* {.importc: "fullydispar".}: ptr FPix
    ## !< full slope h-disparity array
    namidys* {.importc: "namidys".}: ptr Numa
    ## !< sorted y val of midpoint each line
    nacurves* {.importc: "nacurves".}: ptr Numa
    ## !< sorted curvature of each line
    w* {.importc: "w".}: LInt32
    ## !< width of source image
    h* {.importc: "h".}: LInt32
    ## !< height of source image
    pageno* {.importc: "pageno".}: LInt32
    ## !< page number; important for reuse
    sampling* {.importc: "sampling".}: LInt32
    ## !< sampling factor of disparity arrays
    redfactor* {.importc: "redfactor".}: LInt32
    ## !< reduction factor of pixs: 1 or 2
    minlines* {.importc: "minlines".}: LInt32
    ## !< min number of long lines required
    nlines* {.importc: "nlines".}: LInt32
    ## !< number of long lines found
    mincurv* {.importc: "mincurv".}: LInt32
    ## !< min line curvature in micro-units
    maxcurv* {.importc: "maxcurv".}: LInt32
    ## !< max line curvature in micro-units
    leftslope* {.importc: "leftslope".}: LInt32
    ## !< left edge slope in milli-units
    rightslope* {.importc: "rightslope".}: LInt32
    ## !< right edge slope in milli-units
    leftcurv* {.importc: "leftcurv".}: LInt32
    ## !< left edge curvature in micro-units
    rightcurv* {.importc: "rightcurv".}: LInt32
    ## !< right edge curvature in micro-units
    nx* {.importc: "nx".}: LInt32
    ## !< number of sampling pts in x-dir
    ny* {.importc: "ny".}: LInt32
    ## !< number of sampling pts in y-dir
    hasref* {.importc: "hasref".}: LInt32
    ## !< 0 if normal; 1 if has a refpage
    refpage* {.importc: "refpage".}: LInt32
    ## !< page with disparity model to use
    vsuccess* {.importc: "vsuccess".}: LInt32
    ## !< sets to 1 if vert disparity builds
    hsuccess* {.importc: "hsuccess".}: LInt32
    ## !< sets to 1 if horiz disparity builds
    ysuccess* {.importc: "ysuccess".}: LInt32
    ## !< sets to 1 if slope disparity builds
    vvalid* {.importc: "vvalid".}: LInt32
    ## !< sets to 1 if valid vert disparity
    hvalid* {.importc: "hvalid".}: LInt32
    ## !< sets to 1 if valid horiz disparity
    skipHoriz* {.importc: "skip_horiz".}: LInt32
    ## !< if 1, skip horiz disparity
    ## !< correction
    debug* {.importc: "debug".}: LInt32
    ## !< set to 1 if debug output requested

