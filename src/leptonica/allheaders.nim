import typs/[pix_internal, imageio,environ, ptra]
export pix_internal, imageio, environ, ptra
import typs/[arrayy, bbuffer, bmf, colorfill, dewarp, rbtree, hashmap]
export arrayy, bbuffer, bmf, colorfill, dewarp, rbtree, hashmap
import typs/[gplot, heap, jbclass, llist, morph, pix, queue]
export gplot, heap, jbclass, llist, morph, pix, queue
import typs/[recog, regutils, stringcode, sudoku, watershed]
export recog, regutils, stringcode, sudoku, watershed

#FIXME
type
  Pa* {.importc:"struct Pa", bycopy.} = object  
  L_Bbuffer* {.importc:"struct L_Bbuffer", bycopy.} = object    
  L_Kernel* {.importc:"struct L_Kernel", bycopy.} = object   
  L_Bmf* {.importc:"struct L_Bmf", bycopy.} = object 
  L_Bytea* {.importc:"struct L_Bytea", bycopy.} = object   

  Ccbord* {.importc:"struct Ccbord", bycopy.} = object    
  Ccborda* {.importc:"struct Ccborda", bycopy.} = object    
  Sela* {.importc:"struct Sela", bycopy.} = object    
  Jbclasser* {.importc:"struct Jbclasser", bycopy.} = object   
  Pixcmap* {.importc:"struct Pixcmap", bycopy.} = object   
  L_Colorfill* {.importc:"struct L_Colorfill", bycopy.} = object   
  L_Stack* {.importc:"struct L_Stack", bycopy.} = object   
  Pixac* {.importc:"struct Pixac", bycopy.} = object 

#FIXME


const
  LIBLEPT_MAJOR_VERSION* = 1
  LIBLEPT_MINOR_VERSION* = 84
  LIBLEPT_PATCH_VERSION* = 1

proc pixCleanBackgroundToWhite*(pixs: ptr Pix; pixim: ptr Pix; pixg: ptr Pix;
                                gamma: LFloat32; blackval: LInt32;
                                whiteval: LInt32): ptr Pix {.
    importc: "pixCleanBackgroundToWhite".}
proc pixBackgroundNormSimple*(pixs: ptr Pix; pixim: ptr Pix; pixg: ptr Pix): ptr Pix {.
    importc: "pixBackgroundNormSimple".}
proc pixBackgroundNorm*(pixs: ptr Pix; pixim: ptr Pix; pixg: ptr Pix;
                        sx: LInt32; sy: LInt32; thresh: LInt32;
                        mincount: LInt32; bgval: LInt32; smoothx: LInt32;
                        smoothy: LInt32): ptr Pix {.
    importc: "pixBackgroundNorm".}
proc pixBackgroundNormMorph*(pixs: ptr Pix; pixim: ptr Pix; reduction: LInt32;
                             size: LInt32; bgval: LInt32): ptr Pix {.
    importc: "pixBackgroundNormMorph".}
proc pixBackgroundNormGrayArray*(pixs: ptr Pix; pixim: ptr Pix; sx: LInt32;
                                 sy: LInt32; thresh: LInt32; mincount: LInt32;
                                 bgval: LInt32; smoothx: LInt32;
                                 smoothy: LInt32; ppixd: ptr ptr Pix): LOk {.
    importc: "pixBackgroundNormGrayArray".}
proc pixBackgroundNormRGBArrays*(pixs: ptr Pix; pixim: ptr Pix; pixg: ptr Pix;
                                 sx: LInt32; sy: LInt32; thresh: LInt32;
                                 mincount: LInt32; bgval: LInt32;
                                 smoothx: LInt32; smoothy: LInt32;
                                 ppixr: ptr ptr Pix; ppixg: ptr ptr Pix;
                                 ppixb: ptr ptr Pix): LOk {.
    importc: "pixBackgroundNormRGBArrays".}
proc pixBackgroundNormGrayArrayMorph*(pixs: ptr Pix; pixim: ptr Pix;
                                      reduction: LInt32; size: LInt32;
                                      bgval: LInt32; ppixd: ptr ptr Pix): LOk {.
    importc: "pixBackgroundNormGrayArrayMorph".}
proc pixBackgroundNormRGBArraysMorph*(pixs: ptr Pix; pixim: ptr Pix;
                                      reduction: LInt32; size: LInt32;
                                      bgval: LInt32; ppixr: ptr ptr Pix;
                                      ppixg: ptr ptr Pix; ppixb: ptr ptr Pix): LOk {.
    importc: "pixBackgroundNormRGBArraysMorph".}
proc pixGetBackgroundGrayMap*(pixs: ptr Pix; pixim: ptr Pix; sx: LInt32;
                              sy: LInt32; thresh: LInt32; mincount: LInt32;
                              ppixd: ptr ptr Pix): LOk {.
    importc: "pixGetBackgroundGrayMap".}
proc pixGetBackgroundRGBMap*(pixs: ptr Pix; pixim: ptr Pix; pixg: ptr Pix;
                             sx: LInt32; sy: LInt32; thresh: LInt32;
                             mincount: LInt32; ppixmr: ptr ptr Pix;
                             ppixmg: ptr ptr Pix; ppixmb: ptr ptr Pix): LOk {.
    importc: "pixGetBackgroundRGBMap".}
proc pixGetBackgroundGrayMapMorph*(pixs: ptr Pix; pixim: ptr Pix;
                                   reduction: LInt32; size: LInt32;
                                   ppixm: ptr ptr Pix): LOk {.
    importc: "pixGetBackgroundGrayMapMorph".}
proc pixGetBackgroundRGBMapMorph*(pixs: ptr Pix; pixim: ptr Pix;
                                  reduction: LInt32; size: LInt32;
                                  ppixmr: ptr ptr Pix; ppixmg: ptr ptr Pix;
                                  ppixmb: ptr ptr Pix): LOk {.
    importc: "pixGetBackgroundRGBMapMorph".}
proc pixFillMapHoles*(pix: ptr Pix; nx: LInt32; ny: LInt32; filltype: LInt32): LOk {.
    importc: "pixFillMapHoles".}
proc pixExtendByReplication*(pixs: ptr Pix; addw: LInt32; addh: LInt32): ptr Pix {.
    importc: "pixExtendByReplication".}
proc pixSmoothConnectedRegions*(pixs: ptr Pix; pixm: ptr Pix; factor: LInt32): LOk {.
    importc: "pixSmoothConnectedRegions".}
proc pixGetInvBackgroundMap*(pixs: ptr Pix; bgval: LInt32; smoothx: LInt32;
                             smoothy: LInt32): ptr Pix {.
    importc: "pixGetInvBackgroundMap".}
proc pixApplyInvBackgroundGrayMap*(pixs: ptr Pix; pixm: ptr Pix; sx: LInt32;
                                   sy: LInt32): ptr Pix {.
    importc: "pixApplyInvBackgroundGrayMap".}
proc pixApplyInvBackgroundRGBMap*(pixs: ptr Pix; pixmr: ptr Pix; pixmg: ptr Pix;
                                  pixmb: ptr Pix; sx: LInt32; sy: LInt32): ptr Pix {.
    importc: "pixApplyInvBackgroundRGBMap".}
proc pixApplyVariableGrayMap*(pixs: ptr Pix; pixg: ptr Pix; target: LInt32): ptr Pix {.
    importc: "pixApplyVariableGrayMap".}
proc pixGlobalNormRGB*(pixd: ptr Pix; pixs: ptr Pix; rval: LInt32; gval: LInt32;
                       bval: LInt32; mapval: LInt32): ptr Pix {.
    importc: "pixGlobalNormRGB".}
proc pixGlobalNormNoSatRGB*(pixd: ptr Pix; pixs: ptr Pix; rval: LInt32;
                            gval: LInt32; bval: LInt32; factor: LInt32;
                            rank: LFloat32): ptr Pix {.
    importc: "pixGlobalNormNoSatRGB".}
proc pixThresholdSpreadNorm*(pixs: ptr Pix; filtertype: LInt32;
                             edgethresh: LInt32; smoothx: LInt32;
                             smoothy: LInt32; gamma: LFloat32; minval: LInt32;
                             maxval: LInt32; targetthresh: LInt32;
                             ppixth: ptr ptr Pix; ppixb: ptr ptr Pix;
                             ppixd: ptr ptr Pix): LOk {.
    importc: "pixThresholdSpreadNorm".}
proc pixBackgroundNormFlex*(pixs: ptr Pix; sx: LInt32; sy: LInt32;
                            smoothx: LInt32; smoothy: LInt32; delta: LInt32): ptr Pix {.
    importc: "pixBackgroundNormFlex".}
proc pixContrastNorm*(pixd: ptr Pix; pixs: ptr Pix; sx: LInt32; sy: LInt32;
                      mindiff: LInt32; smoothx: LInt32; smoothy: LInt32): ptr Pix {.
    importc: "pixContrastNorm".}
proc pixBackgroundNormTo1MinMax*(pixs: ptr Pix; contrast: LInt32;
                                 scalefactor: LInt32): ptr Pix {.
    importc: "pixBackgroundNormTo1MinMax".}
proc pixConvertTo8MinMax*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertTo8MinMax".}
proc pixAffineSampledPta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                          incolor: LInt32): ptr Pix {.
    importc: "pixAffineSampledPta".}
proc pixAffineSampled*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixAffineSampled".}
proc pixAffinePta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta; incolor: LInt32): ptr Pix {.
    importc: "pixAffinePta".}
proc pixAffine*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixAffine".}
proc pixAffinePtaColor*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                        colorval: LUint32): ptr Pix {.
    importc: "pixAffinePtaColor".}
proc pixAffineColor*(pixs: ptr Pix; vc: ptr LFloat32; colorval: LUint32): ptr Pix {.
    importc: "pixAffineColor".}
proc pixAffinePtaGray*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                       grayval: LUint8): ptr Pix {.importc: "pixAffinePtaGray".}
proc pixAffineGray*(pixs: ptr Pix; vc: ptr LFloat32; grayval: LUint8): ptr Pix {.
    importc: "pixAffineGray".}
proc pixAffinePtaWithAlpha*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                            pixg: ptr Pix; fract: LFloat32; border: LInt32): ptr Pix {.
    importc: "pixAffinePtaWithAlpha".}
proc getAffineXformCoeffs*(ptas: ptr Pta; ptad: ptr Pta; pvc: ptr ptr LFloat32): LOk {.
    importc: "getAffineXformCoeffs".}
proc affineInvertXform*(vc: ptr LFloat32; pvci: ptr ptr LFloat32): LOk {.
    importc: "affineInvertXform".}
proc affineXformSampledPt*(vc: ptr LFloat32; x: LInt32; y: LInt32;
                           pxp: ptr LInt32; pyp: ptr LInt32): LOk {.
    importc: "affineXformSampledPt".}
proc affineXformPt*(vc: ptr LFloat32; x: LInt32; y: LInt32; pxp: ptr LFloat32;
                    pyp: ptr LFloat32): LOk {.importc: "affineXformPt".}
proc linearInterpolatePixelColor*(datas: ptr LUint32; wpls: LInt32; w: LInt32;
                                  h: LInt32; x: LFloat32; y: LFloat32;
                                  colorval: LUint32; pval: ptr LUint32): LOk {.
    importc: "linearInterpolatePixelColor".}
proc linearInterpolatePixelGray*(datas: ptr LUint32; wpls: LInt32; w: LInt32;
                                 h: LInt32; x: LFloat32; y: LFloat32;
                                 grayval: LInt32; pval: ptr LInt32): LOk {.
    importc: "linearInterpolatePixelGray".}
proc gaussjordan*(a: ptr ptr LFloat32; b: ptr LFloat32; n: LInt32): LInt32 {.
    importc: "gaussjordan".}
proc pixAffineSequential*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                          bw: LInt32; bh: LInt32): ptr Pix {.
    importc: "pixAffineSequential".}
proc createMatrix2dTranslate*(transx: LFloat32; transy: LFloat32): ptr LFloat32 {.
    importc: "createMatrix2dTranslate".}
proc createMatrix2dScale*(scalex: LFloat32; scaley: LFloat32): ptr LFloat32 {.
    importc: "createMatrix2dScale".}
proc createMatrix2dRotate*(xc: LFloat32; yc: LFloat32; angle: LFloat32): ptr LFloat32 {.
    importc: "createMatrix2dRotate".}
proc ptaTranslate*(ptas: ptr Pta; transx: LFloat32; transy: LFloat32): ptr Pta {.
    importc: "ptaTranslate".}
proc ptaScale*(ptas: ptr Pta; scalex: LFloat32; scaley: LFloat32): ptr Pta {.
    importc: "ptaScale".}
proc ptaRotate*(ptas: ptr Pta; xc: LFloat32; yc: LFloat32; angle: LFloat32): ptr Pta {.
    importc: "ptaRotate".}
proc boxaTranslate*(boxas: ptr Boxa; transx: LFloat32; transy: LFloat32): ptr Boxa {.
    importc: "boxaTranslate".}
proc boxaScale*(boxas: ptr Boxa; scalex: LFloat32; scaley: LFloat32): ptr Boxa {.
    importc: "boxaScale".}
proc boxaRotate*(boxas: ptr Boxa; xc: LFloat32; yc: LFloat32; angle: LFloat32): ptr Boxa {.
    importc: "boxaRotate".}
proc ptaAffineTransform*(ptas: ptr Pta; mat: ptr LFloat32): ptr Pta {.
    importc: "ptaAffineTransform".}
proc boxaAffineTransform*(boxas: ptr Boxa; mat: ptr LFloat32): ptr Boxa {.
    importc: "boxaAffineTransform".}
proc lProductMatVec*(mat: ptr LFloat32; vecs: ptr LFloat32; vecd: ptr LFloat32;
                     size: LInt32): LOk {.importc: "l_productMatVec".}
proc lProductMat2*(mat1: ptr LFloat32; mat2: ptr LFloat32; matd: ptr LFloat32;
                   size: LInt32): LOk {.importc: "l_productMat2".}
proc lProductMat3*(mat1: ptr LFloat32; mat2: ptr LFloat32; mat3: ptr LFloat32;
                   matd: ptr LFloat32; size: LInt32): LOk {.
    importc: "l_productMat3".}
proc lProductMat4*(mat1: ptr LFloat32; mat2: ptr LFloat32; mat3: ptr LFloat32;
                   mat4: ptr LFloat32; matd: ptr LFloat32; size: LInt32): LOk {.
    importc: "l_productMat4".}
proc lGetDataBit*(line: pointer; n: LInt32): LInt32 {.importc: "l_getDataBit".}
proc lSetDataBit*(line: pointer; n: LInt32) {.importc: "l_setDataBit".}
proc lClearDataBit*(line: pointer; n: LInt32) {.importc: "l_clearDataBit".}
proc lSetDataBitVal*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataBitVal".}
proc lGetDataDibit*(line: pointer; n: LInt32): LInt32 {.
    importc: "l_getDataDibit".}
proc lSetDataDibit*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataDibit".}
proc lClearDataDibit*(line: pointer; n: LInt32) {.importc: "l_clearDataDibit".}
proc lGetDataQbit*(line: pointer; n: LInt32): LInt32 {.importc: "l_getDataQbit".}
proc lSetDataQbit*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataQbit".}
proc lClearDataQbit*(line: pointer; n: LInt32) {.importc: "l_clearDataQbit".}
proc lGetDataByte*(line: pointer; n: LInt32): LInt32 {.importc: "l_getDataByte".}
proc lSetDataByte*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataByte".}
proc lGetDataTwoBytes*(line: pointer; n: LInt32): LInt32 {.
    importc: "l_getDataTwoBytes".}
proc lSetDataTwoBytes*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataTwoBytes".}
proc lGetDataFourBytes*(line: pointer; n: LInt32): LInt32 {.
    importc: "l_getDataFourBytes".}
proc lSetDataFourBytes*(line: pointer; n: LInt32; val: LInt32) {.
    importc: "l_setDataFourBytes".}
proc barcodeDispatchDecoder*(barstr: cstring; format: LInt32; debugflag: LInt32): cstring {.
    importc: "barcodeDispatchDecoder".}
proc barcodeFormatIsSupported*(format: LInt32): LInt32 {.
    importc: "barcodeFormatIsSupported".}
proc pixFindBaselines*(pixs: ptr Pix; ppta: ptr ptr Pta; pixadb: ptr Pixa): ptr Numa {.
    importc: "pixFindBaselines".}
proc pixDeskewLocal*(pixs: ptr Pix; nslices: LInt32; redsweep: LInt32;
                     redsearch: LInt32; sweeprange: LFloat32;
                     sweepdelta: LFloat32; minbsdelta: LFloat32): ptr Pix {.
    importc: "pixDeskewLocal".}
proc pixGetLocalSkewTransform*(pixs: ptr Pix; nslices: LInt32; redsweep: LInt32;
                               redsearch: LInt32; sweeprange: LFloat32;
                               sweepdelta: LFloat32; minbsdelta: LFloat32;
                               pptas: ptr ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "pixGetLocalSkewTransform".}
proc pixGetLocalSkewAngles*(pixs: ptr Pix; nslices: LInt32; redsweep: LInt32;
                            redsearch: LInt32; sweeprange: LFloat32;
                            sweepdelta: LFloat32; minbsdelta: LFloat32;
                            pa: ptr LFloat32; pb: ptr LFloat32; debug: LInt32): ptr Numa {.
    importc: "pixGetLocalSkewAngles".}

proc bbufferCreate*(indata: ptr LUint8; nalloc: LInt32): ptr L_Bbuffer {.
    importc: "bbufferCreate".}
proc bbufferDestroy*(pbb: ptr ptr L_Bbuffer) {.importc: "bbufferDestroy".}
proc bbufferDestroyAndSaveData*(pbb: ptr ptr L_Bbuffer; pnbytes: ptr csize_t): ptr LUint8 {.
    importc: "bbufferDestroyAndSaveData".}
proc bbufferRead*(bb: ptr L_Bbuffer; src: ptr LUint8; nbytes: LInt32): LOk {.
    importc: "bbufferRead".}
proc bbufferReadStream*(bb: ptr L_Bbuffer; fp: ptr File; nbytes: LInt32): LOk {.
    importc: "bbufferReadStream".}
proc bbufferExtendArray*(bb: ptr L_Bbuffer; nbytes: LInt32): LOk {.
    importc: "bbufferExtendArray".}
proc bbufferWrite*(bb: ptr L_Bbuffer; dest: ptr LUint8; nbytes: csize_t;
                   pnout: ptr csize_t): LOk {.importc: "bbufferWrite".}
proc bbufferWriteStream*(bb: ptr L_Bbuffer; fp: ptr File; nbytes: csize_t;
                         pnout: ptr csize_t): LOk {.
    importc: "bbufferWriteStream".}

proc pixBilateral*(pixs: ptr Pix; spatialStdev: LFloat32; rangeStdev: LFloat32;
                   ncomps: LInt32; reduction: LInt32): ptr Pix {.
    importc: "pixBilateral".}
proc pixBilateralGray*(pixs: ptr Pix; spatialStdev: LFloat32;
                       rangeStdev: LFloat32; ncomps: LInt32; reduction: LInt32): ptr Pix {.
    importc: "pixBilateralGray".}
proc pixBilateralExact*(pixs: ptr Pix; spatialKel: ptr L_Kernel;
                        rangeKel: ptr L_Kernel): ptr Pix {.
    importc: "pixBilateralExact".}
proc pixBilateralGrayExact*(pixs: ptr Pix; spatialKel: ptr L_Kernel;
                            rangeKel: ptr L_Kernel): ptr Pix {.
    importc: "pixBilateralGrayExact".}
proc pixBlockBilateralExact*(pixs: ptr Pix; spatialStdev: LFloat32;
                             rangeStdev: LFloat32): ptr Pix {.
    importc: "pixBlockBilateralExact".}
proc makeRangeKernel*(rangeStdev: LFloat32): ptr L_Kernel {.
    importc: "makeRangeKernel".}
proc pixBilinearSampledPta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                            incolor: LInt32): ptr Pix {.
    importc: "pixBilinearSampledPta".}
proc pixBilinearSampled*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixBilinearSampled".}
proc pixBilinearPta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                     incolor: LInt32): ptr Pix {.importc: "pixBilinearPta".}
proc pixBilinear*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixBilinear".}
proc pixBilinearPtaColor*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                          colorval: LUint32): ptr Pix {.
    importc: "pixBilinearPtaColor".}
proc pixBilinearColor*(pixs: ptr Pix; vc: ptr LFloat32; colorval: LUint32): ptr Pix {.
    importc: "pixBilinearColor".}
proc pixBilinearPtaGray*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                         grayval: LUint8): ptr Pix {.
    importc: "pixBilinearPtaGray".}
proc pixBilinearGray*(pixs: ptr Pix; vc: ptr LFloat32; grayval: LUint8): ptr Pix {.
    importc: "pixBilinearGray".}
proc pixBilinearPtaWithAlpha*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                              pixg: ptr Pix; fract: LFloat32; border: LInt32): ptr Pix {.
    importc: "pixBilinearPtaWithAlpha".}
proc getBilinearXformCoeffs*(ptas: ptr Pta; ptad: ptr Pta; pvc: ptr ptr LFloat32): LOk {.
    importc: "getBilinearXformCoeffs".}
proc bilinearXformSampledPt*(vc: ptr LFloat32; x: LInt32; y: LInt32;
                             pxp: ptr LInt32; pyp: ptr LInt32): LOk {.
    importc: "bilinearXformSampledPt".}
proc bilinearXformPt*(vc: ptr LFloat32; x: LInt32; y: LInt32; pxp: ptr LFloat32;
                      pyp: ptr LFloat32): LOk {.importc: "bilinearXformPt".}
proc pixOtsuAdaptiveThreshold*(pixs: ptr Pix; sx: LInt32; sy: LInt32;
                               smoothx: LInt32; smoothy: LInt32;
                               scorefract: LFloat32; ppixth: ptr ptr Pix;
                               ppixd: ptr ptr Pix): LOk {.
    importc: "pixOtsuAdaptiveThreshold".}
proc pixOtsuThreshOnBackgroundNorm*(pixs: ptr Pix; pixim: ptr Pix; sx: LInt32;
                                    sy: LInt32; thresh: LInt32;
                                    mincount: LInt32; bgval: LInt32;
                                    smoothx: LInt32; smoothy: LInt32;
                                    scorefract: LFloat32; pthresh: ptr LInt32): ptr Pix {.
    importc: "pixOtsuThreshOnBackgroundNorm".}
proc pixMaskedThreshOnBackgroundNorm*(pixs: ptr Pix; pixim: ptr Pix; sx: LInt32;
                                      sy: LInt32; thresh: LInt32;
                                      mincount: LInt32; smoothx: LInt32;
                                      smoothy: LInt32; scorefract: LFloat32;
                                      pthresh: ptr LInt32): ptr Pix {.
    importc: "pixMaskedThreshOnBackgroundNorm".}
proc pixSauvolaBinarizeTiled*(pixs: ptr Pix; whsize: LInt32; factor: LFloat32;
                              nx: LInt32; ny: LInt32; ppixth: ptr ptr Pix;
                              ppixd: ptr ptr Pix): LOk {.
    importc: "pixSauvolaBinarizeTiled".}
proc pixSauvolaBinarize*(pixs: ptr Pix; whsize: LInt32; factor: LFloat32;
                         addborder: LInt32; ppixm: ptr ptr Pix;
                         ppixsd: ptr ptr Pix; ppixth: ptr ptr Pix;
                         ppixd: ptr ptr Pix): LOk {.
    importc: "pixSauvolaBinarize".}
proc pixSauvolaOnContrastNorm*(pixs: ptr Pix; mindiff: LInt32;
                               ppixn: ptr ptr Pix; ppixth: ptr ptr Pix): ptr Pix {.
    importc: "pixSauvolaOnContrastNorm".}
proc pixThreshOnDoubleNorm*(pixs: ptr Pix; mindiff: LInt32): ptr Pix {.
    importc: "pixThreshOnDoubleNorm".}
proc pixThresholdByConnComp*(pixs: ptr Pix; pixm: ptr Pix; start: LInt32;
                             `end`: LInt32; incr: LInt32; thresh48: LFloat32;
                             threshdiff: LFloat32; pglobthresh: ptr LInt32;
                             ppixd: ptr ptr Pix; debugflag: LInt32): LOk {.
    importc: "pixThresholdByConnComp".}
proc pixThresholdByHisto*(pixs: ptr Pix; factor: LInt32; halfw: LInt32;
                          skip: LInt32; pthresh: ptr LInt32; ppixd: ptr ptr Pix;
                          pnahisto: ptr ptr Numa; ppixhisto: ptr ptr Pix): LOk {.
    importc: "pixThresholdByHisto".}
proc pixExpandBinaryReplicate*(pixs: ptr Pix; xfact: LInt32; yfact: LInt32): ptr Pix {.
    importc: "pixExpandBinaryReplicate".}
proc pixExpandBinaryPower2*(pixs: ptr Pix; factor: LInt32): ptr Pix {.
    importc: "pixExpandBinaryPower2".}
proc pixReduceBinary2*(pixs: ptr Pix; intab: ptr LUint8): ptr Pix {.
    importc: "pixReduceBinary2".}
proc pixReduceRankBinaryCascade*(pixs: ptr Pix; level1: LInt32; level2: LInt32;
                                 level3: LInt32; level4: LInt32): ptr Pix {.
    importc: "pixReduceRankBinaryCascade".}
proc pixReduceRankBinary2*(pixs: ptr Pix; level: LInt32; intab: ptr LUint8): ptr Pix {.
    importc: "pixReduceRankBinary2".}
proc makeSubsampleTab2x*(): ptr LUint8 {.importc: "makeSubsampleTab2x".}
proc pixBlend*(pixs1: ptr Pix; pixs2: ptr Pix; x: LInt32; y: LInt32;
               fract: LFloat32): ptr Pix {.importc: "pixBlend".}
proc pixBlendMask*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix; x: LInt32;
                   y: LInt32; fract: LFloat32; `type`: LInt32): ptr Pix {.
    importc: "pixBlendMask".}
proc pixBlendGray*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix; x: LInt32;
                   y: LInt32; fract: LFloat32; `type`: LInt32;
                   transparent: LInt32; transpix: LUint32): ptr Pix {.
    importc: "pixBlendGray".}
proc pixBlendGrayInverse*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix;
                          x: LInt32; y: LInt32; fract: LFloat32): ptr Pix {.
    importc: "pixBlendGrayInverse".}
proc pixBlendColor*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix; x: LInt32;
                    y: LInt32; fract: LFloat32; transparent: LInt32;
                    transpix: LUint32): ptr Pix {.importc: "pixBlendColor".}
proc pixBlendColorByChannel*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix;
                             x: LInt32; y: LInt32; rfract: LFloat32;
                             gfract: LFloat32; bfract: LFloat32;
                             transparent: LInt32; transpix: LUint32): ptr Pix {.
    importc: "pixBlendColorByChannel".}
proc pixBlendGrayAdapt*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix;
                        x: LInt32; y: LInt32; fract: LFloat32; shift: LInt32): ptr Pix {.
    importc: "pixBlendGrayAdapt".}
proc pixFadeWithGray*(pixs: ptr Pix; pixb: ptr Pix; factor: LFloat32;
                      `type`: LInt32): ptr Pix {.importc: "pixFadeWithGray".}
proc pixBlendHardLight*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix;
                        x: LInt32; y: LInt32; fract: LFloat32): ptr Pix {.
    importc: "pixBlendHardLight".}
proc pixBlendCmap*(pixs: ptr Pix; pixb: ptr Pix; x: LInt32; y: LInt32;
                   sindex: LInt32): LOk {.importc: "pixBlendCmap".}
proc pixBlendWithGrayMask*(pixs1: ptr Pix; pixs2: ptr Pix; pixg: ptr Pix;
                           x: LInt32; y: LInt32): ptr Pix {.
    importc: "pixBlendWithGrayMask".}
proc pixBlendBackgroundToColor*(pixd: ptr Pix; pixs: ptr Pix; box: ptr Box;
                                color: LUint32; gamma: LFloat32; minval: LInt32;
                                maxval: LInt32): ptr Pix {.
    importc: "pixBlendBackgroundToColor".}
proc pixMultiplyByColor*(pixd: ptr Pix; pixs: ptr Pix; box: ptr Box;
                         color: LUint32): ptr Pix {.
    importc: "pixMultiplyByColor".}
proc pixAlphaBlendUniform*(pixs: ptr Pix; color: LUint32): ptr Pix {.
    importc: "pixAlphaBlendUniform".}
proc pixAddAlphaToBlend*(pixs: ptr Pix; fract: LFloat32; invert: LInt32): ptr Pix {.
    importc: "pixAddAlphaToBlend".}
proc pixSetAlphaOverWhite*(pixs: ptr Pix): ptr Pix {.
    importc: "pixSetAlphaOverWhite".}
proc pixLinearEdgeFade*(pixs: ptr Pix; dir: LInt32; fadeto: LInt32;
                        distfract: LFloat32; maxfade: LFloat32): LOk {.
    importc: "pixLinearEdgeFade".}
proc bmfCreate*(dir: cstring; fontsize: LInt32): ptr L_Bmf {.
    importc: "bmfCreate".}
proc bmfDestroy*(pbmf: ptr ptr L_Bmf) {.importc: "bmfDestroy".}
proc bmfGetPix*(bmf: ptr L_Bmf; chr: char): ptr Pix {.importc: "bmfGetPix".}
proc bmfGetWidth*(bmf: ptr L_Bmf; chr: char; pw: ptr LInt32): LOk {.
    importc: "bmfGetWidth".}
proc bmfGetBaseline*(bmf: ptr L_Bmf; chr: char; pbaseline: ptr LInt32): LOk {.
    importc: "bmfGetBaseline".}
proc pixaGetFont*(dir: cstring; fontsize: LInt32; pbl0: ptr LInt32;
                  pbl1: ptr LInt32; pbl2: ptr LInt32): ptr Pixa {.
    importc: "pixaGetFont".}
proc pixaSaveFont*(indir: cstring; outdir: cstring; fontsize: LInt32): LOk {.
    importc: "pixaSaveFont".}
proc pixReadStreamBmp*(fp: ptr File): ptr Pix {.importc: "pixReadStreamBmp".}
proc pixReadMemBmp*(cdata: ptr LUint8; size: csize_t): ptr Pix {.
    importc: "pixReadMemBmp".}
proc pixWriteStreamBmp*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamBmp".}
proc pixWriteMemBmp*(pfdata: ptr ptr LUint8; pfsize: ptr csize_t; pixs: ptr Pix): LOk {.
    importc: "pixWriteMemBmp".}
proc lBootnumGen1*(): ptr Pixa {.importc: "l_bootnum_gen1".}
proc lBootnumGen2*(): ptr Pixa {.importc: "l_bootnum_gen2".}
proc lBootnumGen3*(): ptr Pixa {.importc: "l_bootnum_gen3".}
proc lBootnumGen4*(nsamp: LInt32): ptr Pixa {.importc: "l_bootnum_gen4".}

#--
proc boxCreate*(x: LInt32; y: LInt32; w: LInt32; h: LInt32): ptr Box {.
    importc: "boxCreate".}

proc boxCreateValid*(x: LInt32; y: LInt32; w: LInt32; h: LInt32): ptr Box {.
    importc: "boxCreateValid".}
proc boxCopy*(box: ptr Box): ptr Box {.importc: "boxCopy".}
proc boxClone*(box: ptr Box): ptr Box {.importc: "boxClone".}
proc boxDestroy*(pbox: ptr ptr Box) {.importc: "boxDestroy".}
proc boxGetGeometry*(box: ptr Box; px: ptr LInt32; py: ptr LInt32;
                     pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "boxGetGeometry".}
proc boxSetGeometry*(box: ptr Box; x: LInt32; y: LInt32; w: LInt32; h: LInt32): LOk {.
    importc: "boxSetGeometry".}
proc boxGetSideLocations*(box: ptr Box; pl: ptr LInt32; pr: ptr LInt32;
                          pt: ptr LInt32; pb: ptr LInt32): LOk {.
    importc: "boxGetSideLocations".}
proc boxSetSideLocations*(box: ptr Box; l: LInt32; r: LInt32; t: LInt32;
                          b: LInt32): LOk {.importc: "boxSetSideLocations".}
proc boxIsValid*(box: ptr Box; pvalid: ptr LInt32): LOk {.importc: "boxIsValid".}

#----
proc boxaCreate*(n: LInt32): ptr Boxa {.importc: "boxaCreate".}

proc boxaCopy*(boxa: ptr Boxa; copyflag: LInt32): ptr Boxa {.
    importc: "boxaCopy".}

proc boxaDestroy*(pboxa: ptr ptr Boxa) {.importc: "boxaDestroy".}

proc boxaAddBox*(boxa: ptr Boxa; box: ptr Box; copyflag: LInt32): LOk {.
    importc: "boxaAddBox".}
proc boxaExtendArray*(boxa: ptr Boxa): LOk {.importc: "boxaExtendArray".}
proc boxaExtendArrayToSize*(boxa: ptr Boxa; size: csize_t): LOk {.
    importc: "boxaExtendArrayToSize".}
proc boxaGetCount*(boxa: ptr Boxa): LInt32 {.importc: "boxaGetCount".}
proc boxaGetValidCount*(boxa: ptr Boxa): LInt32 {.importc: "boxaGetValidCount".}

proc boxaGetBox*(boxa: ptr Boxa; index: LInt32; accessflag: LInt32): ptr Box {.
    importc: "boxaGetBox".}

proc boxaGetValidBox*(boxa: ptr Boxa; index: LInt32; accessflag: LInt32): ptr Box {.
    importc: "boxaGetValidBox".}
proc boxaFindInvalidBoxes*(boxa: ptr Boxa): ptr Numa {.
    importc: "boxaFindInvalidBoxes".}
proc boxaGetBoxGeometry*(boxa: ptr Boxa; index: LInt32; px: ptr LInt32;
                         py: ptr LInt32; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "boxaGetBoxGeometry".}
proc boxaIsFull*(boxa: ptr Boxa; pfull: ptr LInt32): LOk {.
    importc: "boxaIsFull".}


proc boxaReplaceBox*(boxa: ptr Boxa; index: LInt32; box: ptr Box): LOk {.
    importc: "boxaReplaceBox".}
proc boxaInsertBox*(boxa: ptr Boxa; index: LInt32; box: ptr Box): LOk {.
    importc: "boxaInsertBox".}
proc boxaRemoveBox*(boxa: ptr Boxa; index: LInt32): LOk {.
    importc: "boxaRemoveBox".}
proc boxaRemoveBoxAndSave*(boxa: ptr Boxa; index: LInt32; pbox: ptr ptr Box): LOk {.
    importc: "boxaRemoveBoxAndSave".}
proc boxaSaveValid*(boxas: ptr Boxa; copyflag: LInt32): ptr Boxa {.
    importc: "boxaSaveValid".}
proc boxaInitFull*(boxa: ptr Boxa; box: ptr Box): LOk {.importc: "boxaInitFull".}


proc boxaClear*(boxa: ptr Boxa): LOk {.importc: "boxaClear".}
#----

proc boxaaCreate*(n: LInt32): ptr Boxaa {.importc: "boxaaCreate".}
proc boxaaCopy*(baas: ptr Boxaa; copyflag: LInt32): ptr Boxaa {.
    importc: "boxaaCopy".}
proc boxaaDestroy*(pbaa: ptr ptr Boxaa) {.importc: "boxaaDestroy".}
proc boxaaAddBoxa*(baa: ptr Boxaa; ba: ptr Boxa; copyflag: LInt32): LOk {.
    importc: "boxaaAddBoxa".}
proc boxaaExtendArray*(baa: ptr Boxaa): LOk {.importc: "boxaaExtendArray".}
proc boxaaExtendArrayToSize*(baa: ptr Boxaa; size: LInt32): LOk {.
    importc: "boxaaExtendArrayToSize".}
proc boxaaGetCount*(baa: ptr Boxaa): LInt32 {.importc: "boxaaGetCount".}
proc boxaaGetBoxCount*(baa: ptr Boxaa): LInt32 {.importc: "boxaaGetBoxCount".}
proc boxaaGetBoxa*(baa: ptr Boxaa; index: LInt32; accessflag: LInt32): ptr Boxa {.
    importc: "boxaaGetBoxa".}
proc boxaaGetBox*(baa: ptr Boxaa; iboxa: LInt32; ibox: LInt32;
                  accessflag: LInt32): ptr Box {.importc: "boxaaGetBox".}
proc boxaaInitFull*(baa: ptr Boxaa; boxa: ptr Boxa): LOk {.
    importc: "boxaaInitFull".}
proc boxaaExtendWithInit*(baa: ptr Boxaa; maxindex: LInt32; boxa: ptr Boxa): LOk {.
    importc: "boxaaExtendWithInit".}
proc boxaaReplaceBoxa*(baa: ptr Boxaa; index: LInt32; boxa: ptr Boxa): LOk {.
    importc: "boxaaReplaceBoxa".}
proc boxaaInsertBoxa*(baa: ptr Boxaa; index: LInt32; boxa: ptr Boxa): LOk {.
    importc: "boxaaInsertBoxa".}
proc boxaaRemoveBoxa*(baa: ptr Boxaa; index: LInt32): LOk {.
    importc: "boxaaRemoveBoxa".}
proc boxaaAddBox*(baa: ptr Boxaa; index: LInt32; box: ptr Box;
                  accessflag: LInt32): LOk {.importc: "boxaaAddBox".}
proc boxaaReadFromFiles*(dirname: cstring; substr: cstring; first: LInt32;
                         nfiles: LInt32): ptr Boxaa {.
    importc: "boxaaReadFromFiles".}
proc boxaaRead*(filename: cstring): ptr Boxaa {.importc: "boxaaRead".}
proc boxaaReadStream*(fp: ptr File): ptr Boxaa {.importc: "boxaaReadStream".}
proc boxaaReadMem*(data: ptr LUint8; size: csize_t): ptr Boxaa {.
    importc: "boxaaReadMem".}
proc boxaaWrite*(filename: cstring; baa: ptr Boxaa): LOk {.
    importc: "boxaaWrite".}
proc boxaaWriteStream*(fp: ptr File; baa: ptr Boxaa): LOk {.
    importc: "boxaaWriteStream".}
proc boxaaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; baa: ptr Boxaa): LOk {.
    importc: "boxaaWriteMem".}

proc boxaRead*(filename: cstring): ptr Boxa {.importc: "boxaRead".}
proc boxaReadStream*(fp: ptr File): ptr Boxa {.importc: "boxaReadStream".}
proc boxaReadMem*(data: ptr LUint8; size: csize_t): ptr Boxa {.
    importc: "boxaReadMem".}
proc boxaWriteDebug*(filename: cstring; boxa: ptr Boxa): LOk {.
    importc: "boxaWriteDebug".}
proc boxaWrite*(filename: cstring; boxa: ptr Boxa): LOk {.importc: "boxaWrite".}
proc boxaWriteStream*(fp: ptr File; boxa: ptr Boxa): LOk {.
    importc: "boxaWriteStream".}
proc boxaWriteStderr*(boxa: ptr Boxa): LOk {.importc: "boxaWriteStderr".}
proc boxaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; boxa: ptr Boxa): LOk {.
    importc: "boxaWriteMem".}


proc boxPrintStreamInfo*(fp: ptr File; box: ptr Box): LOk {.
    importc: "boxPrintStreamInfo".}
proc boxContains*(box1: ptr Box; box2: ptr Box; presult: ptr LInt32): LOk {.
    importc: "boxContains".}
proc boxIntersects*(box1: ptr Box; box2: ptr Box; presult: ptr LInt32): LOk {.
    importc: "boxIntersects".}

proc boxaContainedInBox*(boxas: ptr Boxa; box: ptr Box): ptr Boxa {.
    importc: "boxaContainedInBox".}
proc boxaContainedInBoxCount*(boxa: ptr Boxa; box: ptr Box; pcount: ptr LInt32): LOk {.
    importc: "boxaContainedInBoxCount".}
proc boxaContainedInBoxa*(boxa1: ptr Boxa; boxa2: ptr Boxa;
                          pcontained: ptr LInt32): LOk {.
    importc: "boxaContainedInBoxa".}
proc boxaIntersectsBox*(boxas: ptr Boxa; box: ptr Box): ptr Boxa {.
    importc: "boxaIntersectsBox".}
proc boxaIntersectsBoxCount*(boxa: ptr Boxa; box: ptr Box; pcount: ptr LInt32): LOk {.
    importc: "boxaIntersectsBoxCount".}
proc boxaClipToBox*(boxas: ptr Boxa; box: ptr Box): ptr Boxa {.
    importc: "boxaClipToBox".}
proc boxaCombineOverlaps*(boxas: ptr Boxa; pixadb: ptr Pixa): ptr Boxa {.
    importc: "boxaCombineOverlaps".}
proc boxaCombineOverlapsInPair*(boxas1: ptr Boxa; boxas2: ptr Boxa;
                                pboxad1: ptr ptr Boxa; pboxad2: ptr ptr Boxa;
                                pixadb: ptr Pixa): LOk {.
    importc: "boxaCombineOverlapsInPair".}


proc boxOverlapRegion*(box1: ptr Box; box2: ptr Box): ptr Box {.
    importc: "boxOverlapRegion".}
proc boxBoundingRegion*(box1: ptr Box; box2: ptr Box): ptr Box {.
    importc: "boxBoundingRegion".}
proc boxOverlapFraction*(box1: ptr Box; box2: ptr Box; pfract: ptr LFloat32): LOk {.
    importc: "boxOverlapFraction".}
proc boxOverlapArea*(box1: ptr Box; box2: ptr Box; parea: ptr LInt32): LOk {.
    importc: "boxOverlapArea".}


proc boxaHandleOverlaps*(boxas: ptr Boxa; op: LInt32; range: LInt32;
                         minOverlap: LFloat32; maxRatio: LFloat32;
                         pnamap: ptr ptr Numa): ptr Boxa {.
    importc: "boxaHandleOverlaps".}
proc boxOverlapDistance*(box1: ptr Box; box2: ptr Box; phOvl: ptr LInt32;
                         pvOvl: ptr LInt32): LOk {.
    importc: "boxOverlapDistance".}
proc boxSeparationDistance*(box1: ptr Box; box2: ptr Box; phSep: ptr LInt32;
                            pvSep: ptr LInt32): LOk {.
    importc: "boxSeparationDistance".}
proc boxCompareSize*(box1: ptr Box; box2: ptr Box; `type`: LInt32;
                     prel: ptr LInt32): LOk {.importc: "boxCompareSize".}
proc boxContainsPt*(box: ptr Box; x: LFloat32; y: LFloat32;
                    pcontains: ptr LInt32): LOk {.importc: "boxContainsPt".}

proc boxaGetNearestToPt*(boxa: ptr Boxa; x: LInt32; y: LInt32): ptr Box {.
    importc: "boxaGetNearestToPt".}
proc boxaGetNearestToLine*(boxa: ptr Boxa; x: LInt32; y: LInt32): ptr Box {.
    importc: "boxaGetNearestToLine".}
proc boxaFindNearestBoxes*(boxa: ptr Boxa; distSelect: LInt32; range: LInt32;
                           pnaaindex: ptr ptr Numaa; pnaadist: ptr ptr Numaa): LOk {.
    importc: "boxaFindNearestBoxes".}
proc boxaGetNearestByDirection*(boxa: ptr Boxa; i: LInt32; dir: LInt32;
                                distSelect: LInt32; range: LInt32;
                                pindex: ptr LInt32; pdist: ptr LInt32): LOk {.
    importc: "boxaGetNearestByDirection".}
proc boxGetCenter*(box: ptr Box; pcx: ptr LFloat32; pcy: ptr LFloat32): LOk {.
    importc: "boxGetCenter".}
proc boxIntersectByLine*(box: ptr Box; x: LInt32; y: LInt32; slope: LFloat32;
                         px1: ptr LInt32; py1: ptr LInt32; px2: ptr LInt32;
                         py2: ptr LInt32; pn: ptr LInt32): LOk {.
    importc: "boxIntersectByLine".}
proc boxClipToRectangle*(box: ptr Box; wi: LInt32; hi: LInt32): ptr Box {.
    importc: "boxClipToRectangle".}
proc boxClipToRectangleParams*(box: ptr Box; w: LInt32; h: LInt32;
                               pxstart: ptr LInt32; pystart: ptr LInt32;
                               pxend: ptr LInt32; pyend: ptr LInt32;
                               pbw: ptr LInt32; pbh: ptr LInt32): LOk {.
    importc: "boxClipToRectangleParams".}
proc boxRelocateOneSide*(boxd: ptr Box; boxs: ptr Box; loc: LInt32;
                         sideflag: LInt32): ptr Box {.
    importc: "boxRelocateOneSide".}
proc boxaAdjustSides*(boxas: ptr Boxa; delleft: LInt32; delright: LInt32;
                      deltop: LInt32; delbot: LInt32): ptr Boxa {.
    importc: "boxaAdjustSides".}
proc boxaAdjustBoxSides*(boxa: ptr Boxa; index: LInt32; delleft: LInt32;
                         delright: LInt32; deltop: LInt32; delbot: LInt32): LOk {.
    importc: "boxaAdjustBoxSides".}
proc boxAdjustSides*(boxd: ptr Box; boxs: ptr Box; delleft: LInt32;
                     delright: LInt32; deltop: LInt32; delbot: LInt32): ptr Box {.
    importc: "boxAdjustSides".}
proc boxaSetSide*(boxad: ptr Boxa; boxas: ptr Boxa; side: LInt32; val: LInt32;
                  thresh: LInt32): ptr Boxa {.importc: "boxaSetSide".}
proc boxSetSide*(boxs: ptr Box; side: LInt32; val: LInt32; thresh: LInt32): LOk {.
    importc: "boxSetSide".}
proc boxaAdjustWidthToTarget*(boxad: ptr Boxa; boxas: ptr Boxa; sides: LInt32;
                              target: LInt32; thresh: LInt32): ptr Boxa {.
    importc: "boxaAdjustWidthToTarget".}
proc boxaAdjustHeightToTarget*(boxad: ptr Boxa; boxas: ptr Boxa; sides: LInt32;
                               target: LInt32; thresh: LInt32): ptr Boxa {.
    importc: "boxaAdjustHeightToTarget".}
proc boxEqual*(box1: ptr Box; box2: ptr Box; psame: ptr LInt32): LOk {.
    importc: "boxEqual".}
proc boxaEqual*(boxa1: ptr Boxa; boxa2: ptr Boxa; maxdist: LInt32;
                pnaindex: ptr ptr Numa; psame: ptr LInt32): LOk {.
    importc: "boxaEqual".}
proc boxSimilar*(box1: ptr Box; box2: ptr Box; leftdiff: LInt32;
                 rightdiff: LInt32; topdiff: LInt32; botdiff: LInt32;
                 psimilar: ptr LInt32): LOk {.importc: "boxSimilar".}
proc boxaSimilar*(boxa1: ptr Boxa; boxa2: ptr Boxa; leftdiff: LInt32;
                  rightdiff: LInt32; topdiff: LInt32; botdiff: LInt32;
                  debug: LInt32; psimilar: ptr LInt32; pnasim: ptr ptr Numa): LOk {.
    importc: "boxaSimilar".}
proc boxaJoin*(boxad: ptr Boxa; boxas: ptr Boxa; istart: LInt32; iend: LInt32): LOk {.
    importc: "boxaJoin".}
proc boxaaJoin*(baad: ptr Boxaa; baas: ptr Boxaa; istart: LInt32; iend: LInt32): LOk {.
    importc: "boxaaJoin".}
proc boxaSplitEvenOdd*(boxa: ptr Boxa; fillflag: LInt32; pboxae: ptr ptr Boxa;
                       pboxao: ptr ptr Boxa): LOk {.importc: "boxaSplitEvenOdd".}
proc boxaMergeEvenOdd*(boxae: ptr Boxa; boxao: ptr Boxa; fillflag: LInt32): ptr Boxa {.
    importc: "boxaMergeEvenOdd".}
proc boxaTransform*(boxas: ptr Boxa; shiftx: LInt32; shifty: LInt32;
                    scalex: LFloat32; scaley: LFloat32): ptr Boxa {.
    importc: "boxaTransform".}
proc boxTransform*(box: ptr Box; shiftx: LInt32; shifty: LInt32;
                   scalex: LFloat32; scaley: LFloat32): ptr Box {.
    importc: "boxTransform".}
proc boxaTransformOrdered*(boxas: ptr Boxa; shiftx: LInt32; shifty: LInt32;
                           scalex: LFloat32; scaley: LFloat32; xcen: LInt32;
                           ycen: LInt32; angle: LFloat32; order: LInt32): ptr Boxa {.
    importc: "boxaTransformOrdered".}
proc boxTransformOrdered*(boxs: ptr Box; shiftx: LInt32; shifty: LInt32;
                          scalex: LFloat32; scaley: LFloat32; xcen: LInt32;
                          ycen: LInt32; angle: LFloat32; order: LInt32): ptr Box {.
    importc: "boxTransformOrdered".}
proc boxaRotateOrth*(boxas: ptr Boxa; w: LInt32; h: LInt32; rotation: LInt32): ptr Boxa {.
    importc: "boxaRotateOrth".}
proc boxRotateOrth*(box: ptr Box; w: LInt32; h: LInt32; rotation: LInt32): ptr Box {.
    importc: "boxRotateOrth".}
proc boxaShiftWithPta*(boxas: ptr Boxa; pta: ptr Pta; dir: LInt32): ptr Boxa {.
    importc: "boxaShiftWithPta".}
proc boxaSort*(boxas: ptr Boxa; sorttype: LInt32; sortorder: LInt32;
               pnaindex: ptr ptr Numa): ptr Boxa {.importc: "boxaSort".}
proc boxaBinSort*(boxas: ptr Boxa; sorttype: LInt32; sortorder: LInt32;
                  pnaindex: ptr ptr Numa): ptr Boxa {.importc: "boxaBinSort".}
proc boxaSortByIndex*(boxas: ptr Boxa; naindex: ptr Numa): ptr Boxa {.
    importc: "boxaSortByIndex".}
proc boxaSort2d*(boxas: ptr Boxa; pnaad: ptr ptr Numaa; delta1: LInt32;
                 delta2: LInt32; minh1: LInt32): ptr Boxaa {.
    importc: "boxaSort2d".}
proc boxaSort2dByIndex*(boxas: ptr Boxa; naa: ptr Numaa): ptr Boxaa {.
    importc: "boxaSort2dByIndex".}
proc boxaExtractAsNuma*(boxa: ptr Boxa; pnal: ptr ptr Numa; pnat: ptr ptr Numa;
                        pnar: ptr ptr Numa; pnab: ptr ptr Numa;
                        pnaw: ptr ptr Numa; pnah: ptr ptr Numa;
                        keepinvalid: LInt32): LOk {.
    importc: "boxaExtractAsNuma".}
proc boxaExtractAsPta*(boxa: ptr Boxa; pptal: ptr ptr Pta; pptat: ptr ptr Pta;
                       pptar: ptr ptr Pta; pptab: ptr ptr Pta;
                       pptaw: ptr ptr Pta; pptah: ptr ptr Pta;
                       keepinvalid: LInt32): LOk {.importc: "boxaExtractAsPta".}
proc boxaExtractCorners*(boxa: ptr Boxa; loc: LInt32): ptr Pta {.
    importc: "boxaExtractCorners".}
proc boxaGetRankVals*(boxa: ptr Boxa; fract: LFloat32; px: ptr LInt32;
                      py: ptr LInt32; pr: ptr LInt32; pb: ptr LInt32;
                      pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "boxaGetRankVals".}
proc boxaGetMedianVals*(boxa: ptr Boxa; px: ptr LInt32; py: ptr LInt32;
                        pr: ptr LInt32; pb: ptr LInt32; pw: ptr LInt32;
                        ph: ptr LInt32): LOk {.importc: "boxaGetMedianVals".}
proc boxaGetAverageSize*(boxa: ptr Boxa; pw: ptr LFloat32; ph: ptr LFloat32): LOk {.
    importc: "boxaGetAverageSize".}
proc boxaaGetExtent*(baa: ptr Boxaa; pw: ptr LInt32; ph: ptr LInt32;
                     pbox: ptr ptr Box; pboxa: ptr ptr Boxa): LOk {.
    importc: "boxaaGetExtent".}
proc boxaaFlattenToBoxa*(baa: ptr Boxaa; pnaindex: ptr ptr Numa;
                         copyflag: LInt32): ptr Boxa {.
    importc: "boxaaFlattenToBoxa".}
proc boxaaFlattenAligned*(baa: ptr Boxaa; num: LInt32; fillerbox: ptr Box;
                          copyflag: LInt32): ptr Boxa {.
    importc: "boxaaFlattenAligned".}
proc boxaEncapsulateAligned*(boxa: ptr Boxa; num: LInt32; copyflag: LInt32): ptr Boxaa {.
    importc: "boxaEncapsulateAligned".}
proc boxaaTranspose*(baas: ptr Boxaa): ptr Boxaa {.importc: "boxaaTranspose".}
proc boxaaAlignBox*(baa: ptr Boxaa; box: ptr Box; delta: LInt32;
                    pindex: ptr LInt32): LOk {.importc: "boxaaAlignBox".}
proc pixMaskConnComp*(pixs: ptr Pix; connectivity: LInt32; pboxa: ptr ptr Boxa): ptr Pix {.
    importc: "pixMaskConnComp".}
proc pixMaskBoxa*(pixd: ptr Pix; pixs: ptr Pix; boxa: ptr Boxa; op: LInt32): ptr Pix {.
    importc: "pixMaskBoxa".}
proc pixPaintBoxa*(pixs: ptr Pix; boxa: ptr Boxa; val: LUint32): ptr Pix {.
    importc: "pixPaintBoxa".}
proc pixSetBlackOrWhiteBoxa*(pixs: ptr Pix; boxa: ptr Boxa; op: LInt32): ptr Pix {.
    importc: "pixSetBlackOrWhiteBoxa".}
proc pixPaintBoxaRandom*(pixs: ptr Pix; boxa: ptr Boxa): ptr Pix {.
    importc: "pixPaintBoxaRandom".}
proc pixBlendBoxaRandom*(pixs: ptr Pix; boxa: ptr Boxa; fract: LFloat32): ptr Pix {.
    importc: "pixBlendBoxaRandom".}
proc pixDrawBoxa*(pixs: ptr Pix; boxa: ptr Boxa; width: LInt32; val: LUint32): ptr Pix {.
    importc: "pixDrawBoxa".}
proc pixDrawBoxaRandom*(pixs: ptr Pix; boxa: ptr Boxa; width: LInt32): ptr Pix {.
    importc: "pixDrawBoxaRandom".}
proc boxaaDisplay*(pixs: ptr Pix; baa: ptr Boxaa; linewba: LInt32;
                   linewb: LInt32; colorba: LUint32; colorb: LUint32; w: LInt32;
                   h: LInt32): ptr Pix {.importc: "boxaaDisplay".}
proc pixaDisplayBoxaa*(pixas: ptr Pixa; baa: ptr Boxaa; colorflag: LInt32;
                       width: LInt32): ptr Pixa {.importc: "pixaDisplayBoxaa".}
proc pixSplitIntoBoxa*(pixs: ptr Pix; minsum: LInt32; skipdist: LInt32;
                       delta: LInt32; maxbg: LInt32; maxcomps: LInt32;
                       remainder: LInt32): ptr Boxa {.
    importc: "pixSplitIntoBoxa".}
proc pixSplitComponentIntoBoxa*(pix: ptr Pix; box: ptr Box; minsum: LInt32;
                                skipdist: LInt32; delta: LInt32; maxbg: LInt32;
                                maxcomps: LInt32; remainder: LInt32): ptr Boxa {.
    importc: "pixSplitComponentIntoBoxa".}
proc makeMosaicStrips*(w: LInt32; h: LInt32; direction: LInt32; size: LInt32): ptr Boxa {.
    importc: "makeMosaicStrips".}
proc boxaCompareRegions*(boxa1: ptr Boxa; boxa2: ptr Boxa; areathresh: LInt32;
                         pnsame: ptr LInt32; pdiffarea: ptr LFloat32;
                         pdiffxor: ptr LFloat32; ppixdb: ptr ptr Pix): LOk {.
    importc: "boxaCompareRegions".}
proc pixSelectLargeULComp*(pixs: ptr Pix; areaslop: LFloat32; yslop: LInt32;
                           connectivity: LInt32): ptr Box {.
    importc: "pixSelectLargeULComp".}
proc boxaSelectLargeULBox*(boxas: ptr Boxa; areaslop: LFloat32; yslop: LInt32): ptr Box {.
    importc: "boxaSelectLargeULBox".}
proc boxaSelectRange*(boxas: ptr Boxa; first: LInt32; last: LInt32;
                      copyflag: LInt32): ptr Boxa {.importc: "boxaSelectRange".}
proc boxaaSelectRange*(baas: ptr Boxaa; first: LInt32; last: LInt32;
                       copyflag: LInt32): ptr Boxaa {.
    importc: "boxaaSelectRange".}
proc boxaSelectBySize*(boxas: ptr Boxa; width: LInt32; height: LInt32;
                       `type`: LInt32; relation: LInt32; pchanged: ptr LInt32): ptr Boxa {.
    importc: "boxaSelectBySize".}
proc boxaMakeSizeIndicator*(boxa: ptr Boxa; width: LInt32; height: LInt32;
                            `type`: LInt32; relation: LInt32): ptr Numa {.
    importc: "boxaMakeSizeIndicator".}
proc boxaSelectByArea*(boxas: ptr Boxa; area: LInt32; relation: LInt32;
                       pchanged: ptr LInt32): ptr Boxa {.
    importc: "boxaSelectByArea".}
proc boxaMakeAreaIndicator*(boxa: ptr Boxa; area: LInt32; relation: LInt32): ptr Numa {.
    importc: "boxaMakeAreaIndicator".}
proc boxaSelectByWHRatio*(boxas: ptr Boxa; ratio: LFloat32; relation: LInt32;
                          pchanged: ptr LInt32): ptr Boxa {.
    importc: "boxaSelectByWHRatio".}
proc boxaMakeWHRatioIndicator*(boxa: ptr Boxa; ratio: LFloat32; relation: LInt32): ptr Numa {.
    importc: "boxaMakeWHRatioIndicator".}
proc boxaSelectWithIndicator*(boxas: ptr Boxa; na: ptr Numa;
                              pchanged: ptr LInt32): ptr Boxa {.
    importc: "boxaSelectWithIndicator".}
proc boxaPermutePseudorandom*(boxas: ptr Boxa): ptr Boxa {.
    importc: "boxaPermutePseudorandom".}
proc boxaPermuteRandom*(boxad: ptr Boxa; boxas: ptr Boxa): ptr Boxa {.
    importc: "boxaPermuteRandom".}
proc boxaSwapBoxes*(boxa: ptr Boxa; i: LInt32; j: LInt32): LOk {.
    importc: "boxaSwapBoxes".}
proc boxaConvertToPta*(boxa: ptr Boxa; ncorners: LInt32): ptr Pta {.
    importc: "boxaConvertToPta".}
proc ptaConvertToBoxa*(pta: ptr Pta; ncorners: LInt32): ptr Boxa {.
    importc: "ptaConvertToBoxa".}
proc boxConvertToPta*(box: ptr Box; ncorners: LInt32): ptr Pta {.
    importc: "boxConvertToPta".}
proc ptaConvertToBox*(pta: ptr Pta): ptr Box {.importc: "ptaConvertToBox".}
proc boxaGetExtent*(boxa: ptr Boxa; pw: ptr LInt32; ph: ptr LInt32;
                    pbox: ptr ptr Box): LOk {.importc: "boxaGetExtent".}
proc boxaGetCoverage*(boxa: ptr Boxa; wc: LInt32; hc: LInt32; exactflag: LInt32;
                      pfract: ptr LFloat32): LOk {.importc: "boxaGetCoverage".}
proc boxaaSizeRange*(baa: ptr Boxaa; pminw: ptr LInt32; pminh: ptr LInt32;
                     pmaxw: ptr LInt32; pmaxh: ptr LInt32): LOk {.
    importc: "boxaaSizeRange".}
proc boxaSizeRange*(boxa: ptr Boxa; pminw: ptr LInt32; pminh: ptr LInt32;
                    pmaxw: ptr LInt32; pmaxh: ptr LInt32): LOk {.
    importc: "boxaSizeRange".}
proc boxaLocationRange*(boxa: ptr Boxa; pminx: ptr LInt32; pminy: ptr LInt32;
                        pmaxx: ptr LInt32; pmaxy: ptr LInt32): LOk {.
    importc: "boxaLocationRange".}
proc boxaGetSizes*(boxa: ptr Boxa; pnaw: ptr ptr Numa; pnah: ptr ptr Numa): LOk {.
    importc: "boxaGetSizes".}
proc boxaGetArea*(boxa: ptr Boxa; parea: ptr LInt32): LOk {.
    importc: "boxaGetArea".}
proc boxaDisplayTiled*(boxas: ptr Boxa; pixa: ptr Pixa; first: LInt32;
                       last: LInt32; maxwidth: LInt32; linewidth: LInt32;
                       scalefactor: LFloat32; background: LInt32;
                       spacing: LInt32; border: LInt32): ptr Pix {.
    importc: "boxaDisplayTiled".}
proc boxaSmoothSequenceMedian*(boxas: ptr Boxa; halfwin: LInt32;
                               subflag: LInt32; maxdiff: LInt32;
                               extrapixels: LInt32; debug: LInt32): ptr Boxa {.
    importc: "boxaSmoothSequenceMedian".}
proc boxaWindowedMedian*(boxas: ptr Boxa; halfwin: LInt32; debug: LInt32): ptr Boxa {.
    importc: "boxaWindowedMedian".}
proc boxaModifyWithBoxa*(boxas: ptr Boxa; boxam: ptr Boxa; subflag: LInt32;
                         maxdiff: LInt32; extrapixels: LInt32): ptr Boxa {.
    importc: "boxaModifyWithBoxa".}
proc boxaReconcilePairWidth*(boxas: ptr Boxa; delw: LInt32; op: LInt32;
                             factor: LFloat32; na: ptr Numa): ptr Boxa {.
    importc: "boxaReconcilePairWidth".}
proc boxaSizeConsistency*(boxas: ptr Boxa; `type`: LInt32; threshp: LFloat32;
                          threshm: LFloat32; pfvarp: ptr LFloat32;
                          pfvarm: ptr LFloat32; psame: ptr LInt32): LOk {.
    importc: "boxaSizeConsistency".}
proc boxaReconcileAllByMedian*(boxas: ptr Boxa; select1: LInt32;
                               select2: LInt32; thresh: LInt32; extra: LInt32;
                               pixadb: ptr Pixa): ptr Boxa {.
    importc: "boxaReconcileAllByMedian".}
proc boxaReconcileSidesByMedian*(boxas: ptr Boxa; select: LInt32;
                                 thresh: LInt32; extra: LInt32; pixadb: ptr Pixa): ptr Boxa {.
    importc: "boxaReconcileSidesByMedian".}
proc boxaReconcileSizeByMedian*(boxas: ptr Boxa; `type`: LInt32;
                                dfract: LFloat32; sfract: LFloat32;
                                factor: LFloat32; pnadelw: ptr ptr Numa;
                                pnadelh: ptr ptr Numa; pratiowh: ptr LFloat32): ptr Boxa {.
    importc: "boxaReconcileSizeByMedian".}
proc boxaPlotSides*(boxa: ptr Boxa; plotname: cstring; pnal: ptr ptr Numa;
                    pnat: ptr ptr Numa; pnar: ptr ptr Numa; pnab: ptr ptr Numa;
                    ppixd: ptr ptr Pix): LOk {.importc: "boxaPlotSides".}
proc boxaPlotSizes*(boxa: ptr Boxa; plotname: cstring; pnaw: ptr ptr Numa;
                    pnah: ptr ptr Numa; ppixd: ptr ptr Pix): LOk {.
    importc: "boxaPlotSizes".}
proc boxaFillSequence*(boxas: ptr Boxa; useflag: LInt32; debug: LInt32): ptr Boxa {.
    importc: "boxaFillSequence".}
proc boxaSizeVariation*(boxa: ptr Boxa; `type`: LInt32;
                        pdelEvenodd: ptr LFloat32; prmsEven: ptr LFloat32;
                        prmsOdd: ptr LFloat32; prmsAll: ptr LFloat32): LOk {.
    importc: "boxaSizeVariation".}
proc boxaMedianDimensions*(boxas: ptr Boxa; pmedw: ptr LInt32;
                           pmedh: ptr LInt32; pmedwe: ptr LInt32;
                           pmedwo: ptr LInt32; pmedhe: ptr LInt32;
                           pmedho: ptr LInt32; pnadelw: ptr ptr Numa;
                           pnadelh: ptr ptr Numa): LOk {.
    importc: "boxaMedianDimensions".}
proc lByteaCreate*(nbytes: csize_t): ptr L_Bytea {.importc: "l_byteaCreate".}
proc lByteaInitFromMem*(data: ptr LUint8; size: csize_t): ptr L_Bytea {.
    importc: "l_byteaInitFromMem".}
proc lByteaInitFromFile*(fname: cstring): ptr L_Bytea {.
    importc: "l_byteaInitFromFile".}
proc lByteaInitFromStream*(fp: ptr File): ptr L_Bytea {.
    importc: "l_byteaInitFromStream".}
proc lByteaCopy*(bas: ptr L_Bytea; copyflag: LInt32): ptr L_Bytea {.
    importc: "l_byteaCopy".}
proc lByteaDestroy*(pba: ptr ptr L_Bytea) {.importc: "l_byteaDestroy".}
proc lByteaGetSize*(ba: ptr L_Bytea): csize_t {.importc: "l_byteaGetSize".}
proc lByteaGetData*(ba: ptr L_Bytea; psize: ptr csize_t): ptr LUint8 {.
    importc: "l_byteaGetData".}
proc lByteaCopyData*(ba: ptr L_Bytea; psize: ptr csize_t): ptr LUint8 {.
    importc: "l_byteaCopyData".}
proc lByteaAppendData*(ba: ptr L_Bytea; newdata: ptr LUint8; newbytes: csize_t): LOk {.
    importc: "l_byteaAppendData".}
proc lByteaAppendString*(ba: ptr L_Bytea; str: cstring): LOk {.
    importc: "l_byteaAppendString".}
proc lByteaJoin*(ba1: ptr L_Bytea; pba2: ptr ptr L_Bytea): LOk {.
    importc: "l_byteaJoin".}
proc lByteaSplit*(ba1: ptr L_Bytea; splitloc: csize_t; pba2: ptr ptr L_Bytea): LOk {.
    importc: "l_byteaSplit".}
proc lByteaFindEachSequence*(ba: ptr L_Bytea; sequence: ptr LUint8;
                             seqlen: csize_t; pda: ptr ptr L_Dna): LOk {.
    importc: "l_byteaFindEachSequence".}
proc lByteaWrite*(fname: cstring; ba: ptr L_Bytea; startloc: csize_t;
                  nbytes: csize_t): LOk {.importc: "l_byteaWrite".}
proc lByteaWriteStream*(fp: ptr File; ba: ptr L_Bytea; startloc: csize_t;
                        nbytes: csize_t): LOk {.importc: "l_byteaWriteStream".}
proc ccbaDestroy*(pccba: ptr ptr Ccborda) {.importc: "ccbaDestroy".}
proc pixGetAllCCBorders*(pixs: ptr Pix): ptr Ccborda {.
    importc: "pixGetAllCCBorders".}
proc pixGetOuterBordersPtaa*(pixs: ptr Pix): ptr Ptaa {.
    importc: "pixGetOuterBordersPtaa".}
proc pixGetOuterBorder*(ccb: ptr Ccbord; pixs: ptr Pix; box: ptr Box): LOk {.
    importc: "pixGetOuterBorder".}
proc ccbaGenerateGlobalLocs*(ccba: ptr Ccborda): LOk {.
    importc: "ccbaGenerateGlobalLocs".}
proc ccbaGenerateStepChains*(ccba: ptr Ccborda): LOk {.
    importc: "ccbaGenerateStepChains".}
proc ccbaStepChainsToPixCoords*(ccba: ptr Ccborda; coordtype: LInt32): LOk {.
    importc: "ccbaStepChainsToPixCoords".}
proc ccbaGenerateSPGlobalLocs*(ccba: ptr Ccborda; ptsflag: LInt32): LOk {.
    importc: "ccbaGenerateSPGlobalLocs".}
proc ccbaGenerateSinglePath*(ccba: ptr Ccborda): LOk {.
    importc: "ccbaGenerateSinglePath".}
proc ccbaDisplayBorder*(ccba: ptr Ccborda): ptr Pix {.
    importc: "ccbaDisplayBorder".}
proc ccbaDisplaySPBorder*(ccba: ptr Ccborda): ptr Pix {.
    importc: "ccbaDisplaySPBorder".}
proc ccbaDisplayImage1*(ccba: ptr Ccborda): ptr Pix {.
    importc: "ccbaDisplayImage1".}
proc ccbaDisplayImage2*(ccba: ptr Ccborda): ptr Pix {.
    importc: "ccbaDisplayImage2".}
proc ccbaWrite*(filename: cstring; ccba: ptr Ccborda): LOk {.
    importc: "ccbaWrite".}
proc ccbaWriteStream*(fp: ptr File; ccba: ptr Ccborda): LOk {.
    importc: "ccbaWriteStream".}
proc ccbaRead*(filename: cstring): ptr Ccborda {.importc: "ccbaRead".}
proc ccbaReadStream*(fp: ptr File): ptr Ccborda {.importc: "ccbaReadStream".}
proc ccbaWriteSVG*(filename: cstring; ccba: ptr Ccborda): LOk {.
    importc: "ccbaWriteSVG".}
proc ccbaWriteSVGString*(ccba: ptr Ccborda): cstring {.
    importc: "ccbaWriteSVGString".}
proc pixaThinConnected*(pixas: ptr Pixa; `type`: LInt32; connectivity: LInt32;
                        maxiters: LInt32): ptr Pixa {.
    importc: "pixaThinConnected".}
proc pixThinConnected*(pixs: ptr Pix; `type`: LInt32; connectivity: LInt32;
                       maxiters: LInt32): ptr Pix {.importc: "pixThinConnected".}
proc pixThinConnectedBySet*(pixs: ptr Pix; `type`: LInt32; sela: ptr Sela;
                            maxiters: LInt32): ptr Pix {.
    importc: "pixThinConnectedBySet".}
proc selaMakeThinSets*(index: LInt32; debug: LInt32): ptr Sela {.
    importc: "selaMakeThinSets".}
proc pixFindCheckerboardCorners*(pixs: ptr Pix; size: LInt32; dilation: LInt32;
                                 nsels: LInt32; ppixCorners: ptr ptr Pix;
                                 pptaCorners: ptr ptr Pta; pixadb: ptr Pixa): LOk {.
    importc: "pixFindCheckerboardCorners".}
proc jbCorrelation*(dirin: cstring; thresh: LFloat32; weight: LFloat32;
                    components: LInt32; rootname: cstring; firstpage: LInt32;
                    npages: LInt32; renderflag: LInt32): LOk {.
    importc: "jbCorrelation".}
proc jbRankHaus*(dirin: cstring; size: LInt32; rank: LFloat32;
                 components: LInt32; rootname: cstring; firstpage: LInt32;
                 npages: LInt32; renderflag: LInt32): LOk {.
    importc: "jbRankHaus".}
proc jbWordsInTextlines*(dirin: cstring; reduction: LInt32; maxwidth: LInt32;
                         maxheight: LInt32; thresh: LFloat32; weight: LFloat32;
                         pnatl: ptr ptr Numa; firstpage: LInt32; npages: LInt32): ptr Jbclasser {.
    importc: "jbWordsInTextlines".}
proc pixGetWordsInTextlines*(pixs: ptr Pix; minwidth: LInt32; minheight: LInt32;
                             maxwidth: LInt32; maxheight: LInt32;
                             pboxad: ptr ptr Boxa; ppixad: ptr ptr Pixa;
                             pnai: ptr ptr Numa): LOk {.
    importc: "pixGetWordsInTextlines".}
proc pixGetWordBoxesInTextlines*(pixs: ptr Pix; minwidth: LInt32;
                                 minheight: LInt32; maxwidth: LInt32;
                                 maxheight: LInt32; pboxad: ptr ptr Boxa;
                                 pnai: ptr ptr Numa): LOk {.
    importc: "pixGetWordBoxesInTextlines".}
proc pixFindWordAndCharacterBoxes*(pixs: ptr Pix; boxs: ptr Box; thresh: LInt32;
                                   pboxaw: ptr ptr Boxa; pboxaac: ptr ptr Boxaa;
                                   debugdir: cstring): LOk {.
    importc: "pixFindWordAndCharacterBoxes".}
proc boxaExtractSortedPattern*(boxa: ptr Boxa; na: ptr Numa): ptr Numaa {.
    importc: "boxaExtractSortedPattern".}
proc numaaCompareImagesByBoxes*(naa1: ptr Numaa; naa2: ptr Numaa;
                                nperline: LInt32; nreq: LInt32;
                                maxshiftx: LInt32; maxshifty: LInt32;
                                delx: LInt32; dely: LInt32; psame: ptr LInt32;
                                debugflag: LInt32): LOk {.
    importc: "numaaCompareImagesByBoxes".}
proc pixColorContent*(pixs: ptr Pix; rref: LInt32; gref: LInt32; bref: LInt32;
                      mingray: LInt32; ppixr: ptr ptr Pix; ppixg: ptr ptr Pix;
                      ppixb: ptr ptr Pix): LOk {.importc: "pixColorContent".}
proc pixColorMagnitude*(pixs: ptr Pix; rref: LInt32; gref: LInt32; bref: LInt32;
                        `type`: LInt32): ptr Pix {.importc: "pixColorMagnitude".}
proc pixColorFraction*(pixs: ptr Pix; darkthresh: LInt32; lightthresh: LInt32;
                       diffthresh: LInt32; factor: LInt32;
                       ppixfract: ptr LFloat32; pcolorfract: ptr LFloat32): LOk {.
    importc: "pixColorFraction".}
proc pixColorShiftWhitePoint*(pixs: ptr Pix; rref: LInt32; gref: LInt32;
                              bref: LInt32): ptr Pix {.
    importc: "pixColorShiftWhitePoint".}
proc pixMaskOverColorPixels*(pixs: ptr Pix; threshdiff: LInt32; mindist: LInt32): ptr Pix {.
    importc: "pixMaskOverColorPixels".}
proc pixMaskOverGrayPixels*(pixs: ptr Pix; maxlimit: LInt32; satlimit: LInt32): ptr Pix {.
    importc: "pixMaskOverGrayPixels".}
proc pixMaskOverColorRange*(pixs: ptr Pix; rmin: LInt32; rmax: LInt32;
                            gmin: LInt32; gmax: LInt32; bmin: LInt32;
                            bmax: LInt32): ptr Pix {.
    importc: "pixMaskOverColorRange".}
proc pixFindColorRegions*(pixs: ptr Pix; pixm: ptr Pix; factor: LInt32;
                          lightthresh: LInt32; darkthresh: LInt32;
                          mindiff: LInt32; colordiff: LInt32;
                          edgefract: LFloat32; pcolorfract: ptr LFloat32;
                          pcolormask1: ptr ptr Pix; pcolormask2: ptr ptr Pix;
                          pixadb: ptr Pixa): LOk {.
    importc: "pixFindColorRegions".}
proc pixNumSignificantGrayColors*(pixs: ptr Pix; darkthresh: LInt32;
                                  lightthresh: LInt32; minfract: LFloat32;
                                  factor: LInt32; pncolors: ptr LInt32): LOk {.
    importc: "pixNumSignificantGrayColors".}
proc pixColorsForQuantization*(pixs: ptr Pix; thresh: LInt32;
                               pncolors: ptr LInt32; piscolor: ptr LInt32;
                               debug: LInt32): LOk {.
    importc: "pixColorsForQuantization".}
proc pixNumColors*(pixs: ptr Pix; factor: LInt32; pncolors: ptr LInt32): LOk {.
    importc: "pixNumColors".}
proc pixConvertRGBToCmapLossless*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToCmapLossless".}
proc pixGetMostPopulatedColors*(pixs: ptr Pix; sigbits: LInt32; factor: LInt32;
                                ncolors: LInt32; parray: ptr ptr LUint32;
                                pcmap: ptr ptr Pixcmap): LOk {.
    importc: "pixGetMostPopulatedColors".}
proc pixSimpleColorQuantize*(pixs: ptr Pix; sigbits: LInt32; factor: LInt32;
                             ncolors: LInt32): ptr Pix {.
    importc: "pixSimpleColorQuantize".}
proc pixGetRGBHistogram*(pixs: ptr Pix; sigbits: LInt32; factor: LInt32): ptr Numa {.
    importc: "pixGetRGBHistogram".}
proc makeRGBIndexTables*(prtab: ptr ptr LUint32; pgtab: ptr ptr LUint32;
                         pbtab: ptr ptr LUint32; sigbits: LInt32): LOk {.
    importc: "makeRGBIndexTables".}
proc getRGBFromIndex*(index: LUint32; sigbits: LInt32; prval: ptr LInt32;
                      pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "getRGBFromIndex".}
proc pixHasHighlightRed*(pixs: ptr Pix; factor: LInt32; minfract: LFloat32;
                         fthresh: LFloat32; phasred: ptr LInt32;
                         pratio: ptr LFloat32; ppixdb: ptr ptr Pix): LOk {.
    importc: "pixHasHighlightRed".}
proc lColorfillCreate*(pixs: ptr Pix; nx: LInt32; ny: LInt32): ptr L_Colorfill {.
    importc: "l_colorfillCreate".}
proc lColorfillDestroy*(pcf: ptr ptr L_Colorfill) {.
    importc: "l_colorfillDestroy".}
proc pixColorContentByLocation*(cf: ptr L_Colorfill; rref: LInt32; gref: LInt32;
                                bref: LInt32; minmax: LInt32; maxdiff: LInt32;
                                minarea: LInt32; smooth: LInt32; debug: LInt32): LOk {.
    importc: "pixColorContentByLocation".}
proc pixColorFill*(pixs: ptr Pix; minmax: LInt32; maxdiff: LInt32;
                   smooth: LInt32; minarea: LInt32; debug: LInt32): ptr Pix {.
    importc: "pixColorFill".}
proc makeColorfillTestData*(w: LInt32; h: LInt32; nseeds: LInt32; range: LInt32): ptr Pixa {.
    importc: "makeColorfillTestData".}
proc pixColorGrayRegions*(pixs: ptr Pix; boxa: ptr Boxa; `type`: LInt32;
                          thresh: LInt32; rval: LInt32; gval: LInt32;
                          bval: LInt32): ptr Pix {.
    importc: "pixColorGrayRegions".}
proc pixColorGray*(pixs: ptr Pix; box: ptr Box; `type`: LInt32; thresh: LInt32;
                   rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixColorGray".}
proc pixColorGrayMasked*(pixs: ptr Pix; pixm: ptr Pix; `type`: LInt32;
                         thresh: LInt32; rval: LInt32; gval: LInt32;
                         bval: LInt32): ptr Pix {.importc: "pixColorGrayMasked".}
proc pixSnapColor*(pixd: ptr Pix; pixs: ptr Pix; srcval: LUint32;
                   dstval: LUint32; diff: LInt32): ptr Pix {.
    importc: "pixSnapColor".}
proc pixSnapColorCmap*(pixd: ptr Pix; pixs: ptr Pix; srcval: LUint32;
                       dstval: LUint32; diff: LInt32): ptr Pix {.
    importc: "pixSnapColorCmap".}
proc pixLinearMapToTargetColor*(pixd: ptr Pix; pixs: ptr Pix; srcval: LUint32;
                                dstval: LUint32): ptr Pix {.
    importc: "pixLinearMapToTargetColor".}
proc pixelLinearMapToTargetColor*(scolor: LUint32; srcmap: LUint32;
                                  dstmap: LUint32; pdcolor: ptr LUint32): LOk {.
    importc: "pixelLinearMapToTargetColor".}
proc pixShiftByComponent*(pixd: ptr Pix; pixs: ptr Pix; srcval: LUint32;
                          dstval: LUint32): ptr Pix {.
    importc: "pixShiftByComponent".}
proc pixelShiftByComponent*(rval: LInt32; gval: LInt32; bval: LInt32;
                            srcval: LUint32; dstval: LUint32;
                            ppixel: ptr LUint32): LOk {.
    importc: "pixelShiftByComponent".}
proc pixelFractionalShift*(rval: LInt32; gval: LInt32; bval: LInt32;
                           fract: LFloat32; ppixel: ptr LUint32): LOk {.
    importc: "pixelFractionalShift".}
proc pixMapWithInvariantHue*(pixd: ptr Pix; pixs: ptr Pix; srcval: LUint32;
                             fract: LFloat32): ptr Pix {.
    importc: "pixMapWithInvariantHue".}
proc pixcmapCreate*(depth: LInt32): ptr Pixcmap {.importc: "pixcmapCreate".}
proc pixcmapCreateRandom*(depth: LInt32; hasblack: LInt32; haswhite: LInt32): ptr Pixcmap {.
    importc: "pixcmapCreateRandom".}
proc pixcmapCreateLinear*(d: LInt32; nlevels: LInt32): ptr Pixcmap {.
    importc: "pixcmapCreateLinear".}
proc pixcmapCopy*(cmaps: ptr Pixcmap): ptr Pixcmap {.importc: "pixcmapCopy".}
proc pixcmapDestroy*(pcmap: ptr ptr Pixcmap) {.importc: "pixcmapDestroy".}
proc pixcmapIsValid*(cmap: ptr Pixcmap; pix: ptr Pix; pvalid: ptr LInt32): LOk {.
    importc: "pixcmapIsValid".}
proc pixcmapAddColor*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                      bval: LInt32): LOk {.importc: "pixcmapAddColor".}
proc pixcmapAddRGBA*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                     bval: LInt32; aval: LInt32): LOk {.
    importc: "pixcmapAddRGBA".}
proc pixcmapAddNewColor*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                         bval: LInt32; pindex: ptr LInt32): LOk {.
    importc: "pixcmapAddNewColor".}
proc pixcmapAddNearestColor*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                             bval: LInt32; pindex: ptr LInt32): LOk {.
    importc: "pixcmapAddNearestColor".}
proc pixcmapUsableColor*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                         bval: LInt32; pusable: ptr LInt32): LOk {.
    importc: "pixcmapUsableColor".}
proc pixcmapAddBlackOrWhite*(cmap: ptr Pixcmap; color: LInt32;
                             pindex: ptr LInt32): LOk {.
    importc: "pixcmapAddBlackOrWhite".}
proc pixcmapSetBlackAndWhite*(cmap: ptr Pixcmap; setblack: LInt32;
                              setwhite: LInt32): LOk {.
    importc: "pixcmapSetBlackAndWhite".}
proc pixcmapGetCount*(cmap: ptr Pixcmap): LInt32 {.importc: "pixcmapGetCount".}
proc pixcmapGetFreeCount*(cmap: ptr Pixcmap): LInt32 {.
    importc: "pixcmapGetFreeCount".}
proc pixcmapGetDepth*(cmap: ptr Pixcmap): LInt32 {.importc: "pixcmapGetDepth".}
proc pixcmapGetMinDepth*(cmap: ptr Pixcmap; pmindepth: ptr LInt32): LOk {.
    importc: "pixcmapGetMinDepth".}
proc pixcmapClear*(cmap: ptr Pixcmap): LOk {.importc: "pixcmapClear".}
proc pixcmapGetColor*(cmap: ptr Pixcmap; index: LInt32; prval: ptr LInt32;
                      pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "pixcmapGetColor".}
proc pixcmapGetColor32*(cmap: ptr Pixcmap; index: LInt32; pval32: ptr LUint32): LOk {.
    importc: "pixcmapGetColor32".}
proc pixcmapGetRGBA*(cmap: ptr Pixcmap; index: LInt32; prval: ptr LInt32;
                     pgval: ptr LInt32; pbval: ptr LInt32; paval: ptr LInt32): LOk {.
    importc: "pixcmapGetRGBA".}
proc pixcmapGetRGBA32*(cmap: ptr Pixcmap; index: LInt32; pval32: ptr LUint32): LOk {.
    importc: "pixcmapGetRGBA32".}
proc pixcmapResetColor*(cmap: ptr Pixcmap; index: LInt32; rval: LInt32;
                        gval: LInt32; bval: LInt32): LOk {.
    importc: "pixcmapResetColor".}
proc pixcmapSetAlpha*(cmap: ptr Pixcmap; index: LInt32; aval: LInt32): LOk {.
    importc: "pixcmapSetAlpha".}
proc pixcmapGetIndex*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                      bval: LInt32; pindex: ptr LInt32): LInt32 {.
    importc: "pixcmapGetIndex".}
proc pixcmapHasColor*(cmap: ptr Pixcmap; pcolor: ptr LInt32): LOk {.
    importc: "pixcmapHasColor".}
proc pixcmapIsOpaque*(cmap: ptr Pixcmap; popaque: ptr LInt32): LOk {.
    importc: "pixcmapIsOpaque".}
proc pixcmapNonOpaqueColorsInfo*(cmap: ptr Pixcmap; pntrans: ptr LInt32;
                                 pmaxTrans: ptr LInt32; pminOpaque: ptr LInt32): LOk {.
    importc: "pixcmapNonOpaqueColorsInfo".}
proc pixcmapIsBlackAndWhite*(cmap: ptr Pixcmap; pblackwhite: ptr LInt32): LOk {.
    importc: "pixcmapIsBlackAndWhite".}
proc pixcmapCountGrayColors*(cmap: ptr Pixcmap; pngray: ptr LInt32): LOk {.
    importc: "pixcmapCountGrayColors".}
proc pixcmapGetRankIntensity*(cmap: ptr Pixcmap; rankval: LFloat32;
                              pindex: ptr LInt32): LOk {.
    importc: "pixcmapGetRankIntensity".}
proc pixcmapGetNearestIndex*(cmap: ptr Pixcmap; rval: LInt32; gval: LInt32;
                             bval: LInt32; pindex: ptr LInt32): LOk {.
    importc: "pixcmapGetNearestIndex".}
proc pixcmapGetNearestGrayIndex*(cmap: ptr Pixcmap; val: LInt32;
                                 pindex: ptr LInt32): LOk {.
    importc: "pixcmapGetNearestGrayIndex".}
proc pixcmapGetDistanceToColor*(cmap: ptr Pixcmap; index: LInt32; rval: LInt32;
                                gval: LInt32; bval: LInt32; pdist: ptr LInt32): LOk {.
    importc: "pixcmapGetDistanceToColor".}
proc pixcmapGetRangeValues*(cmap: ptr Pixcmap; select: LInt32;
                            pminval: ptr LInt32; pmaxval: ptr LInt32;
                            pminindex: ptr LInt32; pmaxindex: ptr LInt32): LOk {.
    importc: "pixcmapGetRangeValues".}
proc pixcmapGrayToFalseColor*(gamma: LFloat32): ptr Pixcmap {.
    importc: "pixcmapGrayToFalseColor".}
proc pixcmapGrayToColor*(color: LUint32): ptr Pixcmap {.
    importc: "pixcmapGrayToColor".}
proc pixcmapColorToGray*(cmaps: ptr Pixcmap; rwt: LFloat32; gwt: LFloat32;
                         bwt: LFloat32): ptr Pixcmap {.
    importc: "pixcmapColorToGray".}
proc pixcmapConvertTo4*(cmaps: ptr Pixcmap): ptr Pixcmap {.
    importc: "pixcmapConvertTo4".}
proc pixcmapConvertTo8*(cmaps: ptr Pixcmap): ptr Pixcmap {.
    importc: "pixcmapConvertTo8".}
proc pixcmapRead*(filename: cstring): ptr Pixcmap {.importc: "pixcmapRead".}
proc pixcmapReadStream*(fp: ptr File): ptr Pixcmap {.
    importc: "pixcmapReadStream".}
proc pixcmapReadMem*(data: ptr LUint8; size: csize_t): ptr Pixcmap {.
    importc: "pixcmapReadMem".}
proc pixcmapWrite*(filename: cstring; cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapWrite".}
proc pixcmapWriteStream*(fp: ptr File; cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapWriteStream".}
proc pixcmapWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                      cmap: ptr Pixcmap): LOk {.importc: "pixcmapWriteMem".}
proc pixcmapToArrays*(cmap: ptr Pixcmap; prmap: ptr ptr LInt32;
                      pgmap: ptr ptr LInt32; pbmap: ptr ptr LInt32;
                      pamap: ptr ptr LInt32): LOk {.importc: "pixcmapToArrays".}
proc pixcmapToRGBTable*(cmap: ptr Pixcmap; ptab: ptr ptr LUint32;
                        pncolors: ptr LInt32): LOk {.
    importc: "pixcmapToRGBTable".}
proc pixcmapSerializeToMemory*(cmap: ptr Pixcmap; cpc: LInt32;
                               pncolors: ptr LInt32; pdata: ptr ptr LUint8): LOk {.
    importc: "pixcmapSerializeToMemory".}
proc pixcmapDeserializeFromMemory*(data: ptr LUint8; cpc: LInt32;
                                   ncolors: LInt32): ptr Pixcmap {.
    importc: "pixcmapDeserializeFromMemory".}
proc pixcmapConvertToHex*(data: ptr LUint8; ncolors: LInt32): cstring {.
    importc: "pixcmapConvertToHex".}
proc pixcmapGammaTRC*(cmap: ptr Pixcmap; gamma: LFloat32; minval: LInt32;
                      maxval: LInt32): LOk {.importc: "pixcmapGammaTRC".}
proc pixcmapContrastTRC*(cmap: ptr Pixcmap; factor: LFloat32): LOk {.
    importc: "pixcmapContrastTRC".}
proc pixcmapShiftIntensity*(cmap: ptr Pixcmap; fraction: LFloat32): LOk {.
    importc: "pixcmapShiftIntensity".}
proc pixcmapShiftByComponent*(cmap: ptr Pixcmap; srcval: LUint32;
                              dstval: LUint32): LOk {.
    importc: "pixcmapShiftByComponent".}
proc pixColorMorph*(pixs: ptr Pix; `type`: LInt32; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixColorMorph".}
proc pixOctreeColorQuant*(pixs: ptr Pix; colors: LInt32; ditherflag: LInt32): ptr Pix {.
    importc: "pixOctreeColorQuant".}
proc pixOctreeColorQuantGeneral*(pixs: ptr Pix; colors: LInt32;
                                 ditherflag: LInt32; validthresh: LFloat32;
                                 colorthresh: LFloat32): ptr Pix {.
    importc: "pixOctreeColorQuantGeneral".}
proc makeRGBToIndexTables*(cqlevels: LInt32; prtab: ptr ptr LUint32;
                           pgtab: ptr ptr LUint32; pbtab: ptr ptr LUint32): LOk {.
    importc: "makeRGBToIndexTables".}
proc getOctcubeIndexFromRGB*(rval: LInt32; gval: LInt32; bval: LInt32;
                             rtab: ptr LUint32; gtab: ptr LUint32;
                             btab: ptr LUint32; pindex: ptr LUint32) {.
    importc: "getOctcubeIndexFromRGB".}
proc pixOctreeQuantByPopulation*(pixs: ptr Pix; level: LInt32;
                                 ditherflag: LInt32): ptr Pix {.
    importc: "pixOctreeQuantByPopulation".}
proc pixOctreeQuantNumColors*(pixs: ptr Pix; maxcolors: LInt32;
                              subsample: LInt32): ptr Pix {.
    importc: "pixOctreeQuantNumColors".}
proc pixOctcubeQuantMixedWithGray*(pixs: ptr Pix; depth: LInt32;
                                   graylevels: LInt32; delta: LInt32): ptr Pix {.
    importc: "pixOctcubeQuantMixedWithGray".}
proc pixFixedOctcubeQuant256*(pixs: ptr Pix; ditherflag: LInt32): ptr Pix {.
    importc: "pixFixedOctcubeQuant256".}
proc pixFewColorsOctcubeQuant1*(pixs: ptr Pix; level: LInt32): ptr Pix {.
    importc: "pixFewColorsOctcubeQuant1".}
proc pixFewColorsOctcubeQuant2*(pixs: ptr Pix; level: LInt32; na: ptr Numa;
                                ncolors: LInt32; pnerrors: ptr LInt32): ptr Pix {.
    importc: "pixFewColorsOctcubeQuant2".}
proc pixFewColorsOctcubeQuantMixed*(pixs: ptr Pix; level: LInt32;
                                    darkthresh: LInt32; lightthresh: LInt32;
                                    diffthresh: LInt32; minfract: LFloat32;
                                    maxspan: LInt32): ptr Pix {.
    importc: "pixFewColorsOctcubeQuantMixed".}
proc pixFixedOctcubeQuantGenRGB*(pixs: ptr Pix; level: LInt32): ptr Pix {.
    importc: "pixFixedOctcubeQuantGenRGB".}
proc pixQuantFromCmap*(pixs: ptr Pix; cmap: ptr Pixcmap; mindepth: LInt32;
                       level: LInt32; metric: LInt32): ptr Pix {.
    importc: "pixQuantFromCmap".}
proc pixOctcubeQuantFromCmap*(pixs: ptr Pix; cmap: ptr Pixcmap;
                              mindepth: LInt32; level: LInt32; metric: LInt32): ptr Pix {.
    importc: "pixOctcubeQuantFromCmap".}
proc pixOctcubeHistogram*(pixs: ptr Pix; level: LInt32; pncolors: ptr LInt32): ptr Numa {.
    importc: "pixOctcubeHistogram".}
proc pixcmapToOctcubeLUT*(cmap: ptr Pixcmap; level: LInt32; metric: LInt32): ptr LInt32 {.
    importc: "pixcmapToOctcubeLUT".}
proc pixRemoveUnusedColors*(pixs: ptr Pix): LOk {.
    importc: "pixRemoveUnusedColors".}
proc pixNumberOccupiedOctcubes*(pix: ptr Pix; level: LInt32; mincount: LInt32;
                                minfract: LFloat32; pncolors: ptr LInt32): LOk {.
    importc: "pixNumberOccupiedOctcubes".}
proc pixMedianCutQuant*(pixs: ptr Pix; ditherflag: LInt32): ptr Pix {.
    importc: "pixMedianCutQuant".}
proc pixMedianCutQuantGeneral*(pixs: ptr Pix; ditherflag: LInt32;
                               outdepth: LInt32; maxcolors: LInt32;
                               sigbits: LInt32; maxsub: LInt32; checkbw: LInt32): ptr Pix {.
    importc: "pixMedianCutQuantGeneral".}
proc pixMedianCutQuantMixed*(pixs: ptr Pix; ncolor: LInt32; ngray: LInt32;
                             darkthresh: LInt32; lightthresh: LInt32;
                             diffthresh: LInt32): ptr Pix {.
    importc: "pixMedianCutQuantMixed".}
proc pixFewColorsMedianCutQuantMixed*(pixs: ptr Pix; ncolor: LInt32;
                                      ngray: LInt32; maxncolors: LInt32;
                                      darkthresh: LInt32; lightthresh: LInt32;
                                      diffthresh: LInt32): ptr Pix {.
    importc: "pixFewColorsMedianCutQuantMixed".}
proc pixMedianCutHisto*(pixs: ptr Pix; sigbits: LInt32; subsample: LInt32): ptr LInt32 {.
    importc: "pixMedianCutHisto".}
proc pixColorSegment*(pixs: ptr Pix; maxdist: LInt32; maxcolors: LInt32;
                      selsize: LInt32; finalcolors: LInt32; debugflag: LInt32): ptr Pix {.
    importc: "pixColorSegment".}
proc pixColorSegmentCluster*(pixs: ptr Pix; maxdist: LInt32; maxcolors: LInt32;
                             debugflag: LInt32): ptr Pix {.
    importc: "pixColorSegmentCluster".}
proc pixAssignToNearestColor*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                              level: LInt32; countarray: ptr LInt32): LOk {.
    importc: "pixAssignToNearestColor".}
proc pixColorSegmentClean*(pixs: ptr Pix; selsize: LInt32;
                           countarray: ptr LInt32): LOk {.
    importc: "pixColorSegmentClean".}
proc pixColorSegmentRemoveColors*(pixd: ptr Pix; pixs: ptr Pix;
                                  finalcolors: LInt32): LOk {.
    importc: "pixColorSegmentRemoveColors".}
proc pixConvertRGBToHSV*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToHSV".}
proc pixConvertHSVToRGB*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertHSVToRGB".}
proc convertRGBToHSV*(rval: LInt32; gval: LInt32; bval: LInt32;
                      phval: ptr LInt32; psval: ptr LInt32; pvval: ptr LInt32): LOk {.
    importc: "convertRGBToHSV".}
proc convertHSVToRGB*(hval: LInt32; sval: LInt32; vval: LInt32;
                      prval: ptr LInt32; pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "convertHSVToRGB".}
proc pixcmapConvertRGBToHSV*(cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapConvertRGBToHSV".}
proc pixcmapConvertHSVToRGB*(cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapConvertHSVToRGB".}
proc pixConvertRGBToHue*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToHue".}
proc pixConvertRGBToSaturation*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToSaturation".}
proc pixConvertRGBToValue*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToValue".}
proc pixMakeRangeMaskHS*(pixs: ptr Pix; huecenter: LInt32; huehw: LInt32;
                         satcenter: LInt32; sathw: LInt32; regionflag: LInt32): ptr Pix {.
    importc: "pixMakeRangeMaskHS".}
proc pixMakeRangeMaskHV*(pixs: ptr Pix; huecenter: LInt32; huehw: LInt32;
                         valcenter: LInt32; valhw: LInt32; regionflag: LInt32): ptr Pix {.
    importc: "pixMakeRangeMaskHV".}
proc pixMakeRangeMaskSV*(pixs: ptr Pix; satcenter: LInt32; sathw: LInt32;
                         valcenter: LInt32; valhw: LInt32; regionflag: LInt32): ptr Pix {.
    importc: "pixMakeRangeMaskSV".}
proc pixMakeHistoHS*(pixs: ptr Pix; factor: LInt32; pnahue: ptr ptr Numa;
                     pnasat: ptr ptr Numa): ptr Pix {.importc: "pixMakeHistoHS".}
proc pixMakeHistoHV*(pixs: ptr Pix; factor: LInt32; pnahue: ptr ptr Numa;
                     pnaval: ptr ptr Numa): ptr Pix {.importc: "pixMakeHistoHV".}
proc pixMakeHistoSV*(pixs: ptr Pix; factor: LInt32; pnasat: ptr ptr Numa;
                     pnaval: ptr ptr Numa): ptr Pix {.importc: "pixMakeHistoSV".}
proc pixFindHistoPeaksHSV*(pixs: ptr Pix; `type`: LInt32; width: LInt32;
                           height: LInt32; npeaks: LInt32;
                           erasefactor: LFloat32; ppta: ptr ptr Pta;
                           pnatot: ptr ptr Numa; ppixa: ptr ptr Pixa): LOk {.
    importc: "pixFindHistoPeaksHSV".}
proc displayHSVColorRange*(hval: LInt32; sval: LInt32; vval: LInt32;
                           huehw: LInt32; sathw: LInt32; nsamp: LInt32;
                           factor: LInt32): ptr Pix {.
    importc: "displayHSVColorRange".}
proc pixConvertRGBToYUV*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToYUV".}
proc pixConvertYUVToRGB*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertYUVToRGB".}
proc convertRGBToYUV*(rval: LInt32; gval: LInt32; bval: LInt32;
                      pyval: ptr LInt32; puval: ptr LInt32; pvval: ptr LInt32): LOk {.
    importc: "convertRGBToYUV".}
proc convertYUVToRGB*(yval: LInt32; uval: LInt32; vval: LInt32;
                      prval: ptr LInt32; pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "convertYUVToRGB".}
proc pixcmapConvertRGBToYUV*(cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapConvertRGBToYUV".}
proc pixcmapConvertYUVToRGB*(cmap: ptr Pixcmap): LOk {.
    importc: "pixcmapConvertYUVToRGB".}
proc pixConvertRGBToXYZ*(pixs: ptr Pix): ptr Fpixa {.
    importc: "pixConvertRGBToXYZ".}
proc fpixaConvertXYZToRGB*(fpixa: ptr Fpixa): ptr Pix {.
    importc: "fpixaConvertXYZToRGB".}
proc convertRGBToXYZ*(rval: LInt32; gval: LInt32; bval: LInt32;
                      pfxval: ptr LFloat32; pfyval: ptr LFloat32;
                      pfzval: ptr LFloat32): LOk {.importc: "convertRGBToXYZ".}
proc convertXYZToRGB*(fxval: LFloat32; fyval: LFloat32; fzval: LFloat32;
                      blackout: LInt32; prval: ptr LInt32; pgval: ptr LInt32;
                      pbval: ptr LInt32): LOk {.importc: "convertXYZToRGB".}
proc fpixaConvertXYZToLAB*(fpixas: ptr Fpixa): ptr Fpixa {.
    importc: "fpixaConvertXYZToLAB".}
proc fpixaConvertLABToXYZ*(fpixas: ptr Fpixa): ptr Fpixa {.
    importc: "fpixaConvertLABToXYZ".}
proc convertXYZToLAB*(xval: LFloat32; yval: LFloat32; zval: LFloat32;
                      plval: ptr LFloat32; paval: ptr LFloat32;
                      pbval: ptr LFloat32): LOk {.importc: "convertXYZToLAB".}
proc convertLABToXYZ*(lval: LFloat32; aval: LFloat32; bval: LFloat32;
                      pxval: ptr LFloat32; pyval: ptr LFloat32;
                      pzval: ptr LFloat32): LOk {.importc: "convertLABToXYZ".}
proc pixConvertRGBToLAB*(pixs: ptr Pix): ptr Fpixa {.
    importc: "pixConvertRGBToLAB".}
proc fpixaConvertLABToRGB*(fpixa: ptr Fpixa): ptr Pix {.
    importc: "fpixaConvertLABToRGB".}
proc convertRGBToLAB*(rval: LInt32; gval: LInt32; bval: LInt32;
                      pflval: ptr LFloat32; pfaval: ptr LFloat32;
                      pfbval: ptr LFloat32): LOk {.importc: "convertRGBToLAB".}
proc convertLABToRGB*(flval: LFloat32; faval: LFloat32; fbval: LFloat32;
                      prval: ptr LInt32; pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "convertLABToRGB".}
proc pixMakeGamutRGB*(scale: LInt32): ptr Pix {.importc: "pixMakeGamutRGB".}
proc pixEqual*(pix1: ptr Pix; pix2: ptr Pix; psame: ptr LInt32): LOk {.
    importc: "pixEqual".}
proc pixEqualWithAlpha*(pix1: ptr Pix; pix2: ptr Pix; useAlpha: LInt32;
                        psame: ptr LInt32): LOk {.importc: "pixEqualWithAlpha".}
proc pixEqualWithCmap*(pix1: ptr Pix; pix2: ptr Pix; psame: ptr LInt32): LOk {.
    importc: "pixEqualWithCmap".}
proc cmapEqual*(cmap1: ptr Pixcmap; cmap2: ptr Pixcmap; ncomps: LInt32;
                psame: ptr LInt32): LOk {.importc: "cmapEqual".}
proc pixUsesCmapColor*(pixs: ptr Pix; pcolor: ptr LInt32): LOk {.
    importc: "pixUsesCmapColor".}
proc pixCorrelationBinary*(pix1: ptr Pix; pix2: ptr Pix; pval: ptr LFloat32): LOk {.
    importc: "pixCorrelationBinary".}
proc pixDisplayDiff*(pix1: ptr Pix; pix2: ptr Pix; showall: LInt32;
                     mindiff: LInt32; diffcolor: LUint32): ptr Pix {.
    importc: "pixDisplayDiff".}
proc pixDisplayDiffBinary*(pix1: ptr Pix; pix2: ptr Pix): ptr Pix {.
    importc: "pixDisplayDiffBinary".}
proc pixCompareBinary*(pix1: ptr Pix; pix2: ptr Pix; comptype: LInt32;
                       pfract: ptr LFloat32; ppixdiff: ptr ptr Pix): LOk {.
    importc: "pixCompareBinary".}
proc pixCompareGrayOrRGB*(pix1: ptr Pix; pix2: ptr Pix; comptype: LInt32;
                          plottype: LInt32; psame: ptr LInt32;
                          pdiff: ptr LFloat32; prmsdiff: ptr LFloat32;
                          ppixdiff: ptr ptr Pix): LOk {.
    importc: "pixCompareGrayOrRGB".}
proc pixCompareGray*(pix1: ptr Pix; pix2: ptr Pix; comptype: LInt32;
                     plottype: LInt32; psame: ptr LInt32; pdiff: ptr LFloat32;
                     prmsdiff: ptr LFloat32; ppixdiff: ptr ptr Pix): LOk {.
    importc: "pixCompareGray".}
proc pixCompareRGB*(pix1: ptr Pix; pix2: ptr Pix; comptype: LInt32;
                    plottype: LInt32; psame: ptr LInt32; pdiff: ptr LFloat32;
                    prmsdiff: ptr LFloat32; ppixdiff: ptr ptr Pix): LOk {.
    importc: "pixCompareRGB".}
proc pixCompareTiled*(pix1: ptr Pix; pix2: ptr Pix; sx: LInt32; sy: LInt32;
                      `type`: LInt32; ppixdiff: ptr ptr Pix): LOk {.
    importc: "pixCompareTiled".}
proc pixCompareRankDifference*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32): ptr Numa {.
    importc: "pixCompareRankDifference".}
proc pixTestForSimilarity*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32;
                           mindiff: LInt32; maxfract: LFloat32;
                           maxave: LFloat32; psimilar: ptr LInt32;
                           details: LInt32): LOk {.
    importc: "pixTestForSimilarity".}
proc pixGetDifferenceStats*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32;
                            mindiff: LInt32; pfractdiff: ptr LFloat32;
                            pavediff: ptr LFloat32; details: LInt32): LOk {.
    importc: "pixGetDifferenceStats".}
proc pixGetDifferenceHistogram*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32): ptr Numa {.
    importc: "pixGetDifferenceHistogram".}
proc pixGetPerceptualDiff*(pixs1: ptr Pix; pixs2: ptr Pix; sampling: LInt32;
                           dilation: LInt32; mindiff: LInt32;
                           pfract: ptr LFloat32; ppixdiff1: ptr ptr Pix;
                           ppixdiff2: ptr ptr Pix): LOk {.
    importc: "pixGetPerceptualDiff".}
proc pixGetPSNR*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32;
                 ppsnr: ptr LFloat32): LOk {.importc: "pixGetPSNR".}
proc pixaComparePhotoRegionsByHisto*(pixa: ptr Pixa; minratio: LFloat32;
                                     textthresh: LFloat32; factor: LInt32;
                                     n: LInt32; simthresh: LFloat32;
                                     pnai: ptr ptr Numa;
                                     pscores: ptr ptr LFloat32;
                                     ppixd: ptr ptr Pix; debug: LInt32): LOk {.
    importc: "pixaComparePhotoRegionsByHisto".}
proc pixComparePhotoRegionsByHisto*(pix1: ptr Pix; pix2: ptr Pix; box1: ptr Box;
                                    box2: ptr Box; minratio: LFloat32;
                                    factor: LInt32; n: LInt32;
                                    pscore: ptr LFloat32; debugflag: LInt32): LOk {.
    importc: "pixComparePhotoRegionsByHisto".}
proc pixGenPhotoHistos*(pixs: ptr Pix; box: ptr Box; factor: LInt32;
                        thresh: LFloat32; n: LInt32; pnaa: ptr ptr Numaa;
                        pw: ptr LInt32; ph: ptr LInt32; debugindex: LInt32): LOk {.
    importc: "pixGenPhotoHistos".}
proc pixPadToCenterCentroid*(pixs: ptr Pix; factor: LInt32): ptr Pix {.
    importc: "pixPadToCenterCentroid".}
proc pixCentroid8*(pixs: ptr Pix; factor: LInt32; pcx: ptr LFloat32;
                   pcy: ptr LFloat32): LOk {.importc: "pixCentroid8".}
proc pixDecideIfPhotoImage*(pix: ptr Pix; factor: LInt32; thresh: LFloat32;
                            n: LInt32; pnaa: ptr ptr Numaa; pixadebug: ptr Pixa): LOk {.
    importc: "pixDecideIfPhotoImage".}
proc compareTilesByHisto*(naa1: ptr Numaa; naa2: ptr Numaa; minratio: LFloat32;
                          w1: LInt32; h1: LInt32; w2: LInt32; h2: LInt32;
                          pscore: ptr LFloat32; pixadebug: ptr Pixa): LOk {.
    importc: "compareTilesByHisto".}
proc pixCompareGrayByHisto*(pix1: ptr Pix; pix2: ptr Pix; box1: ptr Box;
                            box2: ptr Box; minratio: LFloat32; maxgray: LInt32;
                            factor: LInt32; n: LInt32; pscore: ptr LFloat32;
                            debugflag: LInt32): LOk {.
    importc: "pixCompareGrayByHisto".}
proc pixCropAlignedToCentroid*(pix1: ptr Pix; pix2: ptr Pix; factor: LInt32;
                               pbox1: ptr ptr Box; pbox2: ptr ptr Box): LOk {.
    importc: "pixCropAlignedToCentroid".}
proc lCompressGrayHistograms*(naa: ptr Numaa; w: LInt32; h: LInt32;
                              psize: ptr csize_t): ptr LUint8 {.
    importc: "l_compressGrayHistograms".}
proc lUncompressGrayHistograms*(bytea: ptr LUint8; size: csize_t;
                                pw: ptr LInt32; ph: ptr LInt32): ptr Numaa {.
    importc: "l_uncompressGrayHistograms".}
proc pixCompareWithTranslation*(pix1: ptr Pix; pix2: ptr Pix; thresh: LInt32;
                                pdelx: ptr LInt32; pdely: ptr LInt32;
                                pscore: ptr LFloat32; debugflag: LInt32): LOk {.
    importc: "pixCompareWithTranslation".}
proc pixBestCorrelation*(pix1: ptr Pix; pix2: ptr Pix; area1: LInt32;
                         area2: LInt32; etransx: LInt32; etransy: LInt32;
                         maxshift: LInt32; tab8: ptr LInt32; pdelx: ptr LInt32;
                         pdely: ptr LInt32; pscore: ptr LFloat32;
                         debugflag: LInt32): LOk {.
    importc: "pixBestCorrelation".}
proc pixConnComp*(pixs: ptr Pix; ppixa: ptr ptr Pixa; connectivity: LInt32): ptr Boxa {.
    importc: "pixConnComp".}
proc pixConnCompPixa*(pixs: ptr Pix; ppixa: ptr ptr Pixa; connectivity: LInt32): ptr Boxa {.
    importc: "pixConnCompPixa".}
proc pixConnCompBB*(pixs: ptr Pix; connectivity: LInt32): ptr Boxa {.
    importc: "pixConnCompBB".}
proc pixCountConnComp*(pixs: ptr Pix; connectivity: LInt32; pcount: ptr LInt32): LOk {.
    importc: "pixCountConnComp".}
proc nextOnPixelInRaster*(pixs: ptr Pix; xstart: LInt32; ystart: LInt32;
                          px: ptr LInt32; py: ptr LInt32): LInt32 {.
    importc: "nextOnPixelInRaster".}
proc pixSeedfillBB*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32;
                    connectivity: LInt32): ptr Box {.importc: "pixSeedfillBB".}
proc pixSeedfill4BB*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32): ptr Box {.
    importc: "pixSeedfill4BB".}
proc pixSeedfill8BB*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32): ptr Box {.
    importc: "pixSeedfill8BB".}
proc pixSeedfill*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32;
                  connectivity: LInt32): LOk {.importc: "pixSeedfill".}
proc pixSeedfill4*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32): LOk {.
    importc: "pixSeedfill4".}
proc pixSeedfill8*(pixs: ptr Pix; stack: ptr L_Stack; x: LInt32; y: LInt32): LOk {.
    importc: "pixSeedfill8".}
proc convertFilesTo1bpp*(dirin: cstring; substr: cstring; upscaling: LInt32;
                         thresh: LInt32; firstpage: LInt32; npages: LInt32;
                         dirout: cstring; outformat: LInt32): LOk {.
    importc: "convertFilesTo1bpp".}
proc pixBlockconv*(pix: ptr Pix; wc: LInt32; hc: LInt32): ptr Pix {.
    importc: "pixBlockconv".}
proc pixBlockconvGray*(pixs: ptr Pix; pixacc: ptr Pix; wc: LInt32; hc: LInt32): ptr Pix {.
    importc: "pixBlockconvGray".}
proc pixBlockconvAccum*(pixs: ptr Pix): ptr Pix {.importc: "pixBlockconvAccum".}
proc pixBlockconvGrayUnnormalized*(pixs: ptr Pix; wc: LInt32; hc: LInt32): ptr Pix {.
    importc: "pixBlockconvGrayUnnormalized".}
proc pixBlockconvTiled*(pix: ptr Pix; wc: LInt32; hc: LInt32; nx: LInt32;
                        ny: LInt32): ptr Pix {.importc: "pixBlockconvTiled".}
proc pixBlockconvGrayTile*(pixs: ptr Pix; pixacc: ptr Pix; wc: LInt32;
                           hc: LInt32): ptr Pix {.
    importc: "pixBlockconvGrayTile".}
proc pixWindowedStats*(pixs: ptr Pix; wc: LInt32; hc: LInt32; hasborder: LInt32;
                       ppixm: ptr ptr Pix; ppixms: ptr ptr Pix;
                       pfpixv: ptr ptr Fpix; pfpixrv: ptr ptr Fpix): LOk {.
    importc: "pixWindowedStats".}
proc pixWindowedMean*(pixs: ptr Pix; wc: LInt32; hc: LInt32; hasborder: LInt32;
                      normflag: LInt32): ptr Pix {.importc: "pixWindowedMean".}
proc pixWindowedMeanSquare*(pixs: ptr Pix; wc: LInt32; hc: LInt32;
                            hasborder: LInt32): ptr Pix {.
    importc: "pixWindowedMeanSquare".}
proc pixWindowedVariance*(pixm: ptr Pix; pixms: ptr Pix; pfpixv: ptr ptr Fpix;
                          pfpixrv: ptr ptr Fpix): LOk {.
    importc: "pixWindowedVariance".}
proc pixMeanSquareAccum*(pixs: ptr Pix): ptr Dpix {.
    importc: "pixMeanSquareAccum".}
proc pixBlockrank*(pixs: ptr Pix; pixacc: ptr Pix; wc: LInt32; hc: LInt32;
                   rank: LFloat32): ptr Pix {.importc: "pixBlockrank".}
proc pixBlocksum*(pixs: ptr Pix; pixacc: ptr Pix; wc: LInt32; hc: LInt32): ptr Pix {.
    importc: "pixBlocksum".}
proc pixCensusTransform*(pixs: ptr Pix; halfsize: LInt32; pixacc: ptr Pix): ptr Pix {.
    importc: "pixCensusTransform".}
proc pixConvolve*(pixs: ptr Pix; kel: ptr L_Kernel; outdepth: LInt32;
                  normflag: LInt32): ptr Pix {.importc: "pixConvolve".}
proc pixConvolveSep*(pixs: ptr Pix; kelx: ptr L_Kernel; kely: ptr L_Kernel;
                     outdepth: LInt32; normflag: LInt32): ptr Pix {.
    importc: "pixConvolveSep".}
proc pixConvolveRGB*(pixs: ptr Pix; kel: ptr L_Kernel): ptr Pix {.
    importc: "pixConvolveRGB".}
proc pixConvolveRGBSep*(pixs: ptr Pix; kelx: ptr L_Kernel; kely: ptr L_Kernel): ptr Pix {.
    importc: "pixConvolveRGBSep".}
proc fpixConvolve*(fpixs: ptr Fpix; kel: ptr L_Kernel; normflag: LInt32): ptr Fpix {.
    importc: "fpixConvolve".}
proc fpixConvolveSep*(fpixs: ptr Fpix; kelx: ptr L_Kernel; kely: ptr L_Kernel;
                      normflag: LInt32): ptr Fpix {.importc: "fpixConvolveSep".}
proc pixConvolveWithBias*(pixs: ptr Pix; kel1: ptr L_Kernel; kel2: ptr L_Kernel;
                          force8: LInt32; pbias: ptr LInt32): ptr Pix {.
    importc: "pixConvolveWithBias".}
proc lSetConvolveSampling*(xfact: LInt32; yfact: LInt32) {.
    importc: "l_setConvolveSampling".}
proc pixAddGaussianNoise*(pixs: ptr Pix; stdev: LFloat32): ptr Pix {.
    importc: "pixAddGaussianNoise".}
proc gaussDistribSampling*(): LFloat32 {.importc: "gaussDistribSampling".}
proc pixCorrelationScore*(pix1: ptr Pix; pix2: ptr Pix; area1: LInt32;
                          area2: LInt32; delx: LFloat32; dely: LFloat32;
                          maxdiffw: LInt32; maxdiffh: LInt32; tab: ptr LInt32;
                          pscore: ptr LFloat32): LOk {.
    importc: "pixCorrelationScore".}
proc pixCorrelationScoreThresholded*(pix1: ptr Pix; pix2: ptr Pix;
                                     area1: LInt32; area2: LInt32;
                                     delx: LFloat32; dely: LFloat32;
                                     maxdiffw: LInt32; maxdiffh: LInt32;
                                     tab: ptr LInt32; downcount: ptr LInt32;
                                     scoreThreshold: LFloat32): LInt32 {.
    importc: "pixCorrelationScoreThresholded".}
proc pixCorrelationScoreSimple*(pix1: ptr Pix; pix2: ptr Pix; area1: LInt32;
                                area2: LInt32; delx: LFloat32; dely: LFloat32;
                                maxdiffw: LInt32; maxdiffh: LInt32;
                                tab: ptr LInt32; pscore: ptr LFloat32): LOk {.
    importc: "pixCorrelationScoreSimple".}
proc pixCorrelationScoreShifted*(pix1: ptr Pix; pix2: ptr Pix; area1: LInt32;
                                 area2: LInt32; delx: LInt32; dely: LInt32;
                                 tab: ptr LInt32; pscore: ptr LFloat32): LOk {.
    importc: "pixCorrelationScoreShifted".}
proc dewarpCreate*(pixs: ptr Pix; pageno: LInt32): ptr L_Dewarp {.
    importc: "dewarpCreate".}
proc dewarpCreateRef*(pageno: LInt32; refpage: LInt32): ptr L_Dewarp {.
    importc: "dewarpCreateRef".}
proc dewarpDestroy*(pdew: ptr ptr L_Dewarp) {.importc: "dewarpDestroy".}
proc dewarpaCreate*(nptrs: LInt32; sampling: LInt32; redfactor: LInt32;
                    minlines: LInt32; maxdist: LInt32): ptr L_Dewarpa {.
    importc: "dewarpaCreate".}
proc dewarpaCreateFromPixacomp*(pixac: ptr Pixac; useboth: LInt32;
                                sampling: LInt32; minlines: LInt32;
                                maxdist: LInt32): ptr L_Dewarpa {.
    importc: "dewarpaCreateFromPixacomp".}
proc dewarpaDestroy*(pdewa: ptr ptr L_Dewarpa) {.importc: "dewarpaDestroy".}
proc dewarpaDestroyDewarp*(dewa: ptr L_Dewarpa; pageno: LInt32): LOk {.
    importc: "dewarpaDestroyDewarp".}
proc dewarpaInsertDewarp*(dewa: ptr L_Dewarpa; dew: ptr L_Dewarp): LOk {.
    importc: "dewarpaInsertDewarp".}
proc dewarpaGetDewarp*(dewa: ptr L_Dewarpa; index: LInt32): ptr L_Dewarp {.
    importc: "dewarpaGetDewarp".}
proc dewarpaSetCurvatures*(dewa: ptr L_Dewarpa; maxLinecurv: LInt32;
                           minDiffLinecurv: LInt32; maxDiffLinecurv: LInt32;
                           maxEdgecurv: LInt32; maxDiffEdgecurv: LInt32;
                           maxEdgeslope: LInt32): LOk {.
    importc: "dewarpaSetCurvatures".}
proc dewarpaUseBothArrays*(dewa: ptr L_Dewarpa; useboth: LInt32): LOk {.
    importc: "dewarpaUseBothArrays".}
proc dewarpaSetCheckColumns*(dewa: ptr L_Dewarpa; checkColumns: LInt32): LOk {.
    importc: "dewarpaSetCheckColumns".}
proc dewarpaSetMaxDistance*(dewa: ptr L_Dewarpa; maxdist: LInt32): LOk {.
    importc: "dewarpaSetMaxDistance".}
proc dewarpRead*(filename: cstring): ptr L_Dewarp {.importc: "dewarpRead".}
proc dewarpReadStream*(fp: ptr File): ptr L_Dewarp {.
    importc: "dewarpReadStream".}
proc dewarpReadMem*(data: ptr LUint8; size: csize_t): ptr L_Dewarp {.
    importc: "dewarpReadMem".}
proc dewarpWrite*(filename: cstring; dew: ptr L_Dewarp): LOk {.
    importc: "dewarpWrite".}
proc dewarpWriteStream*(fp: ptr File; dew: ptr L_Dewarp): LOk {.
    importc: "dewarpWriteStream".}
proc dewarpWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                     dew: ptr L_Dewarp): LOk {.importc: "dewarpWriteMem".}
proc dewarpaRead*(filename: cstring): ptr L_Dewarpa {.importc: "dewarpaRead".}
proc dewarpaReadStream*(fp: ptr File): ptr L_Dewarpa {.
    importc: "dewarpaReadStream".}
proc dewarpaReadMem*(data: ptr LUint8; size: csize_t): ptr L_Dewarpa {.
    importc: "dewarpaReadMem".}
proc dewarpaWrite*(filename: cstring; dewa: ptr L_Dewarpa): LOk {.
    importc: "dewarpaWrite".}
proc dewarpaWriteStream*(fp: ptr File; dewa: ptr L_Dewarpa): LOk {.
    importc: "dewarpaWriteStream".}
proc dewarpaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                      dewa: ptr L_Dewarpa): LOk {.importc: "dewarpaWriteMem".}
proc dewarpBuildPageModel*(dew: ptr L_Dewarp; debugfile: cstring): LOk {.
    importc: "dewarpBuildPageModel".}
proc dewarpFindVertDisparity*(dew: ptr L_Dewarp; ptaa: ptr Ptaa; rotflag: LInt32): LOk {.
    importc: "dewarpFindVertDisparity".}
proc dewarpFindHorizDisparity*(dew: ptr L_Dewarp; ptaa: ptr Ptaa): LOk {.
    importc: "dewarpFindHorizDisparity".}
proc dewarpGetTextlineCenters*(pixs: ptr Pix; debugflag: LInt32): ptr Ptaa {.
    importc: "dewarpGetTextlineCenters".}
proc dewarpRemoveShortLines*(pixs: ptr Pix; ptaas: ptr Ptaa; fract: LFloat32;
                             debugflag: LInt32): ptr Ptaa {.
    importc: "dewarpRemoveShortLines".}
proc dewarpFindHorizSlopeDisparity*(dew: ptr L_Dewarp; pixb: ptr Pix;
                                    fractthresh: LFloat32; parity: LInt32): LOk {.
    importc: "dewarpFindHorizSlopeDisparity".}
proc dewarpBuildLineModel*(dew: ptr L_Dewarp; opensize: LInt32;
                           debugfile: cstring): LOk {.
    importc: "dewarpBuildLineModel".}
proc dewarpaModelStatus*(dewa: ptr L_Dewarpa; pageno: LInt32;
                         pvsuccess: ptr LInt32; phsuccess: ptr LInt32): LOk {.
    importc: "dewarpaModelStatus".}
proc dewarpaApplyDisparity*(dewa: ptr L_Dewarpa; pageno: LInt32; pixs: ptr Pix;
                            grayin: LInt32; x: LInt32; y: LInt32;
                            ppixd: ptr ptr Pix; debugfile: cstring): LOk {.
    importc: "dewarpaApplyDisparity".}
proc dewarpaApplyDisparityBoxa*(dewa: ptr L_Dewarpa; pageno: LInt32;
                                pixs: ptr Pix; boxas: ptr Boxa; mapdir: LInt32;
                                x: LInt32; y: LInt32; pboxad: ptr ptr Boxa;
                                debugfile: cstring): LOk {.
    importc: "dewarpaApplyDisparityBoxa".}
proc dewarpMinimize*(dew: ptr L_Dewarp): LOk {.importc: "dewarpMinimize".}
proc dewarpPopulateFullRes*(dew: ptr L_Dewarp; pix: ptr Pix; x: LInt32;
                            y: LInt32): LOk {.importc: "dewarpPopulateFullRes".}
proc dewarpSinglePage*(pixs: ptr Pix; thresh: LInt32; adaptive: LInt32;
                       useboth: LInt32; checkColumns: LInt32;
                       ppixd: ptr ptr Pix; pdewa: ptr ptr L_Dewarpa;
                       debug: LInt32): LOk {.importc: "dewarpSinglePage".}
proc dewarpSinglePageInit*(pixs: ptr Pix; thresh: LInt32; adaptive: LInt32;
                           useboth: LInt32; checkColumns: LInt32;
                           ppixb: ptr ptr Pix; pdewa: ptr ptr L_Dewarpa): LOk {.
    importc: "dewarpSinglePageInit".}
proc dewarpSinglePageRun*(pixs: ptr Pix; pixb: ptr Pix; dewa: ptr L_Dewarpa;
                          ppixd: ptr ptr Pix; debug: LInt32): LOk {.
    importc: "dewarpSinglePageRun".}
proc dewarpaListPages*(dewa: ptr L_Dewarpa): LOk {.importc: "dewarpaListPages".}
proc dewarpaSetValidModels*(dewa: ptr L_Dewarpa; notests: LInt32; debug: LInt32): LOk {.
    importc: "dewarpaSetValidModels".}
proc dewarpaInsertRefModels*(dewa: ptr L_Dewarpa; notests: LInt32; debug: LInt32): LOk {.
    importc: "dewarpaInsertRefModels".}
proc dewarpaStripRefModels*(dewa: ptr L_Dewarpa): LOk {.
    importc: "dewarpaStripRefModels".}
proc dewarpaRestoreModels*(dewa: ptr L_Dewarpa): LOk {.
    importc: "dewarpaRestoreModels".}
proc dewarpaInfo*(fp: ptr File; dewa: ptr L_Dewarpa): LOk {.
    importc: "dewarpaInfo".}
proc dewarpaModelStats*(dewa: ptr L_Dewarpa; pnnone: ptr LInt32;
                        pnvsuccess: ptr LInt32; pnvvalid: ptr LInt32;
                        pnhsuccess: ptr LInt32; pnhvalid: ptr LInt32;
                        pnref: ptr LInt32): LOk {.importc: "dewarpaModelStats".}
proc dewarpaShowArrays*(dewa: ptr L_Dewarpa; scalefact: LFloat32; first: LInt32;
                        last: LInt32): LOk {.importc: "dewarpaShowArrays".}
proc dewarpDebug*(dew: ptr L_Dewarp; subdirs: cstring; index: LInt32): LOk {.
    importc: "dewarpDebug".}
proc dewarpShowResults*(dewa: ptr L_Dewarpa; sa: ptr Sarray; boxa: ptr Boxa;
                        firstpage: LInt32; lastpage: LInt32; pdfout: cstring): LOk {.
    importc: "dewarpShowResults".}
proc lDnaCreate*(n: LInt32): ptr L_Dna {.importc: "l_dnaCreate".}
proc lDnaCreateFromIArray*(iarray: ptr LInt32; size: LInt32): ptr L_Dna {.
    importc: "l_dnaCreateFromIArray".}
proc lDnaCreateFromDArray*(darray: ptr LFloat64; size: LInt32; copyflag: LInt32): ptr L_Dna {.
    importc: "l_dnaCreateFromDArray".}
proc lDnaMakeSequence*(startval: LFloat64; increment: LFloat64; size: LInt32): ptr L_Dna {.
    importc: "l_dnaMakeSequence".}
proc lDnaDestroy*(pda: ptr ptr L_Dna) {.importc: "l_dnaDestroy".}
proc lDnaCopy*(da: ptr L_Dna): ptr L_Dna {.importc: "l_dnaCopy".}
proc lDnaClone*(da: ptr L_Dna): ptr L_Dna {.importc: "l_dnaClone".}
proc lDnaEmpty*(da: ptr L_Dna): LOk {.importc: "l_dnaEmpty".}
proc lDnaAddNumber*(da: ptr L_Dna; val: LFloat64): LOk {.
    importc: "l_dnaAddNumber".}
proc lDnaInsertNumber*(da: ptr L_Dna; index: LInt32; val: LFloat64): LOk {.
    importc: "l_dnaInsertNumber".}
proc lDnaRemoveNumber*(da: ptr L_Dna; index: LInt32): LOk {.
    importc: "l_dnaRemoveNumber".}
proc lDnaReplaceNumber*(da: ptr L_Dna; index: LInt32; val: LFloat64): LOk {.
    importc: "l_dnaReplaceNumber".}
proc lDnaGetCount*(da: ptr L_Dna): LInt32 {.importc: "l_dnaGetCount".}
proc lDnaSetCount*(da: ptr L_Dna; newcount: LInt32): LOk {.
    importc: "l_dnaSetCount".}
proc lDnaGetDValue*(da: ptr L_Dna; index: LInt32; pval: ptr LFloat64): LOk {.
    importc: "l_dnaGetDValue".}
proc lDnaGetIValue*(da: ptr L_Dna; index: LInt32; pival: ptr LInt32): LOk {.
    importc: "l_dnaGetIValue".}
proc lDnaSetValue*(da: ptr L_Dna; index: LInt32; val: LFloat64): LOk {.
    importc: "l_dnaSetValue".}
proc lDnaShiftValue*(da: ptr L_Dna; index: LInt32; diff: LFloat64): LOk {.
    importc: "l_dnaShiftValue".}
proc lDnaGetIArray*(da: ptr L_Dna): ptr LInt32 {.importc: "l_dnaGetIArray".}
proc lDnaGetDArray*(da: ptr L_Dna; copyflag: LInt32): ptr LFloat64 {.
    importc: "l_dnaGetDArray".}
proc lDnaGetParameters*(da: ptr L_Dna; pstartx: ptr LFloat64;
                        pdelx: ptr LFloat64): LOk {.
    importc: "l_dnaGetParameters".}
proc lDnaSetParameters*(da: ptr L_Dna; startx: LFloat64; delx: LFloat64): LOk {.
    importc: "l_dnaSetParameters".}
proc lDnaCopyParameters*(dad: ptr L_Dna; das: ptr L_Dna): LOk {.
    importc: "l_dnaCopyParameters".}
proc lDnaRead*(filename: cstring): ptr L_Dna {.importc: "l_dnaRead".}
proc lDnaReadStream*(fp: ptr File): ptr L_Dna {.importc: "l_dnaReadStream".}
proc lDnaReadMem*(data: ptr LUint8; size: csize_t): ptr L_Dna {.
    importc: "l_dnaReadMem".}
proc lDnaWrite*(filename: cstring; da: ptr L_Dna): LOk {.importc: "l_dnaWrite".}
proc lDnaWriteStream*(fp: ptr File; da: ptr L_Dna): LOk {.
    importc: "l_dnaWriteStream".}
proc lDnaWriteStderr*(da: ptr L_Dna): LOk {.importc: "l_dnaWriteStderr".}
proc lDnaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; da: ptr L_Dna): LOk {.
    importc: "l_dnaWriteMem".}
proc lDnaaCreate*(n: LInt32): ptr L_Dnaa {.importc: "l_dnaaCreate".}
proc lDnaaCreateFull*(nptr: LInt32; n: LInt32): ptr L_Dnaa {.
    importc: "l_dnaaCreateFull".}
proc lDnaaTruncate*(daa: ptr L_Dnaa): LOk {.importc: "l_dnaaTruncate".}
proc lDnaaDestroy*(pdaa: ptr ptr L_Dnaa) {.importc: "l_dnaaDestroy".}
proc lDnaaAddDna*(daa: ptr L_Dnaa; da: ptr L_Dna; copyflag: LInt32): LOk {.
    importc: "l_dnaaAddDna".}
proc lDnaaGetCount*(daa: ptr L_Dnaa): LInt32 {.importc: "l_dnaaGetCount".}
proc lDnaaGetDnaCount*(daa: ptr L_Dnaa; index: LInt32): LInt32 {.
    importc: "l_dnaaGetDnaCount".}
proc lDnaaGetNumberCount*(daa: ptr L_Dnaa): LInt32 {.
    importc: "l_dnaaGetNumberCount".}
proc lDnaaGetDna*(daa: ptr L_Dnaa; index: LInt32; accessflag: LInt32): ptr L_Dna {.
    importc: "l_dnaaGetDna".}
proc lDnaaReplaceDna*(daa: ptr L_Dnaa; index: LInt32; da: ptr L_Dna): LOk {.
    importc: "l_dnaaReplaceDna".}
proc lDnaaGetValue*(daa: ptr L_Dnaa; i: LInt32; j: LInt32; pval: ptr LFloat64): LOk {.
    importc: "l_dnaaGetValue".}
proc lDnaaAddNumber*(daa: ptr L_Dnaa; index: LInt32; val: LFloat64): LOk {.
    importc: "l_dnaaAddNumber".}
proc lDnaaRead*(filename: cstring): ptr L_Dnaa {.importc: "l_dnaaRead".}
proc lDnaaReadStream*(fp: ptr File): ptr L_Dnaa {.importc: "l_dnaaReadStream".}
proc lDnaaReadMem*(data: ptr LUint8; size: csize_t): ptr L_Dnaa {.
    importc: "l_dnaaReadMem".}
proc lDnaaWrite*(filename: cstring; daa: ptr L_Dnaa): LOk {.
    importc: "l_dnaaWrite".}
proc lDnaaWriteStream*(fp: ptr File; daa: ptr L_Dnaa): LOk {.
    importc: "l_dnaaWriteStream".}
proc lDnaaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; daa: ptr L_Dnaa): LOk {.
    importc: "l_dnaaWriteMem".}
proc lDnaJoin*(dad: ptr L_Dna; das: ptr L_Dna; istart: LInt32; iend: LInt32): LOk {.
    importc: "l_dnaJoin".}
proc lDnaaFlattenToDna*(daa: ptr L_Dnaa): ptr L_Dna {.
    importc: "l_dnaaFlattenToDna".}
proc lDnaSelectRange*(das: ptr L_Dna; first: LInt32; last: LInt32): ptr L_Dna {.
    importc: "l_dnaSelectRange".}
proc lDnaConvertToNuma*(da: ptr L_Dna): ptr Numa {.
    importc: "l_dnaConvertToNuma".}
proc numaConvertToDna*(na: ptr Numa): ptr L_Dna {.importc: "numaConvertToDna".}
proc pixConvertDataToDna*(pix: ptr Pix): ptr L_Dna {.
    importc: "pixConvertDataToDna".}
proc lAsetCreateFromDna*(da: ptr L_Dna): ptr L_Aset {.
    importc: "l_asetCreateFromDna".}
proc lDnaRemoveDupsByAset*(das: ptr L_Dna; pdad: ptr ptr L_Dna): LOk {.
    importc: "l_dnaRemoveDupsByAset".}
proc lDnaUnionByAset*(da1: ptr L_Dna; da2: ptr L_Dna; pdad: ptr ptr L_Dna): LOk {.
    importc: "l_dnaUnionByAset".}
proc lDnaIntersectionByAset*(da1: ptr L_Dna; da2: ptr L_Dna; pdad: ptr ptr L_Dna): LOk {.
    importc: "l_dnaIntersectionByAset".}
proc lHmapCreateFromDna*(da: ptr L_Dna): ptr L_Hashmap {.
    importc: "l_hmapCreateFromDna".}
proc lDnaRemoveDupsByHmap*(das: ptr L_Dna; pdad: ptr ptr L_Dna;
                           phmap: ptr ptr L_Hashmap): LOk {.
    importc: "l_dnaRemoveDupsByHmap".}
proc lDnaUnionByHmap*(da1: ptr L_Dna; da2: ptr L_Dna; pdad: ptr ptr L_Dna): LOk {.
    importc: "l_dnaUnionByHmap".}
proc lDnaIntersectionByHmap*(da1: ptr L_Dna; da2: ptr L_Dna; pdad: ptr ptr L_Dna): LOk {.
    importc: "l_dnaIntersectionByHmap".}
proc lDnaMakeHistoByHmap*(das: ptr L_Dna; pdav: ptr ptr L_Dna;
                          pdac: ptr ptr L_Dna): LOk {.
    importc: "l_dnaMakeHistoByHmap".}
proc lDnaDiffAdjValues*(das: ptr L_Dna): ptr L_Dna {.
    importc: "l_dnaDiffAdjValues".}
proc lDnaHashCreate*(nbuckets: LInt32; initsize: LInt32): ptr L_Dnahash {.
    importc: "l_dnaHashCreate".}
proc lDnaHashDestroy*(pdahash: ptr ptr L_Dnahash) {.importc: "l_dnaHashDestroy".}
proc lDnaHashGetDna*(dahash: ptr L_Dnahash; key: LUint64; copyflag: LInt32): ptr L_Dna {.
    importc: "l_dnaHashGetDna".}
proc lDnaHashAdd*(dahash: ptr L_Dnahash; key: LUint64; value: LFloat64): LOk {.
    importc: "l_dnaHashAdd".}
proc pixMorphDwa2*(pixd: ptr Pix; pixs: ptr Pix; operation: LInt32;
                   selname: cstring): ptr Pix {.importc: "pixMorphDwa_2".}
proc pixFMorphopGen2*(pixd: ptr Pix; pixs: ptr Pix; operation: LInt32;
                      selname: cstring): ptr Pix {.importc: "pixFMorphopGen_2".}
proc fmorphopgenLow2*(datad: ptr LUint32; w: LInt32; h: LInt32; wpld: LInt32;
                      datas: ptr LUint32; wpls: LInt32; index: LInt32): LInt32 {.
    importc: "fmorphopgen_low_2".}
proc pixSobelEdgeFilter*(pixs: ptr Pix; orientflag: LInt32): ptr Pix {.
    importc: "pixSobelEdgeFilter".}
proc pixTwoSidedEdgeFilter*(pixs: ptr Pix; orientflag: LInt32): ptr Pix {.
    importc: "pixTwoSidedEdgeFilter".}
proc pixMeasureEdgeSmoothness*(pixs: ptr Pix; side: LInt32; minjump: LInt32;
                               minreversal: LInt32; pjpl: ptr LFloat32;
                               pjspl: ptr LFloat32; prpl: ptr LFloat32;
                               debugfile: cstring): LOk {.
    importc: "pixMeasureEdgeSmoothness".}
proc pixGetEdgeProfile*(pixs: ptr Pix; side: LInt32; debugfile: cstring): ptr Numa {.
    importc: "pixGetEdgeProfile".}
proc pixGetLastOffPixelInRun*(pixs: ptr Pix; x: LInt32; y: LInt32;
                              direction: LInt32; ploc: ptr LInt32): LOk {.
    importc: "pixGetLastOffPixelInRun".}
proc pixGetLastOnPixelInRun*(pixs: ptr Pix; x: LInt32; y: LInt32;
                             direction: LInt32; ploc: ptr LInt32): LInt32 {.
    importc: "pixGetLastOnPixelInRun".}
proc encodeBase64*(inarray: ptr LUint8; insize: LInt32; poutsize: ptr LInt32): cstring {.
    importc: "encodeBase64".}
proc decodeBase64*(inarray: cstring; insize: LInt32; poutsize: ptr LInt32): ptr LUint8 {.
    importc: "decodeBase64".}
proc encodeAscii85*(inarray: ptr LUint8; insize: csize_t; poutsize: ptr csize_t): cstring {.
    importc: "encodeAscii85".}
proc decodeAscii85*(inarray: cstring; insize: csize_t; poutsize: ptr csize_t): ptr LUint8 {.
    importc: "decodeAscii85".}
proc encodeAscii85WithComp*(indata: ptr LUint8; insize: csize_t;
                            poutsize: ptr csize_t): cstring {.
    importc: "encodeAscii85WithComp".}
proc decodeAscii85WithComp*(instr: cstring; insize: csize_t;
                            poutsize: ptr csize_t): ptr LUint8 {.
    importc: "decodeAscii85WithComp".}
proc reformatPacked64*(inarray: cstring; insize: LInt32; leadspace: LInt32;
                       linechars: LInt32; addquotes: LInt32;
                       poutsize: ptr LInt32): cstring {.
    importc: "reformatPacked64".}
proc pixGammaTRC*(pixd: ptr Pix; pixs: ptr Pix; gamma: LFloat32; minval: LInt32;
                  maxval: LInt32): ptr Pix {.importc: "pixGammaTRC".}
proc pixGammaTRCMasked*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                        gamma: LFloat32; minval: LInt32; maxval: LInt32): ptr Pix {.
    importc: "pixGammaTRCMasked".}
proc pixGammaTRCWithAlpha*(pixd: ptr Pix; pixs: ptr Pix; gamma: LFloat32;
                           minval: LInt32; maxval: LInt32): ptr Pix {.
    importc: "pixGammaTRCWithAlpha".}
proc numaGammaTRC*(gamma: LFloat32; minval: LInt32; maxval: LInt32): ptr Numa {.
    importc: "numaGammaTRC".}
proc pixContrastTRC*(pixd: ptr Pix; pixs: ptr Pix; factor: LFloat32): ptr Pix {.
    importc: "pixContrastTRC".}
proc pixContrastTRCMasked*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                           factor: LFloat32): ptr Pix {.
    importc: "pixContrastTRCMasked".}
proc numaContrastTRC*(factor: LFloat32): ptr Numa {.importc: "numaContrastTRC".}
proc pixEqualizeTRC*(pixd: ptr Pix; pixs: ptr Pix; fract: LFloat32;
                     factor: LInt32): ptr Pix {.importc: "pixEqualizeTRC".}
proc numaEqualizeTRC*(pix: ptr Pix; fract: LFloat32; factor: LInt32): ptr Numa {.
    importc: "numaEqualizeTRC".}
proc pixTRCMap*(pixs: ptr Pix; pixm: ptr Pix; na: ptr Numa): LInt32 {.
    importc: "pixTRCMap".}
proc pixTRCMapGeneral*(pixs: ptr Pix; pixm: ptr Pix; nar: ptr Numa;
                       nag: ptr Numa; nab: ptr Numa): LInt32 {.
    importc: "pixTRCMapGeneral".}
proc pixUnsharpMasking*(pixs: ptr Pix; halfwidth: LInt32; fract: LFloat32): ptr Pix {.
    importc: "pixUnsharpMasking".}
proc pixUnsharpMaskingGray*(pixs: ptr Pix; halfwidth: LInt32; fract: LFloat32): ptr Pix {.
    importc: "pixUnsharpMaskingGray".}
proc pixUnsharpMaskingFast*(pixs: ptr Pix; halfwidth: LInt32; fract: LFloat32;
                            direction: LInt32): ptr Pix {.
    importc: "pixUnsharpMaskingFast".}
proc pixUnsharpMaskingGrayFast*(pixs: ptr Pix; halfwidth: LInt32;
                                fract: LFloat32; direction: LInt32): ptr Pix {.
    importc: "pixUnsharpMaskingGrayFast".}
proc pixUnsharpMaskingGray1D*(pixs: ptr Pix; halfwidth: LInt32; fract: LFloat32;
                              direction: LInt32): ptr Pix {.
    importc: "pixUnsharpMaskingGray1D".}
proc pixUnsharpMaskingGray2D*(pixs: ptr Pix; halfwidth: LInt32; fract: LFloat32): ptr Pix {.
    importc: "pixUnsharpMaskingGray2D".}
proc pixModifyHue*(pixd: ptr Pix; pixs: ptr Pix; fract: LFloat32): ptr Pix {.
    importc: "pixModifyHue".}
proc pixModifySaturation*(pixd: ptr Pix; pixs: ptr Pix; fract: LFloat32): ptr Pix {.
    importc: "pixModifySaturation".}
proc pixMeasureSaturation*(pixs: ptr Pix; factor: LInt32; psat: ptr LFloat32): LInt32 {.
    importc: "pixMeasureSaturation".}
proc pixModifyBrightness*(pixd: ptr Pix; pixs: ptr Pix; fract: LFloat32): ptr Pix {.
    importc: "pixModifyBrightness".}
proc pixMosaicColorShiftRGB*(pixs: ptr Pix; roff: LFloat32; goff: LFloat32;
                             boff: LFloat32; delta: LFloat32; nincr: LInt32): ptr Pix {.
    importc: "pixMosaicColorShiftRGB".}
proc pixColorShiftRGB*(pixs: ptr Pix; rfract: LFloat32; gfract: LFloat32;
                       bfract: LFloat32): ptr Pix {.importc: "pixColorShiftRGB".}
proc pixDarkenGray*(pixd: ptr Pix; pixs: ptr Pix; thresh: LInt32;
                    satlimit: LInt32): ptr Pix {.importc: "pixDarkenGray".}
proc pixMultConstantColor*(pixs: ptr Pix; rfact: LFloat32; gfact: LFloat32;
                           bfact: LFloat32): ptr Pix {.
    importc: "pixMultConstantColor".}
proc pixMultMatrixColor*(pixs: ptr Pix; kel: ptr L_Kernel): ptr Pix {.
    importc: "pixMultMatrixColor".}
proc pixHalfEdgeByBandpass*(pixs: ptr Pix; sm1h: LInt32; sm1v: LInt32;
                            sm2h: LInt32; sm2v: LInt32): ptr Pix {.
    importc: "pixHalfEdgeByBandpass".}
proc fhmtautogen*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LOk {.
    importc: "fhmtautogen".}
proc fhmtautogen1*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LOk {.
    importc: "fhmtautogen1".}
proc fhmtautogen2*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LOk {.
    importc: "fhmtautogen2".}
proc pixHMTDwa1*(pixd: ptr Pix; pixs: ptr Pix; selname: cstring): ptr Pix {.
    importc: "pixHMTDwa_1".}
proc pixFHMTGen1*(pixd: ptr Pix; pixs: ptr Pix; selname: cstring): ptr Pix {.
    importc: "pixFHMTGen_1".}
proc fhmtgenLow1*(datad: ptr LUint32; w: LInt32; h: LInt32; wpld: LInt32;
                  datas: ptr LUint32; wpls: LInt32; index: LInt32): LInt32 {.
    importc: "fhmtgen_low_1".}
proc pixItalicWords*(pixs: ptr Pix; boxaw: ptr Boxa; pixw: ptr Pix;
                     pboxa: ptr ptr Boxa; debugflag: LInt32): LOk {.
    importc: "pixItalicWords".}
proc pixOrientCorrect*(pixs: ptr Pix; minupconf: LFloat32; minratio: LFloat32;
                       pupconf: ptr LFloat32; pleftconf: ptr LFloat32;
                       protation: ptr LInt32; debug: LInt32): ptr Pix {.
    importc: "pixOrientCorrect".}
proc pixOrientDetect*(pixs: ptr Pix; pupconf: ptr LFloat32;
                      pleftconf: ptr LFloat32; mincount: LInt32; debug: LInt32): LOk {.
    importc: "pixOrientDetect".}
proc makeOrientDecision*(upconf: LFloat32; leftconf: LFloat32;
                         minupconf: LFloat32; minratio: LFloat32;
                         porient: ptr LInt32; debug: LInt32): LOk {.
    importc: "makeOrientDecision".}
proc pixUpDownDetect*(pixs: ptr Pix; pconf: ptr LFloat32; mincount: LInt32;
                      npixels: LInt32; debug: LInt32): LOk {.
    importc: "pixUpDownDetect".}
proc pixMirrorDetect*(pixs: ptr Pix; pconf: ptr LFloat32; mincount: LInt32;
                      debug: LInt32): LOk {.importc: "pixMirrorDetect".}
proc fmorphautogen*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LOk {.
    importc: "fmorphautogen".}
proc fmorphautogen1*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LOk {.
    importc: "fmorphautogen1".}
proc fmorphautogen2*(sela: ptr Sela; fileindex: LInt32; filename: cstring): LInt32 {.
    importc: "fmorphautogen2".}
proc pixMorphDwa1*(pixd: ptr Pix; pixs: ptr Pix; operation: LInt32;
                   selname: cstring): ptr Pix {.importc: "pixMorphDwa_1".}
proc pixFMorphopGen1*(pixd: ptr Pix; pixs: ptr Pix; operation: LInt32;
                      selname: cstring): ptr Pix {.importc: "pixFMorphopGen_1".}
proc fmorphopgenLow1*(datad: ptr LUint32; w: LInt32; h: LInt32; wpld: LInt32;
                      datas: ptr LUint32; wpls: LInt32; index: LInt32): LInt32 {.
    importc: "fmorphopgen_low_1".}
proc fpixCreate*(width: LInt32; height: LInt32): ptr Fpix {.
    importc: "fpixCreate".}
proc fpixCreateTemplate*(fpixs: ptr Fpix): ptr Fpix {.
    importc: "fpixCreateTemplate".}
proc fpixClone*(fpix: ptr Fpix): ptr Fpix {.importc: "fpixClone".}
proc fpixCopy*(fpixs: ptr Fpix): ptr Fpix {.importc: "fpixCopy".}
proc fpixDestroy*(pfpix: ptr ptr Fpix) {.importc: "fpixDestroy".}
proc fpixGetDimensions*(fpix: ptr Fpix; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "fpixGetDimensions".}
proc fpixSetDimensions*(fpix: ptr Fpix; w: LInt32; h: LInt32): LOk {.
    importc: "fpixSetDimensions".}
proc fpixGetWpl*(fpix: ptr Fpix): LInt32 {.importc: "fpixGetWpl".}
proc fpixSetWpl*(fpix: ptr Fpix; wpl: LInt32): LOk {.importc: "fpixSetWpl".}
proc fpixGetResolution*(fpix: ptr Fpix; pxres: ptr LInt32; pyres: ptr LInt32): LOk {.
    importc: "fpixGetResolution".}
proc fpixSetResolution*(fpix: ptr Fpix; xres: LInt32; yres: LInt32): LOk {.
    importc: "fpixSetResolution".}
proc fpixCopyResolution*(fpixd: ptr Fpix; fpixs: ptr Fpix): LOk {.
    importc: "fpixCopyResolution".}
proc fpixGetData*(fpix: ptr Fpix): ptr LFloat32 {.importc: "fpixGetData".}
proc fpixSetData*(fpix: ptr Fpix; data: ptr LFloat32): LOk {.
    importc: "fpixSetData".}
proc fpixGetPixel*(fpix: ptr Fpix; x: LInt32; y: LInt32; pval: ptr LFloat32): LOk {.
    importc: "fpixGetPixel".}
proc fpixSetPixel*(fpix: ptr Fpix; x: LInt32; y: LInt32; val: LFloat32): LOk {.
    importc: "fpixSetPixel".}
proc fpixaCreate*(n: LInt32): ptr Fpixa {.importc: "fpixaCreate".}
proc fpixaCopy*(fpixa: ptr Fpixa; copyflag: LInt32): ptr Fpixa {.
    importc: "fpixaCopy".}
proc fpixaDestroy*(pfpixa: ptr ptr Fpixa) {.importc: "fpixaDestroy".}
proc fpixaAddFPix*(fpixa: ptr Fpixa; fpix: ptr Fpix; copyflag: LInt32): LOk {.
    importc: "fpixaAddFPix".}
proc fpixaGetCount*(fpixa: ptr Fpixa): LInt32 {.importc: "fpixaGetCount".}
proc fpixaGetFPix*(fpixa: ptr Fpixa; index: LInt32; accesstype: LInt32): ptr Fpix {.
    importc: "fpixaGetFPix".}
proc fpixaGetFPixDimensions*(fpixa: ptr Fpixa; index: LInt32; pw: ptr LInt32;
                             ph: ptr LInt32): LOk {.
    importc: "fpixaGetFPixDimensions".}
proc fpixaGetData*(fpixa: ptr Fpixa; index: LInt32): ptr LFloat32 {.
    importc: "fpixaGetData".}
proc fpixaGetPixel*(fpixa: ptr Fpixa; index: LInt32; x: LInt32; y: LInt32;
                    pval: ptr LFloat32): LOk {.importc: "fpixaGetPixel".}
proc fpixaSetPixel*(fpixa: ptr Fpixa; index: LInt32; x: LInt32; y: LInt32;
                    val: LFloat32): LOk {.importc: "fpixaSetPixel".}
proc dpixCreate*(width: LInt32; height: LInt32): ptr Dpix {.
    importc: "dpixCreate".}
proc dpixCreateTemplate*(dpixs: ptr Dpix): ptr Dpix {.
    importc: "dpixCreateTemplate".}
proc dpixClone*(dpix: ptr Dpix): ptr Dpix {.importc: "dpixClone".}
proc dpixCopy*(dpixs: ptr Dpix): ptr Dpix {.importc: "dpixCopy".}
proc dpixDestroy*(pdpix: ptr ptr Dpix) {.importc: "dpixDestroy".}
proc dpixGetDimensions*(dpix: ptr Dpix; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "dpixGetDimensions".}
proc dpixSetDimensions*(dpix: ptr Dpix; w: LInt32; h: LInt32): LOk {.
    importc: "dpixSetDimensions".}
proc dpixGetWpl*(dpix: ptr Dpix): LInt32 {.importc: "dpixGetWpl".}
proc dpixSetWpl*(dpix: ptr Dpix; wpl: LInt32): LOk {.importc: "dpixSetWpl".}
proc dpixGetResolution*(dpix: ptr Dpix; pxres: ptr LInt32; pyres: ptr LInt32): LOk {.
    importc: "dpixGetResolution".}
proc dpixSetResolution*(dpix: ptr Dpix; xres: LInt32; yres: LInt32): LOk {.
    importc: "dpixSetResolution".}
proc dpixCopyResolution*(dpixd: ptr Dpix; dpixs: ptr Dpix): LOk {.
    importc: "dpixCopyResolution".}
proc dpixGetData*(dpix: ptr Dpix): ptr LFloat64 {.importc: "dpixGetData".}
proc dpixSetData*(dpix: ptr Dpix; data: ptr LFloat64): LOk {.
    importc: "dpixSetData".}
proc dpixGetPixel*(dpix: ptr Dpix; x: LInt32; y: LInt32; pval: ptr LFloat64): LOk {.
    importc: "dpixGetPixel".}
proc dpixSetPixel*(dpix: ptr Dpix; x: LInt32; y: LInt32; val: LFloat64): LOk {.
    importc: "dpixSetPixel".}
proc fpixRead*(filename: cstring): ptr Fpix {.importc: "fpixRead".}
proc fpixReadStream*(fp: ptr File): ptr Fpix {.importc: "fpixReadStream".}
proc fpixReadMem*(data: ptr LUint8; size: csize_t): ptr Fpix {.
    importc: "fpixReadMem".}
proc fpixWrite*(filename: cstring; fpix: ptr Fpix): LOk {.importc: "fpixWrite".}
proc fpixWriteStream*(fp: ptr File; fpix: ptr Fpix): LOk {.
    importc: "fpixWriteStream".}
proc fpixWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; fpix: ptr Fpix): LOk {.
    importc: "fpixWriteMem".}
proc fpixEndianByteSwap*(fpixd: ptr Fpix; fpixs: ptr Fpix): ptr Fpix {.
    importc: "fpixEndianByteSwap".}
proc dpixRead*(filename: cstring): ptr Dpix {.importc: "dpixRead".}
proc dpixReadStream*(fp: ptr File): ptr Dpix {.importc: "dpixReadStream".}
proc dpixReadMem*(data: ptr LUint8; size: csize_t): ptr Dpix {.
    importc: "dpixReadMem".}
proc dpixWrite*(filename: cstring; dpix: ptr Dpix): LOk {.importc: "dpixWrite".}
proc dpixWriteStream*(fp: ptr File; dpix: ptr Dpix): LOk {.
    importc: "dpixWriteStream".}
proc dpixWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; dpix: ptr Dpix): LOk {.
    importc: "dpixWriteMem".}
proc dpixEndianByteSwap*(dpixd: ptr Dpix; dpixs: ptr Dpix): ptr Dpix {.
    importc: "dpixEndianByteSwap".}
proc fpixPrintStream*(fp: ptr File; fpix: ptr Fpix; factor: LInt32): LOk {.
    importc: "fpixPrintStream".}
proc pixConvertToFPix*(pixs: ptr Pix; ncomps: LInt32): ptr Fpix {.
    importc: "pixConvertToFPix".}
proc pixConvertToDPix*(pixs: ptr Pix; ncomps: LInt32): ptr Dpix {.
    importc: "pixConvertToDPix".}
proc fpixConvertToPix*(fpixs: ptr Fpix; outdepth: LInt32; negvals: LInt32;
                       errorflag: LInt32): ptr Pix {.
    importc: "fpixConvertToPix".}
proc fpixDisplayMaxDynamicRange*(fpixs: ptr Fpix): ptr Pix {.
    importc: "fpixDisplayMaxDynamicRange".}
proc fpixConvertToDPix*(fpix: ptr Fpix): ptr Dpix {.
    importc: "fpixConvertToDPix".}
proc dpixConvertToPix*(dpixs: ptr Dpix; outdepth: LInt32; negvals: LInt32;
                       errorflag: LInt32): ptr Pix {.
    importc: "dpixConvertToPix".}
proc dpixConvertToFPix*(dpix: ptr Dpix): ptr Fpix {.
    importc: "dpixConvertToFPix".}
proc fpixGetMin*(fpix: ptr Fpix; pminval: ptr LFloat32; pxminloc: ptr LInt32;
                 pyminloc: ptr LInt32): LOk {.importc: "fpixGetMin".}
proc fpixGetMax*(fpix: ptr Fpix; pmaxval: ptr LFloat32; pxmaxloc: ptr LInt32;
                 pymaxloc: ptr LInt32): LOk {.importc: "fpixGetMax".}
proc dpixGetMin*(dpix: ptr Dpix; pminval: ptr LFloat64; pxminloc: ptr LInt32;
                 pyminloc: ptr LInt32): LOk {.importc: "dpixGetMin".}
proc dpixGetMax*(dpix: ptr Dpix; pmaxval: ptr LFloat64; pxmaxloc: ptr LInt32;
                 pymaxloc: ptr LInt32): LOk {.importc: "dpixGetMax".}
proc fpixScaleByInteger*(fpixs: ptr Fpix; factor: LInt32): ptr Fpix {.
    importc: "fpixScaleByInteger".}
proc dpixScaleByInteger*(dpixs: ptr Dpix; factor: LInt32): ptr Dpix {.
    importc: "dpixScaleByInteger".}
proc fpixLinearCombination*(fpixd: ptr Fpix; fpixs1: ptr Fpix; fpixs2: ptr Fpix;
                            a: LFloat32; b: LFloat32): ptr Fpix {.
    importc: "fpixLinearCombination".}
proc fpixAddMultConstant*(fpix: ptr Fpix; addc: LFloat32; multc: LFloat32): LOk {.
    importc: "fpixAddMultConstant".}
proc dpixLinearCombination*(dpixd: ptr Dpix; dpixs1: ptr Dpix; dpixs2: ptr Dpix;
                            a: LFloat32; b: LFloat32): ptr Dpix {.
    importc: "dpixLinearCombination".}
proc dpixAddMultConstant*(dpix: ptr Dpix; addc: LFloat64; multc: LFloat64): LOk {.
    importc: "dpixAddMultConstant".}
proc fpixSetAllArbitrary*(fpix: ptr Fpix; inval: LFloat32): LOk {.
    importc: "fpixSetAllArbitrary".}
proc dpixSetAllArbitrary*(dpix: ptr Dpix; inval: LFloat64): LOk {.
    importc: "dpixSetAllArbitrary".}
proc fpixAddBorder*(fpixs: ptr Fpix; left: LInt32; right: LInt32; top: LInt32;
                    bot: LInt32): ptr Fpix {.importc: "fpixAddBorder".}
proc fpixRemoveBorder*(fpixs: ptr Fpix; left: LInt32; right: LInt32;
                       top: LInt32; bot: LInt32): ptr Fpix {.
    importc: "fpixRemoveBorder".}
proc fpixAddMirroredBorder*(fpixs: ptr Fpix; left: LInt32; right: LInt32;
                            top: LInt32; bot: LInt32): ptr Fpix {.
    importc: "fpixAddMirroredBorder".}
proc fpixAddContinuedBorder*(fpixs: ptr Fpix; left: LInt32; right: LInt32;
                             top: LInt32; bot: LInt32): ptr Fpix {.
    importc: "fpixAddContinuedBorder".}
proc fpixAddSlopeBorder*(fpixs: ptr Fpix; left: LInt32; right: LInt32;
                         top: LInt32; bot: LInt32): ptr Fpix {.
    importc: "fpixAddSlopeBorder".}
proc fpixRasterop*(fpixd: ptr Fpix; dx: LInt32; dy: LInt32; dw: LInt32;
                   dh: LInt32; fpixs: ptr Fpix; sx: LInt32; sy: LInt32): LOk {.
    importc: "fpixRasterop".}
proc fpixRotateOrth*(fpixs: ptr Fpix; quads: LInt32): ptr Fpix {.
    importc: "fpixRotateOrth".}
proc fpixRotate180*(fpixd: ptr Fpix; fpixs: ptr Fpix): ptr Fpix {.
    importc: "fpixRotate180".}
proc fpixRotate90*(fpixs: ptr Fpix; direction: LInt32): ptr Fpix {.
    importc: "fpixRotate90".}
proc fpixFlipLR*(fpixd: ptr Fpix; fpixs: ptr Fpix): ptr Fpix {.
    importc: "fpixFlipLR".}
proc fpixFlipTB*(fpixd: ptr Fpix; fpixs: ptr Fpix): ptr Fpix {.
    importc: "fpixFlipTB".}
proc fpixAffinePta*(fpixs: ptr Fpix; ptad: ptr Pta; ptas: ptr Pta;
                    border: LInt32; inval: LFloat32): ptr Fpix {.
    importc: "fpixAffinePta".}
proc fpixAffine*(fpixs: ptr Fpix; vc: ptr LFloat32; inval: LFloat32): ptr Fpix {.
    importc: "fpixAffine".}
proc fpixProjectivePta*(fpixs: ptr Fpix; ptad: ptr Pta; ptas: ptr Pta;
                        border: LInt32; inval: LFloat32): ptr Fpix {.
    importc: "fpixProjectivePta".}
proc fpixProjective*(fpixs: ptr Fpix; vc: ptr LFloat32; inval: LFloat32): ptr Fpix {.
    importc: "fpixProjective".}
proc linearInterpolatePixelFloat*(datas: ptr LFloat32; w: LInt32; h: LInt32;
                                  x: LFloat32; y: LFloat32; inval: LFloat32;
                                  pval: ptr LFloat32): LOk {.
    importc: "linearInterpolatePixelFloat".}
proc fpixThresholdToPix*(fpix: ptr Fpix; thresh: LFloat32): ptr Pix {.
    importc: "fpixThresholdToPix".}
proc pixComponentFunction*(pix: ptr Pix; rnum: LFloat32; gnum: LFloat32;
                           bnum: LFloat32; rdenom: LFloat32; gdenom: LFloat32;
                           bdenom: LFloat32): ptr Fpix {.
    importc: "pixComponentFunction".}
proc pixReadStreamGif*(fp: ptr File): ptr Pix {.importc: "pixReadStreamGif".}
proc pixReadMemGif*(cdata: ptr LUint8; size: csize_t): ptr Pix {.
    importc: "pixReadMemGif".}
proc pixWriteStreamGif*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamGif".}
proc pixWriteMemGif*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix): LOk {.
    importc: "pixWriteMemGif".}
proc gplotCreate*(rootname: cstring; outformat: LInt32; title: cstring;
                  xlabel: cstring; ylabel: cstring): ptr Gplot {.
    importc: "gplotCreate".}
proc gplotDestroy*(pgplot: ptr ptr Gplot) {.importc: "gplotDestroy".}
proc gplotAddPlot*(gplot: ptr Gplot; nax: ptr Numa; nay: ptr Numa;
                   plotstyle: LInt32; plotlabel: cstring): LOk {.
    importc: "gplotAddPlot".}
proc gplotSetScaling*(gplot: ptr Gplot; scaling: LInt32): LOk {.
    importc: "gplotSetScaling".}
proc gplotMakeOutputPix*(gplot: ptr Gplot): ptr Pix {.
    importc: "gplotMakeOutputPix".}
proc gplotMakeOutput*(gplot: ptr Gplot): LOk {.importc: "gplotMakeOutput".}
proc gplotGenCommandFile*(gplot: ptr Gplot): LOk {.
    importc: "gplotGenCommandFile".}
proc gplotGenDataFiles*(gplot: ptr Gplot): LOk {.importc: "gplotGenDataFiles".}
proc gplotSimple1*(na: ptr Numa; outformat: LInt32; outroot: cstring;
                   title: cstring): LOk {.importc: "gplotSimple1".}
proc gplotSimple2*(na1: ptr Numa; na2: ptr Numa; outformat: LInt32;
                   outroot: cstring; title: cstring): LOk {.
    importc: "gplotSimple2".}
proc gplotSimpleN*(naa: ptr Numaa; outformat: LInt32; outroot: cstring;
                   title: cstring): LOk {.importc: "gplotSimpleN".}
proc gplotSimplePix1*(na: ptr Numa; title: cstring): ptr Pix {.
    importc: "gplotSimplePix1".}
proc gplotSimplePix2*(na1: ptr Numa; na2: ptr Numa; title: cstring): ptr Pix {.
    importc: "gplotSimplePix2".}
proc gplotSimplePixN*(naa: ptr Numaa; title: cstring): ptr Pix {.
    importc: "gplotSimplePixN".}
proc gplotSimpleXY1*(nax: ptr Numa; nay: ptr Numa; plotstyle: LInt32;
                     outformat: LInt32; outroot: cstring; title: cstring): ptr Gplot {.
    importc: "gplotSimpleXY1".}
proc gplotSimpleXY2*(nax: ptr Numa; nay1: ptr Numa; nay2: ptr Numa;
                     plotstyle: LInt32; outformat: LInt32; outroot: cstring;
                     title: cstring): ptr Gplot {.importc: "gplotSimpleXY2".}
proc gplotSimpleXYN*(nax: ptr Numa; naay: ptr Numaa; plotstyle: LInt32;
                     outformat: LInt32; outroot: cstring; title: cstring): ptr Gplot {.
    importc: "gplotSimpleXYN".}
proc gplotGeneralPix1*(na: ptr Numa; plotstyle: LInt32; rootname: cstring;
                       title: cstring; xlabel: cstring; ylabel: cstring): ptr Pix {.
    importc: "gplotGeneralPix1".}
proc gplotGeneralPix2*(na1: ptr Numa; na2: ptr Numa; plotstyle: LInt32;
                       rootname: cstring; title: cstring; xlabel: cstring;
                       ylabel: cstring): ptr Pix {.importc: "gplotGeneralPix2".}
proc gplotGeneralPixN*(nax: ptr Numa; naay: ptr Numaa; plotstyle: LInt32;
                       rootname: cstring; title: cstring; xlabel: cstring;
                       ylabel: cstring): ptr Pix {.importc: "gplotGeneralPixN".}
proc gplotRead*(filename: cstring): ptr Gplot {.importc: "gplotRead".}
proc gplotWrite*(filename: cstring; gplot: ptr Gplot): LOk {.
    importc: "gplotWrite".}
proc generatePtaLine*(x1: LInt32; y1: LInt32; x2: LInt32; y2: LInt32): ptr Pta {.
    importc: "generatePtaLine".}
proc generatePtaWideLine*(x1: LInt32; y1: LInt32; x2: LInt32; y2: LInt32;
                          width: LInt32): ptr Pta {.
    importc: "generatePtaWideLine".}
proc generatePtaBox*(box: ptr Box; width: LInt32): ptr Pta {.
    importc: "generatePtaBox".}
proc generatePtaBoxa*(boxa: ptr Boxa; width: LInt32; removedups: LInt32): ptr Pta {.
    importc: "generatePtaBoxa".}
proc generatePtaHashBox*(box: ptr Box; spacing: LInt32; width: LInt32;
                         orient: LInt32; outline: LInt32): ptr Pta {.
    importc: "generatePtaHashBox".}
proc generatePtaHashBoxa*(boxa: ptr Boxa; spacing: LInt32; width: LInt32;
                          orient: LInt32; outline: LInt32; removedups: LInt32): ptr Pta {.
    importc: "generatePtaHashBoxa".}
proc generatePtaaBoxa*(boxa: ptr Boxa): ptr Ptaa {.importc: "generatePtaaBoxa".}
proc generatePtaaHashBoxa*(boxa: ptr Boxa; spacing: LInt32; width: LInt32;
                           orient: LInt32; outline: LInt32): ptr Ptaa {.
    importc: "generatePtaaHashBoxa".}
proc generatePtaPolyline*(ptas: ptr Pta; width: LInt32; closeflag: LInt32;
                          removedups: LInt32): ptr Pta {.
    importc: "generatePtaPolyline".}
proc generatePtaGrid*(w: LInt32; h: LInt32; nx: LInt32; ny: LInt32;
                      width: LInt32): ptr Pta {.importc: "generatePtaGrid".}
proc convertPtaLineTo4cc*(ptas: ptr Pta): ptr Pta {.
    importc: "convertPtaLineTo4cc".}
proc generatePtaFilledCircle*(radius: LInt32): ptr Pta {.
    importc: "generatePtaFilledCircle".}
proc generatePtaFilledSquare*(side: LInt32): ptr Pta {.
    importc: "generatePtaFilledSquare".}
proc generatePtaLineFromPt*(x: LInt32; y: LInt32; length: LFloat64;
                            radang: LFloat64): ptr Pta {.
    importc: "generatePtaLineFromPt".}
proc locatePtRadially*(xr: LInt32; yr: LInt32; dist: LFloat64; radang: LFloat64;
                       px: ptr LFloat64; py: ptr LFloat64): LOk {.
    importc: "locatePtRadially".}
proc pixRenderPlotFromNuma*(ppix: ptr ptr Pix; na: ptr Numa; plotloc: LInt32;
                            linewidth: LInt32; max: LInt32; color: LUint32): LOk {.
    importc: "pixRenderPlotFromNuma".}
proc makePlotPtaFromNuma*(na: ptr Numa; size: LInt32; plotloc: LInt32;
                          linewidth: LInt32; max: LInt32): ptr Pta {.
    importc: "makePlotPtaFromNuma".}
proc pixRenderPlotFromNumaGen*(ppix: ptr ptr Pix; na: ptr Numa; orient: LInt32;
                               linewidth: LInt32; refpos: LInt32; max: LInt32;
                               drawref: LInt32; color: LUint32): LOk {.
    importc: "pixRenderPlotFromNumaGen".}
proc makePlotPtaFromNumaGen*(na: ptr Numa; orient: LInt32; linewidth: LInt32;
                             refpos: LInt32; max: LInt32; drawref: LInt32): ptr Pta {.
    importc: "makePlotPtaFromNumaGen".}
proc pixRenderPta*(pix: ptr Pix; pta: ptr Pta; op: LInt32): LOk {.
    importc: "pixRenderPta".}
proc pixRenderPtaArb*(pix: ptr Pix; pta: ptr Pta; rval: LUint8; gval: LUint8;
                      bval: LUint8): LOk {.importc: "pixRenderPtaArb".}
proc pixRenderPtaBlend*(pix: ptr Pix; pta: ptr Pta; rval: LUint8; gval: LUint8;
                        bval: LUint8; fract: LFloat32): LOk {.
    importc: "pixRenderPtaBlend".}
proc pixRenderLine*(pix: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                    y2: LInt32; width: LInt32; op: LInt32): LOk {.
    importc: "pixRenderLine".}
proc pixRenderLineArb*(pix: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                       y2: LInt32; width: LInt32; rval: LUint8; gval: LUint8;
                       bval: LUint8): LOk {.importc: "pixRenderLineArb".}
proc pixRenderLineBlend*(pix: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                         y2: LInt32; width: LInt32; rval: LUint8; gval: LUint8;
                         bval: LUint8; fract: LFloat32): LOk {.
    importc: "pixRenderLineBlend".}
proc pixRenderBox*(pix: ptr Pix; box: ptr Box; width: LInt32; op: LInt32): LOk {.
    importc: "pixRenderBox".}
proc pixRenderBoxArb*(pix: ptr Pix; box: ptr Box; width: LInt32; rval: LUint8;
                      gval: LUint8; bval: LUint8): LOk {.
    importc: "pixRenderBoxArb".}
proc pixRenderBoxBlend*(pix: ptr Pix; box: ptr Box; width: LInt32; rval: LUint8;
                        gval: LUint8; bval: LUint8; fract: LFloat32): LOk {.
    importc: "pixRenderBoxBlend".}
proc pixRenderBoxa*(pix: ptr Pix; boxa: ptr Boxa; width: LInt32; op: LInt32): LOk {.
    importc: "pixRenderBoxa".}
proc pixRenderBoxaArb*(pix: ptr Pix; boxa: ptr Boxa; width: LInt32;
                       rval: LUint8; gval: LUint8; bval: LUint8): LOk {.
    importc: "pixRenderBoxaArb".}
proc pixRenderBoxaBlend*(pix: ptr Pix; boxa: ptr Boxa; width: LInt32;
                         rval: LUint8; gval: LUint8; bval: LUint8;
                         fract: LFloat32; removedups: LInt32): LOk {.
    importc: "pixRenderBoxaBlend".}
proc pixRenderHashBox*(pix: ptr Pix; box: ptr Box; spacing: LInt32;
                       width: LInt32; orient: LInt32; outline: LInt32;
                       op: LInt32): LOk {.importc: "pixRenderHashBox".}
proc pixRenderHashBoxArb*(pix: ptr Pix; box: ptr Box; spacing: LInt32;
                          width: LInt32; orient: LInt32; outline: LInt32;
                          rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixRenderHashBoxArb".}
proc pixRenderHashBoxBlend*(pix: ptr Pix; box: ptr Box; spacing: LInt32;
                            width: LInt32; orient: LInt32; outline: LInt32;
                            rval: LInt32; gval: LInt32; bval: LInt32;
                            fract: LFloat32): LOk {.
    importc: "pixRenderHashBoxBlend".}
proc pixRenderHashMaskArb*(pix: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                           spacing: LInt32; width: LInt32; orient: LInt32;
                           outline: LInt32; rval: LInt32; gval: LInt32;
                           bval: LInt32): LOk {.importc: "pixRenderHashMaskArb".}
proc pixRenderHashBoxa*(pix: ptr Pix; boxa: ptr Boxa; spacing: LInt32;
                        width: LInt32; orient: LInt32; outline: LInt32;
                        op: LInt32): LOk {.importc: "pixRenderHashBoxa".}
proc pixRenderHashBoxaArb*(pix: ptr Pix; boxa: ptr Boxa; spacing: LInt32;
                           width: LInt32; orient: LInt32; outline: LInt32;
                           rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixRenderHashBoxaArb".}
proc pixRenderHashBoxaBlend*(pix: ptr Pix; boxa: ptr Boxa; spacing: LInt32;
                             width: LInt32; orient: LInt32; outline: LInt32;
                             rval: LInt32; gval: LInt32; bval: LInt32;
                             fract: LFloat32): LOk {.
    importc: "pixRenderHashBoxaBlend".}
proc pixRenderPolyline*(pix: ptr Pix; ptas: ptr Pta; width: LInt32; op: LInt32;
                        closeflag: LInt32): LOk {.importc: "pixRenderPolyline".}
proc pixRenderPolylineArb*(pix: ptr Pix; ptas: ptr Pta; width: LInt32;
                           rval: LUint8; gval: LUint8; bval: LUint8;
                           closeflag: LInt32): LOk {.
    importc: "pixRenderPolylineArb".}
proc pixRenderPolylineBlend*(pix: ptr Pix; ptas: ptr Pta; width: LInt32;
                             rval: LUint8; gval: LUint8; bval: LUint8;
                             fract: LFloat32; closeflag: LInt32;
                             removedups: LInt32): LOk {.
    importc: "pixRenderPolylineBlend".}
proc pixRenderGridArb*(pix: ptr Pix; nx: LInt32; ny: LInt32; width: LInt32;
                       rval: LUint8; gval: LUint8; bval: LUint8): LOk {.
    importc: "pixRenderGridArb".}
proc pixRenderRandomCmapPtaa*(pix: ptr Pix; ptaa: ptr Ptaa; polyflag: LInt32;
                              width: LInt32; closeflag: LInt32): ptr Pix {.
    importc: "pixRenderRandomCmapPtaa".}
proc pixRenderPolygon*(ptas: ptr Pta; width: LInt32; pxmin: ptr LInt32;
                       pymin: ptr LInt32): ptr Pix {.
    importc: "pixRenderPolygon".}
proc pixFillPolygon*(pixs: ptr Pix; pta: ptr Pta; xmin: LInt32; ymin: LInt32): ptr Pix {.
    importc: "pixFillPolygon".}
proc pixRenderContours*(pixs: ptr Pix; startval: LInt32; incr: LInt32;
                        outdepth: LInt32): ptr Pix {.
    importc: "pixRenderContours".}
proc fpixAutoRenderContours*(fpix: ptr Fpix; ncontours: LInt32): ptr Pix {.
    importc: "fpixAutoRenderContours".}
proc fpixRenderContours*(fpixs: ptr Fpix; incr: LFloat32; proxim: LFloat32): ptr Pix {.
    importc: "fpixRenderContours".}
proc pixGeneratePtaBoundary*(pixs: ptr Pix; width: LInt32): ptr Pta {.
    importc: "pixGeneratePtaBoundary".}
proc pixErodeGray*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixErodeGray".}
proc pixDilateGray*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixDilateGray".}
proc pixOpenGray*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixOpenGray".}
proc pixCloseGray*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixCloseGray".}
proc pixErodeGray3*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixErodeGray3".}
proc pixDilateGray3*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixDilateGray3".}
proc pixOpenGray3*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixOpenGray3".}
proc pixCloseGray3*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixCloseGray3".}
proc pixDitherToBinary*(pixs: ptr Pix): ptr Pix {.importc: "pixDitherToBinary".}
proc pixDitherToBinarySpec*(pixs: ptr Pix; lowerclip: LInt32; upperclip: LInt32): ptr Pix {.
    importc: "pixDitherToBinarySpec".}
proc ditherToBinaryLineLow*(lined: ptr LUint32; w: LInt32; bufs1: ptr LUint32;
                            bufs2: ptr LUint32; lowerclip: LInt32;
                            upperclip: LInt32; lastlineflag: LInt32) {.
    importc: "ditherToBinaryLineLow".}
proc pixThresholdToBinary*(pixs: ptr Pix; thresh: LInt32): ptr Pix {.
    importc: "pixThresholdToBinary".}
proc thresholdToBinaryLineLow*(lined: ptr LUint32; w: LInt32;
                               lines: ptr LUint32; d: LInt32; thresh: LInt32) {.
    importc: "thresholdToBinaryLineLow".}
proc pixVarThresholdToBinary*(pixs: ptr Pix; pixg: ptr Pix): ptr Pix {.
    importc: "pixVarThresholdToBinary".}
proc pixAdaptThresholdToBinary*(pixs: ptr Pix; pixm: ptr Pix; gamma: LFloat32): ptr Pix {.
    importc: "pixAdaptThresholdToBinary".}
proc pixAdaptThresholdToBinaryGen*(pixs: ptr Pix; pixm: ptr Pix;
                                   gamma: LFloat32; blackval: LInt32;
                                   whiteval: LInt32; thresh: LInt32): ptr Pix {.
    importc: "pixAdaptThresholdToBinaryGen".}
proc pixGenerateMaskByValue*(pixs: ptr Pix; val: LInt32; usecmap: LInt32): ptr Pix {.
    importc: "pixGenerateMaskByValue".}
proc pixGenerateMaskByBand*(pixs: ptr Pix; lower: LInt32; upper: LInt32;
                            inband: LInt32; usecmap: LInt32): ptr Pix {.
    importc: "pixGenerateMaskByBand".}
proc pixDitherTo2bpp*(pixs: ptr Pix; cmapflag: LInt32): ptr Pix {.
    importc: "pixDitherTo2bpp".}
proc pixDitherTo2bppSpec*(pixs: ptr Pix; lowerclip: LInt32; upperclip: LInt32;
                          cmapflag: LInt32): ptr Pix {.
    importc: "pixDitherTo2bppSpec".}
proc pixThresholdTo2bpp*(pixs: ptr Pix; nlevels: LInt32; cmapflag: LInt32): ptr Pix {.
    importc: "pixThresholdTo2bpp".}
proc pixThresholdTo4bpp*(pixs: ptr Pix; nlevels: LInt32; cmapflag: LInt32): ptr Pix {.
    importc: "pixThresholdTo4bpp".}
proc pixThresholdOn8bpp*(pixs: ptr Pix; nlevels: LInt32; cmapflag: LInt32): ptr Pix {.
    importc: "pixThresholdOn8bpp".}
proc pixThresholdGrayArb*(pixs: ptr Pix; edgevals: cstring; outdepth: LInt32;
                          useAverage: LInt32; setblack: LInt32; setwhite: LInt32): ptr Pix {.
    importc: "pixThresholdGrayArb".}
proc makeGrayQuantIndexTable*(nlevels: LInt32): ptr LInt32 {.
    importc: "makeGrayQuantIndexTable".}
proc makeGrayQuantTableArb*(na: ptr Numa; outdepth: LInt32;
                            ptab: ptr ptr LInt32; pcmap: ptr ptr Pixcmap): LOk {.
    importc: "makeGrayQuantTableArb".}
proc pixGenerateMaskByBand32*(pixs: ptr Pix; refval: LUint32; delm: LInt32;
                              delp: LInt32; fractm: LFloat32; fractp: LFloat32): ptr Pix {.
    importc: "pixGenerateMaskByBand32".}
proc pixGenerateMaskByDiscr32*(pixs: ptr Pix; refval1: LUint32;
                               refval2: LUint32; distflag: LInt32): ptr Pix {.
    importc: "pixGenerateMaskByDiscr32".}
proc pixGrayQuantFromHisto*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                            minfract: LFloat32; maxsize: LInt32): ptr Pix {.
    importc: "pixGrayQuantFromHisto".}
proc pixGrayQuantFromCmap*(pixs: ptr Pix; cmap: ptr Pixcmap; mindepth: LInt32): ptr Pix {.
    importc: "pixGrayQuantFromCmap".}
proc lHmapCreate*(ninit: LInt32; maxocc: LInt32): ptr L_Hashmap {.
    importc: "l_hmapCreate".}
proc lHmapDestroy*(phmap: ptr ptr L_Hashmap) {.importc: "l_hmapDestroy".}
proc lHmapLookup*(hmap: ptr L_Hashmap; key: LUint64; val: LUint64; op: LInt32): ptr L_Hashitem {.
    importc: "l_hmapLookup".}
proc lHmapRehash*(hmap: ptr L_Hashmap): LOk {.importc: "l_hmapRehash".}
proc lheapCreate*(n: LInt32; direction: LInt32): ptr L_Heap {.
    importc: "lheapCreate".}
proc lheapDestroy*(plh: ptr ptr L_Heap; freeflag: LInt32) {.
    importc: "lheapDestroy".}
proc lheapAdd*(lh: ptr L_Heap; item: pointer): LOk {.importc: "lheapAdd".}
proc lheapRemove*(lh: ptr L_Heap): pointer {.importc: "lheapRemove".}
proc lheapGetCount*(lh: ptr L_Heap): LInt32 {.importc: "lheapGetCount".}
proc lheapGetElement*(lh: ptr L_Heap; index: LInt32): pointer {.
    importc: "lheapGetElement".}
proc lheapSort*(lh: ptr L_Heap): LOk {.importc: "lheapSort".}
proc lheapSortStrictOrder*(lh: ptr L_Heap): LOk {.
    importc: "lheapSortStrictOrder".}
proc lheapPrint*(fp: ptr File; lh: ptr L_Heap): LOk {.importc: "lheapPrint".}
proc jbRankHausInit*(components: LInt32; maxwidth: LInt32; maxheight: LInt32;
                     size: LInt32; rank: LFloat32): ptr Jbclasser {.
    importc: "jbRankHausInit".}
proc jbCorrelationInit*(components: LInt32; maxwidth: LInt32; maxheight: LInt32;
                        thresh: LFloat32; weightfactor: LFloat32): ptr Jbclasser {.
    importc: "jbCorrelationInit".}
proc jbCorrelationInitWithoutComponents*(components: LInt32; maxwidth: LInt32;
    maxheight: LInt32; thresh: LFloat32; weightfactor: LFloat32): ptr Jbclasser {.
    importc: "jbCorrelationInitWithoutComponents".}
proc jbAddPages*(classer: ptr Jbclasser; safiles: ptr Sarray): LOk {.
    importc: "jbAddPages".}
proc jbAddPage*(classer: ptr Jbclasser; pixs: ptr Pix): LOk {.
    importc: "jbAddPage".}
proc jbAddPageComponents*(classer: ptr Jbclasser; pixs: ptr Pix;
                          boxas: ptr Boxa; pixas: ptr Pixa): LOk {.
    importc: "jbAddPageComponents".}
proc jbClassifyRankHaus*(classer: ptr Jbclasser; boxa: ptr Boxa; pixas: ptr Pixa): LOk {.
    importc: "jbClassifyRankHaus".}
proc pixHaustest*(pix1: ptr Pix; pix2: ptr Pix; pix3: ptr Pix; pix4: ptr Pix;
                  delx: LFloat32; dely: LFloat32; maxdiffw: LInt32;
                  maxdiffh: LInt32): LInt32 {.importc: "pixHaustest".}
proc pixRankHaustest*(pix1: ptr Pix; pix2: ptr Pix; pix3: ptr Pix;
                      pix4: ptr Pix; delx: LFloat32; dely: LFloat32;
                      maxdiffw: LInt32; maxdiffh: LInt32; area1: LInt32;
                      area3: LInt32; rank: LFloat32; tab8: ptr LInt32): LInt32 {.
    importc: "pixRankHaustest".}
proc jbClassifyCorrelation*(classer: ptr Jbclasser; boxa: ptr Boxa;
                            pixas: ptr Pixa): LOk {.
    importc: "jbClassifyCorrelation".}
proc jbGetComponents*(pixs: ptr Pix; components: LInt32; maxwidth: LInt32;
                      maxheight: LInt32; pboxad: ptr ptr Boxa;
                      ppixad: ptr ptr Pixa): LOk {.importc: "jbGetComponents".}
proc pixWordMaskByDilation*(pixs: ptr Pix; ppixm: ptr ptr Pix;
                            psize: ptr LInt32; pixadb: ptr Pixa): LOk {.
    importc: "pixWordMaskByDilation".}
proc pixWordBoxesByDilation*(pixs: ptr Pix; minwidth: LInt32; minheight: LInt32;
                             maxwidth: LInt32; maxheight: LInt32;
                             pboxa: ptr ptr Boxa; psize: ptr LInt32;
                             pixadb: ptr Pixa): LOk {.
    importc: "pixWordBoxesByDilation".}
proc jbAccumulateComposites*(pixaa: ptr Pixaa; pna: ptr ptr Numa;
                             pptat: ptr ptr Pta): ptr Pixa {.
    importc: "jbAccumulateComposites".}
proc jbTemplatesFromComposites*(pixac: ptr Pixa; na: ptr Numa): ptr Pixa {.
    importc: "jbTemplatesFromComposites".}
proc jbClasserCreate*(`method`: LInt32; components: LInt32): ptr Jbclasser {.
    importc: "jbClasserCreate".}
proc jbClasserDestroy*(pclasser: ptr ptr Jbclasser) {.
    importc: "jbClasserDestroy".}
proc jbDataSave*(classer: ptr Jbclasser): ptr Jbdata {.importc: "jbDataSave".}
proc jbDataDestroy*(pdata: ptr ptr Jbdata) {.importc: "jbDataDestroy".}
proc jbDataWrite*(rootout: cstring; jbdata: ptr Jbdata): LOk {.
    importc: "jbDataWrite".}
proc jbDataRead*(rootname: cstring): ptr Jbdata {.importc: "jbDataRead".}
proc jbDataRender*(data: ptr Jbdata; debugflag: LInt32): ptr Pixa {.
    importc: "jbDataRender".}
proc jbGetULCorners*(classer: ptr Jbclasser; pixs: ptr Pix; boxa: ptr Boxa): LOk {.
    importc: "jbGetULCorners".}
proc jbGetLLCorners*(classer: ptr Jbclasser): LOk {.importc: "jbGetLLCorners".}
proc readHeaderJp2k*(filename: cstring; pw: ptr LInt32; ph: ptr LInt32;
                     pbps: ptr LInt32; pspp: ptr LInt32; pcodec: ptr LInt32): LOk {.
    importc: "readHeaderJp2k".}
proc freadHeaderJp2k*(fp: ptr File; pw: ptr LInt32; ph: ptr LInt32;
                      pbps: ptr LInt32; pspp: ptr LInt32; pcodec: ptr LInt32): LOk {.
    importc: "freadHeaderJp2k".}
proc readHeaderMemJp2k*(data: ptr LUint8; size: csize_t; pw: ptr LInt32;
                        ph: ptr LInt32; pbps: ptr LInt32; pspp: ptr LInt32;
                        pcodec: ptr LInt32): LOk {.importc: "readHeaderMemJp2k".}
proc fgetJp2kResolution*(fp: ptr File; pxres: ptr LInt32; pyres: ptr LInt32): LInt32 {.
    importc: "fgetJp2kResolution".}
proc pixReadJp2k*(filename: cstring; reduction: LUint32; box: ptr Box;
                  hint: LInt32; debug: LInt32): ptr Pix {.
    importc: "pixReadJp2k".}
proc pixReadStreamJp2k*(fp: ptr File; reduction: LUint32; box: ptr Box;
                        hint: LInt32; debug: LInt32): ptr Pix {.
    importc: "pixReadStreamJp2k".}
proc pixWriteJp2k*(filename: cstring; pix: ptr Pix; quality: LInt32;
                   nlevels: LInt32; hint: LInt32; debug: LInt32): LOk {.
    importc: "pixWriteJp2k".}
proc pixWriteStreamJp2k*(fp: ptr File; pix: ptr Pix; quality: LInt32;
                         nlevels: LInt32; codec: LInt32; hint: LInt32;
                         debug: LInt32): LOk {.importc: "pixWriteStreamJp2k".}
proc pixReadMemJp2k*(data: ptr LUint8; size: csize_t; reduction: LUint32;
                     box: ptr Box; hint: LInt32; debug: LInt32): ptr Pix {.
    importc: "pixReadMemJp2k".}
proc pixWriteMemJp2k*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix;
                      quality: LInt32; nlevels: LInt32; hint: LInt32;
                      debug: LInt32): LOk {.importc: "pixWriteMemJp2k".}
proc pixReadJpeg*(filename: cstring; cmapflag: LInt32; reduction: LInt32;
                  pnwarn: ptr LInt32; hint: LInt32): ptr Pix {.
    importc: "pixReadJpeg".}
proc pixReadStreamJpeg*(fp: ptr File; cmapflag: LInt32; reduction: LInt32;
                        pnwarn: ptr LInt32; hint: LInt32): ptr Pix {.
    importc: "pixReadStreamJpeg".}
proc readHeaderJpeg*(filename: cstring; pw: ptr LInt32; ph: ptr LInt32;
                     pspp: ptr LInt32; pycck: ptr LInt32; pcmyk: ptr LInt32): LOk {.
    importc: "readHeaderJpeg".}
proc freadHeaderJpeg*(fp: ptr File; pw: ptr LInt32; ph: ptr LInt32;
                      pspp: ptr LInt32; pycck: ptr LInt32; pcmyk: ptr LInt32): LOk {.
    importc: "freadHeaderJpeg".}
proc fgetJpegResolution*(fp: ptr File; pxres: ptr LInt32; pyres: ptr LInt32): LInt32 {.
    importc: "fgetJpegResolution".}
proc fgetJpegComment*(fp: ptr File; pcomment: ptr ptr LUint8): LInt32 {.
    importc: "fgetJpegComment".}
proc pixWriteJpeg*(filename: cstring; pix: ptr Pix; quality: LInt32;
                   progressive: LInt32): LOk {.importc: "pixWriteJpeg".}
proc pixWriteStreamJpeg*(fp: ptr File; pixs: ptr Pix; quality: LInt32;
                         progressive: LInt32): LOk {.
    importc: "pixWriteStreamJpeg".}
proc pixReadMemJpeg*(data: ptr LUint8; size: csize_t; cmflag: LInt32;
                     reduction: LInt32; pnwarn: ptr LInt32; hint: LInt32): ptr Pix {.
    importc: "pixReadMemJpeg".}
proc readHeaderMemJpeg*(data: ptr LUint8; size: csize_t; pw: ptr LInt32;
                        ph: ptr LInt32; pspp: ptr LInt32; pycck: ptr LInt32;
                        pcmyk: ptr LInt32): LOk {.importc: "readHeaderMemJpeg".}
proc readResolutionMemJpeg*(data: ptr LUint8; size: csize_t; pxres: ptr LInt32;
                            pyres: ptr LInt32): LOk {.
    importc: "readResolutionMemJpeg".}
proc pixWriteMemJpeg*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix;
                      quality: LInt32; progressive: LInt32): LOk {.
    importc: "pixWriteMemJpeg".}
proc pixSetChromaSampling*(pix: ptr Pix; sampling: LInt32): LOk {.
    importc: "pixSetChromaSampling".}
proc kernelCreate*(height: LInt32; width: LInt32): ptr L_Kernel {.
    importc: "kernelCreate".}
proc kernelDestroy*(pkel: ptr ptr L_Kernel) {.importc: "kernelDestroy".}
proc kernelCopy*(kels: ptr L_Kernel): ptr L_Kernel {.importc: "kernelCopy".}
proc kernelGetElement*(kel: ptr L_Kernel; row: LInt32; col: LInt32;
                       pval: ptr LFloat32): LOk {.importc: "kernelGetElement".}
proc kernelSetElement*(kel: ptr L_Kernel; row: LInt32; col: LInt32;
                       val: LFloat32): LOk {.importc: "kernelSetElement".}
proc kernelGetParameters*(kel: ptr L_Kernel; psy: ptr LInt32; psx: ptr LInt32;
                          pcy: ptr LInt32; pcx: ptr LInt32): LOk {.
    importc: "kernelGetParameters".}
proc kernelSetOrigin*(kel: ptr L_Kernel; cy: LInt32; cx: LInt32): LOk {.
    importc: "kernelSetOrigin".}
proc kernelGetSum*(kel: ptr L_Kernel; psum: ptr LFloat32): LOk {.
    importc: "kernelGetSum".}
proc kernelGetMinMax*(kel: ptr L_Kernel; pmin: ptr LFloat32; pmax: ptr LFloat32): LOk {.
    importc: "kernelGetMinMax".}
proc kernelNormalize*(kels: ptr L_Kernel; normsum: LFloat32): ptr L_Kernel {.
    importc: "kernelNormalize".}
proc kernelInvert*(kels: ptr L_Kernel): ptr L_Kernel {.importc: "kernelInvert".}
proc create2dFloatArray*(sy: LInt32; sx: LInt32): ptr ptr LFloat32 {.
    importc: "create2dFloatArray".}
proc kernelRead*(fname: cstring): ptr L_Kernel {.importc: "kernelRead".}
proc kernelReadStream*(fp: ptr File): ptr L_Kernel {.
    importc: "kernelReadStream".}
proc kernelWrite*(fname: cstring; kel: ptr L_Kernel): LOk {.
    importc: "kernelWrite".}
proc kernelWriteStream*(fp: ptr File; kel: ptr L_Kernel): LOk {.
    importc: "kernelWriteStream".}
proc kernelCreateFromString*(h: LInt32; w: LInt32; cy: LInt32; cx: LInt32;
                             kdata: cstring): ptr L_Kernel {.
    importc: "kernelCreateFromString".}
proc kernelCreateFromFile*(filename: cstring): ptr L_Kernel {.
    importc: "kernelCreateFromFile".}
proc kernelCreateFromPix*(pix: ptr Pix; cy: LInt32; cx: LInt32): ptr L_Kernel {.
    importc: "kernelCreateFromPix".}
proc kernelDisplayInPix*(kel: ptr L_Kernel; size: LInt32; gthick: LInt32): ptr Pix {.
    importc: "kernelDisplayInPix".}
proc parseStringForNumbers*(str: cstring; seps: cstring): ptr Numa {.
    importc: "parseStringForNumbers".}
proc makeFlatKernel*(height: LInt32; width: LInt32; cy: LInt32; cx: LInt32): ptr L_Kernel {.
    importc: "makeFlatKernel".}
proc makeGaussianKernel*(halfh: LInt32; halfw: LInt32; stdev: LFloat32;
                         max: LFloat32): ptr L_Kernel {.
    importc: "makeGaussianKernel".}
proc makeGaussianKernelSep*(halfh: LInt32; halfw: LInt32; stdev: LFloat32;
                            max: LFloat32; pkelx: ptr ptr L_Kernel;
                            pkely: ptr ptr L_Kernel): LOk {.
    importc: "makeGaussianKernelSep".}
proc makeDoGKernel*(halfh: LInt32; halfw: LInt32; stdev: LFloat32;
                    ratio: LFloat32): ptr L_Kernel {.importc: "makeDoGKernel".}
proc getImagelibVersions*(): cstring {.importc: "getImagelibVersions".}
proc listDestroy*(phead: ptr ptr Dllist) {.importc: "listDestroy".}
proc listAddToHead*(phead: ptr ptr Dllist; data: pointer): LOk {.
    importc: "listAddToHead".}
proc listAddToTail*(phead: ptr ptr Dllist; ptail: ptr ptr Dllist; data: pointer): LOk {.
    importc: "listAddToTail".}
proc listInsertBefore*(phead: ptr ptr Dllist; elem: ptr Dllist; data: pointer): LOk {.
    importc: "listInsertBefore".}
proc listInsertAfter*(phead: ptr ptr Dllist; elem: ptr Dllist; data: pointer): LOk {.
    importc: "listInsertAfter".}
proc listRemoveElement*(phead: ptr ptr Dllist; elem: ptr Dllist): pointer {.
    importc: "listRemoveElement".}
proc listRemoveFromHead*(phead: ptr ptr Dllist): pointer {.
    importc: "listRemoveFromHead".}
proc listRemoveFromTail*(phead: ptr ptr Dllist; ptail: ptr ptr Dllist): pointer {.
    importc: "listRemoveFromTail".}
proc listFindElement*(head: ptr Dllist; data: pointer): ptr Dllist {.
    importc: "listFindElement".}
proc listFindTail*(head: ptr Dllist): ptr Dllist {.importc: "listFindTail".}
proc listGetCount*(head: ptr Dllist): LInt32 {.importc: "listGetCount".}
proc listReverse*(phead: ptr ptr Dllist): LOk {.importc: "listReverse".}
proc listJoin*(phead1: ptr ptr Dllist; phead2: ptr ptr Dllist): LOk {.
    importc: "listJoin".}
proc lAmapCreate*(keytype: LInt32): ptr L_Amap {.importc: "l_amapCreate".}
proc lAmapFind*(m: ptr L_Amap; key: Rb_Type): ptr Rb_Type {.
    importc: "l_amapFind".}
proc lAmapInsert*(m: ptr L_Amap; key: Rb_Type; value: Rb_Type) {.
    importc: "l_amapInsert".}
proc lAmapDelete*(m: ptr L_Amap; key: Rb_Type) {.importc: "l_amapDelete".}
proc lAmapDestroy*(pm: ptr ptr L_Amap) {.importc: "l_amapDestroy".}
proc lAmapGetFirst*(m: ptr L_Amap): ptr L_Amap_Node {.importc: "l_amapGetFirst".}
proc lAmapGetNext*(n: ptr L_Amap_Node): ptr L_Amap_Node {.
    importc: "l_amapGetNext".}
proc lAmapGetLast*(m: ptr L_Amap): ptr L_Amap_Node {.importc: "l_amapGetLast".}
proc lAmapGetPrev*(n: ptr L_Amap_Node): ptr L_Amap_Node {.
    importc: "l_amapGetPrev".}
proc lAmapSize*(m: ptr L_Amap): LInt32 {.importc: "l_amapSize".}
proc lAsetCreate*(keytype: LInt32): ptr L_Aset {.importc: "l_asetCreate".}
proc lAsetFind*(s: ptr L_Aset; key: Rb_Type): ptr Rb_Type {.
    importc: "l_asetFind".}
proc lAsetInsert*(s: ptr L_Aset; key: Rb_Type) {.importc: "l_asetInsert".}
proc lAsetDelete*(s: ptr L_Aset; key: Rb_Type) {.importc: "l_asetDelete".}
proc lAsetDestroy*(ps: ptr ptr L_Aset) {.importc: "l_asetDestroy".}
proc lAsetGetFirst*(s: ptr L_Aset): ptr L_Aset_Node {.importc: "l_asetGetFirst".}
proc lAsetGetNext*(n: ptr L_Aset_Node): ptr L_Aset_Node {.
    importc: "l_asetGetNext".}
proc lAsetGetLast*(s: ptr L_Aset): ptr L_Aset_Node {.importc: "l_asetGetLast".}
proc lAsetGetPrev*(n: ptr L_Aset_Node): ptr L_Aset_Node {.
    importc: "l_asetGetPrev".}
proc lAsetSize*(s: ptr L_Aset): LInt32 {.importc: "l_asetSize".}
proc generateBinaryMaze*(w: LInt32; h: LInt32; xi: LInt32; yi: LInt32;
                         wallps: LFloat32; ranis: LFloat32): ptr Pix {.
    importc: "generateBinaryMaze".}
proc pixSearchBinaryMaze*(pixs: ptr Pix; xi: LInt32; yi: LInt32; xf: LInt32;
                          yf: LInt32; ppixd: ptr ptr Pix): ptr Pta {.
    importc: "pixSearchBinaryMaze".}
proc pixSearchGrayMaze*(pixs: ptr Pix; xi: LInt32; yi: LInt32; xf: LInt32;
                        yf: LInt32; ppixd: ptr ptr Pix): ptr Pta {.
    importc: "pixSearchGrayMaze".}
proc pixDilate*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixDilate".}
proc pixErode*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixErode".}
proc pixHMT*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixHMT".}
proc pixOpen*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixOpen".}
proc pixClose*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixClose".}
proc pixCloseSafe*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixCloseSafe".}
proc pixOpenGeneralized*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixOpenGeneralized".}
proc pixCloseGeneralized*(pixd: ptr Pix; pixs: ptr Pix; sel: ptr Sel): ptr Pix {.
    importc: "pixCloseGeneralized".}
proc pixDilateBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixDilateBrick".}
proc pixErodeBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixErodeBrick".}
proc pixOpenBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixOpenBrick".}
proc pixCloseBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixCloseBrick".}
proc pixCloseSafeBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                        vsize: LInt32): ptr Pix {.importc: "pixCloseSafeBrick".}
proc selectComposableSels*(size: LInt32; direction: LInt32; psel1: ptr ptr Sel;
                           psel2: ptr ptr Sel): LInt32 {.
    importc: "selectComposableSels".}
proc selectComposableSizes*(size: LInt32; pfactor1: ptr LInt32;
                            pfactor2: ptr LInt32): LOk {.
    importc: "selectComposableSizes".}
proc pixDilateCompBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                         vsize: LInt32): ptr Pix {.
    importc: "pixDilateCompBrick".}
proc pixErodeCompBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                        vsize: LInt32): ptr Pix {.importc: "pixErodeCompBrick".}
proc pixOpenCompBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                       vsize: LInt32): ptr Pix {.importc: "pixOpenCompBrick".}
proc pixCloseCompBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                        vsize: LInt32): ptr Pix {.importc: "pixCloseCompBrick".}
proc pixCloseSafeCompBrick*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                            vsize: LInt32): ptr Pix {.
    importc: "pixCloseSafeCompBrick".}
proc resetMorphBoundaryCondition*(bc: LInt32) {.
    importc: "resetMorphBoundaryCondition".}
proc getMorphBorderPixelColor*(`type`: LInt32; depth: LInt32): LUint32 {.
    importc: "getMorphBorderPixelColor".}
proc pixExtractBoundary*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixExtractBoundary".}
proc pixMorphSequenceMasked*(pixs: ptr Pix; pixm: ptr Pix; sequence: cstring;
                             dispsep: LInt32): ptr Pix {.
    importc: "pixMorphSequenceMasked".}
proc pixMorphSequenceByComponent*(pixs: ptr Pix; sequence: cstring;
                                  connectivity: LInt32; minw: LInt32;
                                  minh: LInt32; pboxa: ptr ptr Boxa): ptr Pix {.
    importc: "pixMorphSequenceByComponent".}
proc pixaMorphSequenceByComponent*(pixas: ptr Pixa; sequence: cstring;
                                   minw: LInt32; minh: LInt32): ptr Pixa {.
    importc: "pixaMorphSequenceByComponent".}
proc pixMorphSequenceByRegion*(pixs: ptr Pix; pixm: ptr Pix; sequence: cstring;
                               connectivity: LInt32; minw: LInt32; minh: LInt32;
                               pboxa: ptr ptr Boxa): ptr Pix {.
    importc: "pixMorphSequenceByRegion".}
proc pixaMorphSequenceByRegion*(pixs: ptr Pix; pixam: ptr Pixa;
                                sequence: cstring; minw: LInt32; minh: LInt32): ptr Pixa {.
    importc: "pixaMorphSequenceByRegion".}
proc pixUnionOfMorphOps*(pixs: ptr Pix; sela: ptr Sela; `type`: LInt32): ptr Pix {.
    importc: "pixUnionOfMorphOps".}
proc pixIntersectionOfMorphOps*(pixs: ptr Pix; sela: ptr Sela; `type`: LInt32): ptr Pix {.
    importc: "pixIntersectionOfMorphOps".}
proc pixSelectiveConnCompFill*(pixs: ptr Pix; connectivity: LInt32;
                               minw: LInt32; minh: LInt32): ptr Pix {.
    importc: "pixSelectiveConnCompFill".}
proc pixRemoveMatchedPattern*(pixs: ptr Pix; pixp: ptr Pix; pixe: ptr Pix;
                              x0: LInt32; y0: LInt32; dsize: LInt32): LOk {.
    importc: "pixRemoveMatchedPattern".}
proc pixDisplayMatchedPattern*(pixs: ptr Pix; pixp: ptr Pix; pixe: ptr Pix;
                               x0: LInt32; y0: LInt32; color: LUint32;
                               scale: LFloat32; nlevels: LInt32): ptr Pix {.
    importc: "pixDisplayMatchedPattern".}
proc pixaExtendByMorph*(pixas: ptr Pixa; `type`: LInt32; niters: LInt32;
                        sel: ptr Sel; `include`: LInt32): ptr Pixa {.
    importc: "pixaExtendByMorph".}
proc pixaExtendByScaling*(pixas: ptr Pixa; nasc: ptr Numa; `type`: LInt32;
                          `include`: LInt32): ptr Pixa {.
    importc: "pixaExtendByScaling".}
proc pixSeedfillMorph*(pixs: ptr Pix; pixm: ptr Pix; maxiters: LInt32;
                       connectivity: LInt32): ptr Pix {.
    importc: "pixSeedfillMorph".}
proc pixRunHistogramMorph*(pixs: ptr Pix; runtype: LInt32; direction: LInt32;
                           maxsize: LInt32): ptr Numa {.
    importc: "pixRunHistogramMorph".}
proc pixTophat*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32; `type`: LInt32): ptr Pix {.
    importc: "pixTophat".}
proc pixHDome*(pixs: ptr Pix; height: LInt32; connectivity: LInt32): ptr Pix {.
    importc: "pixHDome".}
proc pixFastTophat*(pixs: ptr Pix; xsize: LInt32; ysize: LInt32; `type`: LInt32): ptr Pix {.
    importc: "pixFastTophat".}
proc pixMorphGradient*(pixs: ptr Pix; hsize: LInt32; vsize: LInt32;
                       smoothing: LInt32): ptr Pix {.
    importc: "pixMorphGradient".}
proc pixaCentroids*(pixa: ptr Pixa): ptr Pta {.importc: "pixaCentroids".}
proc pixCentroid*(pix: ptr Pix; centtab: ptr LInt32; sumtab: ptr LInt32;
                  pxave: ptr LFloat32; pyave: ptr LFloat32): LOk {.
    importc: "pixCentroid".}
proc pixDilateBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                        vsize: LInt32): ptr Pix {.importc: "pixDilateBrickDwa".}
proc pixErodeBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                       vsize: LInt32): ptr Pix {.importc: "pixErodeBrickDwa".}
proc pixOpenBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32; vsize: LInt32): ptr Pix {.
    importc: "pixOpenBrickDwa".}
proc pixCloseBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                       vsize: LInt32): ptr Pix {.importc: "pixCloseBrickDwa".}
proc pixDilateCompBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                            vsize: LInt32): ptr Pix {.
    importc: "pixDilateCompBrickDwa".}
proc pixErodeCompBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                           vsize: LInt32): ptr Pix {.
    importc: "pixErodeCompBrickDwa".}
proc pixOpenCompBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                          vsize: LInt32): ptr Pix {.
    importc: "pixOpenCompBrickDwa".}
proc pixCloseCompBrickDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                           vsize: LInt32): ptr Pix {.
    importc: "pixCloseCompBrickDwa".}
proc pixDilateCompBrickExtendDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                                  vsize: LInt32): ptr Pix {.
    importc: "pixDilateCompBrickExtendDwa".}
proc pixErodeCompBrickExtendDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                                 vsize: LInt32): ptr Pix {.
    importc: "pixErodeCompBrickExtendDwa".}
proc pixOpenCompBrickExtendDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                                vsize: LInt32): ptr Pix {.
    importc: "pixOpenCompBrickExtendDwa".}
proc pixCloseCompBrickExtendDwa*(pixd: ptr Pix; pixs: ptr Pix; hsize: LInt32;
                                 vsize: LInt32): ptr Pix {.
    importc: "pixCloseCompBrickExtendDwa".}
proc getExtendedCompositeParameters*(size: LInt32; pn: ptr LInt32;
                                     pextra: ptr LInt32; pactualsize: ptr LInt32): LOk {.
    importc: "getExtendedCompositeParameters".}
proc pixMorphSequence*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32): ptr Pix {.
    importc: "pixMorphSequence".}
proc pixMorphCompSequence*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32): ptr Pix {.
    importc: "pixMorphCompSequence".}
proc pixMorphSequenceDwa*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32): ptr Pix {.
    importc: "pixMorphSequenceDwa".}
proc pixMorphCompSequenceDwa*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32): ptr Pix {.
    importc: "pixMorphCompSequenceDwa".}
proc morphSequenceVerify*(sa: ptr Sarray): LInt32 {.
    importc: "morphSequenceVerify".}
proc pixGrayMorphSequence*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32;
                           dispy: LInt32): ptr Pix {.
    importc: "pixGrayMorphSequence".}
proc pixColorMorphSequence*(pixs: ptr Pix; sequence: cstring; dispsep: LInt32;
                            dispy: LInt32): ptr Pix {.
    importc: "pixColorMorphSequence".}
proc numaCreate*(n: LInt32): ptr Numa {.importc: "numaCreate".}
proc numaCreateFromIArray*(iarray: ptr LInt32; size: LInt32): ptr Numa {.
    importc: "numaCreateFromIArray".}
proc numaCreateFromFArray*(farray: ptr LFloat32; size: LInt32; copyflag: LInt32): ptr Numa {.
    importc: "numaCreateFromFArray".}
proc numaCreateFromString*(str: cstring): ptr Numa {.
    importc: "numaCreateFromString".}
proc numaDestroy*(pna: ptr ptr Numa) {.importc: "numaDestroy".}
proc numaCopy*(na: ptr Numa): ptr Numa {.importc: "numaCopy".}
proc numaClone*(na: ptr Numa): ptr Numa {.importc: "numaClone".}
proc numaEmpty*(na: ptr Numa): LOk {.importc: "numaEmpty".}
proc numaAddNumber*(na: ptr Numa; val: LFloat32): LOk {.
    importc: "numaAddNumber".}
proc numaInsertNumber*(na: ptr Numa; index: LInt32; val: LFloat32): LOk {.
    importc: "numaInsertNumber".}
proc numaRemoveNumber*(na: ptr Numa; index: LInt32): LOk {.
    importc: "numaRemoveNumber".}
proc numaReplaceNumber*(na: ptr Numa; index: LInt32; val: LFloat32): LOk {.
    importc: "numaReplaceNumber".}
proc numaGetCount*(na: ptr Numa): LInt32 {.importc: "numaGetCount".}
proc numaSetCount*(na: ptr Numa; newcount: LInt32): LOk {.
    importc: "numaSetCount".}
proc numaGetFValue*(na: ptr Numa; index: LInt32; pval: ptr LFloat32): LOk {.
    importc: "numaGetFValue".}
proc numaGetIValue*(na: ptr Numa; index: LInt32; pival: ptr LInt32): LOk {.
    importc: "numaGetIValue".}
proc numaSetValue*(na: ptr Numa; index: LInt32; val: LFloat32): LOk {.
    importc: "numaSetValue".}
proc numaShiftValue*(na: ptr Numa; index: LInt32; diff: LFloat32): LOk {.
    importc: "numaShiftValue".}
proc numaGetIArray*(na: ptr Numa): ptr LInt32 {.importc: "numaGetIArray".}
proc numaGetFArray*(na: ptr Numa; copyflag: LInt32): ptr LFloat32 {.
    importc: "numaGetFArray".}
proc numaGetParameters*(na: ptr Numa; pstartx: ptr LFloat32; pdelx: ptr LFloat32): LOk {.
    importc: "numaGetParameters".}
proc numaSetParameters*(na: ptr Numa; startx: LFloat32; delx: LFloat32): LOk {.
    importc: "numaSetParameters".}
proc numaCopyParameters*(nad: ptr Numa; nas: ptr Numa): LOk {.
    importc: "numaCopyParameters".}
proc numaConvertToSarray*(na: ptr Numa; size1: LInt32; size2: LInt32;
                          addzeros: LInt32; `type`: LInt32): ptr Sarray {.
    importc: "numaConvertToSarray".}
proc numaRead*(filename: cstring): ptr Numa {.importc: "numaRead".}
proc numaReadStream*(fp: ptr File): ptr Numa {.importc: "numaReadStream".}
proc numaReadMem*(data: ptr LUint8; size: csize_t): ptr Numa {.
    importc: "numaReadMem".}
proc numaWriteDebug*(filename: cstring; na: ptr Numa): LOk {.
    importc: "numaWriteDebug".}
proc numaWrite*(filename: cstring; na: ptr Numa): LOk {.importc: "numaWrite".}
proc numaWriteStream*(fp: ptr File; na: ptr Numa): LOk {.
    importc: "numaWriteStream".}
proc numaWriteStderr*(na: ptr Numa): LOk {.importc: "numaWriteStderr".}
proc numaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; na: ptr Numa): LOk {.
    importc: "numaWriteMem".}
proc numaaCreate*(n: LInt32): ptr Numaa {.importc: "numaaCreate".}
proc numaaCreateFull*(nptr: LInt32; n: LInt32): ptr Numaa {.
    importc: "numaaCreateFull".}
proc numaaTruncate*(naa: ptr Numaa): LOk {.importc: "numaaTruncate".}
proc numaaDestroy*(pnaa: ptr ptr Numaa) {.importc: "numaaDestroy".}
proc numaaAddNuma*(naa: ptr Numaa; na: ptr Numa; copyflag: LInt32): LOk {.
    importc: "numaaAddNuma".}
proc numaaGetCount*(naa: ptr Numaa): LInt32 {.importc: "numaaGetCount".}
proc numaaGetNumaCount*(naa: ptr Numaa; index: LInt32): LInt32 {.
    importc: "numaaGetNumaCount".}
proc numaaGetNumberCount*(naa: ptr Numaa): LInt32 {.
    importc: "numaaGetNumberCount".}
proc numaaGetPtrArray*(naa: ptr Numaa): ptr ptr Numa {.
    importc: "numaaGetPtrArray".}
proc numaaGetNuma*(naa: ptr Numaa; index: LInt32; accessflag: LInt32): ptr Numa {.
    importc: "numaaGetNuma".}
proc numaaReplaceNuma*(naa: ptr Numaa; index: LInt32; na: ptr Numa): LOk {.
    importc: "numaaReplaceNuma".}
proc numaaGetValue*(naa: ptr Numaa; i: LInt32; j: LInt32; pfval: ptr LFloat32;
                    pival: ptr LInt32): LOk {.importc: "numaaGetValue".}
proc numaaAddNumber*(naa: ptr Numaa; index: LInt32; val: LFloat32): LOk {.
    importc: "numaaAddNumber".}
proc numaaRead*(filename: cstring): ptr Numaa {.importc: "numaaRead".}
proc numaaReadStream*(fp: ptr File): ptr Numaa {.importc: "numaaReadStream".}
proc numaaReadMem*(data: ptr LUint8; size: csize_t): ptr Numaa {.
    importc: "numaaReadMem".}
proc numaaWrite*(filename: cstring; naa: ptr Numaa): LOk {.
    importc: "numaaWrite".}
proc numaaWriteStream*(fp: ptr File; naa: ptr Numaa): LOk {.
    importc: "numaaWriteStream".}
proc numaaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; naa: ptr Numaa): LOk {.
    importc: "numaaWriteMem".}
proc numaArithOp*(nad: ptr Numa; na1: ptr Numa; na2: ptr Numa; op: LInt32): ptr Numa {.
    importc: "numaArithOp".}
proc numaLogicalOp*(nad: ptr Numa; na1: ptr Numa; na2: ptr Numa; op: LInt32): ptr Numa {.
    importc: "numaLogicalOp".}
proc numaInvert*(nad: ptr Numa; nas: ptr Numa): ptr Numa {.
    importc: "numaInvert".}
proc numaSimilar*(na1: ptr Numa; na2: ptr Numa; maxdiff: LFloat32;
                  psimilar: ptr LInt32): LInt32 {.importc: "numaSimilar".}
proc numaAddToNumber*(na: ptr Numa; index: LInt32; val: LFloat32): LOk {.
    importc: "numaAddToNumber".}
proc numaGetMin*(na: ptr Numa; pminval: ptr LFloat32; piminloc: ptr LInt32): LOk {.
    importc: "numaGetMin".}
proc numaGetMax*(na: ptr Numa; pmaxval: ptr LFloat32; pimaxloc: ptr LInt32): LOk {.
    importc: "numaGetMax".}
proc numaGetSum*(na: ptr Numa; psum: ptr LFloat32): LOk {.importc: "numaGetSum".}
proc numaGetPartialSums*(na: ptr Numa): ptr Numa {.
    importc: "numaGetPartialSums".}
proc numaGetSumOnInterval*(na: ptr Numa; first: LInt32; last: LInt32;
                           psum: ptr LFloat32): LOk {.
    importc: "numaGetSumOnInterval".}
proc numaHasOnlyIntegers*(na: ptr Numa; pallints: ptr LInt32): LOk {.
    importc: "numaHasOnlyIntegers".}
proc numaGetMean*(na: ptr Numa; pave: ptr LFloat32): LOk {.
    importc: "numaGetMean".}
proc numaGetMeanAbsval*(na: ptr Numa; paveabs: ptr LFloat32): LOk {.
    importc: "numaGetMeanAbsval".}
proc numaSubsample*(nas: ptr Numa; subfactor: LInt32): ptr Numa {.
    importc: "numaSubsample".}
proc numaMakeDelta*(nas: ptr Numa): ptr Numa {.importc: "numaMakeDelta".}
proc numaMakeSequence*(startval: LFloat32; increment: LFloat32; size: LInt32): ptr Numa {.
    importc: "numaMakeSequence".}
proc numaMakeConstant*(val: LFloat32; size: LInt32): ptr Numa {.
    importc: "numaMakeConstant".}
proc numaMakeAbsval*(nad: ptr Numa; nas: ptr Numa): ptr Numa {.
    importc: "numaMakeAbsval".}
proc numaAddBorder*(nas: ptr Numa; left: LInt32; right: LInt32; val: LFloat32): ptr Numa {.
    importc: "numaAddBorder".}
proc numaAddSpecifiedBorder*(nas: ptr Numa; left: LInt32; right: LInt32;
                             `type`: LInt32): ptr Numa {.
    importc: "numaAddSpecifiedBorder".}
proc numaRemoveBorder*(nas: ptr Numa; left: LInt32; right: LInt32): ptr Numa {.
    importc: "numaRemoveBorder".}
proc numaCountNonzeroRuns*(na: ptr Numa; pcount: ptr LInt32): LOk {.
    importc: "numaCountNonzeroRuns".}
proc numaGetNonzeroRange*(na: ptr Numa; eps: LFloat32; pfirst: ptr LInt32;
                          plast: ptr LInt32): LOk {.
    importc: "numaGetNonzeroRange".}
proc numaGetCountRelativeToZero*(na: ptr Numa; `type`: LInt32;
                                 pcount: ptr LInt32): LOk {.
    importc: "numaGetCountRelativeToZero".}
proc numaClipToInterval*(nas: ptr Numa; first: LInt32; last: LInt32): ptr Numa {.
    importc: "numaClipToInterval".}
proc numaMakeThresholdIndicator*(nas: ptr Numa; thresh: LFloat32; `type`: LInt32): ptr Numa {.
    importc: "numaMakeThresholdIndicator".}
proc numaUniformSampling*(nas: ptr Numa; nsamp: LInt32): ptr Numa {.
    importc: "numaUniformSampling".}
proc numaReverse*(nad: ptr Numa; nas: ptr Numa): ptr Numa {.
    importc: "numaReverse".}
proc numaLowPassIntervals*(nas: ptr Numa; thresh: LFloat32; maxn: LFloat32): ptr Numa {.
    importc: "numaLowPassIntervals".}
proc numaThresholdEdges*(nas: ptr Numa; thresh1: LFloat32; thresh2: LFloat32;
                         maxn: LFloat32): ptr Numa {.
    importc: "numaThresholdEdges".}
proc numaGetSpanValues*(na: ptr Numa; span: LInt32; pstart: ptr LInt32;
                        pend: ptr LInt32): LInt32 {.
    importc: "numaGetSpanValues".}
proc numaGetEdgeValues*(na: ptr Numa; edge: LInt32; pstart: ptr LInt32;
                        pend: ptr LInt32; psign: ptr LInt32): LInt32 {.
    importc: "numaGetEdgeValues".}
proc numaInterpolateEqxVal*(startx: LFloat32; deltax: LFloat32; nay: ptr Numa;
                            `type`: LInt32; xval: LFloat32; pyval: ptr LFloat32): LOk {.
    importc: "numaInterpolateEqxVal".}
proc numaInterpolateArbxVal*(nax: ptr Numa; nay: ptr Numa; `type`: LInt32;
                             xval: LFloat32; pyval: ptr LFloat32): LOk {.
    importc: "numaInterpolateArbxVal".}
proc numaInterpolateEqxInterval*(startx: LFloat32; deltax: LFloat32;
                                 nasy: ptr Numa; `type`: LInt32; x0: LFloat32;
                                 x1: LFloat32; npts: LInt32; pnax: ptr ptr Numa;
                                 pnay: ptr ptr Numa): LOk {.
    importc: "numaInterpolateEqxInterval".}
proc numaInterpolateArbxInterval*(nax: ptr Numa; nay: ptr Numa; `type`: LInt32;
                                  x0: LFloat32; x1: LFloat32; npts: LInt32;
                                  pnadx: ptr ptr Numa; pnady: ptr ptr Numa): LOk {.
    importc: "numaInterpolateArbxInterval".}
proc numaFitMax*(na: ptr Numa; pmaxval: ptr LFloat32; naloc: ptr Numa;
                 pmaxloc: ptr LFloat32): LOk {.importc: "numaFitMax".}
proc numaDifferentiateInterval*(nax: ptr Numa; nay: ptr Numa; x0: LFloat32;
                                x1: LFloat32; npts: LInt32; pnadx: ptr ptr Numa;
                                pnady: ptr ptr Numa): LOk {.
    importc: "numaDifferentiateInterval".}
proc numaIntegrateInterval*(nax: ptr Numa; nay: ptr Numa; x0: LFloat32;
                            x1: LFloat32; npts: LInt32; psum: ptr LFloat32): LOk {.
    importc: "numaIntegrateInterval".}
proc numaSortGeneral*(na: ptr Numa; pnasort: ptr ptr Numa;
                      pnaindex: ptr ptr Numa; pnainvert: ptr ptr Numa;
                      sortorder: LInt32; sorttype: LInt32): LOk {.
    importc: "numaSortGeneral".}
proc numaSortAutoSelect*(nas: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaSortAutoSelect".}
proc numaSortIndexAutoSelect*(nas: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaSortIndexAutoSelect".}
proc numaChooseSortType*(nas: ptr Numa): LInt32 {.importc: "numaChooseSortType".}
proc numaSort*(naout: ptr Numa; nain: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaSort".}
proc numaBinSort*(nas: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaBinSort".}
proc numaGetSortIndex*(na: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaGetSortIndex".}
proc numaGetBinSortIndex*(nas: ptr Numa; sortorder: LInt32): ptr Numa {.
    importc: "numaGetBinSortIndex".}
proc numaSortByIndex*(nas: ptr Numa; naindex: ptr Numa): ptr Numa {.
    importc: "numaSortByIndex".}
proc numaIsSorted*(nas: ptr Numa; sortorder: LInt32; psorted: ptr LInt32): LInt32 {.
    importc: "numaIsSorted".}
proc numaSortPair*(nax: ptr Numa; nay: ptr Numa; sortorder: LInt32;
                   pnasx: ptr ptr Numa; pnasy: ptr ptr Numa): LOk {.
    importc: "numaSortPair".}
proc numaInvertMap*(nas: ptr Numa): ptr Numa {.importc: "numaInvertMap".}
proc numaAddSorted*(na: ptr Numa; val: LFloat32): LOk {.
    importc: "numaAddSorted".}
proc numaFindSortedLoc*(na: ptr Numa; val: LFloat32; pindex: ptr LInt32): LOk {.
    importc: "numaFindSortedLoc".}
proc numaPseudorandomSequence*(size: LInt32; seed: LInt32): ptr Numa {.
    importc: "numaPseudorandomSequence".}
proc numaRandomPermutation*(nas: ptr Numa; seed: LInt32): ptr Numa {.
    importc: "numaRandomPermutation".}
proc numaGetRankValue*(na: ptr Numa; fract: LFloat32; nasort: ptr Numa;
                       usebins: LInt32; pval: ptr LFloat32): LOk {.
    importc: "numaGetRankValue".}
proc numaGetMedian*(na: ptr Numa; pval: ptr LFloat32): LOk {.
    importc: "numaGetMedian".}
proc numaGetBinnedMedian*(na: ptr Numa; pval: ptr LInt32): LOk {.
    importc: "numaGetBinnedMedian".}
proc numaGetMeanDevFromMedian*(na: ptr Numa; med: LFloat32; pdev: ptr LFloat32): LOk {.
    importc: "numaGetMeanDevFromMedian".}
proc numaGetMedianDevFromMedian*(na: ptr Numa; pmed: ptr LFloat32;
                                 pdev: ptr LFloat32): LOk {.
    importc: "numaGetMedianDevFromMedian".}
proc numaGetMode*(na: ptr Numa; pval: ptr LFloat32; pcount: ptr LInt32): LOk {.
    importc: "numaGetMode".}
proc numaJoin*(nad: ptr Numa; nas: ptr Numa; istart: LInt32; iend: LInt32): LOk {.
    importc: "numaJoin".}
proc numaaJoin*(naad: ptr Numaa; naas: ptr Numaa; istart: LInt32; iend: LInt32): LOk {.
    importc: "numaaJoin".}
proc numaaFlattenToNuma*(naa: ptr Numaa): ptr Numa {.
    importc: "numaaFlattenToNuma".}
proc numaErode*(nas: ptr Numa; size: LInt32): ptr Numa {.importc: "numaErode".}
proc numaDilate*(nas: ptr Numa; size: LInt32): ptr Numa {.importc: "numaDilate".}
proc numaOpen*(nas: ptr Numa; size: LInt32): ptr Numa {.importc: "numaOpen".}
proc numaClose*(nas: ptr Numa; size: LInt32): ptr Numa {.importc: "numaClose".}
proc numaTransform*(nas: ptr Numa; shift: LFloat32; scale: LFloat32): ptr Numa {.
    importc: "numaTransform".}
proc numaSimpleStats*(na: ptr Numa; first: LInt32; last: LInt32;
                      pmean: ptr LFloat32; pvar: ptr LFloat32;
                      prvar: ptr LFloat32): LOk {.importc: "numaSimpleStats".}
proc numaWindowedStats*(nas: ptr Numa; wc: LInt32; pnam: ptr ptr Numa;
                        pnams: ptr ptr Numa; pnav: ptr ptr Numa;
                        pnarv: ptr ptr Numa): LOk {.
    importc: "numaWindowedStats".}
proc numaWindowedMean*(nas: ptr Numa; wc: LInt32): ptr Numa {.
    importc: "numaWindowedMean".}
proc numaWindowedMeanSquare*(nas: ptr Numa; wc: LInt32): ptr Numa {.
    importc: "numaWindowedMeanSquare".}
proc numaWindowedVariance*(nam: ptr Numa; nams: ptr Numa; pnav: ptr ptr Numa;
                           pnarv: ptr ptr Numa): LOk {.
    importc: "numaWindowedVariance".}
proc numaWindowedMedian*(nas: ptr Numa; halfwin: LInt32): ptr Numa {.
    importc: "numaWindowedMedian".}
proc numaConvertToInt*(nas: ptr Numa): ptr Numa {.importc: "numaConvertToInt".}
proc numaMakeHistogram*(na: ptr Numa; maxbins: LInt32; pbinsize: ptr LInt32;
                        pbinstart: ptr LInt32): ptr Numa {.
    importc: "numaMakeHistogram".}
proc numaMakeHistogramAuto*(na: ptr Numa; maxbins: LInt32): ptr Numa {.
    importc: "numaMakeHistogramAuto".}
proc numaMakeHistogramClipped*(na: ptr Numa; binsize: LFloat32;
                               maxsize: LFloat32): ptr Numa {.
    importc: "numaMakeHistogramClipped".}
proc numaRebinHistogram*(nas: ptr Numa; newsize: LInt32): ptr Numa {.
    importc: "numaRebinHistogram".}
proc numaNormalizeHistogram*(nas: ptr Numa; tsum: LFloat32): ptr Numa {.
    importc: "numaNormalizeHistogram".}
proc numaGetStatsUsingHistogram*(na: ptr Numa; maxbins: LInt32;
                                 pmin: ptr LFloat32; pmax: ptr LFloat32;
                                 pmean: ptr LFloat32; pvariance: ptr LFloat32;
                                 pmedian: ptr LFloat32; rank: LFloat32;
                                 prval: ptr LFloat32; phisto: ptr ptr Numa): LOk {.
    importc: "numaGetStatsUsingHistogram".}
proc numaGetHistogramStats*(nahisto: ptr Numa; startx: LFloat32;
                            deltax: LFloat32; pxmean: ptr LFloat32;
                            pxmedian: ptr LFloat32; pxmode: ptr LFloat32;
                            pxvariance: ptr LFloat32): LOk {.
    importc: "numaGetHistogramStats".}
proc numaGetHistogramStatsOnInterval*(nahisto: ptr Numa; startx: LFloat32;
                                      deltax: LFloat32; ifirst: LInt32;
                                      ilast: LInt32; pxmean: ptr LFloat32;
                                      pxmedian: ptr LFloat32;
                                      pxmode: ptr LFloat32;
                                      pxvariance: ptr LFloat32): LOk {.
    importc: "numaGetHistogramStatsOnInterval".}
proc numaMakeRankFromHistogram*(startx: LFloat32; deltax: LFloat32;
                                nasy: ptr Numa; npts: LInt32;
                                pnax: ptr ptr Numa; pnay: ptr ptr Numa): LOk {.
    importc: "numaMakeRankFromHistogram".}
proc numaHistogramGetRankFromVal*(na: ptr Numa; rval: LFloat32;
                                  prank: ptr LFloat32): LOk {.
    importc: "numaHistogramGetRankFromVal".}
proc numaHistogramGetValFromRank*(na: ptr Numa; rank: LFloat32;
                                  prval: ptr LFloat32): LOk {.
    importc: "numaHistogramGetValFromRank".}
proc numaDiscretizeSortedInBins*(na: ptr Numa; nbins: LInt32;
                                 pnabinval: ptr ptr Numa): LOk {.
    importc: "numaDiscretizeSortedInBins".}
proc numaDiscretizeHistoInBins*(na: ptr Numa; nbins: LInt32;
                                pnabinval: ptr ptr Numa; pnarank: ptr ptr Numa): LOk {.
    importc: "numaDiscretizeHistoInBins".}
proc numaGetRankBinValues*(na: ptr Numa; nbins: LInt32; pnam: ptr ptr Numa): LOk {.
    importc: "numaGetRankBinValues".}
proc numaGetUniformBinSizes*(ntotal: LInt32; nbins: LInt32): ptr Numa {.
    importc: "numaGetUniformBinSizes".}
proc numaSplitDistribution*(na: ptr Numa; scorefract: LFloat32;
                            psplitindex: ptr LInt32; pave1: ptr LFloat32;
                            pave2: ptr LFloat32; pnum1: ptr LFloat32;
                            pnum2: ptr LFloat32; pnascore: ptr ptr Numa): LOk {.
    importc: "numaSplitDistribution".}
proc grayHistogramsToEMD*(naa1: ptr Numaa; naa2: ptr Numaa; pnad: ptr ptr Numa): LOk {.
    importc: "grayHistogramsToEMD".}
proc numaEarthMoverDistance*(na1: ptr Numa; na2: ptr Numa; pdist: ptr LFloat32): LOk {.
    importc: "numaEarthMoverDistance".}
proc grayInterHistogramStats*(naa: ptr Numaa; wc: LInt32; pnam: ptr ptr Numa;
                              pnams: ptr ptr Numa; pnav: ptr ptr Numa;
                              pnarv: ptr ptr Numa): LOk {.
    importc: "grayInterHistogramStats".}
proc numaFindPeaks*(nas: ptr Numa; nmax: LInt32; fract1: LFloat32;
                    fract2: LFloat32): ptr Numa {.importc: "numaFindPeaks".}
proc numaFindExtrema*(nas: ptr Numa; delta: LFloat32; pnav: ptr ptr Numa): ptr Numa {.
    importc: "numaFindExtrema".}
proc numaFindLocForThreshold*(na: ptr Numa; skip: LInt32; pthresh: ptr LInt32;
                              pfract: ptr LFloat32): LOk {.
    importc: "numaFindLocForThreshold".}
proc numaCountReversals*(nas: ptr Numa; minreversal: LFloat32; pnr: ptr LInt32;
                         prd: ptr LFloat32): LOk {.
    importc: "numaCountReversals".}
proc numaSelectCrossingThreshold*(nax: ptr Numa; nay: ptr Numa;
                                  estthresh: LFloat32; pbestthresh: ptr LFloat32): LOk {.
    importc: "numaSelectCrossingThreshold".}
proc numaCrossingsByThreshold*(nax: ptr Numa; nay: ptr Numa; thresh: LFloat32): ptr Numa {.
    importc: "numaCrossingsByThreshold".}
proc numaCrossingsByPeaks*(nax: ptr Numa; nay: ptr Numa; delta: LFloat32): ptr Numa {.
    importc: "numaCrossingsByPeaks".}
proc numaEvalBestHaarParameters*(nas: ptr Numa; relweight: LFloat32;
                                 nwidth: LInt32; nshift: LInt32;
                                 minwidth: LFloat32; maxwidth: LFloat32;
                                 pbestwidth: ptr LFloat32;
                                 pbestshift: ptr LFloat32;
                                 pbestscore: ptr LFloat32): LOk {.
    importc: "numaEvalBestHaarParameters".}
proc numaEvalHaarSum*(nas: ptr Numa; width: LFloat32; shift: LFloat32;
                      relweight: LFloat32; pscore: ptr LFloat32): LOk {.
    importc: "numaEvalHaarSum".}
proc genConstrainedNumaInRange*(first: LInt32; last: LInt32; nmax: LInt32;
                                usePairs: LInt32): ptr Numa {.
    importc: "genConstrainedNumaInRange".}
proc pixGetRegionsBinary*(pixs: ptr Pix; ppixhm: ptr ptr Pix;
                          ppixtm: ptr ptr Pix; ppixtb: ptr ptr Pix;
                          pixadb: ptr Pixa): LOk {.
    importc: "pixGetRegionsBinary".}
proc pixGenHalftoneMask*(pixs: ptr Pix; ppixtext: ptr ptr Pix;
                         phtfound: ptr LInt32; debug: LInt32): ptr Pix {.
    importc: "pixGenHalftoneMask".}
proc pixGenerateHalftoneMask*(pixs: ptr Pix; ppixtext: ptr ptr Pix;
                              phtfound: ptr LInt32; pixadb: ptr Pixa): ptr Pix {.
    importc: "pixGenerateHalftoneMask".}
proc pixGenTextlineMask*(pixs: ptr Pix; ppixvws: ptr ptr Pix;
                         ptlfound: ptr LInt32; pixadb: ptr Pixa): ptr Pix {.
    importc: "pixGenTextlineMask".}
proc pixGenTextblockMask*(pixs: ptr Pix; pixvws: ptr Pix; pixadb: ptr Pixa): ptr Pix {.
    importc: "pixGenTextblockMask".}
proc pixCropImage*(pixs: ptr Pix; lrClear: LInt32; tbClear: LInt32;
                   edgeclean: LInt32; lrAdd: LInt32; tbAdd: LInt32;
                   maxwiden: LFloat32; debugfile: cstring; pcropbox: ptr ptr Box): ptr Pix {.
    importc: "pixCropImage".}
proc pixCleanImage*(pixs: ptr Pix; contrast: LInt32; rotation: LInt32;
                    scale: LInt32; opensize: LInt32): ptr Pix {.
    importc: "pixCleanImage".}
proc pixFindPageForeground*(pixs: ptr Pix; threshold: LInt32; mindist: LInt32;
                            erasedist: LInt32; showmorph: LInt32;
                            pixac: ptr Pixac): ptr Box {.
    importc: "pixFindPageForeground".}
proc pixSplitIntoCharacters*(pixs: ptr Pix; minw: LInt32; minh: LInt32;
                             pboxa: ptr ptr Boxa; ppixa: ptr ptr Pixa;
                             ppixdebug: ptr ptr Pix): LOk {.
    importc: "pixSplitIntoCharacters".}
proc pixSplitComponentWithProfile*(pixs: ptr Pix; delta: LInt32; mindel: LInt32;
                                   ppixdebug: ptr ptr Pix): ptr Boxa {.
    importc: "pixSplitComponentWithProfile".}
proc pixExtractTextlines*(pixs: ptr Pix; maxw: LInt32; maxh: LInt32;
                          minw: LInt32; minh: LInt32; adjw: LInt32;
                          adjh: LInt32; pixadb: ptr Pixa): ptr Pixa {.
    importc: "pixExtractTextlines".}
proc pixExtractRawTextlines*(pixs: ptr Pix; maxw: LInt32; maxh: LInt32;
                             adjw: LInt32; adjh: LInt32; pixadb: ptr Pixa): ptr Pixa {.
    importc: "pixExtractRawTextlines".}
proc pixCountTextColumns*(pixs: ptr Pix; deltafract: LFloat32;
                          peakfract: LFloat32; clipfract: LFloat32;
                          pncols: ptr LInt32; pixadb: ptr Pixa): LOk {.
    importc: "pixCountTextColumns".}
proc pixDecideIfText*(pixs: ptr Pix; box: ptr Box; pistext: ptr LInt32;
                      pixadb: ptr Pixa): LOk {.importc: "pixDecideIfText".}
proc pixFindThreshFgExtent*(pixs: ptr Pix; thresh: LInt32; ptop: ptr LInt32;
                            pbot: ptr LInt32): LOk {.
    importc: "pixFindThreshFgExtent".}
proc pixDecideIfTable*(pixs: ptr Pix; box: ptr Box; orient: LInt32;
                       pscore: ptr LInt32; pixadb: ptr Pixa): LOk {.
    importc: "pixDecideIfTable".}
proc pixPrepare1bpp*(pixs: ptr Pix; box: ptr Box; cropfract: LFloat32;
                     outres: LInt32): ptr Pix {.importc: "pixPrepare1bpp".}
proc pixEstimateBackground*(pixs: ptr Pix; darkthresh: LInt32;
                            edgecrop: LFloat32; pbg: ptr LInt32): LOk {.
    importc: "pixEstimateBackground".}
proc pixFindLargeRectangles*(pixs: ptr Pix; polarity: LInt32; nrect: LInt32;
                             pboxa: ptr ptr Boxa; ppixdb: ptr ptr Pix): LOk {.
    importc: "pixFindLargeRectangles".}
proc pixFindLargestRectangle*(pixs: ptr Pix; polarity: LInt32;
                              pbox: ptr ptr Box; ppixdb: ptr ptr Pix): LOk {.
    importc: "pixFindLargestRectangle".}
proc pixFindRectangleInCC*(pixs: ptr Pix; boxs: ptr Box; fract: LFloat32;
                           dir: LInt32; select: LInt32; debug: LInt32): ptr Box {.
    importc: "pixFindRectangleInCC".}
proc pixAutoPhotoinvert*(pixs: ptr Pix; thresh: LInt32; ppixm: ptr ptr Pix;
                         pixadb: ptr Pixa): ptr Pix {.
    importc: "pixAutoPhotoinvert".}
proc pixSetSelectCmap*(pixs: ptr Pix; box: ptr Box; sindex: LInt32;
                       rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixSetSelectCmap".}
proc pixColorGrayRegionsCmap*(pixs: ptr Pix; boxa: ptr Boxa; `type`: LInt32;
                              rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixColorGrayRegionsCmap".}
proc pixColorGrayCmap*(pixs: ptr Pix; box: ptr Box; `type`: LInt32;
                       rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixColorGrayCmap".}
proc pixColorGrayMaskedCmap*(pixs: ptr Pix; pixm: ptr Pix; `type`: LInt32;
                             rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixColorGrayMaskedCmap".}
proc addColorizedGrayToCmap*(cmap: ptr Pixcmap; `type`: LInt32; rval: LInt32;
                             gval: LInt32; bval: LInt32; pna: ptr ptr Numa): LOk {.
    importc: "addColorizedGrayToCmap".}
proc pixSetSelectMaskedCmap*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                             sindex: LInt32; rval: LInt32; gval: LInt32;
                             bval: LInt32): LOk {.
    importc: "pixSetSelectMaskedCmap".}
proc pixSetMaskedCmap*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                       rval: LInt32; gval: LInt32; bval: LInt32): LOk {.
    importc: "pixSetMaskedCmap".}
proc parseForProtos*(filein: cstring; prestring: cstring): cstring {.
    importc: "parseForProtos".}
proc partifyFiles*(dirname: cstring; substr: cstring; nparts: LInt32;
                   outroot: cstring; debugfile: cstring): LOk {.
    importc: "partifyFiles".}
proc partifyPixac*(pixac: ptr Pixac; nparts: LInt32; outroot: cstring;
                   pixadb: ptr Pixa): LOk {.importc: "partifyPixac".}
proc boxaGetWhiteblocks*(boxas: ptr Boxa; box: ptr Box; sortflag: LInt32;
                         maxboxes: LInt32; maxoverlap: LFloat32;
                         maxperim: LInt32; fract: LFloat32; maxpops: LInt32): ptr Boxa {.
    importc: "boxaGetWhiteblocks".}
proc boxaPruneSortedOnOverlap*(boxas: ptr Boxa; maxoverlap: LFloat32): ptr Boxa {.
    importc: "boxaPruneSortedOnOverlap".}
proc compressFilesToPdf*(sa: ptr Sarray; onebit: LInt32; savecolor: LInt32;
                         scalefactor: LFloat32; quality: LInt32; title: cstring;
                         fileout: cstring): LOk {.importc: "compressFilesToPdf".}
proc cropFilesToPdf*(sa: ptr Sarray; lrClear: LInt32; tbClear: LInt32;
                     edgeclean: LInt32; lrAdd: LInt32; tbAdd: LInt32;
                     maxwiden: LFloat32; title: cstring; fileout: cstring): LOk {.
    importc: "cropFilesToPdf".}
proc cleanTo1bppFilesToPdf*(sa: ptr Sarray; res: LInt32; contrast: LInt32;
                            rotation: LInt32; opensize: LInt32; title: cstring;
                            fileout: cstring): LOk {.
    importc: "cleanTo1bppFilesToPdf".}
proc convertFilesToPdf*(dirname: cstring; substr: cstring; res: LInt32;
                        scalefactor: LFloat32; `type`: LInt32; quality: LInt32;
                        title: cstring; fileout: cstring): LOk {.
    importc: "convertFilesToPdf".}
proc saConvertFilesToPdf*(sa: ptr Sarray; res: LInt32; scalefactor: LFloat32;
                          `type`: LInt32; quality: LInt32; title: cstring;
                          fileout: cstring): LOk {.
    importc: "saConvertFilesToPdf".}
proc saConvertFilesToPdfData*(sa: ptr Sarray; res: LInt32;
                              scalefactor: LFloat32; `type`: LInt32;
                              quality: LInt32; title: cstring;
                              pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "saConvertFilesToPdfData".}
proc selectDefaultPdfEncoding*(pix: ptr Pix; ptype: ptr LInt32): LOk {.
    importc: "selectDefaultPdfEncoding".}
proc convertUnscaledFilesToPdf*(dirname: cstring; substr: cstring;
                                title: cstring; fileout: cstring): LOk {.
    importc: "convertUnscaledFilesToPdf".}
proc saConvertUnscaledFilesToPdf*(sa: ptr Sarray; title: cstring;
                                  fileout: cstring): LOk {.
    importc: "saConvertUnscaledFilesToPdf".}
proc saConvertUnscaledFilesToPdfData*(sa: ptr Sarray; title: cstring;
                                      pdata: ptr ptr LUint8;
                                      pnbytes: ptr csize_t): LOk {.
    importc: "saConvertUnscaledFilesToPdfData".}
proc convertUnscaledToPdfData*(fname: cstring; title: cstring;
                               pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "convertUnscaledToPdfData".}
proc pixaConvertToPdf*(pixa: ptr Pixa; res: LInt32; scalefactor: LFloat32;
                       `type`: LInt32; quality: LInt32; title: cstring;
                       fileout: cstring): LOk {.importc: "pixaConvertToPdf".}
proc pixaConvertToPdfData*(pixa: ptr Pixa; res: LInt32; scalefactor: LFloat32;
                           `type`: LInt32; quality: LInt32; title: cstring;
                           pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "pixaConvertToPdfData".}
proc convertToPdf*(filein: cstring; `type`: LInt32; quality: LInt32;
                   fileout: cstring; x: LInt32; y: LInt32; res: LInt32;
                   title: cstring; plpd: ptr ptr L_Pdf_Data; position: LInt32): LOk {.
    importc: "convertToPdf".}
proc convertImageDataToPdf*(imdata: ptr LUint8; size: csize_t; `type`: LInt32;
                            quality: LInt32; fileout: cstring; x: LInt32;
                            y: LInt32; res: LInt32; title: cstring;
                            plpd: ptr ptr L_Pdf_Data; position: LInt32): LOk {.
    importc: "convertImageDataToPdf".}
proc convertToPdfData*(filein: cstring; `type`: LInt32; quality: LInt32;
                       pdata: ptr ptr LUint8; pnbytes: ptr csize_t; x: LInt32;
                       y: LInt32; res: LInt32; title: cstring;
                       plpd: ptr ptr L_Pdf_Data; position: LInt32): LOk {.
    importc: "convertToPdfData".}
proc convertImageDataToPdfData*(imdata: ptr LUint8; size: csize_t;
                                `type`: LInt32; quality: LInt32;
                                pdata: ptr ptr LUint8; pnbytes: ptr csize_t;
                                x: LInt32; y: LInt32; res: LInt32;
                                title: cstring; plpd: ptr ptr L_Pdf_Data;
                                position: LInt32): LOk {.
    importc: "convertImageDataToPdfData".}
proc pixConvertToPdf*(pix: ptr Pix; `type`: LInt32; quality: LInt32;
                      fileout: cstring; x: LInt32; y: LInt32; res: LInt32;
                      title: cstring; plpd: ptr ptr L_Pdf_Data; position: LInt32): LOk {.
    importc: "pixConvertToPdf".}
proc pixWriteStreamPdf*(fp: ptr File; pix: ptr Pix; res: LInt32; title: cstring): LOk {.
    importc: "pixWriteStreamPdf".}
proc pixWriteMemPdf*(pdata: ptr ptr LUint8; pnbytes: ptr csize_t; pix: ptr Pix;
                     res: LInt32; title: cstring): LOk {.
    importc: "pixWriteMemPdf".}
proc convertSegmentedFilesToPdf*(dirname: cstring; substr: cstring; res: LInt32;
                                 `type`: LInt32; thresh: LInt32; baa: ptr Boxaa;
                                 quality: LInt32; scalefactor: LFloat32;
                                 title: cstring; fileout: cstring): LOk {.
    importc: "convertSegmentedFilesToPdf".}
proc convertNumberedMasksToBoxaa*(dirname: cstring; substr: cstring;
                                  numpre: LInt32; numpost: LInt32): ptr Boxaa {.
    importc: "convertNumberedMasksToBoxaa".}
proc convertToPdfSegmented*(filein: cstring; res: LInt32; `type`: LInt32;
                            thresh: LInt32; boxa: ptr Boxa; quality: LInt32;
                            scalefactor: LFloat32; title: cstring;
                            fileout: cstring): LOk {.
    importc: "convertToPdfSegmented".}
proc pixConvertToPdfSegmented*(pixs: ptr Pix; res: LInt32; `type`: LInt32;
                               thresh: LInt32; boxa: ptr Boxa; quality: LInt32;
                               scalefactor: LFloat32; title: cstring;
                               fileout: cstring): LOk {.
    importc: "pixConvertToPdfSegmented".}
proc convertToPdfDataSegmented*(filein: cstring; res: LInt32; `type`: LInt32;
                                thresh: LInt32; boxa: ptr Boxa; quality: LInt32;
                                scalefactor: LFloat32; title: cstring;
                                pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "convertToPdfDataSegmented".}
proc pixConvertToPdfDataSegmented*(pixs: ptr Pix; res: LInt32; `type`: LInt32;
                                   thresh: LInt32; boxa: ptr Boxa;
                                   quality: LInt32; scalefactor: LFloat32;
                                   title: cstring; pdata: ptr ptr LUint8;
                                   pnbytes: ptr csize_t): LOk {.
    importc: "pixConvertToPdfDataSegmented".}
proc concatenatePdf*(dirname: cstring; substr: cstring; fileout: cstring): LOk {.
    importc: "concatenatePdf".}
proc saConcatenatePdf*(sa: ptr Sarray; fileout: cstring): LOk {.
    importc: "saConcatenatePdf".}
proc ptraConcatenatePdf*(pa: ptr L_Ptra; fileout: cstring): LOk {.
    importc: "ptraConcatenatePdf".}
proc concatenatePdfToData*(dirname: cstring; substr: cstring;
                           pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "concatenatePdfToData".}
proc saConcatenatePdfToData*(sa: ptr Sarray; pdata: ptr ptr LUint8;
                             pnbytes: ptr csize_t): LOk {.
    importc: "saConcatenatePdfToData".}
proc pixConvertToPdfData*(pix: ptr Pix; `type`: LInt32; quality: LInt32;
                          pdata: ptr ptr LUint8; pnbytes: ptr csize_t;
                          x: LInt32; y: LInt32; res: LInt32; title: cstring;
                          plpd: ptr ptr L_Pdf_Data; position: LInt32): LOk {.
    importc: "pixConvertToPdfData".}
proc ptraConcatenatePdfToData*(paData: ptr L_Ptra; sa: ptr Sarray;
                               pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "ptraConcatenatePdfToData".}
proc convertTiffMultipageToPdf*(filein: cstring; fileout: cstring): LOk {.
    importc: "convertTiffMultipageToPdf".}
proc lGenerateCIDataForPdf*(fname: cstring; pix: ptr Pix; quality: LInt32;
                            pcid: ptr ptr L_Comp_Data): LOk {.
    importc: "l_generateCIDataForPdf".}
proc lGenerateCIData*(fname: cstring; `type`: LInt32; quality: LInt32;
                      ascii85: LInt32; pcid: ptr ptr L_Comp_Data): LOk {.
    importc: "l_generateCIData".}
proc lGenerateFlateDataPdf*(fname: cstring; pixs: ptr Pix): ptr L_Comp_Data {.
    importc: "l_generateFlateDataPdf".}
proc lGenerateJpegData*(fname: cstring; ascii85flag: LInt32): ptr L_Comp_Data {.
    importc: "l_generateJpegData".}
proc lGenerateJpegDataMem*(data: ptr LUint8; nbytes: csize_t;
                           ascii85flag: LInt32): ptr L_Comp_Data {.
    importc: "l_generateJpegDataMem".}
proc lGenerateG4Data*(fname: cstring; ascii85flag: LInt32): ptr L_Comp_Data {.
    importc: "l_generateG4Data".}
proc pixGenerateCIData*(pixs: ptr Pix; `type`: LInt32; quality: LInt32;
                        ascii85: LInt32; pcid: ptr ptr L_Comp_Data): LOk {.
    importc: "pixGenerateCIData".}
proc lGenerateFlateData*(fname: cstring; ascii85flag: LInt32): ptr L_Comp_Data {.
    importc: "l_generateFlateData".}
proc cidConvertToPdfData*(cid: ptr L_Comp_Data; title: cstring;
                          pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "cidConvertToPdfData".}
proc lCIDataDestroy*(pcid: ptr ptr L_Comp_Data) {.importc: "l_CIDataDestroy".}
proc getPdfPageCount*(fname: cstring; pnpages: ptr LInt32): LOk {.
    importc: "getPdfPageCount".}
proc getPdfPageSizes*(fname: cstring; pnaw: ptr ptr Numa; pnah: ptr ptr Numa;
                      pmedw: ptr LInt32; pmedh: ptr LInt32): LOk {.
    importc: "getPdfPageSizes".}
proc getPdfMediaBoxSizes*(fname: cstring; pnaw: ptr ptr Numa;
                          pnah: ptr ptr Numa; pmedw: ptr LInt32;
                          pmedh: ptr LInt32): LOk {.
    importc: "getPdfMediaBoxSizes".}
proc getPdfRendererResolution*(infile: cstring; outdir: cstring;
                               pres: ptr LInt32): LOk {.
    importc: "getPdfRendererResolution".}
proc lPdfSetG4ImageMask*(flag: LInt32) {.importc: "l_pdfSetG4ImageMask".}
proc lPdfSetDateAndVersion*(flag: LInt32) {.importc: "l_pdfSetDateAndVersion".}
proc setPixMemoryManager*(allocator: AllocFn; deallocator: DeallocFn) {.
    importc: "setPixMemoryManager".}
proc pixCreate*(width: LInt32; height: LInt32; depth: LInt32): ptr Pix {.
    importc: "pixCreate".}
proc pixCreateNoInit*(width: LInt32; height: LInt32; depth: LInt32): ptr Pix {.
    importc: "pixCreateNoInit".}
proc pixCreateTemplate*(pixs: ptr Pix): ptr Pix {.importc: "pixCreateTemplate".}
proc pixCreateTemplateNoInit*(pixs: ptr Pix): ptr Pix {.
    importc: "pixCreateTemplateNoInit".}
proc pixCreateWithCmap*(width: LInt32; height: LInt32; depth: LInt32;
                        initcolor: LInt32): ptr Pix {.
    importc: "pixCreateWithCmap".}
proc pixCreateHeader*(width: LInt32; height: LInt32; depth: LInt32): ptr Pix {.
    importc: "pixCreateHeader".}
proc pixClone*(pixs: ptr Pix): ptr Pix {.importc: "pixClone".}
proc pixDestroy*(ppix: ptr ptr Pix) {.importc: "pixDestroy".}
proc pixCopy*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.importc: "pixCopy".}
proc pixResizeImageData*(pixd: ptr Pix; pixs: ptr Pix): LOk {.
    importc: "pixResizeImageData".}
proc pixCopyColormap*(pixd: ptr Pix; pixs: ptr Pix): LOk {.
    importc: "pixCopyColormap".}
proc pixTransferAllData*(pixd: ptr Pix; ppixs: ptr ptr Pix; copytext: LInt32;
                         copyformat: LInt32): LOk {.
    importc: "pixTransferAllData".}
proc pixSwapAndDestroy*(ppixd: ptr ptr Pix; ppixs: ptr ptr Pix): LOk {.
    importc: "pixSwapAndDestroy".}
proc pixGetWidth*(pix: ptr Pix): LInt32 {.importc: "pixGetWidth".}
proc pixSetWidth*(pix: ptr Pix; width: LInt32): LInt32 {.importc: "pixSetWidth".}
proc pixGetHeight*(pix: ptr Pix): LInt32 {.importc: "pixGetHeight".}
proc pixSetHeight*(pix: ptr Pix; height: LInt32): LInt32 {.
    importc: "pixSetHeight".}
proc pixGetDepth*(pix: ptr Pix): LInt32 {.importc: "pixGetDepth".}
proc pixSetDepth*(pix: ptr Pix; depth: LInt32): LInt32 {.importc: "pixSetDepth".}
proc pixGetDimensions*(pix: ptr Pix; pw: ptr LInt32; ph: ptr LInt32;
                       pd: ptr LInt32): LOk {.importc: "pixGetDimensions".}
proc pixSetDimensions*(pix: ptr Pix; w: LInt32; h: LInt32; d: LInt32): LOk {.
    importc: "pixSetDimensions".}
proc pixCopyDimensions*(pixd: ptr Pix; pixs: ptr Pix): LOk {.
    importc: "pixCopyDimensions".}
proc pixGetSpp*(pix: ptr Pix): LInt32 {.importc: "pixGetSpp".}
proc pixSetSpp*(pix: ptr Pix; spp: LInt32): LInt32 {.importc: "pixSetSpp".}
proc pixCopySpp*(pixd: ptr Pix; pixs: ptr Pix): LOk {.importc: "pixCopySpp".}
proc pixGetWpl*(pix: ptr Pix): LInt32 {.importc: "pixGetWpl".}
proc pixSetWpl*(pix: ptr Pix; wpl: LInt32): LInt32 {.importc: "pixSetWpl".}
proc pixGetXRes*(pix: ptr Pix): LInt32 {.importc: "pixGetXRes".}
proc pixSetXRes*(pix: ptr Pix; res: LInt32): LInt32 {.importc: "pixSetXRes".}
proc pixGetYRes*(pix: ptr Pix): LInt32 {.importc: "pixGetYRes".}
proc pixSetYRes*(pix: ptr Pix; res: LInt32): LInt32 {.importc: "pixSetYRes".}
proc pixGetResolution*(pix: ptr Pix; pxres: ptr LInt32; pyres: ptr LInt32): LOk {.
    importc: "pixGetResolution".}
proc pixSetResolution*(pix: ptr Pix; xres: LInt32; yres: LInt32): LOk {.
    importc: "pixSetResolution".}
proc pixCopyResolution*(pixd: ptr Pix; pixs: ptr Pix): LInt32 {.
    importc: "pixCopyResolution".}
proc pixScaleResolution*(pix: ptr Pix; xscale: LFloat32; yscale: LFloat32): LInt32 {.
    importc: "pixScaleResolution".}
proc pixGetInputFormat*(pix: ptr Pix): LInt32 {.importc: "pixGetInputFormat".}
proc pixSetInputFormat*(pix: ptr Pix; informat: LInt32): LInt32 {.
    importc: "pixSetInputFormat".}
proc pixCopyInputFormat*(pixd: ptr Pix; pixs: ptr Pix): LInt32 {.
    importc: "pixCopyInputFormat".}
proc pixSetSpecial*(pix: ptr Pix; special: LInt32): LInt32 {.
    importc: "pixSetSpecial".}
proc pixGetText*(pix: ptr Pix): cstring {.importc: "pixGetText".}
proc pixSetText*(pix: ptr Pix; textstring: cstring): LOk {.
    importc: "pixSetText".}
proc pixAddText*(pix: ptr Pix; textstring: cstring): LOk {.
    importc: "pixAddText".}
proc pixCopyText*(pixd: ptr Pix; pixs: ptr Pix): LInt32 {.
    importc: "pixCopyText".}
proc pixGetTextCompNew*(pix: ptr Pix; psize: ptr csize_t): ptr LUint8 {.
    importc: "pixGetTextCompNew".}
proc pixSetTextCompNew*(pix: ptr Pix; data: ptr LUint8; size: csize_t): LOk {.
    importc: "pixSetTextCompNew".}
proc pixGetColormap*(pix: ptr Pix): ptr Pixcmap {.importc: "pixGetColormap".}
proc pixSetColormap*(pix: ptr Pix; colormap: ptr Pixcmap): LOk {.
    importc: "pixSetColormap".}
proc pixDestroyColormap*(pix: ptr Pix): LOk {.importc: "pixDestroyColormap".}
proc pixGetData*(pix: ptr Pix): ptr LUint32 {.importc: "pixGetData".}
proc pixFreeAndSetData*(pix: ptr Pix; data: ptr LUint32): LInt32 {.
    importc: "pixFreeAndSetData".}
proc pixSetData*(pix: ptr Pix; data: ptr LUint32): LInt32 {.
    importc: "pixSetData".}
proc pixFreeData*(pix: ptr Pix): LInt32 {.importc: "pixFreeData".}
proc pixExtractData*(pixs: ptr Pix): ptr LUint32 {.importc: "pixExtractData".}
proc pixGetLinePtrs*(pix: ptr Pix; psize: ptr LInt32): ptr pointer {.
    importc: "pixGetLinePtrs".}
proc pixSizesEqual*(pix1: ptr Pix; pix2: ptr Pix): LInt32 {.
    importc: "pixSizesEqual".}
proc pixMaxAspectRatio*(pixs: ptr Pix; pratio: ptr LFloat32): LOk {.
    importc: "pixMaxAspectRatio".}
proc pixPrintStreamInfo*(fp: ptr File; pix: ptr Pix; text: cstring): LOk {.
    importc: "pixPrintStreamInfo".}
proc pixGetPixel*(pix: ptr Pix; x: LInt32; y: LInt32; pval: ptr LUint32): LOk {.
    importc: "pixGetPixel".}
proc pixSetPixel*(pix: ptr Pix; x: LInt32; y: LInt32; val: LUint32): LOk {.
    importc: "pixSetPixel".}
proc pixGetRGBPixel*(pix: ptr Pix; x: LInt32; y: LInt32; prval: ptr LInt32;
                     pgval: ptr LInt32; pbval: ptr LInt32): LOk {.
    importc: "pixGetRGBPixel".}
proc pixSetRGBPixel*(pix: ptr Pix; x: LInt32; y: LInt32; rval: LInt32;
                     gval: LInt32; bval: LInt32): LOk {.
    importc: "pixSetRGBPixel".}
proc pixSetCmapPixel*(pix: ptr Pix; x: LInt32; y: LInt32; rval: LInt32;
                      gval: LInt32; bval: LInt32): LOk {.
    importc: "pixSetCmapPixel".}
proc pixGetRandomPixel*(pix: ptr Pix; pval: ptr LUint32; px: ptr LInt32;
                        py: ptr LInt32): LOk {.importc: "pixGetRandomPixel".}
proc pixClearPixel*(pix: ptr Pix; x: LInt32; y: LInt32): LOk {.
    importc: "pixClearPixel".}
proc pixFlipPixel*(pix: ptr Pix; x: LInt32; y: LInt32): LOk {.
    importc: "pixFlipPixel".}
proc setPixelLow*(line: ptr LUint32; x: LInt32; depth: LInt32; val: LUint32) {.
    importc: "setPixelLow".}
proc pixGetBlackOrWhiteVal*(pixs: ptr Pix; op: LInt32; pval: ptr LUint32): LOk {.
    importc: "pixGetBlackOrWhiteVal".}
proc pixClearAll*(pix: ptr Pix): LOk {.importc: "pixClearAll".}
proc pixSetAll*(pix: ptr Pix): LOk {.importc: "pixSetAll".}
proc pixSetAllGray*(pix: ptr Pix; grayval: LInt32): LOk {.
    importc: "pixSetAllGray".}
proc pixSetAllArbitrary*(pix: ptr Pix; val: LUint32): LOk {.
    importc: "pixSetAllArbitrary".}
proc pixSetBlackOrWhite*(pixs: ptr Pix; op: LInt32): LOk {.
    importc: "pixSetBlackOrWhite".}
proc pixSetComponentArbitrary*(pix: ptr Pix; comp: LInt32; val: LInt32): LOk {.
    importc: "pixSetComponentArbitrary".}
proc pixClearInRect*(pix: ptr Pix; box: ptr Box): LOk {.
    importc: "pixClearInRect".}
proc pixSetInRect*(pix: ptr Pix; box: ptr Box): LOk {.importc: "pixSetInRect".}
proc pixSetInRectArbitrary*(pix: ptr Pix; box: ptr Box; val: LUint32): LOk {.
    importc: "pixSetInRectArbitrary".}
proc pixBlendInRect*(pixs: ptr Pix; box: ptr Box; val: LUint32; fract: LFloat32): LOk {.
    importc: "pixBlendInRect".}
proc pixSetPadBits*(pix: ptr Pix; val: LInt32): LOk {.importc: "pixSetPadBits".}
proc pixSetPadBitsBand*(pix: ptr Pix; by: LInt32; bh: LInt32; val: LInt32): LOk {.
    importc: "pixSetPadBitsBand".}
proc pixSetOrClearBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                          top: LInt32; bot: LInt32; op: LInt32): LOk {.
    importc: "pixSetOrClearBorder".}
proc pixSetBorderVal*(pixs: ptr Pix; left: LInt32; right: LInt32; top: LInt32;
                      bot: LInt32; val: LUint32): LOk {.
    importc: "pixSetBorderVal".}
proc pixSetBorderRingVal*(pixs: ptr Pix; dist: LInt32; val: LUint32): LOk {.
    importc: "pixSetBorderRingVal".}
proc pixSetMirroredBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                           top: LInt32; bot: LInt32): LOk {.
    importc: "pixSetMirroredBorder".}
proc pixCopyBorder*(pixd: ptr Pix; pixs: ptr Pix; left: LInt32; right: LInt32;
                    top: LInt32; bot: LInt32): ptr Pix {.
    importc: "pixCopyBorder".}
proc pixAddBorder*(pixs: ptr Pix; npix: LInt32; val: LUint32): ptr Pix {.
    importc: "pixAddBorder".}
proc pixAddBlackOrWhiteBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                               top: LInt32; bot: LInt32; op: LInt32): ptr Pix {.
    importc: "pixAddBlackOrWhiteBorder".}
proc pixAddBorderGeneral*(pixs: ptr Pix; left: LInt32; right: LInt32;
                          top: LInt32; bot: LInt32; val: LUint32): ptr Pix {.
    importc: "pixAddBorderGeneral".}
proc pixAddMultipleBlackWhiteBorders*(pixs: ptr Pix; nblack1: LInt32;
                                      nwhite1: LInt32; nblack2: LInt32;
                                      nwhite2: LInt32; nblack3: LInt32;
                                      nwhite3: LInt32): ptr Pix {.
    importc: "pixAddMultipleBlackWhiteBorders".}
proc pixRemoveBorder*(pixs: ptr Pix; npix: LInt32): ptr Pix {.
    importc: "pixRemoveBorder".}
proc pixRemoveBorderGeneral*(pixs: ptr Pix; left: LInt32; right: LInt32;
                             top: LInt32; bot: LInt32): ptr Pix {.
    importc: "pixRemoveBorderGeneral".}
proc pixRemoveBorderToSize*(pixs: ptr Pix; wd: LInt32; hd: LInt32): ptr Pix {.
    importc: "pixRemoveBorderToSize".}
proc pixAddMirroredBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                           top: LInt32; bot: LInt32): ptr Pix {.
    importc: "pixAddMirroredBorder".}
proc pixAddRepeatedBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                           top: LInt32; bot: LInt32): ptr Pix {.
    importc: "pixAddRepeatedBorder".}
proc pixAddMixedBorder*(pixs: ptr Pix; left: LInt32; right: LInt32; top: LInt32;
                        bot: LInt32): ptr Pix {.importc: "pixAddMixedBorder".}
proc pixAddContinuedBorder*(pixs: ptr Pix; left: LInt32; right: LInt32;
                            top: LInt32; bot: LInt32): ptr Pix {.
    importc: "pixAddContinuedBorder".}
proc pixShiftAndTransferAlpha*(pixd: ptr Pix; pixs: ptr Pix; shiftx: LFloat32;
                               shifty: LFloat32): LOk {.
    importc: "pixShiftAndTransferAlpha".}
proc pixDisplayLayersRGBA*(pixs: ptr Pix; val: LUint32; maxw: LInt32): ptr Pix {.
    importc: "pixDisplayLayersRGBA".}
proc pixCreateRGBImage*(pixr: ptr Pix; pixg: ptr Pix; pixb: ptr Pix): ptr Pix {.
    importc: "pixCreateRGBImage".}
proc pixGetRGBComponent*(pixs: ptr Pix; comp: LInt32): ptr Pix {.
    importc: "pixGetRGBComponent".}
proc pixSetRGBComponent*(pixd: ptr Pix; pixs: ptr Pix; comp: LInt32): LOk {.
    importc: "pixSetRGBComponent".}
proc pixGetRGBComponentCmap*(pixs: ptr Pix; comp: LInt32): ptr Pix {.
    importc: "pixGetRGBComponentCmap".}
proc pixCopyRGBComponent*(pixd: ptr Pix; pixs: ptr Pix; comp: LInt32): LOk {.
    importc: "pixCopyRGBComponent".}
proc composeRGBPixel*(rval: LInt32; gval: LInt32; bval: LInt32;
                      ppixel: ptr LUint32): LOk {.importc: "composeRGBPixel".}
proc composeRGBAPixel*(rval: LInt32; gval: LInt32; bval: LInt32; aval: LInt32;
                       ppixel: ptr LUint32): LOk {.importc: "composeRGBAPixel".}
proc extractRGBValues*(pixel: LUint32; prval: ptr LInt32; pgval: ptr LInt32;
                       pbval: ptr LInt32) {.importc: "extractRGBValues".}
proc extractRGBAValues*(pixel: LUint32; prval: ptr LInt32; pgval: ptr LInt32;
                        pbval: ptr LInt32; paval: ptr LInt32) {.
    importc: "extractRGBAValues".}
proc extractMinMaxComponent*(pixel: LUint32; `type`: LInt32): LInt32 {.
    importc: "extractMinMaxComponent".}
proc pixGetRGBLine*(pixs: ptr Pix; row: LInt32; bufr: ptr LUint8;
                    bufg: ptr LUint8; bufb: ptr LUint8): LOk {.
    importc: "pixGetRGBLine".}
proc setLineDataVal*(line: ptr LUint32; j: LInt32; d: LInt32; val: LUint32): LOk {.
    importc: "setLineDataVal".}
proc pixEndianByteSwapNew*(pixs: ptr Pix): ptr Pix {.
    importc: "pixEndianByteSwapNew".}
proc pixEndianByteSwap*(pixs: ptr Pix): LOk {.importc: "pixEndianByteSwap".}
proc lineEndianByteSwap*(datad: ptr LUint32; datas: ptr LUint32; wpl: LInt32): LInt32 {.
    importc: "lineEndianByteSwap".}
proc pixEndianTwoByteSwapNew*(pixs: ptr Pix): ptr Pix {.
    importc: "pixEndianTwoByteSwapNew".}
proc pixEndianTwoByteSwap*(pixs: ptr Pix): LOk {.
    importc: "pixEndianTwoByteSwap".}
proc pixGetRasterData*(pixs: ptr Pix; pdata: ptr ptr LUint8;
                       pnbytes: ptr csize_t): LOk {.importc: "pixGetRasterData".}
proc pixInferResolution*(pix: ptr Pix; longside: LFloat32; pres: ptr LInt32): LOk {.
    importc: "pixInferResolution".}
proc pixAlphaIsOpaque*(pix: ptr Pix; popaque: ptr LInt32): LOk {.
    importc: "pixAlphaIsOpaque".}
proc pixSetupByteProcessing*(pix: ptr Pix; pw: ptr LInt32; ph: ptr LInt32): ptr ptr LUint8 {.
    importc: "pixSetupByteProcessing".}
proc pixCleanupByteProcessing*(pix: ptr Pix; lineptrs: ptr ptr LUint8): LOk {.
    importc: "pixCleanupByteProcessing".}
proc lSetAlphaMaskBorder*(val1: LFloat32; val2: LFloat32) {.
    importc: "l_setAlphaMaskBorder".}
proc pixSetMasked*(pixd: ptr Pix; pixm: ptr Pix; val: LUint32): LOk {.
    importc: "pixSetMasked".}
proc pixSetMaskedGeneral*(pixd: ptr Pix; pixm: ptr Pix; val: LUint32; x: LInt32;
                          y: LInt32): LOk {.importc: "pixSetMaskedGeneral".}
proc pixCombineMasked*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix): LOk {.
    importc: "pixCombineMasked".}
proc pixCombineMaskedGeneral*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                              x: LInt32; y: LInt32): LOk {.
    importc: "pixCombineMaskedGeneral".}
proc pixPaintThroughMask*(pixd: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                          val: LUint32): LOk {.importc: "pixPaintThroughMask".}
proc pixCopyWithBoxa*(pixs: ptr Pix; boxa: ptr Boxa; background: LInt32): ptr Pix {.
    importc: "pixCopyWithBoxa".}
proc pixPaintSelfThroughMask*(pixd: ptr Pix; pixm: ptr Pix; x: LInt32;
                              y: LInt32; searchdir: LInt32; mindist: LInt32;
                              tilesize: LInt32; ntiles: LInt32;
                              distblend: LInt32): LOk {.
    importc: "pixPaintSelfThroughMask".}
proc pixMakeMaskFromVal*(pixs: ptr Pix; val: LInt32): ptr Pix {.
    importc: "pixMakeMaskFromVal".}
proc pixMakeMaskFromLUT*(pixs: ptr Pix; tab: ptr LInt32): ptr Pix {.
    importc: "pixMakeMaskFromLUT".}
proc pixMakeArbMaskFromRGB*(pixs: ptr Pix; rc: LFloat32; gc: LFloat32;
                            bc: LFloat32; thresh: LFloat32): ptr Pix {.
    importc: "pixMakeArbMaskFromRGB".}
proc pixSetUnderTransparency*(pixs: ptr Pix; val: LUint32; debug: LInt32): ptr Pix {.
    importc: "pixSetUnderTransparency".}
proc pixMakeAlphaFromMask*(pixs: ptr Pix; dist: LInt32; pbox: ptr ptr Box): ptr Pix {.
    importc: "pixMakeAlphaFromMask".}
proc pixGetColorNearMaskBoundary*(pixs: ptr Pix; pixm: ptr Pix; box: ptr Box;
                                  dist: LInt32; pval: ptr LUint32; debug: LInt32): LOk {.
    importc: "pixGetColorNearMaskBoundary".}
proc pixDisplaySelectedPixels*(pixs: ptr Pix; pixm: ptr Pix; sel: ptr Sel;
                               val: LUint32): ptr Pix {.
    importc: "pixDisplaySelectedPixels".}
proc pixInvert*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.importc: "pixInvert".}
proc pixOr*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixOr".}
proc pixAnd*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixAnd".}
proc pixXor*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixXor".}
proc pixSubtract*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixSubtract".}
proc pixZero*(pix: ptr Pix; pempty: ptr LInt32): LOk {.importc: "pixZero".}
proc pixForegroundFraction*(pix: ptr Pix; pfract: ptr LFloat32): LOk {.
    importc: "pixForegroundFraction".}
proc pixaCountPixels*(pixa: ptr Pixa): ptr Numa {.importc: "pixaCountPixels".}
proc pixCountPixels*(pixs: ptr Pix; pcount: ptr LInt32; tab8: ptr LInt32): LOk {.
    importc: "pixCountPixels".}
proc pixCountPixelsInRect*(pixs: ptr Pix; box: ptr Box; pcount: ptr LInt32;
                           tab8: ptr LInt32): LOk {.
    importc: "pixCountPixelsInRect".}
proc pixCountByRow*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixCountByRow".}
proc pixCountByColumn*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixCountByColumn".}
proc pixCountPixelsByRow*(pix: ptr Pix; tab8: ptr LInt32): ptr Numa {.
    importc: "pixCountPixelsByRow".}
proc pixCountPixelsByColumn*(pix: ptr Pix): ptr Numa {.
    importc: "pixCountPixelsByColumn".}
proc pixCountPixelsInRow*(pix: ptr Pix; row: LInt32; pcount: ptr LInt32;
                          tab8: ptr LInt32): LOk {.
    importc: "pixCountPixelsInRow".}
proc pixGetMomentByColumn*(pix: ptr Pix; order: LInt32): ptr Numa {.
    importc: "pixGetMomentByColumn".}
proc pixThresholdPixelSum*(pix: ptr Pix; thresh: LInt32; pabove: ptr LInt32;
                           tab8: ptr LInt32): LOk {.
    importc: "pixThresholdPixelSum".}
proc makePixelSumTab8*(): ptr LInt32 {.importc: "makePixelSumTab8".}
proc makePixelCentroidTab8*(): ptr LInt32 {.importc: "makePixelCentroidTab8".}
proc pixAverageByRow*(pix: ptr Pix; box: ptr Box; `type`: LInt32): ptr Numa {.
    importc: "pixAverageByRow".}
proc pixAverageByColumn*(pix: ptr Pix; box: ptr Box; `type`: LInt32): ptr Numa {.
    importc: "pixAverageByColumn".}
proc pixAverageInRect*(pixs: ptr Pix; pixm: ptr Pix; box: ptr Box;
                       minval: LInt32; maxval: LInt32; subsamp: LInt32;
                       pave: ptr LFloat32): LOk {.importc: "pixAverageInRect".}
proc pixAverageInRectRGB*(pixs: ptr Pix; pixm: ptr Pix; box: ptr Box;
                          subsamp: LInt32; pave: ptr LUint32): LOk {.
    importc: "pixAverageInRectRGB".}
proc pixVarianceByRow*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixVarianceByRow".}
proc pixVarianceByColumn*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixVarianceByColumn".}
proc pixVarianceInRect*(pix: ptr Pix; box: ptr Box; prootvar: ptr LFloat32): LOk {.
    importc: "pixVarianceInRect".}
proc pixAbsDiffByRow*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixAbsDiffByRow".}
proc pixAbsDiffByColumn*(pix: ptr Pix; box: ptr Box): ptr Numa {.
    importc: "pixAbsDiffByColumn".}
proc pixAbsDiffInRect*(pix: ptr Pix; box: ptr Box; dir: LInt32;
                       pabsdiff: ptr LFloat32): LOk {.
    importc: "pixAbsDiffInRect".}
proc pixAbsDiffOnLine*(pix: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                       y2: LInt32; pabsdiff: ptr LFloat32): LOk {.
    importc: "pixAbsDiffOnLine".}
proc pixCountArbInRect*(pixs: ptr Pix; box: ptr Box; val: LInt32;
                        factor: LInt32; pcount: ptr LInt32): LInt32 {.
    importc: "pixCountArbInRect".}
proc pixMirroredTiling*(pixs: ptr Pix; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixMirroredTiling".}
proc pixFindRepCloseTile*(pixs: ptr Pix; box: ptr Box; searchdir: LInt32;
                          mindist: LInt32; tsize: LInt32; ntiles: LInt32;
                          pboxtile: ptr ptr Box; debug: LInt32): LOk {.
    importc: "pixFindRepCloseTile".}
proc pixGetGrayHistogram*(pixs: ptr Pix; factor: LInt32): ptr Numa {.
    importc: "pixGetGrayHistogram".}
proc pixGetGrayHistogramMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32;
                                y: LInt32; factor: LInt32): ptr Numa {.
    importc: "pixGetGrayHistogramMasked".}
proc pixGetGrayHistogramInRect*(pixs: ptr Pix; box: ptr Box; factor: LInt32): ptr Numa {.
    importc: "pixGetGrayHistogramInRect".}
proc pixGetGrayHistogramTiled*(pixs: ptr Pix; factor: LInt32; nx: LInt32;
                               ny: LInt32): ptr Numaa {.
    importc: "pixGetGrayHistogramTiled".}
proc pixGetColorHistogram*(pixs: ptr Pix; factor: LInt32; pnar: ptr ptr Numa;
                           pnag: ptr ptr Numa; pnab: ptr ptr Numa): LOk {.
    importc: "pixGetColorHistogram".}
proc pixGetColorHistogramMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32;
                                 y: LInt32; factor: LInt32; pnar: ptr ptr Numa;
                                 pnag: ptr ptr Numa; pnab: ptr ptr Numa): LOk {.
    importc: "pixGetColorHistogramMasked".}
proc pixGetCmapHistogram*(pixs: ptr Pix; factor: LInt32): ptr Numa {.
    importc: "pixGetCmapHistogram".}
proc pixGetCmapHistogramMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32;
                                y: LInt32; factor: LInt32): ptr Numa {.
    importc: "pixGetCmapHistogramMasked".}
proc pixGetCmapHistogramInRect*(pixs: ptr Pix; box: ptr Box; factor: LInt32): ptr Numa {.
    importc: "pixGetCmapHistogramInRect".}
proc pixCountRGBColorsByHash*(pixs: ptr Pix; pncolors: ptr LInt32): LOk {.
    importc: "pixCountRGBColorsByHash".}
proc pixCountRGBColors*(pixs: ptr Pix; factor: LInt32; pncolors: ptr LInt32): LOk {.
    importc: "pixCountRGBColors".}
proc pixGetColorAmapHistogram*(pixs: ptr Pix; factor: LInt32): ptr L_Amap {.
    importc: "pixGetColorAmapHistogram".}
proc amapGetCountForColor*(amap: ptr L_Amap; val: LUint32): LInt32 {.
    importc: "amapGetCountForColor".}
proc pixGetRankValue*(pixs: ptr Pix; factor: LInt32; rank: LFloat32;
                      pvalue: ptr LUint32): LOk {.importc: "pixGetRankValue".}
proc pixGetRankValueMaskedRGB*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32;
                               y: LInt32; factor: LInt32; rank: LFloat32;
                               prval: ptr LFloat32; pgval: ptr LFloat32;
                               pbval: ptr LFloat32): LOk {.
    importc: "pixGetRankValueMaskedRGB".}
proc pixGetRankValueMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                            factor: LInt32; rank: LFloat32; pval: ptr LFloat32;
                            pna: ptr ptr Numa): LOk {.
    importc: "pixGetRankValueMasked".}
proc pixGetPixelAverage*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                         factor: LInt32; pval: ptr LUint32): LOk {.
    importc: "pixGetPixelAverage".}
proc pixGetPixelStats*(pixs: ptr Pix; factor: LInt32; `type`: LInt32;
                       pvalue: ptr LUint32): LOk {.importc: "pixGetPixelStats".}
proc pixGetAverageMaskedRGB*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                             factor: LInt32; `type`: LInt32;
                             prval: ptr LFloat32; pgval: ptr LFloat32;
                             pbval: ptr LFloat32): LOk {.
    importc: "pixGetAverageMaskedRGB".}
proc pixGetAverageMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                          factor: LInt32; `type`: LInt32; pval: ptr LFloat32): LOk {.
    importc: "pixGetAverageMasked".}
proc pixGetAverageTiledRGB*(pixs: ptr Pix; sx: LInt32; sy: LInt32;
                            `type`: LInt32; ppixr: ptr ptr Pix;
                            ppixg: ptr ptr Pix; ppixb: ptr ptr Pix): LOk {.
    importc: "pixGetAverageTiledRGB".}
proc pixGetAverageTiled*(pixs: ptr Pix; sx: LInt32; sy: LInt32; `type`: LInt32): ptr Pix {.
    importc: "pixGetAverageTiled".}
proc pixRowStats*(pixs: ptr Pix; box: ptr Box; pnamean: ptr ptr Numa;
                  pnamedian: ptr ptr Numa; pnamode: ptr ptr Numa;
                  pnamodecount: ptr ptr Numa; pnavar: ptr ptr Numa;
                  pnarootvar: ptr ptr Numa): LInt32 {.importc: "pixRowStats".}
proc pixColumnStats*(pixs: ptr Pix; box: ptr Box; pnamean: ptr ptr Numa;
                     pnamedian: ptr ptr Numa; pnamode: ptr ptr Numa;
                     pnamodecount: ptr ptr Numa; pnavar: ptr ptr Numa;
                     pnarootvar: ptr ptr Numa): LInt32 {.
    importc: "pixColumnStats".}
proc pixGetRangeValues*(pixs: ptr Pix; factor: LInt32; color: LInt32;
                        pminval: ptr LInt32; pmaxval: ptr LInt32): LOk {.
    importc: "pixGetRangeValues".}
proc pixGetExtremeValue*(pixs: ptr Pix; factor: LInt32; `type`: LInt32;
                         prval: ptr LInt32; pgval: ptr LInt32;
                         pbval: ptr LInt32; pgrayval: ptr LInt32): LOk {.
    importc: "pixGetExtremeValue".}
proc pixGetMaxValueInRect*(pixs: ptr Pix; box: ptr Box; pmaxval: ptr LUint32;
                           pxmax: ptr LInt32; pymax: ptr LInt32): LOk {.
    importc: "pixGetMaxValueInRect".}
proc pixGetMaxColorIndex*(pixs: ptr Pix; pmaxindex: ptr LInt32): LOk {.
    importc: "pixGetMaxColorIndex".}
proc pixGetBinnedComponentRange*(pixs: ptr Pix; nbins: LInt32; factor: LInt32;
                                 color: LInt32; pminval: ptr LInt32;
                                 pmaxval: ptr LInt32; pcarray: ptr ptr LUint32;
                                 fontsize: LInt32): LOk {.
    importc: "pixGetBinnedComponentRange".}
proc pixGetRankColorArray*(pixs: ptr Pix; nbins: LInt32; `type`: LInt32;
                           factor: LInt32; pcarray: ptr ptr LUint32;
                           pixadb: ptr Pixa; fontsize: LInt32): LOk {.
    importc: "pixGetRankColorArray".}
proc pixGetBinnedColor*(pixs: ptr Pix; pixg: ptr Pix; factor: LInt32;
                        nbins: LInt32; pcarray: ptr ptr LUint32;
                        pixadb: ptr Pixa): LOk {.importc: "pixGetBinnedColor".}
proc pixDisplayColorArray*(carray: ptr LUint32; ncolors: LInt32; side: LInt32;
                           ncols: LInt32; fontsize: LInt32): ptr Pix {.
    importc: "pixDisplayColorArray".}
proc pixRankBinByStrip*(pixs: ptr Pix; direction: LInt32; size: LInt32;
                        nbins: LInt32; `type`: LInt32): ptr Pix {.
    importc: "pixRankBinByStrip".}
proc pixaGetAlignedStats*(pixa: ptr Pixa; `type`: LInt32; nbins: LInt32;
                          thresh: LInt32): ptr Pix {.
    importc: "pixaGetAlignedStats".}
proc pixaExtractColumnFromEachPix*(pixa: ptr Pixa; col: LInt32; pixd: ptr Pix): LOk {.
    importc: "pixaExtractColumnFromEachPix".}
proc pixGetRowStats*(pixs: ptr Pix; `type`: LInt32; nbins: LInt32;
                     thresh: LInt32; colvect: ptr LFloat32): LOk {.
    importc: "pixGetRowStats".}
proc pixGetColumnStats*(pixs: ptr Pix; `type`: LInt32; nbins: LInt32;
                        thresh: LInt32; rowvect: ptr LFloat32): LOk {.
    importc: "pixGetColumnStats".}
proc pixSetPixelColumn*(pix: ptr Pix; col: LInt32; colvect: ptr LFloat32): LOk {.
    importc: "pixSetPixelColumn".}
proc pixThresholdForFgBg*(pixs: ptr Pix; factor: LInt32; thresh: LInt32;
                          pfgval: ptr LInt32; pbgval: ptr LInt32): LOk {.
    importc: "pixThresholdForFgBg".}
proc pixSplitDistributionFgBg*(pixs: ptr Pix; scorefract: LFloat32;
                               factor: LInt32; pthresh: ptr LInt32;
                               pfgval: ptr LInt32; pbgval: ptr LInt32;
                               ppixdb: ptr ptr Pix): LOk {.
    importc: "pixSplitDistributionFgBg".}
proc pixaFindDimensions*(pixa: ptr Pixa; pnaw: ptr ptr Numa; pnah: ptr ptr Numa): LOk {.
    importc: "pixaFindDimensions".}
proc pixFindAreaPerimRatio*(pixs: ptr Pix; tab: ptr LInt32; pfract: ptr LFloat32): LOk {.
    importc: "pixFindAreaPerimRatio".}
proc pixaFindPerimToAreaRatio*(pixa: ptr Pixa): ptr Numa {.
    importc: "pixaFindPerimToAreaRatio".}
proc pixFindPerimToAreaRatio*(pixs: ptr Pix; tab: ptr LInt32;
                              pfract: ptr LFloat32): LOk {.
    importc: "pixFindPerimToAreaRatio".}
proc pixaFindPerimSizeRatio*(pixa: ptr Pixa): ptr Numa {.
    importc: "pixaFindPerimSizeRatio".}
proc pixFindPerimSizeRatio*(pixs: ptr Pix; tab: ptr LInt32; pratio: ptr LFloat32): LOk {.
    importc: "pixFindPerimSizeRatio".}
proc pixaFindAreaFraction*(pixa: ptr Pixa): ptr Numa {.
    importc: "pixaFindAreaFraction".}
proc pixFindAreaFraction*(pixs: ptr Pix; tab: ptr LInt32; pfract: ptr LFloat32): LOk {.
    importc: "pixFindAreaFraction".}
proc pixaFindAreaFractionMasked*(pixa: ptr Pixa; pixm: ptr Pix; debug: LInt32): ptr Numa {.
    importc: "pixaFindAreaFractionMasked".}
proc pixFindAreaFractionMasked*(pixs: ptr Pix; box: ptr Box; pixm: ptr Pix;
                                tab: ptr LInt32; pfract: ptr LFloat32): LOk {.
    importc: "pixFindAreaFractionMasked".}
proc pixaFindWidthHeightRatio*(pixa: ptr Pixa): ptr Numa {.
    importc: "pixaFindWidthHeightRatio".}
proc pixaFindWidthHeightProduct*(pixa: ptr Pixa): ptr Numa {.
    importc: "pixaFindWidthHeightProduct".}
proc pixFindOverlapFraction*(pixs1: ptr Pix; pixs2: ptr Pix; x2: LInt32;
                             y2: LInt32; tab: ptr LInt32; pratio: ptr LFloat32;
                             pnoverlap: ptr LInt32): LOk {.
    importc: "pixFindOverlapFraction".}
proc pixFindRectangleComps*(pixs: ptr Pix; dist: LInt32; minw: LInt32;
                            minh: LInt32): ptr Boxa {.
    importc: "pixFindRectangleComps".}
proc pixConformsToRectangle*(pixs: ptr Pix; box: ptr Box; dist: LInt32;
                             pconforms: ptr LInt32): LOk {.
    importc: "pixConformsToRectangle".}
proc pixClipRectangles*(pixs: ptr Pix; boxa: ptr Boxa): ptr Pixa {.
    importc: "pixClipRectangles".}
proc pixClipRectangle*(pixs: ptr Pix; box: ptr Box; pboxc: ptr ptr Box): ptr Pix {.
    importc: "pixClipRectangle".}
proc pixClipRectangleWithBorder*(pixs: ptr Pix; box: ptr Box; maxbord: LInt32;
                                 pboxn: ptr ptr Box): ptr Pix {.
    importc: "pixClipRectangleWithBorder".}
proc pixClipMasked*(pixs: ptr Pix; pixm: ptr Pix; x: LInt32; y: LInt32;
                    outval: LUint32): ptr Pix {.importc: "pixClipMasked".}
proc pixCropToMatch*(pixs1: ptr Pix; pixs2: ptr Pix; ppixd1: ptr ptr Pix;
                     ppixd2: ptr ptr Pix): LOk {.importc: "pixCropToMatch".}
proc pixCropToSize*(pixs: ptr Pix; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixCropToSize".}
proc pixResizeToMatch*(pixs: ptr Pix; pixt: ptr Pix; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixResizeToMatch".}
proc pixSelectComponentBySize*(pixs: ptr Pix; rankorder: LInt32; `type`: LInt32;
                               connectivity: LInt32; pbox: ptr ptr Box): ptr Pix {.
    importc: "pixSelectComponentBySize".}
proc pixFilterComponentBySize*(pixs: ptr Pix; rankorder: LInt32; `type`: LInt32;
                               connectivity: LInt32; pbox: ptr ptr Box): ptr Pix {.
    importc: "pixFilterComponentBySize".}
proc pixMakeSymmetricMask*(w: LInt32; h: LInt32; hf: LFloat32; vf: LFloat32;
                           `type`: LInt32): ptr Pix {.
    importc: "pixMakeSymmetricMask".}
proc pixMakeFrameMask*(w: LInt32; h: LInt32; hf1: LFloat32; hf2: LFloat32;
                       vf1: LFloat32; vf2: LFloat32): ptr Pix {.
    importc: "pixMakeFrameMask".}
proc pixMakeCoveringOfRectangles*(pixs: ptr Pix; maxiters: LInt32): ptr Pix {.
    importc: "pixMakeCoveringOfRectangles".}
proc pixFractionFgInMask*(pix1: ptr Pix; pix2: ptr Pix; pfract: ptr LFloat32): LOk {.
    importc: "pixFractionFgInMask".}
proc pixClipToForeground*(pixs: ptr Pix; ppixd: ptr ptr Pix; pbox: ptr ptr Box): LOk {.
    importc: "pixClipToForeground".}
proc pixTestClipToForeground*(pixs: ptr Pix; pcanclip: ptr LInt32): LOk {.
    importc: "pixTestClipToForeground".}
proc pixClipBoxToForeground*(pixs: ptr Pix; boxs: ptr Box; ppixd: ptr ptr Pix;
                             pboxd: ptr ptr Box): LOk {.
    importc: "pixClipBoxToForeground".}
proc pixScanForForeground*(pixs: ptr Pix; box: ptr Box; scanflag: LInt32;
                           ploc: ptr LInt32): LOk {.
    importc: "pixScanForForeground".}
proc pixClipBoxToEdges*(pixs: ptr Pix; boxs: ptr Box; lowthresh: LInt32;
                        highthresh: LInt32; maxwidth: LInt32; factor: LInt32;
                        ppixd: ptr ptr Pix; pboxd: ptr ptr Box): LOk {.
    importc: "pixClipBoxToEdges".}
proc pixScanForEdge*(pixs: ptr Pix; box: ptr Box; lowthresh: LInt32;
                     highthresh: LInt32; maxwidth: LInt32; factor: LInt32;
                     scanflag: LInt32; ploc: ptr LInt32): LOk {.
    importc: "pixScanForEdge".}
proc pixExtractOnLine*(pixs: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                       y2: LInt32; factor: LInt32): ptr Numa {.
    importc: "pixExtractOnLine".}
proc pixAverageOnLine*(pixs: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                       y2: LInt32; factor: LInt32): LFloat32 {.
    importc: "pixAverageOnLine".}
proc pixAverageIntensityProfile*(pixs: ptr Pix; fract: LFloat32; dir: LInt32;
                                 first: LInt32; last: LInt32; factor1: LInt32;
                                 factor2: LInt32): ptr Numa {.
    importc: "pixAverageIntensityProfile".}
proc pixReversalProfile*(pixs: ptr Pix; fract: LFloat32; dir: LInt32;
                         first: LInt32; last: LInt32; minreversal: LInt32;
                         factor1: LInt32; factor2: LInt32): ptr Numa {.
    importc: "pixReversalProfile".}
proc pixWindowedVarianceOnLine*(pixs: ptr Pix; dir: LInt32; loc: LInt32;
                                c1: LInt32; c2: LInt32; size: LInt32;
                                pnad: ptr ptr Numa): LOk {.
    importc: "pixWindowedVarianceOnLine".}
proc pixMinMaxNearLine*(pixs: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                        y2: LInt32; dist: LInt32; direction: LInt32;
                        pnamin: ptr ptr Numa; pnamax: ptr ptr Numa;
                        pminave: ptr LFloat32; pmaxave: ptr LFloat32): LOk {.
    importc: "pixMinMaxNearLine".}
proc pixRankRowTransform*(pixs: ptr Pix): ptr Pix {.
    importc: "pixRankRowTransform".}
proc pixRankColumnTransform*(pixs: ptr Pix): ptr Pix {.
    importc: "pixRankColumnTransform".}
proc pixaCreate*(n: LInt32): ptr Pixa {.importc: "pixaCreate".}
proc pixaCreateFromPix*(pixs: ptr Pix; n: LInt32; cellw: LInt32; cellh: LInt32): ptr Pixa {.
    importc: "pixaCreateFromPix".}
proc pixaCreateFromBoxa*(pixs: ptr Pix; boxa: ptr Boxa; start: LInt32;
                         num: LInt32; pcropwarn: ptr LInt32): ptr Pixa {.
    importc: "pixaCreateFromBoxa".}
proc pixaSplitPix*(pixs: ptr Pix; nx: LInt32; ny: LInt32; borderwidth: LInt32;
                   bordercolor: LUint32): ptr Pixa {.importc: "pixaSplitPix".}
proc pixaDestroy*(ppixa: ptr ptr Pixa) {.importc: "pixaDestroy".}
proc pixaCopy*(pixa: ptr Pixa; copyflag: LInt32): ptr Pixa {.
    importc: "pixaCopy".}
proc pixaAddPix*(pixa: ptr Pixa; pix: ptr Pix; copyflag: LInt32): LOk {.
    importc: "pixaAddPix".}
proc pixaAddBox*(pixa: ptr Pixa; box: ptr Box; copyflag: LInt32): LOk {.
    importc: "pixaAddBox".}
proc pixaExtendArrayToSize*(pixa: ptr Pixa; size: csize_t): LOk {.
    importc: "pixaExtendArrayToSize".}
proc pixaGetCount*(pixa: ptr Pixa): LInt32 {.importc: "pixaGetCount".}
proc pixaGetPix*(pixa: ptr Pixa; index: LInt32; accesstype: LInt32): ptr Pix {.
    importc: "pixaGetPix".}
proc pixaGetPixDimensions*(pixa: ptr Pixa; index: LInt32; pw: ptr LInt32;
                           ph: ptr LInt32; pd: ptr LInt32): LOk {.
    importc: "pixaGetPixDimensions".}
proc pixaGetBoxa*(pixa: ptr Pixa; accesstype: LInt32): ptr Boxa {.
    importc: "pixaGetBoxa".}
proc pixaGetBoxaCount*(pixa: ptr Pixa): LInt32 {.importc: "pixaGetBoxaCount".}
proc pixaGetBox*(pixa: ptr Pixa; index: LInt32; accesstype: LInt32): ptr Box {.
    importc: "pixaGetBox".}
proc pixaGetBoxGeometry*(pixa: ptr Pixa; index: LInt32; px: ptr LInt32;
                         py: ptr LInt32; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "pixaGetBoxGeometry".}
proc pixaSetBoxa*(pixa: ptr Pixa; boxa: ptr Boxa; accesstype: LInt32): LOk {.
    importc: "pixaSetBoxa".}
proc pixaGetPixArray*(pixa: ptr Pixa): ptr ptr Pix {.importc: "pixaGetPixArray".}
proc pixaVerifyDepth*(pixa: ptr Pixa; psame: ptr LInt32; pmaxd: ptr LInt32): LOk {.
    importc: "pixaVerifyDepth".}
proc pixaVerifyDimensions*(pixa: ptr Pixa; psame: ptr LInt32; pmaxw: ptr LInt32;
                           pmaxh: ptr LInt32): LOk {.
    importc: "pixaVerifyDimensions".}
proc pixaIsFull*(pixa: ptr Pixa; pfullpa: ptr LInt32; pfullba: ptr LInt32): LOk {.
    importc: "pixaIsFull".}
proc pixaCountText*(pixa: ptr Pixa; pntext: ptr LInt32): LOk {.
    importc: "pixaCountText".}
proc pixaSetText*(pixa: ptr Pixa; text: cstring; sa: ptr Sarray): LOk {.
    importc: "pixaSetText".}
proc pixaGetLinePtrs*(pixa: ptr Pixa; psize: ptr LInt32): ptr ptr pointer {.
    importc: "pixaGetLinePtrs".}
proc pixaWriteStreamInfo*(fp: ptr File; pixa: ptr Pixa): LOk {.
    importc: "pixaWriteStreamInfo".}
proc pixaReplacePix*(pixa: ptr Pixa; index: LInt32; pix: ptr Pix; box: ptr Box): LOk {.
    importc: "pixaReplacePix".}
proc pixaInsertPix*(pixa: ptr Pixa; index: LInt32; pixs: ptr Pix; box: ptr Box): LOk {.
    importc: "pixaInsertPix".}
proc pixaRemovePix*(pixa: ptr Pixa; index: LInt32): LOk {.
    importc: "pixaRemovePix".}
proc pixaRemovePixAndSave*(pixa: ptr Pixa; index: LInt32; ppix: ptr ptr Pix;
                           pbox: ptr ptr Box): LOk {.
    importc: "pixaRemovePixAndSave".}
proc pixaRemoveSelected*(pixa: ptr Pixa; naindex: ptr Numa): LOk {.
    importc: "pixaRemoveSelected".}
proc pixaInitFull*(pixa: ptr Pixa; pix: ptr Pix; box: ptr Box): LOk {.
    importc: "pixaInitFull".}
proc pixaClear*(pixa: ptr Pixa): LOk {.importc: "pixaClear".}
proc pixaJoin*(pixad: ptr Pixa; pixas: ptr Pixa; istart: LInt32; iend: LInt32): LOk {.
    importc: "pixaJoin".}
proc pixaInterleave*(pixa1: ptr Pixa; pixa2: ptr Pixa; copyflag: LInt32): ptr Pixa {.
    importc: "pixaInterleave".}
proc pixaaJoin*(paad: ptr Pixaa; paas: ptr Pixaa; istart: LInt32; iend: LInt32): LOk {.
    importc: "pixaaJoin".}
proc pixaaCreate*(n: LInt32): ptr Pixaa {.importc: "pixaaCreate".}
proc pixaaCreateFromPixa*(pixa: ptr Pixa; n: LInt32; `type`: LInt32;
                          copyflag: LInt32): ptr Pixaa {.
    importc: "pixaaCreateFromPixa".}
proc pixaaDestroy*(ppaa: ptr ptr Pixaa) {.importc: "pixaaDestroy".}
proc pixaaAddPixa*(paa: ptr Pixaa; pixa: ptr Pixa; copyflag: LInt32): LOk {.
    importc: "pixaaAddPixa".}
proc pixaaAddPix*(paa: ptr Pixaa; index: LInt32; pix: ptr Pix; box: ptr Box;
                  copyflag: LInt32): LOk {.importc: "pixaaAddPix".}
proc pixaaAddBox*(paa: ptr Pixaa; box: ptr Box; copyflag: LInt32): LOk {.
    importc: "pixaaAddBox".}
proc pixaaGetCount*(paa: ptr Pixaa; pna: ptr ptr Numa): LInt32 {.
    importc: "pixaaGetCount".}
proc pixaaGetPixa*(paa: ptr Pixaa; index: LInt32; accesstype: LInt32): ptr Pixa {.
    importc: "pixaaGetPixa".}
proc pixaaGetBoxa*(paa: ptr Pixaa; accesstype: LInt32): ptr Boxa {.
    importc: "pixaaGetBoxa".}
proc pixaaGetPix*(paa: ptr Pixaa; index: LInt32; ipix: LInt32;
                  accessflag: LInt32): ptr Pix {.importc: "pixaaGetPix".}
proc pixaaVerifyDepth*(paa: ptr Pixaa; psame: ptr LInt32; pmaxd: ptr LInt32): LOk {.
    importc: "pixaaVerifyDepth".}
proc pixaaVerifyDimensions*(paa: ptr Pixaa; psame: ptr LInt32;
                            pmaxw: ptr LInt32; pmaxh: ptr LInt32): LOk {.
    importc: "pixaaVerifyDimensions".}
proc pixaaIsFull*(paa: ptr Pixaa; pfull: ptr LInt32): LInt32 {.
    importc: "pixaaIsFull".}
proc pixaaInitFull*(paa: ptr Pixaa; pixa: ptr Pixa): LOk {.
    importc: "pixaaInitFull".}
proc pixaaReplacePixa*(paa: ptr Pixaa; index: LInt32; pixa: ptr Pixa): LOk {.
    importc: "pixaaReplacePixa".}
proc pixaaClear*(paa: ptr Pixaa): LOk {.importc: "pixaaClear".}
proc pixaaTruncate*(paa: ptr Pixaa): LOk {.importc: "pixaaTruncate".}
proc pixaRead*(filename: cstring): ptr Pixa {.importc: "pixaRead".}
proc pixaReadStream*(fp: ptr File): ptr Pixa {.importc: "pixaReadStream".}
proc pixaReadMem*(data: ptr LUint8; size: csize_t): ptr Pixa {.
    importc: "pixaReadMem".}
proc pixaWriteDebug*(fname: cstring; pixa: ptr Pixa): LOk {.
    importc: "pixaWriteDebug".}
proc pixaWrite*(filename: cstring; pixa: ptr Pixa): LOk {.importc: "pixaWrite".}
proc pixaWriteStream*(fp: ptr File; pixa: ptr Pixa): LOk {.
    importc: "pixaWriteStream".}
proc pixaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; pixa: ptr Pixa): LOk {.
    importc: "pixaWriteMem".}
proc pixaReadBoth*(filename: cstring): ptr Pixa {.importc: "pixaReadBoth".}
proc pixaaReadFromFiles*(dirname: cstring; substr: cstring; first: LInt32;
                         nfiles: LInt32): ptr Pixaa {.
    importc: "pixaaReadFromFiles".}
proc pixaaRead*(filename: cstring): ptr Pixaa {.importc: "pixaaRead".}
proc pixaaReadStream*(fp: ptr File): ptr Pixaa {.importc: "pixaaReadStream".}
proc pixaaReadMem*(data: ptr LUint8; size: csize_t): ptr Pixaa {.
    importc: "pixaaReadMem".}
proc pixaaWrite*(filename: cstring; paa: ptr Pixaa): LOk {.
    importc: "pixaaWrite".}
proc pixaaWriteStream*(fp: ptr File; paa: ptr Pixaa): LOk {.
    importc: "pixaaWriteStream".}
proc pixaaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; paa: ptr Pixaa): LOk {.
    importc: "pixaaWriteMem".}
proc pixaccCreate*(w: LInt32; h: LInt32; negflag: LInt32): ptr Pixacc {.
    importc: "pixaccCreate".}
proc pixaccCreateFromPix*(pix: ptr Pix; negflag: LInt32): ptr Pixacc {.
    importc: "pixaccCreateFromPix".}
proc pixaccDestroy*(ppixacc: ptr ptr Pixacc) {.importc: "pixaccDestroy".}
proc pixaccFinal*(pixacc: ptr Pixacc; outdepth: LInt32): ptr Pix {.
    importc: "pixaccFinal".}
proc pixaccGetPix*(pixacc: ptr Pixacc): ptr Pix {.importc: "pixaccGetPix".}
proc pixaccGetOffset*(pixacc: ptr Pixacc): LInt32 {.importc: "pixaccGetOffset".}
proc pixaccAdd*(pixacc: ptr Pixacc; pix: ptr Pix): LOk {.importc: "pixaccAdd".}
proc pixaccSubtract*(pixacc: ptr Pixacc; pix: ptr Pix): LOk {.
    importc: "pixaccSubtract".}
proc pixaccMultConst*(pixacc: ptr Pixacc; factor: LFloat32): LOk {.
    importc: "pixaccMultConst".}
proc pixaccMultConstAccumulate*(pixacc: ptr Pixacc; pix: ptr Pix;
                                factor: LFloat32): LOk {.
    importc: "pixaccMultConstAccumulate".}
proc pixSelectBySize*(pixs: ptr Pix; width: LInt32; height: LInt32;
                      connectivity: LInt32; `type`: LInt32; relation: LInt32;
                      pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectBySize".}
proc pixaSelectBySize*(pixas: ptr Pixa; width: LInt32; height: LInt32;
                       `type`: LInt32; relation: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectBySize".}
proc pixaMakeSizeIndicator*(pixa: ptr Pixa; width: LInt32; height: LInt32;
                            `type`: LInt32; relation: LInt32): ptr Numa {.
    importc: "pixaMakeSizeIndicator".}
proc pixSelectByPerimToAreaRatio*(pixs: ptr Pix; thresh: LFloat32;
                                  connectivity: LInt32; `type`: LInt32;
                                  pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectByPerimToAreaRatio".}
proc pixaSelectByPerimToAreaRatio*(pixas: ptr Pixa; thresh: LFloat32;
                                   `type`: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByPerimToAreaRatio".}
proc pixSelectByPerimSizeRatio*(pixs: ptr Pix; thresh: LFloat32;
                                connectivity: LInt32; `type`: LInt32;
                                pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectByPerimSizeRatio".}
proc pixaSelectByPerimSizeRatio*(pixas: ptr Pixa; thresh: LFloat32;
                                 `type`: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByPerimSizeRatio".}
proc pixSelectByAreaFraction*(pixs: ptr Pix; thresh: LFloat32;
                              connectivity: LInt32; `type`: LInt32;
                              pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectByAreaFraction".}
proc pixaSelectByAreaFraction*(pixas: ptr Pixa; thresh: LFloat32;
                               `type`: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByAreaFraction".}
proc pixSelectByArea*(pixs: ptr Pix; thresh: LFloat32; connectivity: LInt32;
                      `type`: LInt32; pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectByArea".}
proc pixaSelectByArea*(pixas: ptr Pixa; thresh: LFloat32; `type`: LInt32;
                       pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByArea".}
proc pixSelectByWidthHeightRatio*(pixs: ptr Pix; thresh: LFloat32;
                                  connectivity: LInt32; `type`: LInt32;
                                  pchanged: ptr LInt32): ptr Pix {.
    importc: "pixSelectByWidthHeightRatio".}
proc pixaSelectByWidthHeightRatio*(pixas: ptr Pixa; thresh: LFloat32;
                                   `type`: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByWidthHeightRatio".}
proc pixaSelectByNumConnComp*(pixas: ptr Pixa; nmin: LInt32; nmax: LInt32;
                              connectivity: LInt32; pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectByNumConnComp".}
proc pixaSelectWithIndicator*(pixas: ptr Pixa; na: ptr Numa;
                              pchanged: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectWithIndicator".}
proc pixRemoveWithIndicator*(pixs: ptr Pix; pixa: ptr Pixa; na: ptr Numa): LOk {.
    importc: "pixRemoveWithIndicator".}
proc pixAddWithIndicator*(pixs: ptr Pix; pixa: ptr Pixa; na: ptr Numa): LOk {.
    importc: "pixAddWithIndicator".}
proc pixaSelectWithString*(pixas: ptr Pixa; str: cstring; perror: ptr LInt32): ptr Pixa {.
    importc: "pixaSelectWithString".}
proc pixaRenderComponent*(pixs: ptr Pix; pixa: ptr Pixa; index: LInt32): ptr Pix {.
    importc: "pixaRenderComponent".}
proc pixaSort*(pixas: ptr Pixa; sorttype: LInt32; sortorder: LInt32;
               pnaindex: ptr ptr Numa; copyflag: LInt32): ptr Pixa {.
    importc: "pixaSort".}
proc pixaBinSort*(pixas: ptr Pixa; sorttype: LInt32; sortorder: LInt32;
                  pnaindex: ptr ptr Numa; copyflag: LInt32): ptr Pixa {.
    importc: "pixaBinSort".}
proc pixaSortByIndex*(pixas: ptr Pixa; naindex: ptr Numa; copyflag: LInt32): ptr Pixa {.
    importc: "pixaSortByIndex".}
proc pixaSort2dByIndex*(pixas: ptr Pixa; naa: ptr Numaa; copyflag: LInt32): ptr Pixaa {.
    importc: "pixaSort2dByIndex".}
proc pixaSelectRange*(pixas: ptr Pixa; first: LInt32; last: LInt32;
                      copyflag: LInt32): ptr Pixa {.importc: "pixaSelectRange".}
proc pixaaSelectRange*(paas: ptr Pixaa; first: LInt32; last: LInt32;
                       copyflag: LInt32): ptr Pixaa {.
    importc: "pixaaSelectRange".}
proc pixaaScaleToSize*(paas: ptr Pixaa; wd: LInt32; hd: LInt32): ptr Pixaa {.
    importc: "pixaaScaleToSize".}
proc pixaaScaleToSizeVar*(paas: ptr Pixaa; nawd: ptr Numa; nahd: ptr Numa): ptr Pixaa {.
    importc: "pixaaScaleToSizeVar".}
proc pixaScaleToSize*(pixas: ptr Pixa; wd: LInt32; hd: LInt32): ptr Pixa {.
    importc: "pixaScaleToSize".}
proc pixaScaleToSizeRel*(pixas: ptr Pixa; delw: LInt32; delh: LInt32): ptr Pixa {.
    importc: "pixaScaleToSizeRel".}
proc pixaScale*(pixas: ptr Pixa; scalex: LFloat32; scaley: LFloat32): ptr Pixa {.
    importc: "pixaScale".}
proc pixaScaleBySampling*(pixas: ptr Pixa; scalex: LFloat32; scaley: LFloat32): ptr Pixa {.
    importc: "pixaScaleBySampling".}
proc pixaRotate*(pixas: ptr Pixa; angle: LFloat32; `type`: LInt32;
                 incolor: LInt32; width: LInt32; height: LInt32): ptr Pixa {.
    importc: "pixaRotate".}
proc pixaRotateOrth*(pixas: ptr Pixa; rotation: LInt32): ptr Pixa {.
    importc: "pixaRotateOrth".}
proc pixaTranslate*(pixas: ptr Pixa; hshift: LInt32; vshift: LInt32;
                    incolor: LInt32): ptr Pixa {.importc: "pixaTranslate".}
proc pixaAddBorderGeneral*(pixad: ptr Pixa; pixas: ptr Pixa; left: LInt32;
                           right: LInt32; top: LInt32; bot: LInt32; val: LUint32): ptr Pixa {.
    importc: "pixaAddBorderGeneral".}
proc pixaaFlattenToPixa*(paa: ptr Pixaa; pnaindex: ptr ptr Numa;
                         copyflag: LInt32): ptr Pixa {.
    importc: "pixaaFlattenToPixa".}
proc pixaaSizeRange*(paa: ptr Pixaa; pminw: ptr LInt32; pminh: ptr LInt32;
                     pmaxw: ptr LInt32; pmaxh: ptr LInt32): LOk {.
    importc: "pixaaSizeRange".}
proc pixaSizeRange*(pixa: ptr Pixa; pminw: ptr LInt32; pminh: ptr LInt32;
                    pmaxw: ptr LInt32; pmaxh: ptr LInt32): LOk {.
    importc: "pixaSizeRange".}
proc pixaClipToPix*(pixas: ptr Pixa; pixs: ptr Pix): ptr Pixa {.
    importc: "pixaClipToPix".}
proc pixaClipToForeground*(pixas: ptr Pixa; ppixad: ptr ptr Pixa;
                           pboxa: ptr ptr Boxa): LOk {.
    importc: "pixaClipToForeground".}
proc pixaGetRenderingDepth*(pixa: ptr Pixa; pdepth: ptr LInt32): LOk {.
    importc: "pixaGetRenderingDepth".}
proc pixaHasColor*(pixa: ptr Pixa; phascolor: ptr LInt32): LOk {.
    importc: "pixaHasColor".}
proc pixaAnyColormaps*(pixa: ptr Pixa; phascmap: ptr LInt32): LOk {.
    importc: "pixaAnyColormaps".}
proc pixaGetDepthInfo*(pixa: ptr Pixa; pmaxdepth: ptr LInt32; psame: ptr LInt32): LOk {.
    importc: "pixaGetDepthInfo".}
proc pixaConvertToSameDepth*(pixas: ptr Pixa): ptr Pixa {.
    importc: "pixaConvertToSameDepth".}
proc pixaConvertToGivenDepth*(pixas: ptr Pixa; depth: LInt32): ptr Pixa {.
    importc: "pixaConvertToGivenDepth".}
proc pixaEqual*(pixa1: ptr Pixa; pixa2: ptr Pixa; maxdist: LInt32;
                pnaindex: ptr ptr Numa; psame: ptr LInt32): LOk {.
    importc: "pixaEqual".}
proc pixaSetFullSizeBoxa*(pixa: ptr Pixa): LOk {.importc: "pixaSetFullSizeBoxa".}
proc pixaDisplay*(pixa: ptr Pixa; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixaDisplay".}
proc pixaDisplayRandomCmap*(pixa: ptr Pixa; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixaDisplayRandomCmap".}
proc pixaDisplayLinearly*(pixas: ptr Pixa; direction: LInt32;
                          scalefactor: LFloat32; background: LInt32;
                          spacing: LInt32; border: LInt32; pboxa: ptr ptr Boxa): ptr Pix {.
    importc: "pixaDisplayLinearly".}
proc pixaDisplayOnLattice*(pixa: ptr Pixa; cellw: LInt32; cellh: LInt32;
                           pncols: ptr LInt32; pboxa: ptr ptr Boxa): ptr Pix {.
    importc: "pixaDisplayOnLattice".}
proc pixaDisplayUnsplit*(pixa: ptr Pixa; nx: LInt32; ny: LInt32;
                         borderwidth: LInt32; bordercolor: LUint32): ptr Pix {.
    importc: "pixaDisplayUnsplit".}
proc pixaDisplayTiled*(pixa: ptr Pixa; maxwidth: LInt32; background: LInt32;
                       spacing: LInt32): ptr Pix {.importc: "pixaDisplayTiled".}
proc pixaDisplayTiledInRows*(pixa: ptr Pixa; outdepth: LInt32; maxwidth: LInt32;
                             scalefactor: LFloat32; background: LInt32;
                             spacing: LInt32; border: LInt32): ptr Pix {.
    importc: "pixaDisplayTiledInRows".}
proc pixaDisplayTiledInColumns*(pixas: ptr Pixa; nx: LInt32;
                                scalefactor: LFloat32; spacing: LInt32;
                                border: LInt32): ptr Pix {.
    importc: "pixaDisplayTiledInColumns".}
proc pixaDisplayTiledAndScaled*(pixa: ptr Pixa; outdepth: LInt32;
                                tilewidth: LInt32; ncols: LInt32;
                                background: LInt32; spacing: LInt32;
                                border: LInt32): ptr Pix {.
    importc: "pixaDisplayTiledAndScaled".}
proc pixaDisplayTiledWithText*(pixa: ptr Pixa; maxwidth: LInt32;
                               scalefactor: LFloat32; spacing: LInt32;
                               border: LInt32; fontsize: LInt32;
                               textcolor: LUint32): ptr Pix {.
    importc: "pixaDisplayTiledWithText".}
proc pixaDisplayTiledByIndex*(pixa: ptr Pixa; na: ptr Numa; width: LInt32;
                              spacing: LInt32; border: LInt32; fontsize: LInt32;
                              textcolor: LUint32): ptr Pix {.
    importc: "pixaDisplayTiledByIndex".}
proc pixaDisplayPairTiledInColumns*(pixas1: ptr Pixa; pixas2: ptr Pixa;
                                    nx: LInt32; scalefactor: LFloat32;
                                    spacing1: LInt32; spacing2: LInt32;
                                    border1: LInt32; border2: LInt32;
                                    fontsize: LInt32; startindex: LInt32;
                                    sa: ptr Sarray): ptr Pix {.
    importc: "pixaDisplayPairTiledInColumns".}
proc pixaaDisplay*(paa: ptr Pixaa; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixaaDisplay".}
proc pixaaDisplayByPixa*(paa: ptr Pixaa; maxnx: LInt32; scalefactor: LFloat32;
                         hspacing: LInt32; vspacing: LInt32; border: LInt32): ptr Pix {.
    importc: "pixaaDisplayByPixa".}
proc pixaaDisplayTiledAndScaled*(paa: ptr Pixaa; outdepth: LInt32;
                                 tilewidth: LInt32; ncols: LInt32;
                                 background: LInt32; spacing: LInt32;
                                 border: LInt32): ptr Pixa {.
    importc: "pixaaDisplayTiledAndScaled".}
proc pixaConvertTo1*(pixas: ptr Pixa; thresh: LInt32): ptr Pixa {.
    importc: "pixaConvertTo1".}
proc pixaConvertTo8*(pixas: ptr Pixa; cmapflag: LInt32): ptr Pixa {.
    importc: "pixaConvertTo8".}
proc pixaConvertTo8Colormap*(pixas: ptr Pixa; dither: LInt32): ptr Pixa {.
    importc: "pixaConvertTo8Colormap".}
proc pixaConvertTo32*(pixas: ptr Pixa): ptr Pixa {.importc: "pixaConvertTo32".}
proc pixaConstrainedSelect*(pixas: ptr Pixa; first: LInt32; last: LInt32;
                            nmax: LInt32; usePairs: LInt32; copyflag: LInt32): ptr Pixa {.
    importc: "pixaConstrainedSelect".}
proc pixaSelectToPdf*(pixas: ptr Pixa; first: LInt32; last: LInt32; res: LInt32;
                      scalefactor: LFloat32; `type`: LInt32; quality: LInt32;
                      color: LUint32; fontsize: LInt32; fileout: cstring): LOk {.
    importc: "pixaSelectToPdf".}
proc pixaMakeFromTiledPixa*(pixas: ptr Pixa; w: LInt32; h: LInt32; nsamp: LInt32): ptr Pixa {.
    importc: "pixaMakeFromTiledPixa".}
proc pixaMakeFromTiledPix*(pixs: ptr Pix; w: LInt32; h: LInt32; start: LInt32;
                           num: LInt32; boxa: ptr Boxa): ptr Pixa {.
    importc: "pixaMakeFromTiledPix".}
proc pixGetTileCount*(pix: ptr Pix; pn: ptr LInt32): LOk {.
    importc: "pixGetTileCount".}
proc pixaDisplayMultiTiled*(pixas: ptr Pixa; nx: LInt32; ny: LInt32;
                            maxw: LInt32; maxh: LInt32; scalefactor: LFloat32;
                            spacing: LInt32; border: LInt32): ptr Pixa {.
    importc: "pixaDisplayMultiTiled".}
proc pixaSplitIntoFiles*(pixas: ptr Pixa; nsplit: LInt32; scale: LFloat32;
                         outwidth: LInt32; writePixa: LInt32; writePix: LInt32;
                         writePdf: LInt32): LOk {.importc: "pixaSplitIntoFiles".}
proc convertToNUpFiles*(dir: cstring; substr: cstring; nx: LInt32; ny: LInt32;
                        tw: LInt32; spacing: LInt32; border: LInt32;
                        fontsize: LInt32; outdir: cstring): LOk {.
    importc: "convertToNUpFiles".}
proc convertToNUpPixa*(dir: cstring; substr: cstring; nx: LInt32; ny: LInt32;
                       tw: LInt32; spacing: LInt32; border: LInt32;
                       fontsize: LInt32): ptr Pixa {.
    importc: "convertToNUpPixa".}
proc pixaConvertToNUpPixa*(pixas: ptr Pixa; sa: ptr Sarray; nx: LInt32;
                           ny: LInt32; tw: LInt32; spacing: LInt32;
                           border: LInt32; fontsize: LInt32): ptr Pixa {.
    importc: "pixaConvertToNUpPixa".}
proc pixaCompareInPdf*(pixa1: ptr Pixa; pixa2: ptr Pixa; nx: LInt32; ny: LInt32;
                       tw: LInt32; spacing: LInt32; border: LInt32;
                       fontsize: LInt32; fileout: cstring): LOk {.
    importc: "pixaCompareInPdf".}
proc pmsCreate*(minsize: csize_t; smallest: csize_t; numalloc: ptr Numa;
                logfile: cstring): LOk {.importc: "pmsCreate".}
proc pmsDestroy*() {.importc: "pmsDestroy".}
proc pmsCustomAlloc*(nbytes: csize_t): pointer {.importc: "pmsCustomAlloc".}
proc pmsCustomDealloc*(data: pointer) {.importc: "pmsCustomDealloc".}
proc pmsGetAlloc*(nbytes: csize_t): pointer {.importc: "pmsGetAlloc".}
proc pmsGetLevelForAlloc*(nbytes: csize_t; plevel: ptr LInt32): LOk {.
    importc: "pmsGetLevelForAlloc".}
proc pmsGetLevelForDealloc*(data: pointer; plevel: ptr LInt32): LOk {.
    importc: "pmsGetLevelForDealloc".}
proc pmsLogInfo*() {.importc: "pmsLogInfo".}
proc pixAddConstantGray*(pixs: ptr Pix; val: LInt32): LOk {.
    importc: "pixAddConstantGray".}
proc pixMultConstantGray*(pixs: ptr Pix; val: LFloat32): LOk {.
    importc: "pixMultConstantGray".}
proc pixAddGray*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixAddGray".}
proc pixSubtractGray*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixSubtractGray".}
proc pixMultiplyGray*(pixs: ptr Pix; pixg: ptr Pix; norm: LFloat32): ptr Pix {.
    importc: "pixMultiplyGray".}
proc pixThresholdToValue*(pixd: ptr Pix; pixs: ptr Pix; threshval: LInt32;
                          setval: LInt32): ptr Pix {.
    importc: "pixThresholdToValue".}
proc pixInitAccumulate*(w: LInt32; h: LInt32; offset: LUint32): ptr Pix {.
    importc: "pixInitAccumulate".}
proc pixFinalAccumulate*(pixs: ptr Pix; offset: LUint32; depth: LInt32): ptr Pix {.
    importc: "pixFinalAccumulate".}
proc pixFinalAccumulateThreshold*(pixs: ptr Pix; offset: LUint32;
                                  threshold: LUint32): ptr Pix {.
    importc: "pixFinalAccumulateThreshold".}
proc pixAccumulate*(pixd: ptr Pix; pixs: ptr Pix; op: LInt32): LOk {.
    importc: "pixAccumulate".}
proc pixMultConstAccumulate*(pixs: ptr Pix; factor: LFloat32; offset: LUint32): LOk {.
    importc: "pixMultConstAccumulate".}
proc pixAbsDifference*(pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixAbsDifference".}
proc pixAddRGB*(pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.importc: "pixAddRGB".}
proc pixMinOrMax*(pixd: ptr Pix; pixs1: ptr Pix; pixs2: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixMinOrMax".}
proc pixMaxDynamicRange*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixMaxDynamicRange".}
proc pixMaxDynamicRangeRGB*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixMaxDynamicRangeRGB".}
proc linearScaleRGBVal*(sval: LUint32; factor: LFloat32): LUint32 {.
    importc: "linearScaleRGBVal".}
proc logScaleRGBVal*(sval: LUint32; tab: ptr LFloat32; factor: LFloat32): LUint32 {.
    importc: "logScaleRGBVal".}
proc makeLogBase2Tab*(): ptr LFloat32 {.importc: "makeLogBase2Tab".}
proc getLogBase2*(val: LInt32; logtab: ptr LFloat32): LFloat32 {.
    importc: "getLogBase2".}
proc pixcompCreateFromPix*(pix: ptr Pix; comptype: LInt32): ptr Pixc {.
    importc: "pixcompCreateFromPix".}
proc pixcompCreateFromString*(data: ptr LUint8; size: csize_t; copyflag: LInt32): ptr Pixc {.
    importc: "pixcompCreateFromString".}
proc pixcompCreateFromFile*(filename: cstring; comptype: LInt32): ptr Pixc {.
    importc: "pixcompCreateFromFile".}
proc pixcompDestroy*(ppixc: ptr ptr Pixc) {.importc: "pixcompDestroy".}
proc pixcompCopy*(pixcs: ptr Pixc): ptr Pixc {.importc: "pixcompCopy".}
proc pixcompGetDimensions*(pixc: ptr Pixc; pw: ptr LInt32; ph: ptr LInt32;
                           pd: ptr LInt32): LOk {.
    importc: "pixcompGetDimensions".}
proc pixcompGetParameters*(pixc: ptr Pixc; pxres: ptr LInt32; pyres: ptr LInt32;
                           pcomptype: ptr LInt32; pcmapflag: ptr LInt32): LOk {.
    importc: "pixcompGetParameters".}
proc pixcompDetermineFormat*(comptype: LInt32; d: LInt32; cmapflag: LInt32;
                             pformat: ptr LInt32): LOk {.
    importc: "pixcompDetermineFormat".}
proc pixCreateFromPixcomp*(pixc: ptr Pixc): ptr Pix {.
    importc: "pixCreateFromPixcomp".}
proc pixacompCreate*(n: LInt32): ptr Pixac {.importc: "pixacompCreate".}
proc pixacompCreateWithInit*(n: LInt32; offset: LInt32; pix: ptr Pix;
                             comptype: LInt32): ptr Pixac {.
    importc: "pixacompCreateWithInit".}
proc pixacompCreateFromPixa*(pixa: ptr Pixa; comptype: LInt32;
                             accesstype: LInt32): ptr Pixac {.
    importc: "pixacompCreateFromPixa".}
proc pixacompCreateFromFiles*(dirname: cstring; substr: cstring;
                              comptype: LInt32): ptr Pixac {.
    importc: "pixacompCreateFromFiles".}
proc pixacompCreateFromSA*(sa: ptr Sarray; comptype: LInt32): ptr Pixac {.
    importc: "pixacompCreateFromSA".}
proc pixacompDestroy*(ppixac: ptr ptr Pixac) {.importc: "pixacompDestroy".}
proc pixacompAddPix*(pixac: ptr Pixac; pix: ptr Pix; comptype: LInt32): LOk {.
    importc: "pixacompAddPix".}
proc pixacompAddPixcomp*(pixac: ptr Pixac; pixc: ptr Pixc; copyflag: LInt32): LOk {.
    importc: "pixacompAddPixcomp".}
proc pixacompReplacePix*(pixac: ptr Pixac; index: LInt32; pix: ptr Pix;
                         comptype: LInt32): LOk {.importc: "pixacompReplacePix".}
proc pixacompReplacePixcomp*(pixac: ptr Pixac; index: LInt32; pixc: ptr Pixc): LOk {.
    importc: "pixacompReplacePixcomp".}
proc pixacompAddBox*(pixac: ptr Pixac; box: ptr Box; copyflag: LInt32): LOk {.
    importc: "pixacompAddBox".}
proc pixacompGetCount*(pixac: ptr Pixac): LInt32 {.importc: "pixacompGetCount".}
proc pixacompGetPixcomp*(pixac: ptr Pixac; index: LInt32; copyflag: LInt32): ptr Pixc {.
    importc: "pixacompGetPixcomp".}
proc pixacompGetPix*(pixac: ptr Pixac; index: LInt32): ptr Pix {.
    importc: "pixacompGetPix".}
proc pixacompGetPixDimensions*(pixac: ptr Pixac; index: LInt32; pw: ptr LInt32;
                               ph: ptr LInt32; pd: ptr LInt32): LOk {.
    importc: "pixacompGetPixDimensions".}
proc pixacompGetBoxa*(pixac: ptr Pixac; accesstype: LInt32): ptr Boxa {.
    importc: "pixacompGetBoxa".}
proc pixacompGetBoxaCount*(pixac: ptr Pixac): LInt32 {.
    importc: "pixacompGetBoxaCount".}
proc pixacompGetBox*(pixac: ptr Pixac; index: LInt32; accesstype: LInt32): ptr Box {.
    importc: "pixacompGetBox".}
proc pixacompGetBoxGeometry*(pixac: ptr Pixac; index: LInt32; px: ptr LInt32;
                             py: ptr LInt32; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "pixacompGetBoxGeometry".}
proc pixacompGetOffset*(pixac: ptr Pixac): LInt32 {.
    importc: "pixacompGetOffset".}
proc pixacompSetOffset*(pixac: ptr Pixac; offset: LInt32): LOk {.
    importc: "pixacompSetOffset".}
proc pixaCreateFromPixacomp*(pixac: ptr Pixac; accesstype: LInt32): ptr Pixa {.
    importc: "pixaCreateFromPixacomp".}
proc pixacompJoin*(pixacd: ptr Pixac; pixacs: ptr Pixac; istart: LInt32;
                   iend: LInt32): LOk {.importc: "pixacompJoin".}
proc pixacompInterleave*(pixac1: ptr Pixac; pixac2: ptr Pixac): ptr Pixac {.
    importc: "pixacompInterleave".}
proc pixacompRead*(filename: cstring): ptr Pixac {.importc: "pixacompRead".}
proc pixacompReadStream*(fp: ptr File): ptr Pixac {.
    importc: "pixacompReadStream".}
proc pixacompReadMem*(data: ptr LUint8; size: csize_t): ptr Pixac {.
    importc: "pixacompReadMem".}
proc pixacompWrite*(filename: cstring; pixac: ptr Pixac): LOk {.
    importc: "pixacompWrite".}
proc pixacompWriteStream*(fp: ptr File; pixac: ptr Pixac): LOk {.
    importc: "pixacompWriteStream".}
proc pixacompWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                       pixac: ptr Pixac): LOk {.importc: "pixacompWriteMem".}
proc pixacompConvertToPdf*(pixac: ptr Pixac; res: LInt32; scalefactor: LFloat32;
                           `type`: LInt32; quality: LInt32; title: cstring;
                           fileout: cstring): LOk {.
    importc: "pixacompConvertToPdf".}
proc pixacompConvertToPdfData*(pixac: ptr Pixac; res: LInt32;
                               scalefactor: LFloat32; `type`: LInt32;
                               quality: LInt32; title: cstring;
                               pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "pixacompConvertToPdfData".}
proc pixacompFastConvertToPdfData*(pixac: ptr Pixac; title: cstring;
                                   pdata: ptr ptr LUint8; pnbytes: ptr csize_t): LOk {.
    importc: "pixacompFastConvertToPdfData".}
proc pixacompWriteStreamInfo*(fp: ptr File; pixac: ptr Pixac; text: cstring): LOk {.
    importc: "pixacompWriteStreamInfo".}
proc pixcompWriteStreamInfo*(fp: ptr File; pixc: ptr Pixc; text: cstring): LOk {.
    importc: "pixcompWriteStreamInfo".}
proc pixacompDisplayTiledAndScaled*(pixac: ptr Pixac; outdepth: LInt32;
                                    tilewidth: LInt32; ncols: LInt32;
                                    background: LInt32; spacing: LInt32;
                                    border: LInt32): ptr Pix {.
    importc: "pixacompDisplayTiledAndScaled".}
proc pixacompWriteFiles*(pixac: ptr Pixac; subdir: cstring): LOk {.
    importc: "pixacompWriteFiles".}
proc pixcompWriteFile*(rootname: cstring; pixc: ptr Pixc): LOk {.
    importc: "pixcompWriteFile".}
proc pixThreshold8*(pixs: ptr Pix; d: LInt32; nlevels: LInt32; cmapflag: LInt32): ptr Pix {.
    importc: "pixThreshold8".}
proc pixRemoveColormapGeneral*(pixs: ptr Pix; `type`: LInt32; ifnocmap: LInt32): ptr Pix {.
    importc: "pixRemoveColormapGeneral".}
proc pixRemoveColormap*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixRemoveColormap".}
proc pixAddGrayColormap8*(pixs: ptr Pix): LOk {.importc: "pixAddGrayColormap8".}
proc pixAddMinimalGrayColormap8*(pixs: ptr Pix): ptr Pix {.
    importc: "pixAddMinimalGrayColormap8".}
proc pixConvertRGBToLuminance*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToLuminance".}
proc pixConvertRGBToGrayGeneral*(pixs: ptr Pix; `type`: LInt32; rwt: LFloat32;
                                 gwt: LFloat32; bwt: LFloat32): ptr Pix {.
    importc: "pixConvertRGBToGrayGeneral".}
proc pixConvertRGBToGray*(pixs: ptr Pix; rwt: LFloat32; gwt: LFloat32;
                          bwt: LFloat32): ptr Pix {.
    importc: "pixConvertRGBToGray".}
proc pixConvertRGBToGrayFast*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertRGBToGrayFast".}
proc pixConvertRGBToGrayMinMax*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixConvertRGBToGrayMinMax".}
proc pixConvertRGBToGraySatBoost*(pixs: ptr Pix; refval: LInt32): ptr Pix {.
    importc: "pixConvertRGBToGraySatBoost".}
proc pixConvertRGBToGrayArb*(pixs: ptr Pix; rc: LFloat32; gc: LFloat32;
                             bc: LFloat32): ptr Pix {.
    importc: "pixConvertRGBToGrayArb".}
proc pixConvertRGBToBinaryArb*(pixs: ptr Pix; rc: LFloat32; gc: LFloat32;
                               bc: LFloat32; thresh: LInt32; relation: LInt32): ptr Pix {.
    importc: "pixConvertRGBToBinaryArb".}
proc pixConvertGrayToColormap*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertGrayToColormap".}
proc pixConvertGrayToColormap8*(pixs: ptr Pix; mindepth: LInt32): ptr Pix {.
    importc: "pixConvertGrayToColormap8".}
proc pixColorizeGray*(pixs: ptr Pix; color: LUint32; cmapflag: LInt32): ptr Pix {.
    importc: "pixColorizeGray".}
proc pixConvertRGBToColormap*(pixs: ptr Pix; ditherflag: LInt32): ptr Pix {.
    importc: "pixConvertRGBToColormap".}
proc pixConvertCmapTo1*(pixs: ptr Pix): ptr Pix {.importc: "pixConvertCmapTo1".}
proc pixQuantizeIfFewColors*(pixs: ptr Pix; maxcolors: LInt32;
                             mingraycolors: LInt32; octlevel: LInt32;
                             ppixd: ptr ptr Pix): LOk {.
    importc: "pixQuantizeIfFewColors".}
proc pixConvert16To8*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixConvert16To8".}
proc pixConvertGrayToFalseColor*(pixs: ptr Pix; gamma: LFloat32): ptr Pix {.
    importc: "pixConvertGrayToFalseColor".}
proc pixUnpackBinary*(pixs: ptr Pix; depth: LInt32; invert: LInt32): ptr Pix {.
    importc: "pixUnpackBinary".}
proc pixConvert1To16*(pixd: ptr Pix; pixs: ptr Pix; val0: LUint16; val1: LUint16): ptr Pix {.
    importc: "pixConvert1To16".}
proc pixConvert1To32*(pixd: ptr Pix; pixs: ptr Pix; val0: LUint32; val1: LUint32): ptr Pix {.
    importc: "pixConvert1To32".}
proc pixConvert1To2Cmap*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvert1To2Cmap".}
proc pixConvert1To2*(pixd: ptr Pix; pixs: ptr Pix; val0: LInt32; val1: LInt32): ptr Pix {.
    importc: "pixConvert1To2".}
proc pixConvert1To4Cmap*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvert1To4Cmap".}
proc pixConvert1To4*(pixd: ptr Pix; pixs: ptr Pix; val0: LInt32; val1: LInt32): ptr Pix {.
    importc: "pixConvert1To4".}
proc pixConvert1To8Cmap*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvert1To8Cmap".}
proc pixConvert1To8*(pixd: ptr Pix; pixs: ptr Pix; val0: LUint8; val1: LUint8): ptr Pix {.
    importc: "pixConvert1To8".}
proc pixConvert2To8*(pixs: ptr Pix; val0: LUint8; val1: LUint8; val2: LUint8;
                     val3: LUint8; cmapflag: LInt32): ptr Pix {.
    importc: "pixConvert2To8".}
proc pixConvert4To8*(pixs: ptr Pix; cmapflag: LInt32): ptr Pix {.
    importc: "pixConvert4To8".}
proc pixConvert8To16*(pixs: ptr Pix; leftshift: LInt32): ptr Pix {.
    importc: "pixConvert8To16".}
proc pixConvertTo2*(pixs: ptr Pix): ptr Pix {.importc: "pixConvertTo2".}
proc pixConvert8To2*(pix: ptr Pix): ptr Pix {.importc: "pixConvert8To2".}
proc pixConvertTo4*(pixs: ptr Pix): ptr Pix {.importc: "pixConvertTo4".}
proc pixConvert8To4*(pix: ptr Pix): ptr Pix {.importc: "pixConvert8To4".}
proc pixConvertTo1Adaptive*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertTo1Adaptive".}
proc pixConvertTo1*(pixs: ptr Pix; threshold: LInt32): ptr Pix {.
    importc: "pixConvertTo1".}
proc pixConvertTo1BySampling*(pixs: ptr Pix; factor: LInt32; threshold: LInt32): ptr Pix {.
    importc: "pixConvertTo1BySampling".}
proc pixConvertTo8*(pixs: ptr Pix; cmapflag: LInt32): ptr Pix {.
    importc: "pixConvertTo8".}
proc pixConvertTo8BySampling*(pixs: ptr Pix; factor: LInt32; cmapflag: LInt32): ptr Pix {.
    importc: "pixConvertTo8BySampling".}
proc pixConvertTo8Colormap*(pixs: ptr Pix; dither: LInt32): ptr Pix {.
    importc: "pixConvertTo8Colormap".}
proc pixConvertTo16*(pixs: ptr Pix): ptr Pix {.importc: "pixConvertTo16".}
proc pixConvertTo32*(pixs: ptr Pix): ptr Pix {.importc: "pixConvertTo32".}
proc pixConvertTo32BySampling*(pixs: ptr Pix; factor: LInt32): ptr Pix {.
    importc: "pixConvertTo32BySampling".}
proc pixConvert8To32*(pixs: ptr Pix): ptr Pix {.importc: "pixConvert8To32".}
proc pixConvertTo8Or32*(pixs: ptr Pix; copyflag: LInt32; warnflag: LInt32): ptr Pix {.
    importc: "pixConvertTo8Or32".}
proc pixConvert24To32*(pixs: ptr Pix): ptr Pix {.importc: "pixConvert24To32".}
proc pixConvert32To24*(pixs: ptr Pix): ptr Pix {.importc: "pixConvert32To24".}
proc pixConvert32To16*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixConvert32To16".}
proc pixConvert32To8*(pixs: ptr Pix; type16: LInt32; type8: LInt32): ptr Pix {.
    importc: "pixConvert32To8".}
proc pixRemoveAlpha*(pixs: ptr Pix): ptr Pix {.importc: "pixRemoveAlpha".}
proc pixAddAlphaTo1bpp*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixAddAlphaTo1bpp".}
proc pixConvertLossless*(pixs: ptr Pix; d: LInt32): ptr Pix {.
    importc: "pixConvertLossless".}
proc pixConvertForPSWrap*(pixs: ptr Pix): ptr Pix {.
    importc: "pixConvertForPSWrap".}
proc pixConvertToSubpixelRGB*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32;
                              order: LInt32): ptr Pix {.
    importc: "pixConvertToSubpixelRGB".}
proc pixConvertGrayToSubpixelRGB*(pixs: ptr Pix; scalex: LFloat32;
                                  scaley: LFloat32; order: LInt32): ptr Pix {.
    importc: "pixConvertGrayToSubpixelRGB".}
proc pixConvertColorToSubpixelRGB*(pixs: ptr Pix; scalex: LFloat32;
                                   scaley: LFloat32; order: LInt32): ptr Pix {.
    importc: "pixConvertColorToSubpixelRGB".}
proc lSetNeutralBoostVal*(val: LInt32) {.importc: "l_setNeutralBoostVal".}
proc pixConnCompTransform*(pixs: ptr Pix; connect: LInt32; depth: LInt32): ptr Pix {.
    importc: "pixConnCompTransform".}
proc pixConnCompAreaTransform*(pixs: ptr Pix; connect: LInt32): ptr Pix {.
    importc: "pixConnCompAreaTransform".}
proc pixConnCompIncrInit*(pixs: ptr Pix; conn: LInt32; ppixd: ptr ptr Pix;
                          pptaa: ptr ptr Ptaa; pncc: ptr LInt32): LOk {.
    importc: "pixConnCompIncrInit".}
proc pixConnCompIncrAdd*(pixs: ptr Pix; ptaa: ptr Ptaa; pncc: ptr LInt32;
                         x: LFloat32; y: LFloat32; debug: LInt32): LInt32 {.
    importc: "pixConnCompIncrAdd".}
proc pixGetSortedNeighborValues*(pixs: ptr Pix; x: LInt32; y: LInt32;
                                 conn: LInt32; pneigh: ptr ptr LInt32;
                                 pnvals: ptr LInt32): LOk {.
    importc: "pixGetSortedNeighborValues".}
proc pixLocToColorTransform*(pixs: ptr Pix): ptr Pix {.
    importc: "pixLocToColorTransform".}
proc pixTilingCreate*(pixs: ptr Pix; nx: LInt32; ny: LInt32; w: LInt32;
                      h: LInt32; xoverlap: LInt32; yoverlap: LInt32): ptr Pixtiling {.
    importc: "pixTilingCreate".}
proc pixTilingDestroy*(ppt: ptr ptr Pixtiling) {.importc: "pixTilingDestroy".}
proc pixTilingGetCount*(pt: ptr Pixtiling; pnx: ptr LInt32; pny: ptr LInt32): LOk {.
    importc: "pixTilingGetCount".}
proc pixTilingGetSize*(pt: ptr Pixtiling; pw: ptr LInt32; ph: ptr LInt32): LOk {.
    importc: "pixTilingGetSize".}
proc pixTilingGetTile*(pt: ptr Pixtiling; i: LInt32; j: LInt32): ptr Pix {.
    importc: "pixTilingGetTile".}
proc pixTilingNoStripOnPaint*(pt: ptr Pixtiling): LOk {.
    importc: "pixTilingNoStripOnPaint".}
proc pixTilingPaintTile*(pixd: ptr Pix; i: LInt32; j: LInt32; pixs: ptr Pix;
                         pt: ptr Pixtiling): LOk {.
    importc: "pixTilingPaintTile".}
proc pixReadStreamPng*(fp: ptr File): ptr Pix {.importc: "pixReadStreamPng".}
proc readHeaderPng*(filename: cstring; pw: ptr LInt32; ph: ptr LInt32;
                    pbps: ptr LInt32; pspp: ptr LInt32; piscmap: ptr LInt32): LOk {.
    importc: "readHeaderPng".}
proc freadHeaderPng*(fp: ptr File; pw: ptr LInt32; ph: ptr LInt32;
                     pbps: ptr LInt32; pspp: ptr LInt32; piscmap: ptr LInt32): LOk {.
    importc: "freadHeaderPng".}
proc readHeaderMemPng*(data: ptr LUint8; size: csize_t; pw: ptr LInt32;
                       ph: ptr LInt32; pbps: ptr LInt32; pspp: ptr LInt32;
                       piscmap: ptr LInt32): LOk {.importc: "readHeaderMemPng".}
proc fgetPngResolution*(fp: ptr File; pxres: ptr LInt32; pyres: ptr LInt32): LInt32 {.
    importc: "fgetPngResolution".}
proc isPngInterlaced*(filename: cstring; pinterlaced: ptr LInt32): LOk {.
    importc: "isPngInterlaced".}
proc fgetPngColormapInfo*(fp: ptr File; pcmap: ptr ptr Pixcmap;
                          ptransparency: ptr LInt32): LOk {.
    importc: "fgetPngColormapInfo".}
proc pixWritePng*(filename: cstring; pix: ptr Pix; gamma: LFloat32): LOk {.
    importc: "pixWritePng".}
proc pixWriteStreamPng*(fp: ptr File; pix: ptr Pix; gamma: LFloat32): LOk {.
    importc: "pixWriteStreamPng".}
proc pixSetZlibCompression*(pix: ptr Pix; compval: LInt32): LOk {.
    importc: "pixSetZlibCompression".}
proc lPngSetReadStrip16To8*(flag: LInt32) {.importc: "l_pngSetReadStrip16To8".}
proc pixReadMemPng*(filedata: ptr LUint8; filesize: csize_t): ptr Pix {.
    importc: "pixReadMemPng".}
proc pixWriteMemPng*(pfiledata: ptr ptr LUint8; pfilesize: ptr csize_t;
                     pix: ptr Pix; gamma: LFloat32): LOk {.
    importc: "pixWriteMemPng".}
proc pixReadStreamPnm*(fp: ptr File): ptr Pix {.importc: "pixReadStreamPnm".}
proc readHeaderPnm*(filename: cstring; pw: ptr LInt32; ph: ptr LInt32;
                    pd: ptr LInt32; ptype: ptr LInt32; pbps: ptr LInt32;
                    pspp: ptr LInt32): LOk {.importc: "readHeaderPnm".}
proc freadHeaderPnm*(fp: ptr File; pw: ptr LInt32; ph: ptr LInt32;
                     pd: ptr LInt32; ptype: ptr LInt32; pbps: ptr LInt32;
                     pspp: ptr LInt32): LOk {.importc: "freadHeaderPnm".}
proc pixWriteStreamPnm*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamPnm".}
proc pixWriteStreamAsciiPnm*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamAsciiPnm".}
proc pixWriteStreamPam*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamPam".}
proc pixReadMemPnm*(data: ptr LUint8; size: csize_t): ptr Pix {.
    importc: "pixReadMemPnm".}
proc readHeaderMemPnm*(data: ptr LUint8; size: csize_t; pw: ptr LInt32;
                       ph: ptr LInt32; pd: ptr LInt32; ptype: ptr LInt32;
                       pbps: ptr LInt32; pspp: ptr LInt32): LOk {.
    importc: "readHeaderMemPnm".}
proc pixWriteMemPnm*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix): LOk {.
    importc: "pixWriteMemPnm".}
proc pixWriteMemPam*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix): LOk {.
    importc: "pixWriteMemPam".}
proc pixProjectiveSampledPta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                              incolor: LInt32): ptr Pix {.
    importc: "pixProjectiveSampledPta".}
proc pixProjectiveSampled*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixProjectiveSampled".}
proc pixProjectivePta*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                       incolor: LInt32): ptr Pix {.importc: "pixProjectivePta".}
proc pixProjective*(pixs: ptr Pix; vc: ptr LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixProjective".}
proc pixProjectivePtaColor*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                            colorval: LUint32): ptr Pix {.
    importc: "pixProjectivePtaColor".}
proc pixProjectiveColor*(pixs: ptr Pix; vc: ptr LFloat32; colorval: LUint32): ptr Pix {.
    importc: "pixProjectiveColor".}
proc pixProjectivePtaGray*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                           grayval: LUint8): ptr Pix {.
    importc: "pixProjectivePtaGray".}
proc pixProjectiveGray*(pixs: ptr Pix; vc: ptr LFloat32; grayval: LUint8): ptr Pix {.
    importc: "pixProjectiveGray".}
proc pixProjectivePtaWithAlpha*(pixs: ptr Pix; ptad: ptr Pta; ptas: ptr Pta;
                                pixg: ptr Pix; fract: LFloat32; border: LInt32): ptr Pix {.
    importc: "pixProjectivePtaWithAlpha".}
proc getProjectiveXformCoeffs*(ptas: ptr Pta; ptad: ptr Pta;
                               pvc: ptr ptr LFloat32): LOk {.
    importc: "getProjectiveXformCoeffs".}
proc projectiveXformSampledPt*(vc: ptr LFloat32; x: LInt32; y: LInt32;
                               pxp: ptr LInt32; pyp: ptr LInt32): LOk {.
    importc: "projectiveXformSampledPt".}
proc projectiveXformPt*(vc: ptr LFloat32; x: LInt32; y: LInt32;
                        pxp: ptr LFloat32; pyp: ptr LFloat32): LOk {.
    importc: "projectiveXformPt".}
proc convertFilesToPS*(dirin: cstring; substr: cstring; res: LInt32;
                       fileout: cstring): LOk {.importc: "convertFilesToPS".}
proc sarrayConvertFilesToPS*(sa: ptr Sarray; res: LInt32; fileout: cstring): LOk {.
    importc: "sarrayConvertFilesToPS".}
proc convertFilesFittedToPS*(dirin: cstring; substr: cstring; xpts: LFloat32;
                             ypts: LFloat32; fileout: cstring): LOk {.
    importc: "convertFilesFittedToPS".}
proc sarrayConvertFilesFittedToPS*(sa: ptr Sarray; xpts: LFloat32;
                                   ypts: LFloat32; fileout: cstring): LOk {.
    importc: "sarrayConvertFilesFittedToPS".}
proc writeImageCompressedToPSFile*(filein: cstring; fileout: cstring;
                                   res: LInt32; pindex: ptr LInt32): LOk {.
    importc: "writeImageCompressedToPSFile".}
proc convertSegmentedPagesToPS*(pagedir: cstring; pagestr: cstring;
                                pageNumpre: LInt32; maskdir: cstring;
                                maskstr: cstring; maskNumpre: LInt32;
                                numpost: LInt32; maxnum: LInt32;
                                textscale: LFloat32; imagescale: LFloat32;
                                threshold: LInt32; fileout: cstring): LOk {.
    importc: "convertSegmentedPagesToPS".}
proc pixWriteSegmentedPageToPS*(pixs: ptr Pix; pixm: ptr Pix;
                                textscale: LFloat32; imagescale: LFloat32;
                                threshold: LInt32; pageno: LInt32;
                                fileout: cstring): LOk {.
    importc: "pixWriteSegmentedPageToPS".}
proc pixWriteMixedToPS*(pixb: ptr Pix; pixc: ptr Pix; scale: LFloat32;
                        pageno: LInt32; fileout: cstring): LOk {.
    importc: "pixWriteMixedToPS".}
proc convertToPSEmbed*(filein: cstring; fileout: cstring; level: LInt32): LOk {.
    importc: "convertToPSEmbed".}
proc pixaWriteCompressedToPS*(pixa: ptr Pixa; fileout: cstring; res: LInt32;
                              level: LInt32): LOk {.
    importc: "pixaWriteCompressedToPS".}
proc pixWriteCompressedToPS*(pix: ptr Pix; fileout: cstring; res: LInt32;
                             level: LInt32; pindex: ptr LInt32): LOk {.
    importc: "pixWriteCompressedToPS".}
proc pixWritePSEmbed*(filein: cstring; fileout: cstring): LOk {.
    importc: "pixWritePSEmbed".}
proc pixWriteStreamPS*(fp: ptr File; pix: ptr Pix; box: ptr Box; res: LInt32;
                       scale: LFloat32): LOk {.importc: "pixWriteStreamPS".}
proc pixWriteStringPS*(pixs: ptr Pix; box: ptr Box; res: LInt32; scale: LFloat32): cstring {.
    importc: "pixWriteStringPS".}
proc generateUncompressedPS*(hexdata: cstring; w: LInt32; h: LInt32; d: LInt32;
                             psbpl: LInt32; bps: LInt32; xpt: LFloat32;
                             ypt: LFloat32; wpt: LFloat32; hpt: LFloat32;
                             boxflag: LInt32): cstring {.
    importc: "generateUncompressedPS".}
proc convertJpegToPSEmbed*(filein: cstring; fileout: cstring): LOk {.
    importc: "convertJpegToPSEmbed".}
proc convertJpegToPS*(filein: cstring; fileout: cstring; operation: cstring;
                      x: LInt32; y: LInt32; res: LInt32; scale: LFloat32;
                      pageno: LInt32; endpage: LInt32): LOk {.
    importc: "convertJpegToPS".}
proc convertG4ToPSEmbed*(filein: cstring; fileout: cstring): LOk {.
    importc: "convertG4ToPSEmbed".}
proc convertG4ToPS*(filein: cstring; fileout: cstring; operation: cstring;
                    x: LInt32; y: LInt32; res: LInt32; scale: LFloat32;
                    pageno: LInt32; maskflag: LInt32; endpage: LInt32): LOk {.
    importc: "convertG4ToPS".}
proc convertTiffMultipageToPS*(filein: cstring; fileout: cstring;
                               fillfract: LFloat32): LOk {.
    importc: "convertTiffMultipageToPS".}
proc convertFlateToPSEmbed*(filein: cstring; fileout: cstring): LOk {.
    importc: "convertFlateToPSEmbed".}
proc convertFlateToPS*(filein: cstring; fileout: cstring; operation: cstring;
                       x: LInt32; y: LInt32; res: LInt32; scale: LFloat32;
                       pageno: LInt32; endpage: LInt32): LOk {.
    importc: "convertFlateToPS".}
proc pixWriteMemPS*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix;
                    box: ptr Box; res: LInt32; scale: LFloat32): LOk {.
    importc: "pixWriteMemPS".}
proc getResLetterPage*(w: LInt32; h: LInt32; fillfract: LFloat32): LInt32 {.
    importc: "getResLetterPage".}
proc getResA4Page*(w: LInt32; h: LInt32; fillfract: LFloat32): LInt32 {.
    importc: "getResA4Page".}
proc lPsWriteBoundingBox*(flag: LInt32) {.importc: "l_psWriteBoundingBox".}
proc ptaCreate*(n: LInt32): ptr Pta {.importc: "ptaCreate".}
proc ptaCreateFromNuma*(nax: ptr Numa; nay: ptr Numa): ptr Pta {.
    importc: "ptaCreateFromNuma".}
proc ptaDestroy*(ppta: ptr ptr Pta) {.importc: "ptaDestroy".}
proc ptaCopy*(pta: ptr Pta): ptr Pta {.importc: "ptaCopy".}
proc ptaCopyRange*(ptas: ptr Pta; istart: LInt32; iend: LInt32): ptr Pta {.
    importc: "ptaCopyRange".}
proc ptaClone*(pta: ptr Pta): ptr Pta {.importc: "ptaClone".}
proc ptaEmpty*(pta: ptr Pta): LOk {.importc: "ptaEmpty".}
proc ptaAddPt*(pta: ptr Pta; x: LFloat32; y: LFloat32): LOk {.
    importc: "ptaAddPt".}
proc ptaInsertPt*(pta: ptr Pta; index: LInt32; x: LInt32; y: LInt32): LOk {.
    importc: "ptaInsertPt".}
proc ptaRemovePt*(pta: ptr Pta; index: LInt32): LOk {.importc: "ptaRemovePt".}
proc ptaGetCount*(pta: ptr Pta): LInt32 {.importc: "ptaGetCount".}
proc ptaGetPt*(pta: ptr Pta; index: LInt32; px: ptr LFloat32; py: ptr LFloat32): LOk {.
    importc: "ptaGetPt".}
proc ptaGetIPt*(pta: ptr Pta; index: LInt32; px: ptr LInt32; py: ptr LInt32): LOk {.
    importc: "ptaGetIPt".}
proc ptaSetPt*(pta: ptr Pta; index: LInt32; x: LFloat32; y: LFloat32): LOk {.
    importc: "ptaSetPt".}
proc ptaGetArrays*(pta: ptr Pta; pnax: ptr ptr Numa; pnay: ptr ptr Numa): LOk {.
    importc: "ptaGetArrays".}
proc ptaRead*(filename: cstring): ptr Pta {.importc: "ptaRead".}
proc ptaReadStream*(fp: ptr File): ptr Pta {.importc: "ptaReadStream".}
proc ptaReadMem*(data: ptr LUint8; size: csize_t): ptr Pta {.
    importc: "ptaReadMem".}
proc ptaWriteDebug*(filename: cstring; pta: ptr Pta; `type`: LInt32): LOk {.
    importc: "ptaWriteDebug".}
proc ptaWrite*(filename: cstring; pta: ptr Pta; `type`: LInt32): LOk {.
    importc: "ptaWrite".}
proc ptaWriteStream*(fp: ptr File; pta: ptr Pta; `type`: LInt32): LOk {.
    importc: "ptaWriteStream".}
proc ptaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; pta: ptr Pta;
                  `type`: LInt32): LOk {.importc: "ptaWriteMem".}
proc ptaaCreate*(n: LInt32): ptr Ptaa {.importc: "ptaaCreate".}
proc ptaaDestroy*(pptaa: ptr ptr Ptaa) {.importc: "ptaaDestroy".}
proc ptaaAddPta*(ptaa: ptr Ptaa; pta: ptr Pta; copyflag: LInt32): LOk {.
    importc: "ptaaAddPta".}
proc ptaaGetCount*(ptaa: ptr Ptaa): LInt32 {.importc: "ptaaGetCount".}
proc ptaaGetPta*(ptaa: ptr Ptaa; index: LInt32; accessflag: LInt32): ptr Pta {.
    importc: "ptaaGetPta".}
proc ptaaGetPt*(ptaa: ptr Ptaa; ipta: LInt32; jpt: LInt32; px: ptr LFloat32;
                py: ptr LFloat32): LOk {.importc: "ptaaGetPt".}
proc ptaaInitFull*(ptaa: ptr Ptaa; pta: ptr Pta): LOk {.importc: "ptaaInitFull".}
proc ptaaReplacePta*(ptaa: ptr Ptaa; index: LInt32; pta: ptr Pta): LOk {.
    importc: "ptaaReplacePta".}
proc ptaaAddPt*(ptaa: ptr Ptaa; ipta: LInt32; x: LFloat32; y: LFloat32): LOk {.
    importc: "ptaaAddPt".}
proc ptaaTruncate*(ptaa: ptr Ptaa): LOk {.importc: "ptaaTruncate".}
proc ptaaRead*(filename: cstring): ptr Ptaa {.importc: "ptaaRead".}
proc ptaaReadStream*(fp: ptr File): ptr Ptaa {.importc: "ptaaReadStream".}
proc ptaaReadMem*(data: ptr LUint8; size: csize_t): ptr Ptaa {.
    importc: "ptaaReadMem".}
proc ptaaWriteDebug*(filename: cstring; ptaa: ptr Ptaa; `type`: LInt32): LOk {.
    importc: "ptaaWriteDebug".}
proc ptaaWrite*(filename: cstring; ptaa: ptr Ptaa; `type`: LInt32): LOk {.
    importc: "ptaaWrite".}
proc ptaaWriteStream*(fp: ptr File; ptaa: ptr Ptaa; `type`: LInt32): LOk {.
    importc: "ptaaWriteStream".}
proc ptaaWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; ptaa: ptr Ptaa;
                   `type`: LInt32): LOk {.importc: "ptaaWriteMem".}
proc ptaSubsample*(ptas: ptr Pta; subfactor: LInt32): ptr Pta {.
    importc: "ptaSubsample".}
proc ptaJoin*(ptad: ptr Pta; ptas: ptr Pta; istart: LInt32; iend: LInt32): LOk {.
    importc: "ptaJoin".}
proc ptaaJoin*(ptaad: ptr Ptaa; ptaas: ptr Ptaa; istart: LInt32; iend: LInt32): LOk {.
    importc: "ptaaJoin".}
proc ptaReverse*(ptas: ptr Pta; `type`: LInt32): ptr Pta {.
    importc: "ptaReverse".}
proc ptaTranspose*(ptas: ptr Pta): ptr Pta {.importc: "ptaTranspose".}
proc ptaCyclicPerm*(ptas: ptr Pta; xs: LInt32; ys: LInt32): ptr Pta {.
    importc: "ptaCyclicPerm".}
proc ptaSelectRange*(ptas: ptr Pta; first: LInt32; last: LInt32): ptr Pta {.
    importc: "ptaSelectRange".}
proc ptaGetBoundingRegion*(pta: ptr Pta): ptr Box {.
    importc: "ptaGetBoundingRegion".}
proc ptaGetRange*(pta: ptr Pta; pminx: ptr LFloat32; pmaxx: ptr LFloat32;
                  pminy: ptr LFloat32; pmaxy: ptr LFloat32): LOk {.
    importc: "ptaGetRange".}
proc ptaGetInsideBox*(ptas: ptr Pta; box: ptr Box): ptr Pta {.
    importc: "ptaGetInsideBox".}
proc pixFindCornerPixels*(pixs: ptr Pix): ptr Pta {.
    importc: "pixFindCornerPixels".}
proc ptaContainsPt*(pta: ptr Pta; x: LInt32; y: LInt32): LInt32 {.
    importc: "ptaContainsPt".}
proc ptaTestIntersection*(pta1: ptr Pta; pta2: ptr Pta): LInt32 {.
    importc: "ptaTestIntersection".}
proc ptaTransform*(ptas: ptr Pta; shiftx: LInt32; shifty: LInt32;
                   scalex: LFloat32; scaley: LFloat32): ptr Pta {.
    importc: "ptaTransform".}
proc ptaPtInsidePolygon*(pta: ptr Pta; x: LFloat32; y: LFloat32;
                         pinside: ptr LInt32): LInt32 {.
    importc: "ptaPtInsidePolygon".}
proc lAngleBetweenVectors*(x1: LFloat32; y1: LFloat32; x2: LFloat32;
                           y2: LFloat32): LFloat32 {.
    importc: "l_angleBetweenVectors".}
proc ptaPolygonIsConvex*(pta: ptr Pta; pisconvex: ptr LInt32): LInt32 {.
    importc: "ptaPolygonIsConvex".}
proc ptaGetMinMax*(pta: ptr Pta; pxmin: ptr LFloat32; pymin: ptr LFloat32;
                   pxmax: ptr LFloat32; pymax: ptr LFloat32): LOk {.
    importc: "ptaGetMinMax".}
proc ptaSelectByValue*(ptas: ptr Pta; xth: LFloat32; yth: LFloat32;
                       `type`: LInt32; relation: LInt32): ptr Pta {.
    importc: "ptaSelectByValue".}
proc ptaCropToMask*(ptas: ptr Pta; pixm: ptr Pix): ptr Pta {.
    importc: "ptaCropToMask".}
proc ptaGetLinearLSF*(pta: ptr Pta; pa: ptr LFloat32; pb: ptr LFloat32;
                      pnafit: ptr ptr Numa): LOk {.importc: "ptaGetLinearLSF".}
proc ptaGetQuadraticLSF*(pta: ptr Pta; pa: ptr LFloat32; pb: ptr LFloat32;
                         pc: ptr LFloat32; pnafit: ptr ptr Numa): LOk {.
    importc: "ptaGetQuadraticLSF".}
proc ptaGetCubicLSF*(pta: ptr Pta; pa: ptr LFloat32; pb: ptr LFloat32;
                     pc: ptr LFloat32; pd: ptr LFloat32; pnafit: ptr ptr Numa): LOk {.
    importc: "ptaGetCubicLSF".}
proc ptaGetQuarticLSF*(pta: ptr Pta; pa: ptr LFloat32; pb: ptr LFloat32;
                       pc: ptr LFloat32; pd: ptr LFloat32; pe: ptr LFloat32;
                       pnafit: ptr ptr Numa): LOk {.importc: "ptaGetQuarticLSF".}
proc ptaNoisyLinearLSF*(pta: ptr Pta; factor: LFloat32; pptad: ptr ptr Pta;
                        pa: ptr LFloat32; pb: ptr LFloat32;
                        pmederr: ptr LFloat32; pnafit: ptr ptr Numa): LOk {.
    importc: "ptaNoisyLinearLSF".}
proc ptaNoisyQuadraticLSF*(pta: ptr Pta; factor: LFloat32; pptad: ptr ptr Pta;
                           pa: ptr LFloat32; pb: ptr LFloat32; pc: ptr LFloat32;
                           pmederr: ptr LFloat32; pnafit: ptr ptr Numa): LOk {.
    importc: "ptaNoisyQuadraticLSF".}
proc applyLinearFit*(a: LFloat32; b: LFloat32; x: LFloat32; py: ptr LFloat32): LOk {.
    importc: "applyLinearFit".}
proc applyQuadraticFit*(a: LFloat32; b: LFloat32; c: LFloat32; x: LFloat32;
                        py: ptr LFloat32): LOk {.importc: "applyQuadraticFit".}
proc applyCubicFit*(a: LFloat32; b: LFloat32; c: LFloat32; d: LFloat32;
                    x: LFloat32; py: ptr LFloat32): LOk {.
    importc: "applyCubicFit".}
proc applyQuarticFit*(a: LFloat32; b: LFloat32; c: LFloat32; d: LFloat32;
                      e: LFloat32; x: LFloat32; py: ptr LFloat32): LOk {.
    importc: "applyQuarticFit".}
proc pixPlotAlongPta*(pixs: ptr Pix; pta: ptr Pta; outformat: LInt32;
                      title: cstring): LOk {.importc: "pixPlotAlongPta".}
proc ptaGetPixelsFromPix*(pixs: ptr Pix; box: ptr Box): ptr Pta {.
    importc: "ptaGetPixelsFromPix".}
proc pixGenerateFromPta*(pta: ptr Pta; w: LInt32; h: LInt32): ptr Pix {.
    importc: "pixGenerateFromPta".}
proc ptaGetBoundaryPixels*(pixs: ptr Pix; `type`: LInt32): ptr Pta {.
    importc: "ptaGetBoundaryPixels".}
proc ptaaGetBoundaryPixels*(pixs: ptr Pix; `type`: LInt32; connectivity: LInt32;
                            pboxa: ptr ptr Boxa; ppixa: ptr ptr Pixa): ptr Ptaa {.
    importc: "ptaaGetBoundaryPixels".}
proc ptaaIndexLabeledPixels*(pixs: ptr Pix; pncc: ptr LInt32): ptr Ptaa {.
    importc: "ptaaIndexLabeledPixels".}
proc ptaGetNeighborPixLocs*(pixs: ptr Pix; x: LInt32; y: LInt32; conn: LInt32): ptr Pta {.
    importc: "ptaGetNeighborPixLocs".}
proc numaConvertToPta1*(na: ptr Numa): ptr Pta {.importc: "numaConvertToPta1".}
proc numaConvertToPta2*(nax: ptr Numa; nay: ptr Numa): ptr Pta {.
    importc: "numaConvertToPta2".}
proc ptaConvertToNuma*(pta: ptr Pta; pnax: ptr ptr Numa; pnay: ptr ptr Numa): LOk {.
    importc: "ptaConvertToNuma".}
proc pixDisplayPta*(pixd: ptr Pix; pixs: ptr Pix; pta: ptr Pta): ptr Pix {.
    importc: "pixDisplayPta".}
proc pixDisplayPtaaPattern*(pixd: ptr Pix; pixs: ptr Pix; ptaa: ptr Ptaa;
                            pixp: ptr Pix; cx: LInt32; cy: LInt32): ptr Pix {.
    importc: "pixDisplayPtaaPattern".}
proc pixDisplayPtaPattern*(pixd: ptr Pix; pixs: ptr Pix; pta: ptr Pta;
                           pixp: ptr Pix; cx: LInt32; cy: LInt32; color: LUint32): ptr Pix {.
    importc: "pixDisplayPtaPattern".}
proc ptaReplicatePattern*(ptas: ptr Pta; pixp: ptr Pix; ptap: ptr Pta;
                          cx: LInt32; cy: LInt32; w: LInt32; h: LInt32): ptr Pta {.
    importc: "ptaReplicatePattern".}
proc pixDisplayPtaa*(pixs: ptr Pix; ptaa: ptr Ptaa): ptr Pix {.
    importc: "pixDisplayPtaa".}
proc ptaSort*(ptas: ptr Pta; sorttype: LInt32; sortorder: LInt32;
              pnaindex: ptr ptr Numa): ptr Pta {.importc: "ptaSort".}
proc ptaGetSortIndex*(ptas: ptr Pta; sorttype: LInt32; sortorder: LInt32;
                      pnaindex: ptr ptr Numa): LOk {.importc: "ptaGetSortIndex".}
proc ptaSortByIndex*(ptas: ptr Pta; naindex: ptr Numa): ptr Pta {.
    importc: "ptaSortByIndex".}
proc ptaaSortByIndex*(ptaas: ptr Ptaa; naindex: ptr Numa): ptr Ptaa {.
    importc: "ptaaSortByIndex".}
proc ptaGetRankValue*(pta: ptr Pta; fract: LFloat32; ptasort: ptr Pta;
                      sorttype: LInt32; pval: ptr LFloat32): LOk {.
    importc: "ptaGetRankValue".}
proc ptaSort2d*(pta: ptr Pta): ptr Pta {.importc: "ptaSort2d".}
proc ptaEqual*(pta1: ptr Pta; pta2: ptr Pta; psame: ptr LInt32): LOk {.
    importc: "ptaEqual".}
proc lAsetCreateFromPta*(pta: ptr Pta): ptr L_Aset {.
    importc: "l_asetCreateFromPta".}
proc ptaRemoveDupsByAset*(ptas: ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "ptaRemoveDupsByAset".}
proc ptaUnionByAset*(pta1: ptr Pta; pta2: ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "ptaUnionByAset".}
proc ptaIntersectionByAset*(pta1: ptr Pta; pta2: ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "ptaIntersectionByAset".}
proc lHmapCreateFromPta*(pta: ptr Pta): ptr L_Hashmap {.
    importc: "l_hmapCreateFromPta".}
proc ptaRemoveDupsByHmap*(ptas: ptr Pta; pptad: ptr ptr Pta;
                          phmap: ptr ptr L_Hashmap): LOk {.
    importc: "ptaRemoveDupsByHmap".}
proc ptaUnionByHmap*(pta1: ptr Pta; pta2: ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "ptaUnionByHmap".}
proc ptaIntersectionByHmap*(pta1: ptr Pta; pta2: ptr Pta; pptad: ptr ptr Pta): LOk {.
    importc: "ptaIntersectionByHmap".}
proc ptraCreate*(n: LInt32): ptr L_Ptra {.importc: "ptraCreate".}
proc ptraDestroy*(ppa: ptr ptr L_Ptra; freeflag: LInt32; warnflag: LInt32) {.
    importc: "ptraDestroy".}
proc ptraAdd*(pa: ptr L_Ptra; item: pointer): LOk {.importc: "ptraAdd".}
proc ptraInsert*(pa: ptr L_Ptra; index: LInt32; item: pointer; shiftflag: LInt32): LOk {.
    importc: "ptraInsert".}
proc ptraRemove*(pa: ptr L_Ptra; index: LInt32; flag: LInt32): pointer {.
    importc: "ptraRemove".}
proc ptraRemoveLast*(pa: ptr L_Ptra): pointer {.importc: "ptraRemoveLast".}
proc ptraReplace*(pa: ptr L_Ptra; index: LInt32; item: pointer; freeflag: LInt32): pointer {.
    importc: "ptraReplace".}
proc ptraSwap*(pa: ptr L_Ptra; index1: LInt32; index2: LInt32): LOk {.
    importc: "ptraSwap".}
proc ptraCompactArray*(pa: ptr L_Ptra): LOk {.importc: "ptraCompactArray".}
proc ptraReverse*(pa: ptr L_Ptra): LOk {.importc: "ptraReverse".}
proc ptraJoin*(pa1: ptr L_Ptra; pa2: ptr L_Ptra): LOk {.importc: "ptraJoin".}
proc ptraGetMaxIndex*(pa: ptr L_Ptra; pmaxindex: ptr LInt32): LOk {.
    importc: "ptraGetMaxIndex".}
proc ptraGetActualCount*(pa: ptr L_Ptra; pcount: ptr LInt32): LOk {.
    importc: "ptraGetActualCount".}
proc ptraGetPtrToItem*(pa: ptr L_Ptra; index: LInt32): pointer {.
    importc: "ptraGetPtrToItem".}
proc ptraaCreate*(n: LInt32): ptr L_Ptraa {.importc: "ptraaCreate".}
proc ptraaDestroy*(ppaa: ptr ptr L_Ptraa; freeflag: LInt32; warnflag: LInt32) {.
    importc: "ptraaDestroy".}
proc ptraaGetSize*(paa: ptr L_Ptraa; psize: ptr LInt32): LOk {.
    importc: "ptraaGetSize".}
proc ptraaInsertPtra*(paa: ptr L_Ptraa; index: LInt32; pa: ptr L_Ptra): LOk {.
    importc: "ptraaInsertPtra".}
proc ptraaGetPtra*(paa: ptr L_Ptraa; index: LInt32; accessflag: LInt32): ptr L_Ptra {.
    importc: "ptraaGetPtra".}
proc ptraaFlattenToPtra*(paa: ptr L_Ptraa): ptr L_Ptra {.
    importc: "ptraaFlattenToPtra".}
proc pixQuadtreeMean*(pixs: ptr Pix; nlevels: LInt32; pixMa: ptr Pix;
                      pfpixa: ptr ptr Fpixa): LOk {.importc: "pixQuadtreeMean".}
proc pixQuadtreeVariance*(pixs: ptr Pix; nlevels: LInt32; pixMa: ptr Pix;
                          dpixMsa: ptr Dpix; pfpixaV: ptr ptr Fpixa;
                          pfpixaRv: ptr ptr Fpixa): LOk {.
    importc: "pixQuadtreeVariance".}
proc pixMeanInRectangle*(pixs: ptr Pix; box: ptr Box; pixma: ptr Pix;
                         pval: ptr LFloat32): LOk {.
    importc: "pixMeanInRectangle".}
proc pixVarianceInRectangle*(pixs: ptr Pix; box: ptr Box; pixMa: ptr Pix;
                             dpixMsa: ptr Dpix; pvar: ptr LFloat32;
                             prvar: ptr LFloat32): LOk {.
    importc: "pixVarianceInRectangle".}
proc boxaaQuadtreeRegions*(w: LInt32; h: LInt32; nlevels: LInt32): ptr Boxaa {.
    importc: "boxaaQuadtreeRegions".}
proc quadtreeGetParent*(fpixa: ptr Fpixa; level: LInt32; x: LInt32; y: LInt32;
                        pval: ptr LFloat32): LOk {.importc: "quadtreeGetParent".}
proc quadtreeGetChildren*(fpixa: ptr Fpixa; level: LInt32; x: LInt32; y: LInt32;
                          pval00: ptr LFloat32; pval10: ptr LFloat32;
                          pval01: ptr LFloat32; pval11: ptr LFloat32): LOk {.
    importc: "quadtreeGetChildren".}
proc quadtreeMaxLevels*(w: LInt32; h: LInt32): LInt32 {.
    importc: "quadtreeMaxLevels".}
proc fpixaDisplayQuadtree*(fpixa: ptr Fpixa; factor: LInt32; fontsize: LInt32): ptr Pix {.
    importc: "fpixaDisplayQuadtree".}
proc lqueueCreate*(nalloc: LInt32): ptr L_Queue {.importc: "lqueueCreate".}
proc lqueueDestroy*(plq: ptr ptr L_Queue; freeflag: LInt32) {.
    importc: "lqueueDestroy".}
proc lqueueAdd*(lq: ptr L_Queue; item: pointer): LOk {.importc: "lqueueAdd".}
proc lqueueRemove*(lq: ptr L_Queue): pointer {.importc: "lqueueRemove".}
proc lqueueGetCount*(lq: ptr L_Queue): LInt32 {.importc: "lqueueGetCount".}
proc lqueuePrint*(fp: ptr File; lq: ptr L_Queue): LOk {.importc: "lqueuePrint".}
proc pixRankFilter*(pixs: ptr Pix; wf: LInt32; hf: LInt32; rank: LFloat32): ptr Pix {.
    importc: "pixRankFilter".}
proc pixRankFilterRGB*(pixs: ptr Pix; wf: LInt32; hf: LInt32; rank: LFloat32): ptr Pix {.
    importc: "pixRankFilterRGB".}
proc pixRankFilterGray*(pixs: ptr Pix; wf: LInt32; hf: LInt32; rank: LFloat32): ptr Pix {.
    importc: "pixRankFilterGray".}
proc pixMedianFilter*(pixs: ptr Pix; wf: LInt32; hf: LInt32): ptr Pix {.
    importc: "pixMedianFilter".}
proc pixRankFilterWithScaling*(pixs: ptr Pix; wf: LInt32; hf: LInt32;
                               rank: LFloat32; scalefactor: LFloat32): ptr Pix {.
    importc: "pixRankFilterWithScaling".}
proc lRbtreeCreate*(keytype: LInt32): ptr L_Rbtree {.importc: "l_rbtreeCreate".}
proc lRbtreeLookup*(t: ptr L_Rbtree; key: Rb_Type): ptr Rb_Type {.
    importc: "l_rbtreeLookup".}
proc lRbtreeInsert*(t: ptr L_Rbtree; key: Rb_Type; value: Rb_Type) {.
    importc: "l_rbtreeInsert".}
proc lRbtreeDelete*(t: ptr L_Rbtree; key: Rb_Type) {.importc: "l_rbtreeDelete".}
proc lRbtreeDestroy*(pt: ptr ptr L_Rbtree) {.importc: "l_rbtreeDestroy".}
proc lRbtreeGetFirst*(t: ptr L_Rbtree): ptr L_Rbtree_Node {.
    importc: "l_rbtreeGetFirst".}
proc lRbtreeGetNext*(n: ptr L_Rbtree_Node): ptr L_Rbtree_Node {.
    importc: "l_rbtreeGetNext".}
proc lRbtreeGetLast*(t: ptr L_Rbtree): ptr L_Rbtree_Node {.
    importc: "l_rbtreeGetLast".}
proc lRbtreeGetPrev*(n: ptr L_Rbtree_Node): ptr L_Rbtree_Node {.
    importc: "l_rbtreeGetPrev".}
proc lRbtreeGetCount*(t: ptr L_Rbtree): LInt32 {.importc: "l_rbtreeGetCount".}
proc lRbtreePrint*(fp: ptr File; t: ptr L_Rbtree) {.importc: "l_rbtreePrint".}
proc pixProcessBarcodes*(pixs: ptr Pix; format: LInt32; `method`: LInt32;
                         psaw: ptr ptr Sarray; debugflag: LInt32): ptr Sarray {.
    importc: "pixProcessBarcodes".}
proc pixExtractBarcodes*(pixs: ptr Pix; debugflag: LInt32): ptr Pixa {.
    importc: "pixExtractBarcodes".}
proc pixReadBarcodes*(pixa: ptr Pixa; format: LInt32; `method`: LInt32;
                      psaw: ptr ptr Sarray; debugflag: LInt32): ptr Sarray {.
    importc: "pixReadBarcodes".}
proc pixReadBarcodeWidths*(pixs: ptr Pix; `method`: LInt32; debugflag: LInt32): ptr Numa {.
    importc: "pixReadBarcodeWidths".}
proc pixLocateBarcodes*(pixs: ptr Pix; thresh: LInt32; ppixb: ptr ptr Pix;
                        ppixm: ptr ptr Pix): ptr Boxa {.
    importc: "pixLocateBarcodes".}
proc pixDeskewBarcode*(pixs: ptr Pix; pixb: ptr Pix; box: ptr Box;
                       margin: LInt32; threshold: LInt32; pangle: ptr LFloat32;
                       pconf: ptr LFloat32): ptr Pix {.
    importc: "pixDeskewBarcode".}
proc pixExtractBarcodeWidths1*(pixs: ptr Pix; thresh: LFloat32;
                               binfract: LFloat32; pnaehist: ptr ptr Numa;
                               pnaohist: ptr ptr Numa; debugflag: LInt32): ptr Numa {.
    importc: "pixExtractBarcodeWidths1".}
proc pixExtractBarcodeWidths2*(pixs: ptr Pix; thresh: LFloat32;
                               pwidth: ptr LFloat32; pnac: ptr ptr Numa;
                               debugflag: LInt32): ptr Numa {.
    importc: "pixExtractBarcodeWidths2".}
proc pixExtractBarcodeCrossings*(pixs: ptr Pix; thresh: LFloat32;
                                 debugflag: LInt32): ptr Numa {.
    importc: "pixExtractBarcodeCrossings".}
proc numaQuantizeCrossingsByWidth*(nas: ptr Numa; binfract: LFloat32;
                                   pnaehist: ptr ptr Numa;
                                   pnaohist: ptr ptr Numa; debugflag: LInt32): ptr Numa {.
    importc: "numaQuantizeCrossingsByWidth".}
proc numaQuantizeCrossingsByWindow*(nas: ptr Numa; ratio: LFloat32;
                                    pwidth: ptr LFloat32;
                                    pfirstloc: ptr LFloat32; pnac: ptr ptr Numa;
                                    debugflag: LInt32): ptr Numa {.
    importc: "numaQuantizeCrossingsByWindow".}
proc pixaReadFiles*(dirname: cstring; substr: cstring): ptr Pixa {.
    importc: "pixaReadFiles".}
proc pixaReadFilesSA*(sa: ptr Sarray): ptr Pixa {.importc: "pixaReadFilesSA".}
proc pixRead*(filename: cstring): ptr Pix {.importc: "pixRead".}
proc pixReadWithHint*(filename: cstring; hint: LInt32): ptr Pix {.
    importc: "pixReadWithHint".}
proc pixReadIndexed*(sa: ptr Sarray; index: LInt32): ptr Pix {.
    importc: "pixReadIndexed".}
proc pixReadStream*(fp: ptr File; hint: LInt32): ptr Pix {.
    importc: "pixReadStream".}
proc pixReadHeader*(filename: cstring; pformat: ptr LInt32; pw: ptr LInt32;
                    ph: ptr LInt32; pbps: ptr LInt32; pspp: ptr LInt32;
                    piscmap: ptr LInt32): LOk {.importc: "pixReadHeader".}
proc findFileFormat*(filename: cstring; pformat: ptr LInt32): LOk {.
    importc: "findFileFormat".}
proc findFileFormatStream*(fp: ptr File; pformat: ptr LInt32): LOk {.
    importc: "findFileFormatStream".}
proc findFileFormatBuffer*(buf: ptr LUint8; pformat: ptr LInt32): LOk {.
    importc: "findFileFormatBuffer".}
proc fileFormatIsTiff*(fp: ptr File): LInt32 {.importc: "fileFormatIsTiff".}
proc pixReadMem*(data: ptr LUint8; size: csize_t): ptr Pix {.
    importc: "pixReadMem".}
proc pixReadHeaderMem*(data: ptr LUint8; size: csize_t; pformat: ptr LInt32;
                       pw: ptr LInt32; ph: ptr LInt32; pbps: ptr LInt32;
                       pspp: ptr LInt32; piscmap: ptr LInt32): LOk {.
    importc: "pixReadHeaderMem".}
proc writeImageFileInfo*(filename: cstring; fpout: ptr File; headeronly: LInt32): LOk {.
    importc: "writeImageFileInfo".}
proc ioFormatTest*(filename: cstring): LOk {.importc: "ioFormatTest".}
proc recogCreateFromRecog*(recs: ptr L_Recog; scalew: LInt32; scaleh: LInt32;
                           linew: LInt32; threshold: LInt32; maxyshift: LInt32): ptr L_Recog {.
    importc: "recogCreateFromRecog".}
proc recogCreateFromPixa*(pixa: ptr Pixa; scalew: LInt32; scaleh: LInt32;
                          linew: LInt32; threshold: LInt32; maxyshift: LInt32): ptr L_Recog {.
    importc: "recogCreateFromPixa".}
proc recogCreateFromPixaNoFinish*(pixa: ptr Pixa; scalew: LInt32;
                                  scaleh: LInt32; linew: LInt32;
                                  threshold: LInt32; maxyshift: LInt32): ptr L_Recog {.
    importc: "recogCreateFromPixaNoFinish".}
proc recogCreate*(scalew: LInt32; scaleh: LInt32; linew: LInt32;
                  threshold: LInt32; maxyshift: LInt32): ptr L_Recog {.
    importc: "recogCreate".}
proc recogDestroy*(precog: ptr ptr L_Recog) {.importc: "recogDestroy".}
proc recogGetCount*(recog: ptr L_Recog): LInt32 {.importc: "recogGetCount".}
proc recogSetParams*(recog: ptr L_Recog; `type`: LInt32; minNopad: LInt32;
                     maxWhRatio: LFloat32; maxHtRatio: LFloat32): LOk {.
    importc: "recogSetParams".}
proc recogGetClassIndex*(recog: ptr L_Recog; val: LInt32; text: cstring;
                         pindex: ptr LInt32): LInt32 {.
    importc: "recogGetClassIndex".}
proc recogStringToIndex*(recog: ptr L_Recog; text: cstring; pindex: ptr LInt32): LOk {.
    importc: "recogStringToIndex".}
proc recogGetClassString*(recog: ptr L_Recog; index: LInt32;
                          pcharstr: cstringArray): LInt32 {.
    importc: "recogGetClassString".}
proc lConvertCharstrToInt*(str: cstring; pval: ptr LInt32): LOk {.
    importc: "l_convertCharstrToInt".}
proc recogRead*(filename: cstring): ptr L_Recog {.importc: "recogRead".}
proc recogReadStream*(fp: ptr File): ptr L_Recog {.importc: "recogReadStream".}
proc recogReadMem*(data: ptr LUint8; size: csize_t): ptr L_Recog {.
    importc: "recogReadMem".}
proc recogWrite*(filename: cstring; recog: ptr L_Recog): LOk {.
    importc: "recogWrite".}
proc recogWriteStream*(fp: ptr File; recog: ptr L_Recog): LOk {.
    importc: "recogWriteStream".}
proc recogWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                    recog: ptr L_Recog): LOk {.importc: "recogWriteMem".}
proc recogExtractPixa*(recog: ptr L_Recog): ptr Pixa {.
    importc: "recogExtractPixa".}
proc recogDecode*(recog: ptr L_Recog; pixs: ptr Pix; nlevels: LInt32;
                  ppixdb: ptr ptr Pix): ptr Boxa {.importc: "recogDecode".}
proc recogCreateDid*(recog: ptr L_Recog; pixs: ptr Pix): LOk {.
    importc: "recogCreateDid".}
proc recogDestroyDid*(recog: ptr L_Recog): LOk {.importc: "recogDestroyDid".}
proc recogDidExists*(recog: ptr L_Recog): LInt32 {.importc: "recogDidExists".}
proc recogGetDid*(recog: ptr L_Recog): ptr L_Rdid {.importc: "recogGetDid".}
proc recogSetChannelParams*(recog: ptr L_Recog; nlevels: LInt32): LOk {.
    importc: "recogSetChannelParams".}
proc recogIdentifyMultiple*(recog: ptr L_Recog; pixs: ptr Pix; minh: LInt32;
                            skipsplit: LInt32; pboxa: ptr ptr Boxa;
                            ppixa: ptr ptr Pixa; ppixdb: ptr ptr Pix;
                            debugsplit: LInt32): LOk {.
    importc: "recogIdentifyMultiple".}
proc recogSplitIntoCharacters*(recog: ptr L_Recog; pixs: ptr Pix; minh: LInt32;
                               skipsplit: LInt32; pboxa: ptr ptr Boxa;
                               ppixa: ptr ptr Pixa; debug: LInt32): LOk {.
    importc: "recogSplitIntoCharacters".}
proc recogCorrelationBestRow*(recog: ptr L_Recog; pixs: ptr Pix;
                              pboxa: ptr ptr Boxa; pnascore: ptr ptr Numa;
                              pnaindex: ptr ptr Numa; psachar: ptr ptr Sarray;
                              debug: LInt32): LOk {.
    importc: "recogCorrelationBestRow".}
proc recogCorrelationBestChar*(recog: ptr L_Recog; pixs: ptr Pix;
                               pbox: ptr ptr Box; pscore: ptr LFloat32;
                               pindex: ptr LInt32; pcharstr: cstringArray;
                               ppixdb: ptr ptr Pix): LOk {.
    importc: "recogCorrelationBestChar".}
proc recogIdentifyPixa*(recog: ptr L_Recog; pixa: ptr Pixa; ppixdb: ptr ptr Pix): LOk {.
    importc: "recogIdentifyPixa".}
proc recogIdentifyPix*(recog: ptr L_Recog; pixs: ptr Pix; ppixdb: ptr ptr Pix): LOk {.
    importc: "recogIdentifyPix".}
proc recogSkipIdentify*(recog: ptr L_Recog): LOk {.importc: "recogSkipIdentify".}
proc rchaDestroy*(prcha: ptr ptr L_Rcha) {.importc: "rchaDestroy".}
proc rchDestroy*(prch: ptr ptr L_Rch) {.importc: "rchDestroy".}
proc rchaExtract*(rcha: ptr L_Rcha; pnaindex: ptr ptr Numa;
                  pnascore: ptr ptr Numa; psatext: ptr ptr Sarray;
                  pnasample: ptr ptr Numa; pnaxloc: ptr ptr Numa;
                  pnayloc: ptr ptr Numa; pnawidth: ptr ptr Numa): LOk {.
    importc: "rchaExtract".}
proc rchExtract*(rch: ptr L_Rch; pindex: ptr LInt32; pscore: ptr LFloat32;
                 ptext: cstringArray; psample: ptr LInt32; pxloc: ptr LInt32;
                 pyloc: ptr LInt32; pwidth: ptr LInt32): LOk {.
    importc: "rchExtract".}
proc recogProcessToIdentify*(recog: ptr L_Recog; pixs: ptr Pix; pad: LInt32): ptr Pix {.
    importc: "recogProcessToIdentify".}
proc recogExtractNumbers*(recog: ptr L_Recog; boxas: ptr Boxa;
                          scorethresh: LFloat32; spacethresh: LInt32;
                          pbaa: ptr ptr Boxaa; pnaa: ptr ptr Numaa): ptr Sarray {.
    importc: "recogExtractNumbers".}
proc showExtractNumbers*(pixs: ptr Pix; sa: ptr Sarray; baa: ptr Boxaa;
                         naa: ptr Numaa; ppixdb: ptr ptr Pix): ptr Pixa {.
    importc: "showExtractNumbers".}
proc recogTrainLabeled*(recog: ptr L_Recog; pixs: ptr Pix; box: ptr Box;
                        text: cstring; debug: LInt32): LOk {.
    importc: "recogTrainLabeled".}
proc recogProcessLabeled*(recog: ptr L_Recog; pixs: ptr Pix; box: ptr Box;
                          text: cstring; ppix: ptr ptr Pix): LOk {.
    importc: "recogProcessLabeled".}
proc recogAddSample*(recog: ptr L_Recog; pix: ptr Pix; debug: LInt32): LOk {.
    importc: "recogAddSample".}
proc recogModifyTemplate*(recog: ptr L_Recog; pixs: ptr Pix): ptr Pix {.
    importc: "recogModifyTemplate".}
proc recogAverageSamples*(recog: ptr L_Recog; debug: LInt32): LInt32 {.
    importc: "recogAverageSamples".}
proc pixaAccumulateSamples*(pixa: ptr Pixa; pta: ptr Pta; ppixd: ptr ptr Pix;
                            px: ptr LFloat32; py: ptr LFloat32): LInt32 {.
    importc: "pixaAccumulateSamples".}
proc recogTrainingFinished*(precog: ptr ptr L_Recog; modifyflag: LInt32;
                            minsize: LInt32; minfract: LFloat32): LOk {.
    importc: "recogTrainingFinished".}
proc recogFilterPixaBySize*(pixas: ptr Pixa; setsize: LInt32; maxkeep: LInt32;
                            maxHtRatio: LFloat32; pna: ptr ptr Numa): ptr Pixa {.
    importc: "recogFilterPixaBySize".}
proc recogSortPixaByClass*(pixa: ptr Pixa; setsize: LInt32): ptr Pixaa {.
    importc: "recogSortPixaByClass".}
proc recogRemoveOutliers1*(precog: ptr ptr L_Recog; minscore: LFloat32;
                           mintarget: LInt32; minsize: LInt32;
                           ppixsave: ptr ptr Pix; ppixrem: ptr ptr Pix): LOk {.
    importc: "recogRemoveOutliers1".}
proc pixaRemoveOutliers1*(pixas: ptr Pixa; minscore: LFloat32;
                          mintarget: LInt32; minsize: LInt32;
                          ppixsave: ptr ptr Pix; ppixrem: ptr ptr Pix): ptr Pixa {.
    importc: "pixaRemoveOutliers1".}
proc recogRemoveOutliers2*(precog: ptr ptr L_Recog; minscore: LFloat32;
                           minsize: LInt32; ppixsave: ptr ptr Pix;
                           ppixrem: ptr ptr Pix): LOk {.
    importc: "recogRemoveOutliers2".}
proc pixaRemoveOutliers2*(pixas: ptr Pixa; minscore: LFloat32; minsize: LInt32;
                          ppixsave: ptr ptr Pix; ppixrem: ptr ptr Pix): ptr Pixa {.
    importc: "pixaRemoveOutliers2".}
proc recogTrainFromBoot*(recogboot: ptr L_Recog; pixas: ptr Pixa;
                         minscore: LFloat32; threshold: LInt32; debug: LInt32): ptr Pixa {.
    importc: "recogTrainFromBoot".}
proc recogPadDigitTrainingSet*(precog: ptr ptr L_Recog; scaleh: LInt32;
                               linew: LInt32): LOk {.
    importc: "recogPadDigitTrainingSet".}
proc recogIsPaddingNeeded*(recog: ptr L_Recog; psa: ptr ptr Sarray): LInt32 {.
    importc: "recogIsPaddingNeeded".}
proc recogAddDigitPadTemplates*(recog: ptr L_Recog; sa: ptr Sarray): ptr Pixa {.
    importc: "recogAddDigitPadTemplates".}
proc recogMakeBootDigitRecog*(nsamp: LInt32; scaleh: LInt32; linew: LInt32;
                              maxyshift: LInt32; debug: LInt32): ptr L_Recog {.
    importc: "recogMakeBootDigitRecog".}
proc recogMakeBootDigitTemplates*(nsamp: LInt32; debug: LInt32): ptr Pixa {.
    importc: "recogMakeBootDigitTemplates".}
proc recogShowContent*(fp: ptr File; recog: ptr L_Recog; index: LInt32;
                       display: LInt32): LOk {.importc: "recogShowContent".}
proc recogDebugAverages*(recog: ptr L_Recog; debug: LInt32): LOk {.
    importc: "recogDebugAverages".}
proc recogShowAverageTemplates*(recog: ptr L_Recog): LInt32 {.
    importc: "recogShowAverageTemplates".}
proc recogShowMatchesInRange*(recog: ptr L_Recog; pixa: ptr Pixa;
                              minscore: LFloat32; maxscore: LFloat32;
                              display: LInt32): LOk {.
    importc: "recogShowMatchesInRange".}
proc recogShowMatch*(recog: ptr L_Recog; pix1: ptr Pix; pix2: ptr Pix;
                     box: ptr Box; index: LInt32; score: LFloat32): ptr Pix {.
    importc: "recogShowMatch".}
proc regTestSetup*(argc: LInt32; argv: cstringArray; prp: ptr ptr L_Regparams): LOk {.
    importc: "regTestSetup".}
proc regTestCleanup*(rp: ptr L_Regparams): LOk {.importc: "regTestCleanup".}
proc regTestCompareValues*(rp: ptr L_Regparams; val1: LFloat32; val2: LFloat32;
                           delta: LFloat32): LOk {.
    importc: "regTestCompareValues".}
proc regTestCompareStrings*(rp: ptr L_Regparams; string1: ptr LUint8;
                            bytes1: csize_t; string2: ptr LUint8;
                            bytes2: csize_t): LOk {.
    importc: "regTestCompareStrings".}
proc regTestComparePix*(rp: ptr L_Regparams; pix1: ptr Pix; pix2: ptr Pix): LOk {.
    importc: "regTestComparePix".}
proc regTestCompareSimilarPix*(rp: ptr L_Regparams; pix1: ptr Pix;
                               pix2: ptr Pix; mindiff: LInt32;
                               maxfract: LFloat32; printstats: LInt32): LOk {.
    importc: "regTestCompareSimilarPix".}
proc regTestCheckFile*(rp: ptr L_Regparams; localname: cstring): LOk {.
    importc: "regTestCheckFile".}
proc regTestCompareFiles*(rp: ptr L_Regparams; index1: LInt32; index2: LInt32): LOk {.
    importc: "regTestCompareFiles".}
proc regTestWritePixAndCheck*(rp: ptr L_Regparams; pix: ptr Pix; format: LInt32): LOk {.
    importc: "regTestWritePixAndCheck".}
proc regTestWriteDataAndCheck*(rp: ptr L_Regparams; data: pointer;
                               nbytes: csize_t; ext: cstring): LOk {.
    importc: "regTestWriteDataAndCheck".}
proc regTestGenLocalFilename*(rp: ptr L_Regparams; index: LInt32; format: LInt32): cstring {.
    importc: "regTestGenLocalFilename".}
proc pixRasterop*(pixd: ptr Pix; dx: LInt32; dy: LInt32; dw: LInt32; dh: LInt32;
                  op: LInt32; pixs: ptr Pix; sx: LInt32; sy: LInt32): LOk {.
    importc: "pixRasterop".}
proc pixRasteropVip*(pixd: ptr Pix; bx: LInt32; bw: LInt32; vshift: LInt32;
                     incolor: LInt32): LOk {.importc: "pixRasteropVip".}
proc pixRasteropHip*(pixd: ptr Pix; by: LInt32; bh: LInt32; hshift: LInt32;
                     incolor: LInt32): LOk {.importc: "pixRasteropHip".}
proc pixTranslate*(pixd: ptr Pix; pixs: ptr Pix; hshift: LInt32; vshift: LInt32;
                   incolor: LInt32): ptr Pix {.importc: "pixTranslate".}
proc pixRasteropIP*(pixd: ptr Pix; hshift: LInt32; vshift: LInt32;
                    incolor: LInt32): LOk {.importc: "pixRasteropIP".}
proc pixRasteropFullImage*(pixd: ptr Pix; pixs: ptr Pix; op: LInt32): LOk {.
    importc: "pixRasteropFullImage".}
proc rasteropUniLow*(datad: ptr LUint32; dpixw: LInt32; dpixh: LInt32;
                     depth: LInt32; dwpl: LInt32; dx: LInt32; dy: LInt32;
                     dw: LInt32; dh: LInt32; op: LInt32) {.
    importc: "rasteropUniLow".}
proc rasteropLow*(datad: ptr LUint32; dpixw: LInt32; dpixh: LInt32;
                  depth: LInt32; dwpl: LInt32; dx: LInt32; dy: LInt32;
                  dw: LInt32; dh: LInt32; op: LInt32; datas: ptr LUint32;
                  spixw: LInt32; spixh: LInt32; swpl: LInt32; sx: LInt32;
                  sy: LInt32) {.importc: "rasteropLow".}
proc rasteropVipLow*(data: ptr LUint32; pixw: LInt32; pixh: LInt32;
                     depth: LInt32; wpl: LInt32; x: LInt32; w: LInt32;
                     shift: LInt32) {.importc: "rasteropVipLow".}
proc rasteropHipLow*(data: ptr LUint32; pixh: LInt32; depth: LInt32;
                     wpl: LInt32; y: LInt32; h: LInt32; shift: LInt32) {.
    importc: "rasteropHipLow".}
proc pixRotate*(pixs: ptr Pix; angle: LFloat32; `type`: LInt32; incolor: LInt32;
                width: LInt32; height: LInt32): ptr Pix {.importc: "pixRotate".}
proc pixEmbedForRotation*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32;
                          width: LInt32; height: LInt32): ptr Pix {.
    importc: "pixEmbedForRotation".}
proc pixRotateBySampling*(pixs: ptr Pix; xcen: LInt32; ycen: LInt32;
                          angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotateBySampling".}
proc pixRotateBinaryNice*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotateBinaryNice".}
proc pixRotateWithAlpha*(pixs: ptr Pix; angle: LFloat32; pixg: ptr Pix;
                         fract: LFloat32): ptr Pix {.
    importc: "pixRotateWithAlpha".}
proc pixRotateAM*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotateAM".}
proc pixRotateAMColor*(pixs: ptr Pix; angle: LFloat32; colorval: LUint32): ptr Pix {.
    importc: "pixRotateAMColor".}
proc pixRotateAMGray*(pixs: ptr Pix; angle: LFloat32; grayval: LUint8): ptr Pix {.
    importc: "pixRotateAMGray".}
proc pixRotateAMCorner*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotateAMCorner".}
proc pixRotateAMColorCorner*(pixs: ptr Pix; angle: LFloat32; fillval: LUint32): ptr Pix {.
    importc: "pixRotateAMColorCorner".}
proc pixRotateAMGrayCorner*(pixs: ptr Pix; angle: LFloat32; grayval: LUint8): ptr Pix {.
    importc: "pixRotateAMGrayCorner".}
proc pixRotateAMColorFast*(pixs: ptr Pix; angle: LFloat32; colorval: LUint32): ptr Pix {.
    importc: "pixRotateAMColorFast".}
proc pixRotateOrth*(pixs: ptr Pix; quads: LInt32): ptr Pix {.
    importc: "pixRotateOrth".}
proc pixRotate180*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.
    importc: "pixRotate180".}
proc pixRotate90*(pixs: ptr Pix; direction: LInt32): ptr Pix {.
    importc: "pixRotate90".}
proc pixFlipLR*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.importc: "pixFlipLR".}
proc pixFlipTB*(pixd: ptr Pix; pixs: ptr Pix): ptr Pix {.importc: "pixFlipTB".}
proc pixRotateShear*(pixs: ptr Pix; xcen: LInt32; ycen: LInt32; angle: LFloat32;
                     incolor: LInt32): ptr Pix {.importc: "pixRotateShear".}
proc pixRotate2Shear*(pixs: ptr Pix; xcen: LInt32; ycen: LInt32;
                      angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotate2Shear".}
proc pixRotate3Shear*(pixs: ptr Pix; xcen: LInt32; ycen: LInt32;
                      angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotate3Shear".}
proc pixRotateShearIP*(pixs: ptr Pix; xcen: LInt32; ycen: LInt32;
                       angle: LFloat32; incolor: LInt32): LOk {.
    importc: "pixRotateShearIP".}
proc pixRotateShearCenter*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixRotateShearCenter".}
proc pixRotateShearCenterIP*(pixs: ptr Pix; angle: LFloat32; incolor: LInt32): LOk {.
    importc: "pixRotateShearCenterIP".}
proc pixStrokeWidthTransform*(pixs: ptr Pix; color: LInt32; depth: LInt32;
                              nangles: LInt32): ptr Pix {.
    importc: "pixStrokeWidthTransform".}
proc pixRunlengthTransform*(pixs: ptr Pix; color: LInt32; direction: LInt32;
                            depth: LInt32): ptr Pix {.
    importc: "pixRunlengthTransform".}
proc pixFindHorizontalRuns*(pix: ptr Pix; y: LInt32; xstart: ptr LInt32;
                            xend: ptr LInt32; pn: ptr LInt32): LOk {.
    importc: "pixFindHorizontalRuns".}
proc pixFindVerticalRuns*(pix: ptr Pix; x: LInt32; ystart: ptr LInt32;
                          yend: ptr LInt32; pn: ptr LInt32): LOk {.
    importc: "pixFindVerticalRuns".}
proc pixFindMaxRuns*(pix: ptr Pix; direction: LInt32; pnastart: ptr ptr Numa): ptr Numa {.
    importc: "pixFindMaxRuns".}
proc pixFindMaxHorizontalRunOnLine*(pix: ptr Pix; y: LInt32;
                                    pxstart: ptr LInt32; psize: ptr LInt32): LOk {.
    importc: "pixFindMaxHorizontalRunOnLine".}
proc pixFindMaxVerticalRunOnLine*(pix: ptr Pix; x: LInt32; pystart: ptr LInt32;
                                  psize: ptr LInt32): LOk {.
    importc: "pixFindMaxVerticalRunOnLine".}
proc runlengthMembershipOnLine*(buffer: ptr LInt32; size: LInt32; depth: LInt32;
                                start: ptr LInt32; `end`: ptr LInt32; n: LInt32): LOk {.
    importc: "runlengthMembershipOnLine".}
proc makeMSBitLocTab*(bitval: LInt32): ptr LInt32 {.importc: "makeMSBitLocTab".}
proc sarrayCreate*(n: LInt32): ptr Sarray {.importc: "sarrayCreate".}
proc sarrayCreateInitialized*(n: LInt32; initstr: cstring): ptr Sarray {.
    importc: "sarrayCreateInitialized".}
proc sarrayCreateWordsFromString*(string: cstring): ptr Sarray {.
    importc: "sarrayCreateWordsFromString".}
proc sarrayCreateLinesFromString*(string: cstring; blankflag: LInt32): ptr Sarray {.
    importc: "sarrayCreateLinesFromString".}
proc sarrayDestroy*(psa: ptr ptr Sarray) {.importc: "sarrayDestroy".}
proc sarrayCopy*(sa: ptr Sarray): ptr Sarray {.importc: "sarrayCopy".}
proc sarrayClone*(sa: ptr Sarray): ptr Sarray {.importc: "sarrayClone".}
proc sarrayAddString*(sa: ptr Sarray; string: cstring; copyflag: LInt32): LOk {.
    importc: "sarrayAddString".}
proc sarrayRemoveString*(sa: ptr Sarray; index: LInt32): cstring {.
    importc: "sarrayRemoveString".}
proc sarrayReplaceString*(sa: ptr Sarray; index: LInt32; newstr: cstring;
                          copyflag: LInt32): LOk {.
    importc: "sarrayReplaceString".}
proc sarrayClear*(sa: ptr Sarray): LOk {.importc: "sarrayClear".}
proc sarrayGetCount*(sa: ptr Sarray): LInt32 {.importc: "sarrayGetCount".}
proc sarrayGetArray*(sa: ptr Sarray; pnalloc: ptr LInt32; pn: ptr LInt32): cstringArray {.
    importc: "sarrayGetArray".}
proc sarrayGetString*(sa: ptr Sarray; index: LInt32; copyflag: LInt32): cstring {.
    importc: "sarrayGetString".}
proc sarrayToString*(sa: ptr Sarray; addnlflag: LInt32): cstring {.
    importc: "sarrayToString".}
proc sarrayToStringRange*(sa: ptr Sarray; first: LInt32; nstrings: LInt32;
                          addnlflag: LInt32): cstring {.
    importc: "sarrayToStringRange".}
proc sarrayConcatUniformly*(sa: ptr Sarray; n: LInt32; addnlflag: LInt32): ptr Sarray {.
    importc: "sarrayConcatUniformly".}
proc sarrayJoin*(sa1: ptr Sarray; sa2: ptr Sarray): LOk {.importc: "sarrayJoin".}
proc sarrayAppendRange*(sa1: ptr Sarray; sa2: ptr Sarray; start: LInt32;
                        `end`: LInt32): LOk {.importc: "sarrayAppendRange".}
proc sarrayPadToSameSize*(sa1: ptr Sarray; sa2: ptr Sarray; padstring: cstring): LOk {.
    importc: "sarrayPadToSameSize".}
proc sarrayConvertWordsToLines*(sa: ptr Sarray; linesize: LInt32): ptr Sarray {.
    importc: "sarrayConvertWordsToLines".}
proc sarraySplitString*(sa: ptr Sarray; str: cstring; separators: cstring): LInt32 {.
    importc: "sarraySplitString".}
proc sarraySelectBySubstring*(sain: ptr Sarray; substr: cstring): ptr Sarray {.
    importc: "sarraySelectBySubstring".}
proc sarraySelectRange*(sain: ptr Sarray; first: LInt32; last: LInt32): ptr Sarray {.
    importc: "sarraySelectRange".}
proc sarrayParseRange*(sa: ptr Sarray; start: LInt32; pactualstart: ptr LInt32;
                       pend: ptr LInt32; pnewstart: ptr LInt32; substr: cstring;
                       loc: LInt32): LInt32 {.importc: "sarrayParseRange".}
proc sarrayRead*(filename: cstring): ptr Sarray {.importc: "sarrayRead".}
proc sarrayReadStream*(fp: ptr File): ptr Sarray {.importc: "sarrayReadStream".}
proc sarrayReadMem*(data: ptr LUint8; size: csize_t): ptr Sarray {.
    importc: "sarrayReadMem".}
proc sarrayWrite*(filename: cstring; sa: ptr Sarray): LOk {.
    importc: "sarrayWrite".}
proc sarrayWriteStream*(fp: ptr File; sa: ptr Sarray): LOk {.
    importc: "sarrayWriteStream".}
proc sarrayWriteStderr*(sa: ptr Sarray): LOk {.importc: "sarrayWriteStderr".}
proc sarrayWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; sa: ptr Sarray): LOk {.
    importc: "sarrayWriteMem".}
proc sarrayAppend*(filename: cstring; sa: ptr Sarray): LOk {.
    importc: "sarrayAppend".}
proc getNumberedPathnamesInDirectory*(dirname: cstring; substr: cstring;
                                      numpre: LInt32; numpost: LInt32;
                                      maxnum: LInt32): ptr Sarray {.
    importc: "getNumberedPathnamesInDirectory".}
proc getSortedPathnamesInDirectory*(dirname: cstring; substr: cstring;
                                    first: LInt32; nfiles: LInt32): ptr Sarray {.
    importc: "getSortedPathnamesInDirectory".}
proc convertSortedToNumberedPathnames*(sa: ptr Sarray; numpre: LInt32;
                                       numpost: LInt32; maxnum: LInt32): ptr Sarray {.
    importc: "convertSortedToNumberedPathnames".}
proc getFilenamesInDirectory*(dirname: cstring): ptr Sarray {.
    importc: "getFilenamesInDirectory".}
proc sarraySort*(saout: ptr Sarray; sain: ptr Sarray; sortorder: LInt32): ptr Sarray {.
    importc: "sarraySort".}
proc sarraySortByIndex*(sain: ptr Sarray; naindex: ptr Numa): ptr Sarray {.
    importc: "sarraySortByIndex".}
proc stringCompareLexical*(str1: cstring; str2: cstring): LInt32 {.
    importc: "stringCompareLexical".}
proc lAsetCreateFromSarray*(sa: ptr Sarray): ptr L_Aset {.
    importc: "l_asetCreateFromSarray".}
proc sarrayRemoveDupsByAset*(sas: ptr Sarray; psad: ptr ptr Sarray): LOk {.
    importc: "sarrayRemoveDupsByAset".}
proc sarrayUnionByAset*(sa1: ptr Sarray; sa2: ptr Sarray; psad: ptr ptr Sarray): LOk {.
    importc: "sarrayUnionByAset".}
proc sarrayIntersectionByAset*(sa1: ptr Sarray; sa2: ptr Sarray;
                               psad: ptr ptr Sarray): LOk {.
    importc: "sarrayIntersectionByAset".}
proc lHmapCreateFromSarray*(sa: ptr Sarray): ptr L_Hashmap {.
    importc: "l_hmapCreateFromSarray".}
proc sarrayRemoveDupsByHmap*(sas: ptr Sarray; psad: ptr ptr Sarray;
                             phmap: ptr ptr L_Hashmap): LOk {.
    importc: "sarrayRemoveDupsByHmap".}
proc sarrayUnionByHmap*(sa1: ptr Sarray; sa2: ptr Sarray; psad: ptr ptr Sarray): LOk {.
    importc: "sarrayUnionByHmap".}
proc sarrayIntersectionByHmap*(sa1: ptr Sarray; sa2: ptr Sarray;
                               psad: ptr ptr Sarray): LOk {.
    importc: "sarrayIntersectionByHmap".}
proc sarrayGenerateIntegers*(n: LInt32): ptr Sarray {.
    importc: "sarrayGenerateIntegers".}
proc sarrayLookupCSKV*(sa: ptr Sarray; keystring: cstring;
                       pvalstring: cstringArray): LOk {.
    importc: "sarrayLookupCSKV".}
proc pixScale*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScale".}
proc pixScaleToSizeRel*(pixs: ptr Pix; delw: LInt32; delh: LInt32): ptr Pix {.
    importc: "pixScaleToSizeRel".}
proc pixScaleToSize*(pixs: ptr Pix; wd: LInt32; hd: LInt32): ptr Pix {.
    importc: "pixScaleToSize".}
proc pixScaleToResolution*(pixs: ptr Pix; target: LFloat32; assumed: LFloat32;
                           pscalefact: ptr LFloat32): ptr Pix {.
    importc: "pixScaleToResolution".}
proc pixScaleGeneral*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32;
                      sharpfract: LFloat32; sharpwidth: LInt32): ptr Pix {.
    importc: "pixScaleGeneral".}
proc pixScaleLI*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleLI".}
proc pixScaleColorLI*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleColorLI".}
proc pixScaleColor2xLI*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleColor2xLI".}
proc pixScaleColor4xLI*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleColor4xLI".}
proc pixScaleGrayLI*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleGrayLI".}
proc pixScaleGray2xLI*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleGray2xLI".}
proc pixScaleGray4xLI*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleGray4xLI".}
proc pixScaleGray2xLIThresh*(pixs: ptr Pix; thresh: LInt32): ptr Pix {.
    importc: "pixScaleGray2xLIThresh".}
proc pixScaleGray2xLIDither*(pixs: ptr Pix): ptr Pix {.
    importc: "pixScaleGray2xLIDither".}
proc pixScaleGray4xLIThresh*(pixs: ptr Pix; thresh: LInt32): ptr Pix {.
    importc: "pixScaleGray4xLIThresh".}
proc pixScaleGray4xLIDither*(pixs: ptr Pix): ptr Pix {.
    importc: "pixScaleGray4xLIDither".}
proc pixScaleBySampling*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleBySampling".}
proc pixScaleBySamplingWithShift*(pixs: ptr Pix; scalex: LFloat32;
                                  scaley: LFloat32; shiftx: LFloat32;
                                  shifty: LFloat32): ptr Pix {.
    importc: "pixScaleBySamplingWithShift".}
proc pixScaleBySamplingToSize*(pixs: ptr Pix; wd: LInt32; hd: LInt32): ptr Pix {.
    importc: "pixScaleBySamplingToSize".}
proc pixScaleByIntSampling*(pixs: ptr Pix; factor: LInt32): ptr Pix {.
    importc: "pixScaleByIntSampling".}
proc pixScaleRGBToGrayFast*(pixs: ptr Pix; factor: LInt32; color: LInt32): ptr Pix {.
    importc: "pixScaleRGBToGrayFast".}
proc pixScaleRGBToBinaryFast*(pixs: ptr Pix; factor: LInt32; thresh: LInt32): ptr Pix {.
    importc: "pixScaleRGBToBinaryFast".}
proc pixScaleGrayToBinaryFast*(pixs: ptr Pix; factor: LInt32; thresh: LInt32): ptr Pix {.
    importc: "pixScaleGrayToBinaryFast".}
proc pixScaleSmooth*(pix: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleSmooth".}
proc pixScaleSmoothToSize*(pixs: ptr Pix; wd: LInt32; hd: LInt32): ptr Pix {.
    importc: "pixScaleSmoothToSize".}
proc pixScaleRGBToGray2*(pixs: ptr Pix; rwt: LFloat32; gwt: LFloat32;
                         bwt: LFloat32): ptr Pix {.
    importc: "pixScaleRGBToGray2".}
proc pixScaleAreaMap*(pix: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleAreaMap".}
proc pixScaleAreaMap2*(pix: ptr Pix): ptr Pix {.importc: "pixScaleAreaMap2".}
proc pixScaleAreaMapToSize*(pixs: ptr Pix; wd: LInt32; hd: LInt32): ptr Pix {.
    importc: "pixScaleAreaMapToSize".}
proc pixScaleBinary*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32): ptr Pix {.
    importc: "pixScaleBinary".}
proc pixScaleBinaryWithShift*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32;
                              shiftx: LFloat32; shifty: LFloat32): ptr Pix {.
    importc: "pixScaleBinaryWithShift".}
proc pixScaleToGray*(pixs: ptr Pix; scalefactor: LFloat32): ptr Pix {.
    importc: "pixScaleToGray".}
proc pixScaleToGrayFast*(pixs: ptr Pix; scalefactor: LFloat32): ptr Pix {.
    importc: "pixScaleToGrayFast".}
proc pixScaleToGray2*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray2".}
proc pixScaleToGray3*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray3".}
proc pixScaleToGray4*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray4".}
proc pixScaleToGray6*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray6".}
proc pixScaleToGray8*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray8".}
proc pixScaleToGray16*(pixs: ptr Pix): ptr Pix {.importc: "pixScaleToGray16".}
proc pixScaleToGrayMipmap*(pixs: ptr Pix; scalefactor: LFloat32): ptr Pix {.
    importc: "pixScaleToGrayMipmap".}
proc pixScaleMipmap*(pixs1: ptr Pix; pixs2: ptr Pix; scale: LFloat32): ptr Pix {.
    importc: "pixScaleMipmap".}
proc pixExpandReplicate*(pixs: ptr Pix; factor: LInt32): ptr Pix {.
    importc: "pixExpandReplicate".}
proc pixScaleGrayMinMax*(pixs: ptr Pix; xfact: LInt32; yfact: LInt32;
                         `type`: LInt32): ptr Pix {.
    importc: "pixScaleGrayMinMax".}
proc pixScaleGrayMinMax2*(pixs: ptr Pix; `type`: LInt32): ptr Pix {.
    importc: "pixScaleGrayMinMax2".}
proc pixScaleGrayRankCascade*(pixs: ptr Pix; level1: LInt32; level2: LInt32;
                              level3: LInt32; level4: LInt32): ptr Pix {.
    importc: "pixScaleGrayRankCascade".}
proc pixScaleGrayRank2*(pixs: ptr Pix; rank: LInt32): ptr Pix {.
    importc: "pixScaleGrayRank2".}
proc pixScaleAndTransferAlpha*(pixd: ptr Pix; pixs: ptr Pix; scalex: LFloat32;
                               scaley: LFloat32): LOk {.
    importc: "pixScaleAndTransferAlpha".}
proc pixScaleWithAlpha*(pixs: ptr Pix; scalex: LFloat32; scaley: LFloat32;
                        pixg: ptr Pix; fract: LFloat32): ptr Pix {.
    importc: "pixScaleWithAlpha".}
proc pixSeedfillBinary*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                        connectivity: LInt32): ptr Pix {.
    importc: "pixSeedfillBinary".}
proc pixSeedfillBinaryRestricted*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                                  connectivity: LInt32; xmax: LInt32;
                                  ymax: LInt32): ptr Pix {.
    importc: "pixSeedfillBinaryRestricted".}
proc pixHolesByFilling*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixHolesByFilling".}
proc pixFillClosedBorders*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixFillClosedBorders".}
proc pixExtractBorderConnComps*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixExtractBorderConnComps".}
proc pixRemoveBorderConnComps*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixRemoveBorderConnComps".}
proc pixFillBgFromBorder*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixFillBgFromBorder".}
proc pixFillHolesToBoundingRect*(pixs: ptr Pix; minsize: LInt32;
                                 maxhfract: LFloat32; minfgfract: LFloat32): ptr Pix {.
    importc: "pixFillHolesToBoundingRect".}
proc pixSeedfillGray*(pixs: ptr Pix; pixm: ptr Pix; connectivity: LInt32): LOk {.
    importc: "pixSeedfillGray".}
proc pixSeedfillGrayInv*(pixs: ptr Pix; pixm: ptr Pix; connectivity: LInt32): LOk {.
    importc: "pixSeedfillGrayInv".}
proc pixSeedfillGraySimple*(pixs: ptr Pix; pixm: ptr Pix; connectivity: LInt32): LOk {.
    importc: "pixSeedfillGraySimple".}
proc pixSeedfillGrayInvSimple*(pixs: ptr Pix; pixm: ptr Pix;
                               connectivity: LInt32): LOk {.
    importc: "pixSeedfillGrayInvSimple".}
proc pixSeedfillGrayBasin*(pixb: ptr Pix; pixm: ptr Pix; delta: LInt32;
                           connectivity: LInt32): ptr Pix {.
    importc: "pixSeedfillGrayBasin".}
proc pixDistanceFunction*(pixs: ptr Pix; connectivity: LInt32; outdepth: LInt32;
                          boundcond: LInt32): ptr Pix {.
    importc: "pixDistanceFunction".}
proc pixSeedspread*(pixs: ptr Pix; connectivity: LInt32): ptr Pix {.
    importc: "pixSeedspread".}
proc pixLocalExtrema*(pixs: ptr Pix; maxmin: LInt32; minmax: LInt32;
                      ppixmin: ptr ptr Pix; ppixmax: ptr ptr Pix): LOk {.
    importc: "pixLocalExtrema".}
proc pixSelectedLocalExtrema*(pixs: ptr Pix; mindist: LInt32;
                              ppixmin: ptr ptr Pix; ppixmax: ptr ptr Pix): LOk {.
    importc: "pixSelectedLocalExtrema".}
proc pixFindEqualValues*(pixs1: ptr Pix; pixs2: ptr Pix): ptr Pix {.
    importc: "pixFindEqualValues".}
proc pixSelectMinInConnComp*(pixs: ptr Pix; pixm: ptr Pix; ppta: ptr ptr Pta;
                             pnav: ptr ptr Numa): LOk {.
    importc: "pixSelectMinInConnComp".}
proc pixRemoveSeededComponents*(pixd: ptr Pix; pixs: ptr Pix; pixm: ptr Pix;
                                connectivity: LInt32; bordersize: LInt32): ptr Pix {.
    importc: "pixRemoveSeededComponents".}
proc selaCreate*(n: LInt32): ptr Sela {.importc: "selaCreate".}
proc selaDestroy*(psela: ptr ptr Sela) {.importc: "selaDestroy".}
proc selCreate*(height: LInt32; width: LInt32; name: cstring): ptr Sel {.
    importc: "selCreate".}
proc selDestroy*(psel: ptr ptr Sel) {.importc: "selDestroy".}
proc selCopy*(sel: ptr Sel): ptr Sel {.importc: "selCopy".}
proc selCreateBrick*(h: LInt32; w: LInt32; cy: LInt32; cx: LInt32;
                     `type`: LInt32): ptr Sel {.importc: "selCreateBrick".}
proc selCreateComb*(factor1: LInt32; factor2: LInt32; direction: LInt32): ptr Sel {.
    importc: "selCreateComb".}
proc create2dIntArray*(sy: LInt32; sx: LInt32): ptr ptr LInt32 {.
    importc: "create2dIntArray".}
proc selaAddSel*(sela: ptr Sela; sel: ptr Sel; selname: cstring;
                 copyflag: LInt32): LOk {.importc: "selaAddSel".}
proc selaGetCount*(sela: ptr Sela): LInt32 {.importc: "selaGetCount".}
proc selaGetSel*(sela: ptr Sela; i: LInt32): ptr Sel {.importc: "selaGetSel".}
proc selGetName*(sel: ptr Sel): cstring {.importc: "selGetName".}
proc selSetName*(sel: ptr Sel; name: cstring): LOk {.importc: "selSetName".}
proc selaFindSelByName*(sela: ptr Sela; name: cstring; pindex: ptr LInt32;
                        psel: ptr ptr Sel): LOk {.importc: "selaFindSelByName".}
proc selGetElement*(sel: ptr Sel; row: LInt32; col: LInt32; ptype: ptr LInt32): LOk {.
    importc: "selGetElement".}
proc selSetElement*(sel: ptr Sel; row: LInt32; col: LInt32; `type`: LInt32): LOk {.
    importc: "selSetElement".}
proc selGetParameters*(sel: ptr Sel; psy: ptr LInt32; psx: ptr LInt32;
                       pcy: ptr LInt32; pcx: ptr LInt32): LOk {.
    importc: "selGetParameters".}
proc selSetOrigin*(sel: ptr Sel; cy: LInt32; cx: LInt32): LOk {.
    importc: "selSetOrigin".}
proc selGetTypeAtOrigin*(sel: ptr Sel; ptype: ptr LInt32): LOk {.
    importc: "selGetTypeAtOrigin".}
proc selaGetBrickName*(sela: ptr Sela; hsize: LInt32; vsize: LInt32): cstring {.
    importc: "selaGetBrickName".}
proc selaGetCombName*(sela: ptr Sela; size: LInt32; direction: LInt32): cstring {.
    importc: "selaGetCombName".}
proc getCompositeParameters*(size: LInt32; psize1: ptr LInt32;
                             psize2: ptr LInt32; pnameh1: cstringArray;
                             pnameh2: cstringArray; pnamev1: cstringArray;
                             pnamev2: cstringArray): LOk {.
    importc: "getCompositeParameters".}
proc selaGetSelnames*(sela: ptr Sela): ptr Sarray {.importc: "selaGetSelnames".}
proc selFindMaxTranslations*(sel: ptr Sel; pxp: ptr LInt32; pyp: ptr LInt32;
                             pxn: ptr LInt32; pyn: ptr LInt32): LOk {.
    importc: "selFindMaxTranslations".}
proc selRotateOrth*(sel: ptr Sel; quads: LInt32): ptr Sel {.
    importc: "selRotateOrth".}
proc selaRead*(fname: cstring): ptr Sela {.importc: "selaRead".}
proc selaReadStream*(fp: ptr File): ptr Sela {.importc: "selaReadStream".}
proc selRead*(fname: cstring): ptr Sel {.importc: "selRead".}
proc selReadStream*(fp: ptr File): ptr Sel {.importc: "selReadStream".}
proc selaWrite*(fname: cstring; sela: ptr Sela): LOk {.importc: "selaWrite".}
proc selaWriteStream*(fp: ptr File; sela: ptr Sela): LOk {.
    importc: "selaWriteStream".}
proc selWrite*(fname: cstring; sel: ptr Sel): LOk {.importc: "selWrite".}
proc selWriteStream*(fp: ptr File; sel: ptr Sel): LOk {.
    importc: "selWriteStream".}
proc selCreateFromString*(text: cstring; h: LInt32; w: LInt32; name: cstring): ptr Sel {.
    importc: "selCreateFromString".}
proc selPrintToString*(sel: ptr Sel): cstring {.importc: "selPrintToString".}
proc selaCreateFromFile*(filename: cstring): ptr Sela {.
    importc: "selaCreateFromFile".}
proc selCreateFromPta*(pta: ptr Pta; cy: LInt32; cx: LInt32; name: cstring): ptr Sel {.
    importc: "selCreateFromPta".}
proc selCreateFromPix*(pix: ptr Pix; cy: LInt32; cx: LInt32; name: cstring): ptr Sel {.
    importc: "selCreateFromPix".}
proc selReadFromColorImage*(pathname: cstring): ptr Sel {.
    importc: "selReadFromColorImage".}
proc selCreateFromColorPix*(pixs: ptr Pix; selname: cstring): ptr Sel {.
    importc: "selCreateFromColorPix".}
proc selaCreateFromColorPixa*(pixa: ptr Pixa; sa: ptr Sarray): ptr Sela {.
    importc: "selaCreateFromColorPixa".}
proc selDisplayInPix*(sel: ptr Sel; size: LInt32; gthick: LInt32): ptr Pix {.
    importc: "selDisplayInPix".}
proc selaDisplayInPix*(sela: ptr Sela; size: LInt32; gthick: LInt32;
                       spacing: LInt32; ncols: LInt32): ptr Pix {.
    importc: "selaDisplayInPix".}
proc selaAddBasic*(sela: ptr Sela): ptr Sela {.importc: "selaAddBasic".}
proc selaAddHitMiss*(sela: ptr Sela): ptr Sela {.importc: "selaAddHitMiss".}
proc selaAddDwaLinear*(sela: ptr Sela): ptr Sela {.importc: "selaAddDwaLinear".}
proc selaAddDwaCombs*(sela: ptr Sela): ptr Sela {.importc: "selaAddDwaCombs".}
proc selaAddCrossJunctions*(sela: ptr Sela; hlsize: LFloat32; mdist: LFloat32;
                            norient: LInt32; debugflag: LInt32): ptr Sela {.
    importc: "selaAddCrossJunctions".}
proc selaAddTJunctions*(sela: ptr Sela; hlsize: LFloat32; mdist: LFloat32;
                        norient: LInt32; debugflag: LInt32): ptr Sela {.
    importc: "selaAddTJunctions".}
proc sela4ccThin*(sela: ptr Sela): ptr Sela {.importc: "sela4ccThin".}
proc sela8ccThin*(sela: ptr Sela): ptr Sela {.importc: "sela8ccThin".}
proc sela4and8ccThin*(sela: ptr Sela): ptr Sela {.importc: "sela4and8ccThin".}
proc selMakePlusSign*(size: LInt32; linewidth: LInt32): ptr Sel {.
    importc: "selMakePlusSign".}
proc pixGenerateSelWithRuns*(pixs: ptr Pix; nhlines: LInt32; nvlines: LInt32;
                             distance: LInt32; minlength: LInt32;
                             toppix: LInt32; botpix: LInt32; leftpix: LInt32;
                             rightpix: LInt32; ppixe: ptr ptr Pix): ptr Sel {.
    importc: "pixGenerateSelWithRuns".}
proc pixGenerateSelRandom*(pixs: ptr Pix; hitfract: LFloat32;
                           missfract: LFloat32; distance: LInt32;
                           toppix: LInt32; botpix: LInt32; leftpix: LInt32;
                           rightpix: LInt32; ppixe: ptr ptr Pix): ptr Sel {.
    importc: "pixGenerateSelRandom".}
proc pixGenerateSelBoundary*(pixs: ptr Pix; hitdist: LInt32; missdist: LInt32;
                             hitskip: LInt32; missskip: LInt32; topflag: LInt32;
                             botflag: LInt32; leftflag: LInt32;
                             rightflag: LInt32; ppixe: ptr ptr Pix): ptr Sel {.
    importc: "pixGenerateSelBoundary".}
proc pixGetRunCentersOnLine*(pixs: ptr Pix; x: LInt32; y: LInt32;
                             minlength: LInt32): ptr Numa {.
    importc: "pixGetRunCentersOnLine".}
proc pixGetRunsOnLine*(pixs: ptr Pix; x1: LInt32; y1: LInt32; x2: LInt32;
                       y2: LInt32): ptr Numa {.importc: "pixGetRunsOnLine".}
proc pixSubsampleBoundaryPixels*(pixs: ptr Pix; skip: LInt32): ptr Pta {.
    importc: "pixSubsampleBoundaryPixels".}
proc adjacentOnPixelInRaster*(pixs: ptr Pix; x: LInt32; y: LInt32;
                              pxa: ptr LInt32; pya: ptr LInt32): LInt32 {.
    importc: "adjacentOnPixelInRaster".}
proc pixDisplayHitMissSel*(pixs: ptr Pix; sel: ptr Sel; scalefactor: LInt32;
                           hitcolor: LUint32; misscolor: LUint32): ptr Pix {.
    importc: "pixDisplayHitMissSel".}
proc pixHShear*(pixd: ptr Pix; pixs: ptr Pix; yloc: LInt32; radang: LFloat32;
                incolor: LInt32): ptr Pix {.importc: "pixHShear".}
proc pixVShear*(pixd: ptr Pix; pixs: ptr Pix; xloc: LInt32; radang: LFloat32;
                incolor: LInt32): ptr Pix {.importc: "pixVShear".}
proc pixHShearCorner*(pixd: ptr Pix; pixs: ptr Pix; radang: LFloat32;
                      incolor: LInt32): ptr Pix {.importc: "pixHShearCorner".}
proc pixVShearCorner*(pixd: ptr Pix; pixs: ptr Pix; radang: LFloat32;
                      incolor: LInt32): ptr Pix {.importc: "pixVShearCorner".}
proc pixHShearCenter*(pixd: ptr Pix; pixs: ptr Pix; radang: LFloat32;
                      incolor: LInt32): ptr Pix {.importc: "pixHShearCenter".}
proc pixVShearCenter*(pixd: ptr Pix; pixs: ptr Pix; radang: LFloat32;
                      incolor: LInt32): ptr Pix {.importc: "pixVShearCenter".}
proc pixHShearIP*(pixs: ptr Pix; yloc: LInt32; radang: LFloat32; incolor: LInt32): LOk {.
    importc: "pixHShearIP".}
proc pixVShearIP*(pixs: ptr Pix; xloc: LInt32; radang: LFloat32; incolor: LInt32): LOk {.
    importc: "pixVShearIP".}
proc pixHShearLI*(pixs: ptr Pix; yloc: LInt32; radang: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixHShearLI".}
proc pixVShearLI*(pixs: ptr Pix; xloc: LInt32; radang: LFloat32; incolor: LInt32): ptr Pix {.
    importc: "pixVShearLI".}
proc pixDeskewBoth*(pixs: ptr Pix; redsearch: LInt32): ptr Pix {.
    importc: "pixDeskewBoth".}
proc pixDeskew*(pixs: ptr Pix; redsearch: LInt32): ptr Pix {.
    importc: "pixDeskew".}
proc pixFindSkewAndDeskew*(pixs: ptr Pix; redsearch: LInt32;
                           pangle: ptr LFloat32; pconf: ptr LFloat32): ptr Pix {.
    importc: "pixFindSkewAndDeskew".}
proc pixDeskewGeneral*(pixs: ptr Pix; redsweep: LInt32; sweeprange: LFloat32;
                       sweepdelta: LFloat32; redsearch: LInt32; thresh: LInt32;
                       pangle: ptr LFloat32; pconf: ptr LFloat32): ptr Pix {.
    importc: "pixDeskewGeneral".}
proc pixFindSkew*(pixs: ptr Pix; pangle: ptr LFloat32; pconf: ptr LFloat32): LOk {.
    importc: "pixFindSkew".}
proc pixFindSkewSweep*(pixs: ptr Pix; pangle: ptr LFloat32; reduction: LInt32;
                       sweeprange: LFloat32; sweepdelta: LFloat32): LOk {.
    importc: "pixFindSkewSweep".}
proc pixFindSkewSweepAndSearch*(pixs: ptr Pix; pangle: ptr LFloat32;
                                pconf: ptr LFloat32; redsweep: LInt32;
                                redsearch: LInt32; sweeprange: LFloat32;
                                sweepdelta: LFloat32; minbsdelta: LFloat32): LOk {.
    importc: "pixFindSkewSweepAndSearch".}
proc pixFindSkewSweepAndSearchScore*(pixs: ptr Pix; pangle: ptr LFloat32;
                                     pconf: ptr LFloat32;
                                     pendscore: ptr LFloat32; redsweep: LInt32;
                                     redsearch: LInt32; sweepcenter: LFloat32;
                                     sweeprange: LFloat32; sweepdelta: LFloat32;
                                     minbsdelta: LFloat32): LOk {.
    importc: "pixFindSkewSweepAndSearchScore".}
proc pixFindSkewSweepAndSearchScorePivot*(pixs: ptr Pix; pangle: ptr LFloat32;
    pconf: ptr LFloat32; pendscore: ptr LFloat32; redsweep: LInt32;
    redsearch: LInt32; sweepcenter: LFloat32; sweeprange: LFloat32;
    sweepdelta: LFloat32; minbsdelta: LFloat32; pivot: LInt32): LOk {.
    importc: "pixFindSkewSweepAndSearchScorePivot".}
proc pixFindSkewOrthogonalRange*(pixs: ptr Pix; pangle: ptr LFloat32;
                                 pconf: ptr LFloat32; redsweep: LInt32;
                                 redsearch: LInt32; sweeprange: LFloat32;
                                 sweepdelta: LFloat32; minbsdelta: LFloat32;
                                 confprior: LFloat32): LInt32 {.
    importc: "pixFindSkewOrthogonalRange".}
proc pixFindDifferentialSquareSum*(pixs: ptr Pix; psum: ptr LFloat32): LOk {.
    importc: "pixFindDifferentialSquareSum".}
proc pixFindNormalizedSquareSum*(pixs: ptr Pix; phratio: ptr LFloat32;
                                 pvratio: ptr LFloat32; pfract: ptr LFloat32): LOk {.
    importc: "pixFindNormalizedSquareSum".}
proc pixReadStreamSpix*(fp: ptr File): ptr Pix {.importc: "pixReadStreamSpix".}
proc readHeaderSpix*(filename: cstring; pwidth: ptr LInt32; pheight: ptr LInt32;
                     pbps: ptr LInt32; pspp: ptr LInt32; piscmap: ptr LInt32): LOk {.
    importc: "readHeaderSpix".}
proc freadHeaderSpix*(fp: ptr File; pwidth: ptr LInt32; pheight: ptr LInt32;
                      pbps: ptr LInt32; pspp: ptr LInt32; piscmap: ptr LInt32): LOk {.
    importc: "freadHeaderSpix".}
proc sreadHeaderSpix*(data: ptr LUint32; size: csize_t; pwidth: ptr LInt32;
                      pheight: ptr LInt32; pbps: ptr LInt32; pspp: ptr LInt32;
                      piscmap: ptr LInt32): LOk {.importc: "sreadHeaderSpix".}
proc pixWriteStreamSpix*(fp: ptr File; pix: ptr Pix): LOk {.
    importc: "pixWriteStreamSpix".}
proc pixReadMemSpix*(data: ptr LUint8; size: csize_t): ptr Pix {.
    importc: "pixReadMemSpix".}
proc pixWriteMemSpix*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix): LOk {.
    importc: "pixWriteMemSpix".}
proc pixSerializeToMemory*(pixs: ptr Pix; pdata: ptr ptr LUint32;
                           pnbytes: ptr csize_t): LOk {.
    importc: "pixSerializeToMemory".}
proc pixDeserializeFromMemory*(data: ptr LUint32; nbytes: csize_t): ptr Pix {.
    importc: "pixDeserializeFromMemory".}
proc lstackCreate*(n: LInt32): ptr L_Stack {.importc: "lstackCreate".}
proc lstackDestroy*(plstack: ptr ptr L_Stack; freeflag: LInt32) {.
    importc: "lstackDestroy".}
proc lstackAdd*(lstack: ptr L_Stack; item: pointer): LOk {.importc: "lstackAdd".}
proc lstackRemove*(lstack: ptr L_Stack): pointer {.importc: "lstackRemove".}
proc lstackGetCount*(lstack: ptr L_Stack): LInt32 {.importc: "lstackGetCount".}
proc lstackPrint*(fp: ptr File; lstack: ptr L_Stack): LOk {.
    importc: "lstackPrint".}
proc strcodeCreate*(fileno: LInt32): ptr L_Strcode {.importc: "strcodeCreate".}
proc strcodeCreateFromFile*(filein: cstring; fileno: LInt32; outdir: cstring): LOk {.
    importc: "strcodeCreateFromFile".}
proc strcodeGenerate*(strcode: ptr L_Strcode; filein: cstring; `type`: cstring): LOk {.
    importc: "strcodeGenerate".}
proc strcodeFinalize*(pstrcode: ptr ptr L_Strcode; outdir: cstring): LInt32 {.
    importc: "strcodeFinalize".}
proc lGetStructStrFromFile*(filename: cstring; field: LInt32; pstr: cstringArray): LInt32 {.
    importc: "l_getStructStrFromFile".}
proc pixFindStrokeLength*(pixs: ptr Pix; tab8: ptr LInt32; plength: ptr LInt32): LOk {.
    importc: "pixFindStrokeLength".}
proc pixFindStrokeWidth*(pixs: ptr Pix; thresh: LFloat32; tab8: ptr LInt32;
                         pwidth: ptr LFloat32; pnahisto: ptr ptr Numa): LOk {.
    importc: "pixFindStrokeWidth".}
proc pixaFindStrokeWidth*(pixa: ptr Pixa; thresh: LFloat32; tab8: ptr LInt32;
                          debug: LInt32): ptr Numa {.
    importc: "pixaFindStrokeWidth".}
proc pixaModifyStrokeWidth*(pixas: ptr Pixa; targetw: LFloat32): ptr Pixa {.
    importc: "pixaModifyStrokeWidth".}
proc pixModifyStrokeWidth*(pixs: ptr Pix; width: LFloat32; targetw: LFloat32): ptr Pix {.
    importc: "pixModifyStrokeWidth".}
proc pixaSetStrokeWidth*(pixas: ptr Pixa; width: LInt32; thinfirst: LInt32;
                         connectivity: LInt32): ptr Pixa {.
    importc: "pixaSetStrokeWidth".}
proc pixSetStrokeWidth*(pixs: ptr Pix; width: LInt32; thinfirst: LInt32;
                        connectivity: LInt32): ptr Pix {.
    importc: "pixSetStrokeWidth".}
proc sudokuReadFile*(filename: cstring): ptr LInt32 {.importc: "sudokuReadFile".}
proc sudokuReadString*(str: cstring): ptr LInt32 {.importc: "sudokuReadString".}
proc sudokuCreate*(array: ptr LInt32): ptr L_Sudoku {.importc: "sudokuCreate".}
proc sudokuDestroy*(psud: ptr ptr L_Sudoku) {.importc: "sudokuDestroy".}
proc sudokuSolve*(sud: ptr L_Sudoku): LInt32 {.importc: "sudokuSolve".}
proc sudokuTestUniqueness*(array: ptr LInt32; punique: ptr LInt32): LOk {.
    importc: "sudokuTestUniqueness".}
proc sudokuGenerate*(array: ptr LInt32; seed: LInt32; minelems: LInt32;
                     maxtries: LInt32): ptr L_Sudoku {.
    importc: "sudokuGenerate".}
proc sudokuOutput*(sud: ptr L_Sudoku; arraytype: LInt32): LInt32 {.
    importc: "sudokuOutput".}
proc pixAddSingleTextblock*(pixs: ptr Pix; bmf: ptr L_Bmf; textstr: cstring;
                            val: LUint32; location: LInt32;
                            poverflow: ptr LInt32): ptr Pix {.
    importc: "pixAddSingleTextblock".}
proc pixAddTextlines*(pixs: ptr Pix; bmf: ptr L_Bmf; textstr: cstring;
                      val: LUint32; location: LInt32): ptr Pix {.
    importc: "pixAddTextlines".}
proc pixSetTextblock*(pixs: ptr Pix; bmf: ptr L_Bmf; textstr: cstring;
                      val: LUint32; x0: LInt32; y0: LInt32; wtext: LInt32;
                      firstindent: LInt32; poverflow: ptr LInt32): LOk {.
    importc: "pixSetTextblock".}
proc pixSetTextline*(pixs: ptr Pix; bmf: ptr L_Bmf; textstr: cstring;
                     val: LUint32; x0: LInt32; y0: LInt32; pwidth: ptr LInt32;
                     poverflow: ptr LInt32): LOk {.importc: "pixSetTextline".}
proc pixaAddTextNumber*(pixas: ptr Pixa; bmf: ptr L_Bmf; na: ptr Numa;
                        val: LUint32; location: LInt32): ptr Pixa {.
    importc: "pixaAddTextNumber".}
proc pixaAddTextlines*(pixas: ptr Pixa; bmf: ptr L_Bmf; sa: ptr Sarray;
                       val: LUint32; location: LInt32): ptr Pixa {.
    importc: "pixaAddTextlines".}
proc pixaAddPixWithText*(pixa: ptr Pixa; pixs: ptr Pix; reduction: LInt32;
                         bmf: ptr L_Bmf; textstr: cstring; val: LUint32;
                         location: LInt32): LOk {.importc: "pixaAddPixWithText".}
proc bmfGetLineStrings*(bmf: ptr L_Bmf; textstr: cstring; maxw: LInt32;
                        firstindent: LInt32; ph: ptr LInt32): ptr Sarray {.
    importc: "bmfGetLineStrings".}
proc bmfGetWordWidths*(bmf: ptr L_Bmf; textstr: cstring; sa: ptr Sarray): ptr Numa {.
    importc: "bmfGetWordWidths".}
proc bmfGetStringWidth*(bmf: ptr L_Bmf; textstr: cstring; pw: ptr LInt32): LOk {.
    importc: "bmfGetStringWidth".}
proc splitStringToParagraphs*(textstr: cstring; splitflag: LInt32): ptr Sarray {.
    importc: "splitStringToParagraphs".}
proc pixReadTiff*(filename: cstring; n: LInt32): ptr Pix {.
    importc: "pixReadTiff".}
proc pixReadStreamTiff*(fp: ptr File; n: LInt32): ptr Pix {.
    importc: "pixReadStreamTiff".}
proc pixWriteTiff*(filename: cstring; pix: ptr Pix; comptype: LInt32;
                   modestr: cstring): LOk {.importc: "pixWriteTiff".}
proc pixWriteTiffCustom*(filename: cstring; pix: ptr Pix; comptype: LInt32;
                         modestr: cstring; natags: ptr Numa; savals: ptr Sarray;
                         satypes: ptr Sarray; nasizes: ptr Numa): LOk {.
    importc: "pixWriteTiffCustom".}
proc pixWriteStreamTiff*(fp: ptr File; pix: ptr Pix; comptype: LInt32): LOk {.
    importc: "pixWriteStreamTiff".}
proc pixWriteStreamTiffWA*(fp: ptr File; pix: ptr Pix; comptype: LInt32;
                           modestr: cstring): LOk {.
    importc: "pixWriteStreamTiffWA".}
proc pixReadFromMultipageTiff*(fname: cstring; poffset: ptr csize_t): ptr Pix {.
    importc: "pixReadFromMultipageTiff".}
proc pixaReadMultipageTiff*(filename: cstring): ptr Pixa {.
    importc: "pixaReadMultipageTiff".}
proc pixaWriteMultipageTiff*(fname: cstring; pixa: ptr Pixa): LOk {.
    importc: "pixaWriteMultipageTiff".}
proc writeMultipageTiff*(dirin: cstring; substr: cstring; fileout: cstring): LOk {.
    importc: "writeMultipageTiff".}
proc writeMultipageTiffSA*(sa: ptr Sarray; fileout: cstring): LOk {.
    importc: "writeMultipageTiffSA".}
proc fprintTiffInfo*(fpout: ptr File; tiffile: cstring): LOk {.
    importc: "fprintTiffInfo".}
proc tiffGetCount*(fp: ptr File; pn: ptr LInt32): LOk {.importc: "tiffGetCount".}
proc getTiffResolution*(fp: ptr File; pxres: ptr LInt32; pyres: ptr LInt32): LOk {.
    importc: "getTiffResolution".}
proc readHeaderTiff*(filename: cstring; n: LInt32; pw: ptr LInt32;
                     ph: ptr LInt32; pbps: ptr LInt32; pspp: ptr LInt32;
                     pres: ptr LInt32; pcmap: ptr LInt32; pformat: ptr LInt32): LOk {.
    importc: "readHeaderTiff".}
proc freadHeaderTiff*(fp: ptr File; n: LInt32; pw: ptr LInt32; ph: ptr LInt32;
                      pbps: ptr LInt32; pspp: ptr LInt32; pres: ptr LInt32;
                      pcmap: ptr LInt32; pformat: ptr LInt32): LOk {.
    importc: "freadHeaderTiff".}
proc readHeaderMemTiff*(cdata: ptr LUint8; size: csize_t; n: LInt32;
                        pw: ptr LInt32; ph: ptr LInt32; pbps: ptr LInt32;
                        pspp: ptr LInt32; pres: ptr LInt32; pcmap: ptr LInt32;
                        pformat: ptr LInt32): LOk {.
    importc: "readHeaderMemTiff".}
proc findTiffCompression*(fp: ptr File; pcomptype: ptr LInt32): LOk {.
    importc: "findTiffCompression".}
proc extractG4DataFromFile*(filein: cstring; pdata: ptr ptr LUint8;
                            pnbytes: ptr csize_t; pw: ptr LInt32;
                            ph: ptr LInt32; pminisblack: ptr LInt32): LOk {.
    importc: "extractG4DataFromFile".}
proc pixReadMemTiff*(cdata: ptr LUint8; size: csize_t; n: LInt32): ptr Pix {.
    importc: "pixReadMemTiff".}
proc pixReadMemFromMultipageTiff*(cdata: ptr LUint8; size: csize_t;
                                  poffset: ptr csize_t): ptr Pix {.
    importc: "pixReadMemFromMultipageTiff".}
proc pixaReadMemMultipageTiff*(data: ptr LUint8; size: csize_t): ptr Pixa {.
    importc: "pixaReadMemMultipageTiff".}
proc pixaWriteMemMultipageTiff*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                                pixa: ptr Pixa): LOk {.
    importc: "pixaWriteMemMultipageTiff".}
proc pixWriteMemTiff*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix;
                      comptype: LInt32): LOk {.importc: "pixWriteMemTiff".}
proc pixWriteMemTiffCustom*(pdata: ptr ptr LUint8; psize: ptr csize_t;
                            pix: ptr Pix; comptype: LInt32; natags: ptr Numa;
                            savals: ptr Sarray; satypes: ptr Sarray;
                            nasizes: ptr Numa): LOk {.
    importc: "pixWriteMemTiffCustom".}
proc setMsgSeverity*(newsev: LInt32): LInt32 {.importc: "setMsgSeverity".}
proc returnErrorInt*(msg: cstring; procname: cstring; ival: LInt32): LInt32 {.
    importc: "returnErrorInt".}
proc returnErrorFloat*(msg: cstring; procname: cstring; fval: LFloat32): LFloat32 {.
    importc: "returnErrorFloat".}
proc returnErrorPtr*(msg: cstring; procname: cstring; pval: pointer): pointer {.
    importc: "returnErrorPtr".}
proc returnErrorInt1*(msg: cstring; arg: cstring; procname: cstring;
                      ival: LInt32): LInt32 {.importc: "returnErrorInt1".}
proc returnErrorFloat1*(msg: cstring; arg: cstring; procname: cstring;
                        fval: LFloat32): LFloat32 {.
    importc: "returnErrorFloat1".}
proc returnErrorPtr1*(msg: cstring; arg: cstring; procname: cstring;
                      pval: pointer): pointer {.importc: "returnErrorPtr1".}
proc leptSetStderrHandler*(handler: proc (a1: cstring)) {.
    importc: "leptSetStderrHandler".}
proc leptStderr*(fmt: cstring) {.varargs, importc: "lept_stderr".}
proc filesAreIdentical*(fname1: cstring; fname2: cstring; psame: ptr LInt32): LOk {.
    importc: "filesAreIdentical".}
proc convertOnLittleEnd16*(shortin: LUint16): LUint16 {.
    importc: "convertOnLittleEnd16".}
proc convertOnBigEnd16*(shortin: LUint16): LUint16 {.
    importc: "convertOnBigEnd16".}
proc convertOnLittleEnd32*(wordin: LUint32): LUint32 {.
    importc: "convertOnLittleEnd32".}
proc convertOnBigEnd32*(wordin: LUint32): LUint32 {.
    importc: "convertOnBigEnd32".}
proc fileCorruptByDeletion*(filein: cstring; loc: LFloat32; size: LFloat32;
                            fileout: cstring): LOk {.
    importc: "fileCorruptByDeletion".}
proc fileCorruptByMutation*(filein: cstring; loc: LFloat32; size: LFloat32;
                            fileout: cstring): LOk {.
    importc: "fileCorruptByMutation".}
proc fileReplaceBytes*(filein: cstring; start: LInt32; nbytes: LInt32;
                       newdata: ptr LUint8; newsize: csize_t; fileout: cstring): LOk {.
    importc: "fileReplaceBytes".}
proc genRandomIntOnInterval*(start: LInt32; `end`: LInt32; seed: LInt32;
                             pval: ptr LInt32): LOk {.
    importc: "genRandomIntOnInterval".}
proc leptRoundftoi*(fval: LFloat32): LInt32 {.importc: "lept_roundftoi".}
proc leptFloor*(fval: LFloat32): LInt32 {.importc: "lept_floor".}
proc leptCeiling*(fval: LFloat32): LInt32 {.importc: "lept_ceiling".}
proc lHashStringToUint64*(str: cstring; phash: ptr LUint64): LOk {.
    importc: "l_hashStringToUint64".}
proc lHashStringToUint64Fast*(str: cstring; phash: ptr LUint64): LOk {.
    importc: "l_hashStringToUint64Fast".}
proc lHashPtToUint64*(x: LInt32; y: LInt32; phash: ptr LUint64): LOk {.
    importc: "l_hashPtToUint64".}
proc lHashFloat64ToUint64*(val: LFloat64; phash: ptr LUint64): LOk {.
    importc: "l_hashFloat64ToUint64".}
proc findNextLargerPrime*(start: LInt32; pprime: ptr LUint32): LOk {.
    importc: "findNextLargerPrime".}
proc leptIsPrime*(n: LUint64; pisPrime: ptr LInt32; pfactor: ptr LUint32): LOk {.
    importc: "lept_isPrime".}
proc convertIntToGrayCode*(val: LUint32): LUint32 {.
    importc: "convertIntToGrayCode".}
proc convertGrayCodeToInt*(val: LUint32): LUint32 {.
    importc: "convertGrayCodeToInt".}
proc getLeptonicaVersion*(): cstring {.importc: "getLeptonicaVersion".}
proc startTimer*() {.importc: "startTimer".}
proc stopTimer*(): LFloat32 {.importc: "stopTimer".}
proc startTimerNested*(): L_Timer {.importc: "startTimerNested".}
proc stopTimerNested*(rusageStart: L_Timer): LFloat32 {.
    importc: "stopTimerNested".}
proc lGetCurrentTime*(sec: ptr LInt32; usec: ptr LInt32) {.
    importc: "l_getCurrentTime".}
proc startWallTimer*(): ptr L_Walltimer {.importc: "startWallTimer".}
proc stopWallTimer*(ptimer: ptr ptr L_Walltimer): LFloat32 {.
    importc: "stopWallTimer".}
proc lGetFormattedDate*(): cstring {.importc: "l_getFormattedDate".}
proc stringNew*(src: cstring): cstring {.importc: "stringNew".}
proc stringCopy*(dest: cstring; src: cstring; n: LInt32): LOk {.
    importc: "stringCopy".}
proc stringCopySegment*(src: cstring; start: LInt32; nbytes: LInt32): cstring {.
    importc: "stringCopySegment".}
proc stringReplace*(pdest: cstringArray; src: cstring): LOk {.
    importc: "stringReplace".}
proc stringLength*(src: cstring; size: csize_t): LInt32 {.
    importc: "stringLength".}
proc stringCat*(dest: cstring; size: csize_t; src: cstring): LInt32 {.
    importc: "stringCat".}
proc stringConcatNew*(first: cstring): cstring {.varargs,
    importc: "stringConcatNew".}
proc stringJoin*(src1: cstring; src2: cstring): cstring {.importc: "stringJoin".}
proc stringJoinIP*(psrc1: cstringArray; src2: cstring): LOk {.
    importc: "stringJoinIP".}
proc stringReverse*(src: cstring): cstring {.importc: "stringReverse".}
proc strtokSafe*(cstr: cstring; seps: cstring; psaveptr: cstringArray): cstring {.
    importc: "strtokSafe".}
proc stringSplitOnToken*(cstr: cstring; seps: cstring; phead: cstringArray;
                         ptail: cstringArray): LOk {.
    importc: "stringSplitOnToken".}
proc stringCheckForChars*(src: cstring; chars: cstring; pfound: ptr LInt32): LOk {.
    importc: "stringCheckForChars".}
proc stringRemoveChars*(src: cstring; remchars: cstring): cstring {.
    importc: "stringRemoveChars".}
proc stringReplaceEachSubstr*(src: cstring; sub1: cstring; sub2: cstring;
                              pcount: ptr LInt32): cstring {.
    importc: "stringReplaceEachSubstr".}
proc stringReplaceSubstr*(src: cstring; sub1: cstring; sub2: cstring;
                          ploc: ptr LInt32; pfound: ptr LInt32): cstring {.
    importc: "stringReplaceSubstr".}
proc stringFindEachSubstr*(src: cstring; sub: cstring): ptr L_Dna {.
    importc: "stringFindEachSubstr".}
proc stringFindSubstr*(src: cstring; sub: cstring; ploc: ptr LInt32): LInt32 {.
    importc: "stringFindSubstr".}
proc arrayReplaceEachSequence*(datas: ptr LUint8; dataslen: csize_t;
                               seq: ptr LUint8; seqlen: csize_t;
                               newseq: ptr LUint8; newseqlen: csize_t;
                               pdatadlen: ptr csize_t; pcount: ptr LInt32): ptr LUint8 {.
    importc: "arrayReplaceEachSequence".}
proc arrayFindEachSequence*(data: ptr LUint8; datalen: csize_t;
                            sequence: ptr LUint8; seqlen: csize_t): ptr L_Dna {.
    importc: "arrayFindEachSequence".}
proc arrayFindSequence*(data: ptr LUint8; datalen: csize_t;
                        sequence: ptr LUint8; seqlen: csize_t;
                        poffset: ptr LInt32; pfound: ptr LInt32): LOk {.
    importc: "arrayFindSequence".}
proc reallocNew*(pindata: ptr pointer; oldsize: csize_t; newsize: csize_t): pointer {.
    importc: "reallocNew".}
proc lBinaryRead*(filename: cstring; pnbytes: ptr csize_t): ptr LUint8 {.
    importc: "l_binaryRead".}
proc lBinaryReadStream*(fp: ptr File; pnbytes: ptr csize_t): ptr LUint8 {.
    importc: "l_binaryReadStream".}
proc lBinaryReadSelect*(filename: cstring; start: csize_t; nbytes: csize_t;
                        pnread: ptr csize_t): ptr LUint8 {.
    importc: "l_binaryReadSelect".}
proc lBinaryReadSelectStream*(fp: ptr File; start: csize_t; nbytes: csize_t;
                              pnread: ptr csize_t): ptr LUint8 {.
    importc: "l_binaryReadSelectStream".}
proc lBinaryWrite*(filename: cstring; operation: cstring; data: pointer;
                   nbytes: csize_t): LOk {.importc: "l_binaryWrite".}
proc nbytesInFile*(filename: cstring): csize_t {.importc: "nbytesInFile".}
proc fnbytesInFile*(fp: ptr File): csize_t {.importc: "fnbytesInFile".}
proc lBinaryCopy*(datas: ptr LUint8; size: csize_t): ptr LUint8 {.
    importc: "l_binaryCopy".}
proc lBinaryCompare*(data1: ptr LUint8; size1: csize_t; data2: ptr LUint8;
                     size2: csize_t; psame: ptr LInt32): LOk {.
    importc: "l_binaryCompare".}
proc fileCopy*(srcfile: cstring; newfile: cstring): LOk {.importc: "fileCopy".}
proc fileConcatenate*(srcfile: cstring; destfile: cstring): LOk {.
    importc: "fileConcatenate".}
proc fileAppendString*(filename: cstring; str: cstring): LOk {.
    importc: "fileAppendString".}
proc fileSplitLinesUniform*(filename: cstring; n: LInt32; saveEmpty: LInt32;
                            rootpath: cstring; ext: cstring): LOk {.
    importc: "fileSplitLinesUniform".}
proc fopenReadStream*(filename: cstring): ptr File {.importc: "fopenReadStream".}
proc fopenWriteStream*(filename: cstring; modestring: cstring): ptr File {.
    importc: "fopenWriteStream".}
proc fopenReadFromMemory*(data: ptr LUint8; size: csize_t): ptr File {.
    importc: "fopenReadFromMemory".}
proc fopenWriteWinTempfile*(): ptr File {.importc: "fopenWriteWinTempfile".}
proc leptFopen*(filename: cstring; mode: cstring): ptr File {.
    importc: "lept_fopen".}
proc leptFclose*(fp: ptr File): LOk {.importc: "lept_fclose".}
proc leptCalloc*(nmemb: csize_t; size: csize_t): pointer {.
    importc: "lept_calloc".}
proc leptFree*(`ptr`: pointer) {.importc: "lept_free".}
proc leptMkdir*(subdir: cstring): LInt32 {.importc: "lept_mkdir".}
proc leptRmdir*(subdir: cstring): LInt32 {.importc: "lept_rmdir".}
proc leptDirexists*(dir: cstring; pexists: ptr LInt32) {.
    importc: "lept_direxists".}
proc leptRmMatch*(subdir: cstring; substr: cstring): LInt32 {.
    importc: "lept_rm_match".}
proc leptRm*(subdir: cstring; tail: cstring): LInt32 {.importc: "lept_rm".}
proc leptRmfile*(filepath: cstring): LInt32 {.importc: "lept_rmfile".}
proc leptMv*(srcfile: cstring; newdir: cstring; newtail: cstring;
             pnewpath: cstringArray): LInt32 {.importc: "lept_mv".}
proc leptCp*(srcfile: cstring; newdir: cstring; newtail: cstring;
             pnewpath: cstringArray): LInt32 {.importc: "lept_cp".}
proc callSystemDebug*(cmd: cstring) {.importc: "callSystemDebug".}
proc splitPathAtDirectory*(pathname: cstring; pdir: cstringArray;
                           ptail: cstringArray): LOk {.
    importc: "splitPathAtDirectory".}
proc splitPathAtExtension*(pathname: cstring; pbasename: cstringArray;
                           pextension: cstringArray): LOk {.
    importc: "splitPathAtExtension".}
proc pathJoin*(dir: cstring; fname: cstring): cstring {.importc: "pathJoin".}
proc appendSubdirs*(basedir: cstring; subdirs: cstring): cstring {.
    importc: "appendSubdirs".}
proc convertSepCharsInPath*(path: cstring; `type`: LInt32): LOk {.
    importc: "convertSepCharsInPath".}
proc genPathname*(dir: cstring; fname: cstring): cstring {.
    importc: "genPathname".}
proc makeTempDirname*(result: cstring; nbytes: csize_t; subdir: cstring): LOk {.
    importc: "makeTempDirname".}
proc modifyTrailingSlash*(path: cstring; nbytes: csize_t; flag: LInt32): LOk {.
    importc: "modifyTrailingSlash".}
proc lMakeTempFilename*(): cstring {.importc: "l_makeTempFilename".}
proc extractNumberFromFilename*(fname: cstring; numpre: LInt32; numpost: LInt32): LInt32 {.
    importc: "extractNumberFromFilename".}
proc pixSimpleCaptcha*(pixs: ptr Pix; border: LInt32; nterms: LInt32;
                       seed: LUint32; color: LUint32; cmapflag: LInt32): ptr Pix {.
    importc: "pixSimpleCaptcha".}
proc pixRandomHarmonicWarp*(pixs: ptr Pix; xmag: LFloat32; ymag: LFloat32;
                            xfreq: LFloat32; yfreq: LFloat32; nx: LInt32;
                            ny: LInt32; seed: LUint32; grayval: LInt32): ptr Pix {.
    importc: "pixRandomHarmonicWarp".}
proc pixWarpStereoscopic*(pixs: ptr Pix; zbend: LInt32; zshiftt: LInt32;
                          zshiftb: LInt32; ybendt: LInt32; ybendb: LInt32;
                          redleft: LInt32): ptr Pix {.
    importc: "pixWarpStereoscopic".}
proc pixStretchHorizontal*(pixs: ptr Pix; dir: LInt32; `type`: LInt32;
                           hmax: LInt32; operation: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixStretchHorizontal".}
proc pixStretchHorizontalSampled*(pixs: ptr Pix; dir: LInt32; `type`: LInt32;
                                  hmax: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixStretchHorizontalSampled".}
proc pixStretchHorizontalLI*(pixs: ptr Pix; dir: LInt32; `type`: LInt32;
                             hmax: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixStretchHorizontalLI".}
proc pixQuadraticVShear*(pixs: ptr Pix; dir: LInt32; vmaxt: LInt32;
                         vmaxb: LInt32; operation: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixQuadraticVShear".}
proc pixQuadraticVShearSampled*(pixs: ptr Pix; dir: LInt32; vmaxt: LInt32;
                                vmaxb: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixQuadraticVShearSampled".}
proc pixQuadraticVShearLI*(pixs: ptr Pix; dir: LInt32; vmaxt: LInt32;
                           vmaxb: LInt32; incolor: LInt32): ptr Pix {.
    importc: "pixQuadraticVShearLI".}
proc pixStereoFromPair*(pix1: ptr Pix; pix2: ptr Pix; rwt: LFloat32;
                        gwt: LFloat32; bwt: LFloat32): ptr Pix {.
    importc: "pixStereoFromPair".}
proc wshedCreate*(pixs: ptr Pix; pixm: ptr Pix; mindepth: LInt32;
                  debugflag: LInt32): ptr L_Wshed {.importc: "wshedCreate".}
proc wshedDestroy*(pwshed: ptr ptr L_Wshed) {.importc: "wshedDestroy".}
proc wshedApply*(wshed: ptr L_Wshed): LOk {.importc: "wshedApply".}
proc wshedBasins*(wshed: ptr L_Wshed; ppixa: ptr ptr Pixa;
                  pnalevels: ptr ptr Numa): LOk {.importc: "wshedBasins".}
proc wshedRenderFill*(wshed: ptr L_Wshed): ptr Pix {.importc: "wshedRenderFill".}
proc wshedRenderColors*(wshed: ptr L_Wshed): ptr Pix {.
    importc: "wshedRenderColors".}
proc pixaWriteWebPAnim*(filename: cstring; pixa: ptr Pixa; loopcount: LInt32;
                        duration: LInt32; quality: LInt32; lossless: LInt32): LOk {.
    importc: "pixaWriteWebPAnim".}
proc pixaWriteStreamWebPAnim*(fp: ptr File; pixa: ptr Pixa; loopcount: LInt32;
                              duration: LInt32; quality: LInt32;
                              lossless: LInt32): LOk {.
    importc: "pixaWriteStreamWebPAnim".}
proc pixaWriteMemWebPAnim*(pencdata: ptr ptr LUint8; pencsize: ptr csize_t;
                           pixa: ptr Pixa; loopcount: LInt32; duration: LInt32;
                           quality: LInt32; lossless: LInt32): LOk {.
    importc: "pixaWriteMemWebPAnim".}
proc pixReadStreamWebP*(fp: ptr File): ptr Pix {.importc: "pixReadStreamWebP".}
proc pixReadMemWebP*(filedata: ptr LUint8; filesize: csize_t): ptr Pix {.
    importc: "pixReadMemWebP".}
proc readHeaderWebP*(filename: cstring; pw: ptr LInt32; ph: ptr LInt32;
                     pspp: ptr LInt32): LOk {.importc: "readHeaderWebP".}
proc readHeaderMemWebP*(data: ptr LUint8; size: csize_t; pw: ptr LInt32;
                        ph: ptr LInt32; pspp: ptr LInt32): LOk {.
    importc: "readHeaderMemWebP".}
proc pixWriteWebP*(filename: cstring; pixs: ptr Pix; quality: LInt32;
                   lossless: LInt32): LOk {.importc: "pixWriteWebP".}
proc pixWriteStreamWebP*(fp: ptr File; pixs: ptr Pix; quality: LInt32;
                         lossless: LInt32): LOk {.importc: "pixWriteStreamWebP".}
proc pixWriteMemWebP*(pencdata: ptr ptr LUint8; pencsize: ptr csize_t;
                      pixs: ptr Pix; quality: LInt32; lossless: LInt32): LOk {.
    importc: "pixWriteMemWebP".}
proc lJpegSetQuality*(newQuality: LInt32): LInt32 {.importc: "l_jpegSetQuality".}
proc setLeptDebugOK*(allow: LInt32) {.importc: "setLeptDebugOK".}
proc pixaWriteFiles*(rootname: cstring; pixa: ptr Pixa; format: LInt32): LOk {.
    importc: "pixaWriteFiles".}
proc pixWriteDebug*(fname: cstring; pix: ptr Pix; format: LInt32): LOk {.
    importc: "pixWriteDebug".}
proc pixWrite*(fname: cstring; pix: ptr Pix; format: LInt32): LOk {.
    importc: "pixWrite".}
proc pixWriteAutoFormat*(filename: cstring; pix: ptr Pix): LOk {.
    importc: "pixWriteAutoFormat".}
proc pixWriteStream*(fp: ptr File; pix: ptr Pix; format: LInt32): LOk {.
    importc: "pixWriteStream".}
proc pixWriteImpliedFormat*(filename: cstring; pix: ptr Pix; quality: LInt32;
                            progressive: LInt32): LOk {.
    importc: "pixWriteImpliedFormat".}
proc pixChooseOutputFormat*(pix: ptr Pix): LInt32 {.
    importc: "pixChooseOutputFormat".}
proc getImpliedFileFormat*(filename: cstring): LInt32 {.
    importc: "getImpliedFileFormat".}
proc getFormatFromExtension*(extension: cstring): LInt32 {.
    importc: "getFormatFromExtension".}
proc pixGetAutoFormat*(pix: ptr Pix; pformat: ptr LInt32): LOk {.
    importc: "pixGetAutoFormat".}
proc getFormatExtension*(format: LInt32): cstring {.
    importc: "getFormatExtension".}
proc pixWriteMem*(pdata: ptr ptr LUint8; psize: ptr csize_t; pix: ptr Pix;
                  format: LInt32): LOk {.importc: "pixWriteMem".}
proc lFileDisplay*(fname: cstring; x: LInt32; y: LInt32; scale: LFloat32): LOk {.
    importc: "l_fileDisplay".}
proc pixDisplay*(pixs: ptr Pix; x: LInt32; y: LInt32): LOk {.
    importc: "pixDisplay".}
proc pixDisplayWithTitle*(pixs: ptr Pix; x: LInt32; y: LInt32; title: cstring;
                          dispflag: LInt32): LOk {.
    importc: "pixDisplayWithTitle".}
proc pixMakeColorSquare*(color: LUint32; size: LInt32; addlabel: LInt32;
                         location: LInt32; textcolor: LUint32): ptr Pix {.
    importc: "pixMakeColorSquare".}
proc lChooseDisplayProg*(selection: LInt32) {.importc: "l_chooseDisplayProg".}
proc changeFormatForMissingLib*(pformat: ptr LInt32) {.
    importc: "changeFormatForMissingLib".}
proc pixDisplayWrite*(pixs: ptr Pix; reduction: LInt32): LOk {.
    importc: "pixDisplayWrite".}
proc zlibCompress*(datain: ptr LUint8; nin: csize_t; pnout: ptr csize_t): ptr LUint8 {.
    importc: "zlibCompress".}
proc zlibUncompress*(datain: ptr LUint8; nin: csize_t; pnout: ptr csize_t): ptr LUint8 {.
    importc: "zlibUncompress".}