import environ, arrayy
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
##  \file stringcode.h
##
##      Data structure to hold accumulating generated code for storing
##      and extracting serializable leptonica objects (e.g., pixa, recog).
##
##      Also a flag for selecting a string from the L_GenAssoc struct
##      in stringcode.
##

type
  L_StrCode* {.importc: "L_StrCode", header: "stringcode.h", bycopy.} = object
    fileno* {.importc: "fileno".}: LInt32
    ## !< index for function and output file names
    ifunc* {.importc: "ifunc".}: LInt32
    ## !< index into struct currently being stored
    function* {.importc: "function".}: ptr Sarray
    ## !< store case code for extraction
    data* {.importc: "data".}: ptr Sarray
    ## !< store base64 encoded data as strings
    descr* {.importc: "descr".}: ptr Sarray
    ## !< store line in description table
    n* {.importc: "n".}: LInt32
    ## !< number of data strings


## ! Select string in stringcode for a specific serializable data type
## ! Stringcode Select

const
  L_STR_TYPE* = 0            ## !< typedef for the data type
  L_STR_NAME* = 1            ## !< name of the data type
  L_STR_READER* = 2          ## !< reader to get the data type from file
  L_STR_MEMREADER* = 3
