{.passL:"-lleptonica".}
{.passC:"-I/usr/include/leptonica/" .}

import leptonica/typs/[environ,imageio, pix_internal]
export environ, imageio, pix_internal

import leptonica/allheaders
export allheaders


#import leptonica/
#export pix_internal


# import leptonica/typs/pix
# export pix

# import leptonica/allheaders
# export allheaders
#{.push dynlib:"/usr/lib/libleptonica.so".}

#[ type
  PixColormap* {.importc: "struct PixColormap", bycopy.} = object
    array* {.importc: "array".}: pointer
    ## !< colormap table (array of RGBA_QUAD)
    depth* {.importc: "depth".}: int32
    ## !< of pix (1, 2, 4 or 8 bpp)
    nalloc* {.importc: "nalloc".}: int32
    ## !< number of color entries allocated
    n* {.importc: "n".}: int32
    ## !< number of color entries used


type
  #Pix* {.importc: "struct Pix", header: "pix_internal.h", bycopy.} = object
  Pix* {.importc: "struct Pix", bycopy.} = object
    w* {.importc: "w".}: uint32
    ## !< width in pixels
    h* {.importc: "h".}: uint32
    ## !< height in pixels
    d* {.importc: "d".}: uint32
    ## !< depth in bits (bpp)
    spp* {.importc: "spp".}: uint32
    ## !< number of samples per pixel
    wpl* {.importc: "wpl".}: uint32
    ## !< 32-bit words/line
    refcount* {.importc: "refcount".}: int32
    ## !< reference count (1 if no clones)
    xres* {.importc: "xres".}: int32
    ## !< image res (ppi) in x direction
    ## !< (use 0 if unknown)
    yres* {.importc: "yres".}: int32
    ## !< image res (ppi) in y direction
    ## !< (use 0 if unknown)
    informat* {.importc: "informat".}: int32
    ## !< input file format, IFF_*
    special* {.importc: "special".}: int32
    ## !< special instructions for I/O, etc
    text* {.importc: "text".}: cstring
    ## !< text string associated with pix
    colormap* {.importc: "colormap".}: ptr PixColormap
    ## !< colormap (may be null)
    data* {.importc: "data".}: ptr uint32
    ## !< the image data
 ]#


# {.push header:"allheaders.h".}

# proc pixRead*(filename: cstring): ptr Pix {.importc: "pixRead".}

# proc pixRotate90*(pixs: ptr Pix; direction: int32): ptr Pix {.
#     importc: "pixRotate90".}

# proc pixWrite*(fname: cstring; pix: ptr Pix; format: int32): int32 {.
#     importc: "pixWrite".}
# {.pop.}

