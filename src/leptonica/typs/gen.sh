# General and configuration defs
c2nim --nep1 --debug --strict --header --out:endianness.nim /usr/include/leptonica/endianness.h
c2nim --nep1 --debug --strict --header --out:environ.nim /usr/include/leptonica/environ.h

# Generic and non-image-specific containers
c2nim --nep1 --debug --strict --header --out:array.nim /usr/include/leptonica/array.h
c2nim --nep1 --debug --strict --header --out:bbuffer.nim /usr/include/leptonica/bbuffer.h
c2nim --nep1 --debug --strict --header --out:hashmap.nim /usr/include/leptonica/hashmap.h
c2nim --nep1 --debug --strict --header --out:heap.nim /usr/include/leptonica/heap.h
c2nim --nep1 --debug --strict --header --out:list.nim /usr/include/leptonica/list.h
c2nim --nep1 --debug --strict --header --out:ptra.nim /usr/include/leptonica/ptra.h
c2nim --nep1 --debug --strict --header --out:queue.nim /usr/include/leptonica/queue.h
c2nim --nep1 --debug --strict --header --out:rbtree.nim /usr/include/leptonica/rbtree.h
c2nim --nep1 --debug --strict --header --out:stack.nim /usr/include/leptonica/stack.h

# Imaging
c2nim --nep1 --debug --strict --header --out:arrayaccess.nim /usr/include/leptonica/arrayaccess.h
c2nim --nep1 --debug --strict --header --out:bmf.nim /usr/include/leptonica/bmf.h
c2nim --nep1 --debug --strict --header --out:colorfill.nim /usr/include/leptonica/colorfill.h
c2nim --nep1 --debug --strict --header --out:gplot.nim /usr/include/leptonica/gplot.h
c2nim --nep1 --debug --strict --header --out:imageio.nim /usr/include/leptonica/imageio.h
c2nim --nep1 --debug --strict --header --out:jbclass.nim /usr/include/leptonica/jbclass.h
c2nim --nep1 --debug --strict --header --out:morph.nim /usr/include/leptonica/morph.h
c2nim --nep1 --debug --strict --header --out:pix.nim /usr/include/leptonica/pix.h
c2nim --nep1 --debug --strict --header --out:recog.nim /usr/include/leptonica/recog.h
c2nim --nep1 --debug --strict --header --out:regutils.nim /usr/include/leptonica/regutils.h
c2nim --nep1 --debug --strict --header --out:stringcode.nim /usr/include/leptonica/stringcode.h
c2nim --nep1 --debug --strict --header --out:sudoku.nim /usr/include/leptonica/sudoku.h
c2nim --nep1 --debug --strict --header --out:watershed.nim /usr/include/leptonica/watershed.h
