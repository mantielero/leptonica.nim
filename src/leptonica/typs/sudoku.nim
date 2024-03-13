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
##  \file sudoku.h
##
##  <pre>
##     The L_Sudoku holds all the information of the current state.
##
##     The input to sudokuCreate() is a file with any number of lines
##     starting with '#', followed by 9 lines consisting of 9 numbers
##     in each line.  These have the known values and use 0 for the unknowns.
##     Blank lines are ignored.
##
##     The %locs array holds the indices of the unknowns, numbered
##     left-to-right and top-to-bottom from 0 to 80.  The array size
##     is initialized to %num.  %current is the index into the %locs
##     array of the current guess: locs[current].
##
##     The %state array is used to determine the validity of each guess.
##     It is of size 81, and is initialized by setting the unknowns to 0
##     and the knowns to their input values.
##  </pre>
##

type
  L_Sudoku* {.importc: "L_Sudoku", header: "sudoku.h", bycopy.} = object
    num* {.importc: "num".}: LInt32
    ## !< number of unknowns
    locs* {.importc: "locs".}: ptr LInt32
    ## !< location of unknowns
    current* {.importc: "current".}: LInt32
    ## !< index into %locs of current location
    init* {.importc: "init".}: ptr LInt32
    ## !< initial state, with 0 representing
    ## !< the unknowns
    state* {.importc: "state".}: ptr LInt32
    ## !< present state, including inits and
    ## !< guesses of unknowns up to %current
    nguess* {.importc: "nguess".}: LInt32
    ## !< shows current number of guesses
    finished* {.importc: "finished".}: LInt32
    ## !< set to 1 when solved
    failure* {.importc: "failure".}: LInt32
    ## !< set to 1 if no solution is possible


## ! For printing out array data
## ! Sudoku Output

const
  L_SUDOKU_INIT* = 0
  L_SUDOKU_STATE* = 1
