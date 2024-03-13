import leptonica

var inputPix = pixRead("/home/jose/docs/scanned/salida.png")

var rotatedPix = pixRotate90(inputPix, 1)

# const 
#   IFF_JFIF_JPEG* = 2
discard pixWrite("rotated_image.jpg", rotatedPix, IFF_JFIF_JPEG) 