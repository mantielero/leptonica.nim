{.experimental: "codeReordering".}
import environ#, ptra#, pix
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
##  \file imageio.h
##
##  <pre>
##   General features of image I/O in leptonica
##
##   At present, there are 9 file formats for images that can be read
##   and written:
##       png (requires libpng, libz)
##       jpeg (requires libjpeg)
##       tiff (requires libtiff, libz)
##       gif (requires libgif)
##       webp (requires libwebp)
##       jp2 (requires libopenjp2)
##       bmp (no library required)
##       pnm (no library required)
##       spix (no library required)
##   Additionally, there are two file formats for writing (only) images:
##       PostScript (requires libpng, libz, libjpeg, libtiff)
##       pdf (requires libpng, libz, libjpeg, libtiff)
##
##   For all 9 read/write formats, leptonica provides interconversion
##   between pix (with raster data) and formatted image data:
##       Conversion from pix (typically compression):
##           pixWrite():        pix --> file
##           pixWriteStream():  pix --> filestream (aka FILE*)
##           pixWriteMem():     pix --> memory buffer
##       Conversion to pix (typically decompression):
##           pixRead():         file --> pix
##           pixReadStream():   filestream --> pix
##           pixReadMem():      memory buffer --> pix
##
##   Conversions for which the image data is not compressed are:
##      * uncompressed tiff   (IFF_TIFF)
##      * bmp
##      * pnm
##      * spix (fast serialization that copies the pix raster data)
##
##   The image header (metadata) information can be read from either
##   the compressed file or a memory buffer, for all 9 formats.
##  </pre>
##

##  --------------------------------------------------------------- *
##                     Image file format types                      *
##  ---------------------------------------------------------------
##
##   The IFF_DEFAULT flag is used to write the file out in the
##   same (input) file format that the pix was read from.  If the pix
##   was not read from file, the input format field will be
##   IFF_UNKNOWN and the output file format will be chosen to
##   be compressed and lossless; namely, IFF_TIFF_G4 for d = 1
##   and IFF_PNG for everything else.
##
##   In the future, new format types that have defined extensions
##   will be added before IFF_DEFAULT, and will be kept in sync with
##   the file format extensions in writefile.c.  The positions of
##   file formats before IFF_DEFAULT will remain invariant.
##
## ! Image Formats

const
  IFF_UNKNOWN* = 0
  IFF_BMP* = 1
  IFF_JFIF_JPEG* = 2
  IFF_PNG* = 3
  IFF_TIFF* = 4
  IFF_TIFF_PACKBITS* = 5
  IFF_TIFF_RLE* = 6
  IFF_TIFF_G3* = 7
  IFF_TIFF_G4* = 8
  IFF_TIFF_LZW* = 9
  IFF_TIFF_ZIP* = 10
  IFF_PNM* = 11
  IFF_PS* = 12
  IFF_GIF* = 13
  IFF_JP2* = 14
  IFF_WEBP* = 15
  IFF_LPDF* = 16
  IFF_TIFF_JPEG* = 17
  IFF_DEFAULT* = 18
  IFF_SPIX* = 19

##  Convenient macro for checking requested tiff output

template l_Format_Is_Tiff*(f: untyped): untyped =
  ((f) == IFF_TIFF or (f) == IFF_TIFF_PACKBITS or (f) == IFF_TIFF_RLE or
      (f) == IFF_TIFF_G3 or
      (f) == IFF_TIFF_G4 or
      (f) == IFF_TIFF_LZW or
      (f) == IFF_TIFF_ZIP or
      (f) == IFF_TIFF_JPEG)

##  --------------------------------------------------------------- *
##                          Format header ids                       *
##  ---------------------------------------------------------------
## ! Header Ids

const
  BMP_ID* = 0x4d42           ## !< BM - for bitmaps
  TIFF_BIGEND_ID* = 0x4d4d   ## !< MM - for 'motorola'
  TIFF_LITTLEEND_ID* = 0x4949

##  --------------------------------------------------------------- *
##                 Hinting bit flags in jpeg reader                 *
##  ---------------------------------------------------------------
## ! Jpeg Hints
##  The default behavior is now to fail on data corruption.

const
  L_JPEG_READ_LUMINANCE* = 1 ## !< only want luminance data; no chroma
  L_JPEG_CONTINUE_WITH_BAD_DATA* = 2

##  --------------------------------------------------------------- *
##                             Jp2k codecs                          *
##  ---------------------------------------------------------------
## ! Jp2k Codecs

const
  L_J2K_CODEC* = 1           ## !< codestream
  L_JP2_CODEC* = 2

##  --------------------------------------------------------------- *
##                     Pdf formatted encoding types                 *
##  ---------------------------------------------------------------
## ! Pdf Encoding

const
  L_DEFAULT_ENCODE* = 0      ## !< use default encoding based on image
  L_JPEG_ENCODE* = 1         ## !< use dct encoding: 8 and 32 bpp, no cmap
  L_G4_ENCODE* = 2           ## !< use ccitt g4 fax encoding: 1 bpp
  L_FLATE_ENCODE* = 3        ## !< use flate encoding: any depth, cmap ok
  L_JP2K_ENCODE* = 4

##  --------------------------------------------------------------- *
##                     Compressed image data                        *
##  ---------------------------------------------------------------
##
##   In use, either datacomp or data85 will be produced, depending
##   on whether the data needs to be ascii85 encoded.  PostScript
##   requires ascii85 encoding; pdf does not.
##
##   For the colormap (flate compression only), PostScript uses ascii85
##   encoding and pdf uses a bracketed array of space-separated
##   hex-encoded rgb triples.  Only tiff g4 (type == L_G4_ENCODE) uses
##   the minisblack field.
##
## ! Compressed image data

type
  L_CompressedData* {.importc: "L_Compressed_Data", header: "imageio.h", bycopy.} = object
    `type`* {.importc: "type".}: LInt32
    ## !< encoding type: L_JPEG_ENCODE, etc
    datacomp* {.importc: "datacomp".}: ptr LUint8
    ## !< gzipped raster data
    nbytescomp* {.importc: "nbytescomp".}: csize_t
    ## !< number of compressed bytes
    data85* {.importc: "data85".}: cstring
    ## !< ascii85-encoded gzipped raster data
    nbytes85* {.importc: "nbytes85".}: csize_t
    ## !< number of ascii85 encoded bytes
    cmapdata85* {.importc: "cmapdata85".}: cstring
    ## !< ascii85-encoded uncompressed cmap
    cmapdatahex* {.importc: "cmapdatahex".}: cstring
    ## !< hex pdf array for the cmap
    ncolors* {.importc: "ncolors".}: LInt32
    ## !< number of colors in cmap
    w* {.importc: "w".}: LInt32
    ## !< image width
    h* {.importc: "h".}: LInt32
    ## !< image height
    bps* {.importc: "bps".}: LInt32
    ## !< bits/sample; typ. 1, 2, 4 or 8
    spp* {.importc: "spp".}: LInt32
    ## !< samples/pixel; typ. 1 or 3
    minisblack* {.importc: "minisblack".}: LInt32
    ## !< tiff g4 photometry
    predictor* {.importc: "predictor".}: LInt32
    ## !< flate data has PNG predictors
    nbytes* {.importc: "nbytes".}: csize_t
    ## !< number of uncompressed raster bytes
    res* {.importc: "res".}: LInt32
    ## !< resolution (ppi)

  L_Comp_Data* = L_CompressedData

##  ------------------------------------------------------------------------- *
##                            Pdf multi image flags                           *
##  -------------------------------------------------------------------------
## ! Pdf MultiImage

const
  L_FIRST_IMAGE* = 1         ## !< first image to be used
  L_NEXT_IMAGE* = 2          ## !< intermediate image; not first or last
  L_LAST_IMAGE* = 3

##  ------------------------------------------------------------------------- *
##                      Intermediate pdf generation data                      *
##  -------------------------------------------------------------------------
##
##   This accumulates data for generating a pdf of a single page consisting
##   of an arbitrary number of images.
##
##   None of the strings have a trailing newline.
##
## ! Intermediate pdf generation data

type
  L_PdfData* {.importc: "L_Pdf_Data", header: "imageio.h", bycopy.} = object
    # title* {.importc: "title".}: cstring
    # ## !< optional title for pdf
    # n* {.importc: "n".}: LInt32
    # ## !< number of images
    # ncmap* {.importc: "ncmap".}: LInt32
    # ## !< number of colormaps
    # cida* {.importc: "cida".}: ptr L_Ptra
    # ## !< array of compressed image data
    # id* {.importc: "id".}: cstring
    # ## !< %PDF-1.2 id string
    # obj1* {.importc: "obj1".}: cstring
    # ## !< catalog string
    # obj2* {.importc: "obj2".}: cstring
    # ## !< metadata string
    # obj3* {.importc: "obj3".}: cstring
    # ## !< pages string
    # obj4* {.importc: "obj4".}: cstring
    # ## !< page string (variable data)
    # obj5* {.importc: "obj5".}: cstring
    # ## !< content string (variable data)
    # poststream* {.importc: "poststream".}: cstring
    # ## !< post-binary-stream string
    # trailer* {.importc: "trailer".}: cstring
    # ## !< trailer string (variable data)
    # xy* {.importc: "xy".}: ptr Pta
    # ## !< store (xpt, ypt) array
    # wh* {.importc: "wh".}: ptr Pta
    # ## !< store (wpt, hpt) array
    # mediabox* {.importc: "mediabox".}: ptr Box
    # ## !< bounding region for all images
    # saprex* {.importc: "saprex".}: ptr Sarray
    # ## !< pre-binary-stream xobject strings
    # sacmap* {.importc: "sacmap".}: ptr Sarray
    # ## !< colormap pdf object strings
    # objsize* {.importc: "objsize".}: ptr L_Dna
    # ## !< sizes of each pdf string object
    # objloc* {.importc: "objloc".}: ptr L_Dna
    # ## !< location of each pdf string object
    # xrefloc* {.importc: "xrefloc".}: LInt32
    # ## !< location of xref

