import leptonica/allheaders

type
  BoxItem* = object
    handle:ptr Box

proc `=destroy`*(self: BoxItem) =
  #if not isNil(self):
  boxDestroy(self.handle.unsafeAddr)

proc newBoxItem*(x,y,w,h:int32):BoxItem =
  result.handle = boxCreate(x.LInt32, y.LInt32, w.LInt32, h.LInt32)

#------
type
  BoxArray* = object
    handle:ptr Boxa

proc `=destroy`*(self: BoxArray) =
  #if not isNil(self):
  boxaDestroy(self.handle.unsafeAddr)


proc newBoxArray*(cap:int):BoxArray =
  result.handle = boxaCreate(cap.LInt32)

proc len*(self: BoxArray):int =
  self.handle.n.int
#var a:BoxArray

proc add*(self: BoxArray; b: BoxItem) =
  let tmp = self.handle.boxaAddBox(b.handle, 0)
  echo tmp
  #if tmp != LOk:
  #  raise newException(ValueError, "failed adding a box in a box array")