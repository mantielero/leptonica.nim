
c2nim --nep1 --debug --strict --header --out:allheaders.nim /usr/include/leptonica/allheaders.h

toast -pnrk -f:ast2 -G=L_WallTimer,L_WALLTIMER -G=L_Hashmap,L_HASHMAP -G=L_Hashitem,L_HASHITEM -G=L_Heap,L_HEAP -G=L_Ptra,_L_PTRA /usr/include/leptonica/alltypes.h
