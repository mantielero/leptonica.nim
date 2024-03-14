import leptonica

var boxa = boxaCreate(3)

echo typeof(boxa)

echo typeof( boxa[].n )
echo boxa[].n

var ba = newBoxArray(4)
echo ba.len


var b1 = newBoxItem(10,20, 100,200)

ba.add(b1)
ba.add(b1)
ba.add(b1)
ba.add(b1)
echo ba.len