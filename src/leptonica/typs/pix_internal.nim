{.experimental: "codeReordering".}
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
##  \file pix_internal.h
##
##  <pre>
##   Valid image types in leptonica:
##        Pix: 1 bpp, with and without colormap
##        Pix: 2 bpp, with and without colormap
##        Pix: 4 bpp, with and without colormap
##        Pix: 8 bpp, with and without colormap
##        Pix: 16 bpp (1 spp)
##        Pix: 32 bpp (rgb, 3 spp)
##        Pix: 32 bpp (rgba, 4 spp)
##        FPix: 32 bpp float
##        DPix: 64 bpp double
##        Notes:
##           (1) The only valid Pix image type with alpha is rgba.
##               In particular, the alpha component is not used in
##               cmapped images.
##           (2) PixComp can hold any Pix with IFF_PNG encoding.
##
##   This file is internal: it is not part of the public interface.
##   It contains the definitions of most of the image-related structs
##   used in leptonica:
##        struct Pix
##        struct PixColormap
##        struct RGBA_Quad
##        struct Pixa
##        struct Pixaa
##        struct Box
##        struct Boxa
##        struct Boxaa
##        struct Pta
##        struct Ptaa
##        struct Pixacc
##        struct PixTiling
##        struct FPix
##        struct FPixa
##        struct DPix
##        struct PixComp
##        struct PixaComp
##
##   This file can be #included after allheaders.h in source files that
##   require direct access to the internal data fields in these structs.
##
##   Notes on the pixels in the raster image.  Most of this information
##   can also be found in pix.h.
##
##        (1) The image data is stored in a single contiguous
##            array of l_uint32, into which the pixels are packed.
##            By "packed" we mean that there are no unused bits
##            between pixels, except for end-of-line padding to
##            satisfy item (2) below.
##
##        (2) Every image raster line begins on a 32-bit word
##            boundary within this array.
##
##        (3) Pix image data is stored in 32-bit units, with the
##            pixels ordered from left to right in the image being
##            stored in order from the MSB to LSB within the word,
##            for both big-endian and little-endian machines.
##            This is the natural ordering for big-endian machines,
##            as successive bytes are stored and fetched progressively
##            to the right.  However, for little-endians, when storing
##            we re-order the bytes from this byte stream order, and
##            reshuffle again for byte access on 32-bit entities.
##            So if the bytes come in sequence from left to right, we
##            store them on little-endians in byte order:
##                 3 2 1 0 7 6 5 4 ...
##            This MSB to LSB ordering allows left and right shift
##            operations on 32 bit words to move the pixels properly.
##
##        (4) We use 32 bit pixels for both RGB and RGBA color images.
##            The A (alpha) byte is ignored in most leptonica functions
##            operating on color images.  Within each 4 byte pixel, the
##            color samples are ordered from MSB to LSB, as follows:
##
##                 |  MSB  |  2nd MSB  |  3rd MSB  |  LSB  |
##                    red      green       blue      alpha
##                     0         1           2         3   (big-endian)
##                     3         2           1         0   (little-endian)
##
##            Because we use MSB to LSB ordering within the 32-bit word,
##            the individual 8-bit samples can be accessed with
##            GET_DATA_BYTE and SET_DATA_BYTE macros, using the
##            (implicitly big-ending) ordering
##                  red:    byte 0  (MSB)
##                  green:  byte 1  (2nd MSB)
##                  blue:   byte 2  (3rd MSB)
##                  alpha:  byte 3  (LSB)
##
##            The specific color assignment is made in this file,
##            through the definitions of COLOR_RED, etc.  Then the R, G
##            B and A sample values can be retrieved using
##                  redval = GET_DATA_BYTE(&pixel, COLOR_RED);
##                  greenval = GET_DATA_BYTE(&pixel, COLOR_GREEN);
##                  blueval = GET_DATA_BYTE(&pixel, COLOR_BLUE);
##                  alphaval = GET_DATA_BYTE(&pixel, L_ALPHA_CHANNEL);
##            and they can be set with
##                  SET_DATA_BYTE(&pixel, COLOR_RED, redval);
##                  SET_DATA_BYTE(&pixel, COLOR_GREEN, greenval);
##                  SET_DATA_BYTE(&pixel, COLOR_BLUE, blueval);
##                  SET_DATA_BYTE(&pixel, L_ALPHA_CHANNEL, alphaval);
##
##            More efficiently, these components can be extracted directly
##            by shifting and masking, explicitly using the values in
##            L_RED_SHIFT, etc.:
##                  (pixel32 >> L_RED_SHIFT) & 0xff;         (red)
##                  (pixel32 >> L_GREEN_SHIFT) & 0xff;       (green)
##                  (pixel32 >> L_BLUE_SHIFT) & 0xff;        (blue)
##                  (pixel32 >> L_ALPHA_SHIFT) & 0xff;       (alpha)
##            The functions extractRGBValues() and extractRGBAValues() are
##            provided to do this.  Likewise, the pixels can be set
##            directly by shifting, using composeRGBPixel() and
##            composeRGBAPixel().
##
##            All these operations work properly on both big- and little-endians.
##
##        (5) A reference count is held within each pix, giving the
##            number of ptrs to the pix.  When a pixClone() call
##            is made, the ref count is increased by 1, and
##            when a pixDestroy() call is made, the reference count
##            of the pix is decremented.  The pix is only destroyed
##            when the reference count goes to zero.
##
##        (6) The version numbers (below) are used in the serialization
##            of these data structures.  They are placed in the files,
##            and rarely (if ever) change.
##
##        (7) The serialization dependencies are as follows:
##                pixaa  :  pixa  :  boxa
##                boxaa  :  boxa
##            So, for example, pixaa and boxaa can be changed without
##            forcing a change in pixa or boxa.  However, if pixa is
##            changed, it forces a change in pixaa, and if boxa is
##            changed, if forces a change in the other three.
##            We define four version numbers:
##                PIXAA_VERSION_NUMBER
##                PIXA_VERSION_NUMBER
##                BOXAA_VERSION_NUMBER
##                BOXA_VERSION_NUMBER
##  </pre>
## -------------------------------------------------------------------------
## -------------------------------------------------------------------------*
##                               Basic Pix                                  *
## -------------------------------------------------------------------------
##  The 'special' field is by default 0, but it can hold integers
##  that direct non-default actions, e.g., in png and jpeg I/O.

## ! Colormap of a Pix

type
  PixColormap* {.importc: "struct PixColormap", bycopy.} = object
    array* {.importc: "array".}: pointer
    ## !< colormap table (array of RGBA_QUAD)
    depth* {.importc: "depth".}: LInt32
    ## !< of pix (1, 2, 4 or 8 bpp)
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of color entries allocated
    n* {.importc: "n".}: LInt32
    ## !< number of color entries used
    
## ! Basic Pix

type
  Pix* {.importc: "struct Pix", bycopy.} = object
    w* {.importc: "w".}: LUint32
    ## !< width in pixels
    h* {.importc: "h".}: LUint32
    ## !< height in pixels
    d* {.importc: "d".}: LUint32
    ## !< depth in bits (bpp)
    spp* {.importc: "spp".}: LUint32
    ## !< number of samples per pixel
    wpl* {.importc: "wpl".}: LUint32
    ## !< 32-bit words/line
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    xres* {.importc: "xres".}: LInt32
    ## !< image res (ppi) in x direction
    ## !< (use 0 if unknown)
    yres* {.importc: "yres".}: LInt32
    ## !< image res (ppi) in y direction
    ## !< (use 0 if unknown)
    informat* {.importc: "informat".}: LInt32
    ## !< input file format, IFF_*
    special* {.importc: "special".}: LInt32
    ## !< special instructions for I/O, etc
    text* {.importc: "text".}: cstring
    ## !< text string associated with pix
    colormap* {.importc: "colormap".}: ptr PixColormap
    ## !< colormap (may be null)
    data* {.importc: "data".}: ptr LUint32
    ## !< the image data





## ! Colormap table entry (after the BMP version).
##  Note that the BMP format stores the colormap table exactly
##  as it appears here, with color samples being stored sequentially,
##  in the order (b,g,r,a).

type
  RGBA_Quad* {.importc: "struct RGBA_Quad", bycopy.} = object
    blue* {.importc: "blue".}: LUint8
    ## !< blue value
    green* {.importc: "green".}: LUint8
    ## !< green value
    red* {.importc: "red".}: LUint8
    ## !< red value
    alpha* {.importc: "alpha".}: LUint8
    ## !< alpha value


## -------------------------------------------------------------------------*
##                               Array of pix                               *
## -------------------------------------------------------------------------
##   Serialization for primary data structures

const
  PIXAA_VERSION_NUMBER* = 2
  PIXA_VERSION_NUMBER* = 2
  BOXA_VERSION_NUMBER* = 2
  BOXAA_VERSION_NUMBER* = 3

## ! Array of pix

type
  Pixa* {.importc: "struct Pixa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of Pix in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of Pix ptrs allocated
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    pix* {.importc: "pix".}: ptr ptr Pix
    ## !< the array of ptrs to pix
    boxa* {.importc: "boxa".}: ptr Boxa
    ## !< array of boxes


## ! Array of arrays of pix

type
  Pixaa* {.importc: "struct Pixaa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of Pixa in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of Pixa ptrs allocated
    pixa* {.importc: "pixa".}: ptr ptr Pixa
    ## !< array of ptrs to pixa
    boxa* {.importc: "boxa".}: ptr Boxa
    ## !< array of boxes


## -------------------------------------------------------------------------*
##                     Basic rectangle and rectangle arrays                 *
## -------------------------------------------------------------------------
## ! Basic rectangle

type
  Box* {.importc: "struct Box", bycopy.} = object
    x* {.importc: "x".}: LInt32
    ## !< left coordinate
    y* {.importc: "y".}: LInt32
    ## !< top coordinate
    w* {.importc: "w".}: LInt32
    ## !< box width
    h* {.importc: "h".}: LInt32
    ## !< box height
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)


## ! Array of Box

type
  Boxa* {.importc: "struct Boxa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of box in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of box ptrs allocated
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    box* {.importc: "box".}: ptr ptr Box
    ## !< box ptr array


## ! Array of Boxa

type
  Boxaa* {.importc: "struct Boxaa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of boxa in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of boxa ptrs allocated
    boxa* {.importc: "boxa".}: ptr ptr Boxa
    ## !< boxa ptr array


## -------------------------------------------------------------------------*
##                                Array of points                           *
## -------------------------------------------------------------------------

const
  PTA_VERSION_NUMBER* = 1

## ! Array of points

type
  Pta* {.importc: "struct Pta", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< actual number of pts
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< size of allocated arrays
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    x* {.importc: "x".}: ptr LFloat32
    y* {.importc: "y".}: ptr LFloat32
    ## !< arrays of floats


## -------------------------------------------------------------------------*
##                               Array of Pta                               *
## -------------------------------------------------------------------------
## ! Array of Pta

type
  Ptaa* {.importc: "struct Ptaa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of pta in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of pta ptrs allocated
    pta* {.importc: "pta".}: ptr ptr Pta
    ## !< pta ptr array


## -------------------------------------------------------------------------*
##                        Pix accumulator container                         *
## -------------------------------------------------------------------------
## ! Pix accumulator container

type
  Pixacc* {.importc: "struct Pixacc", bycopy.} = object
    w* {.importc: "w".}: LInt32
    ## !< array width
    h* {.importc: "h".}: LInt32
    ## !< array height
    offset* {.importc: "offset".}: LInt32
    ## !< used to allow negative
    ## !< intermediate results
    pix* {.importc: "pix".}: ptr Pix
    ## !< the 32 bit accumulator pix


## -------------------------------------------------------------------------*
##                               Pix tiling                                 *
## -------------------------------------------------------------------------
## ! Pix tiling

type
  PixTiling* {.importc: "struct PixTiling", bycopy.} = object
    pix* {.importc: "pix".}: ptr Pix
    ## !< input pix (a clone)
    nx* {.importc: "nx".}: LInt32
    ## !< number of tiles horizontally
    ny* {.importc: "ny".}: LInt32
    ## !< number of tiles vertically
    w* {.importc: "w".}: LInt32
    ## !< tile width
    h* {.importc: "h".}: LInt32
    ## !< tile height
    xoverlap* {.importc: "xoverlap".}: LInt32
    ## !< overlap on left and right
    yoverlap* {.importc: "yoverlap".}: LInt32
    ## !< overlap on top and bottom
    strip* {.importc: "strip".}: LInt32
    ## !< strip for paint; default is TRUE


## -------------------------------------------------------------------------*
##                        FPix: pix with float array                        *
## -------------------------------------------------------------------------

const
  FPIX_VERSION_NUMBER* = 2

## ! Pix with float array

type
  FPix* {.importc: "struct FPix", bycopy.} = object
    w* {.importc: "w".}: LInt32
    ## !< width in pixels
    h* {.importc: "h".}: LInt32
    ## !< height in pixels
    wpl* {.importc: "wpl".}: LInt32
    ## !< 32-bit words/line
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    xres* {.importc: "xres".}: LInt32
    ## !< image res (ppi) in x direction
    ## !< (use 0 if unknown)
    yres* {.importc: "yres".}: LInt32
    ## !< image res (ppi) in y direction
    ## !< (use 0 if unknown)
    data* {.importc: "data".}: ptr LFloat32
    ## !< the float image data


## ! Array of FPix

type
  FPixa* {.importc: "struct FPixa", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of fpix in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of fpix ptrs allocated
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    fpix* {.importc: "fpix".}: ptr ptr FPix
    ## !< the array of ptrs to fpix


## -------------------------------------------------------------------------*
##                        DPix: pix with double array                       *
## -------------------------------------------------------------------------

const
  DPIX_VERSION_NUMBER* = 2

## ! Pix with double array

type
  DPix* {.importc: "struct DPix", bycopy.} = object
    w* {.importc: "w".}: LInt32
    ## !< width in pixels
    h* {.importc: "h".}: LInt32
    ## !< height in pixels
    wpl* {.importc: "wpl".}: LInt32
    ## !< 32-bit words/line
    refcount* {.importc: "refcount".}: LAtomic
    ## !< reference count (1 if no clones)
    xres* {.importc: "xres".}: LInt32
    ## !< image res (ppi) in x direction
    ## !< (use 0 if unknown)
    yres* {.importc: "yres".}: LInt32
    ## !< image res (ppi) in y direction
    ## !< (use 0 if unknown)
    data* {.importc: "data".}: ptr LFloat64
    ## !< the double image data


## -------------------------------------------------------------------------*
##                         PixComp: compressed pix                          *
## -------------------------------------------------------------------------
## ! Compressed Pix

type
  PixComp* {.importc: "struct PixComp", bycopy.} = object
    w* {.importc: "w".}: LInt32
    ## !< width in pixels
    h* {.importc: "h".}: LInt32
    ## !< height in pixels
    d* {.importc: "d".}: LInt32
    ## !< depth in bits
    xres* {.importc: "xres".}: LInt32
    ## !< image res (ppi) in x direction
    ## !<   (use 0 if unknown)
    yres* {.importc: "yres".}: LInt32
    ## !< image res (ppi) in y direction
    ## !<   (use 0 if unknown)
    comptype* {.importc: "comptype".}: LInt32
    ## !< compressed format (IFF_TIFF_G4,
    ## !<   IFF_PNG, IFF_JFIF_JPEG)
    text* {.importc: "text".}: cstring
    ## !< text string associated with pix
    cmapflag* {.importc: "cmapflag".}: LInt32
    ## !< flag (1 for cmap, 0 otherwise)
    data* {.importc: "data".}: ptr LUint8
    ## !< the compressed image data
    size* {.importc: "size".}: csize_t
    ## !< size of the data array


## -------------------------------------------------------------------------*
##                      PixaComp: array of compressed pix                   *
## -------------------------------------------------------------------------

const
  PIXACOMP_VERSION_NUMBER* = 2

## ! Array of compressed pix

type
  PixaComp* {.importc: "struct PixaComp", bycopy.} = object
    n* {.importc: "n".}: LInt32
    ## !< number of PixComp in ptr array
    nalloc* {.importc: "nalloc".}: LInt32
    ## !< number of PixComp ptrs allocated
    offset* {.importc: "offset".}: LInt32
    ## !< indexing offset into ptr array
    pixc* {.importc: "pixc".}: ptr ptr PixComp
    ## !< the array of ptrs to PixComp
    boxa* {.importc: "boxa".}: ptr Boxa
    ## !< array of boxes

