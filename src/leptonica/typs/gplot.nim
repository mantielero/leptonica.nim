import arrayy, environ
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
##  \file gplot.h
##
##  <pre>
##    Data structures and parameters for generating gnuplot files
##
##    We used to support X11 output, but recent versions of gnuplot do not
##    support the X11 terminal.  To get display to your screen, use
##    GPLOT_PNG output; e.g.,
##        gplotSimple1(na, GPLOT_PNG, "/tmp/someroot", ...);
##        l_fileDisplay("/tmp/someroot.png", ...);
##  </pre>
##

const
  GPLOT_VERSION_NUMBER* = 1
  NUM_GPLOT_STYLES* = 5

type
  Gplot_Style* {.size: sizeof(cint).} = enum
    GPLOT_LINES = 0, GPLOT_POINTS = 1, GPLOT_IMPULSES = 2,
    GPLOT_LINESPOINTS = 3, GPLOT_DOTS = 4


const
  NUM_GPLOT_OUTPUTS* = 6

type
  Gplot_Output* {.size: sizeof(cint).} = enum
    GPLOT_NONE = 0, GPLOT_PNG = 1, GPLOT_PS = 2, GPLOT_EPS = 3, GPLOT_LATEX = 4,
    GPLOT_PNM = 5


type
  Gplot_Scaling* {.size: sizeof(cint).} = enum
    GPLOT_LINEAR_SCALE = 0, ## !< default
    GPLOT_LOG_SCALE_X = 1, GPLOT_LOG_SCALE_Y = 2, GPLOT_LOG_SCALE_X_Y = 3


# let gplotstylenames* {.importc: "gplotstylenames", header: "gplot.h".}: UncheckedArray[
#     cstring]

# ## !< used in gnuplot cmd file

# let gplotfileoutputs* {.importc: "gplotfileoutputs", header: "gplot.h".}: UncheckedArray[
#     cstring]

## !< used in simple file input
## ! Data structure for generating gnuplot files

type
  GPlot* {.importc: "GPlot", header: "gplot.h", bycopy.} = object
    rootname* {.importc: "rootname".}: cstring
    ## !< for cmd, data, output
    cmdname* {.importc: "cmdname".}: cstring
    ## !< command file name
    cmddata* {.importc: "cmddata".}: ptr Sarray
    ## !< command file contents
    datanames* {.importc: "datanames".}: ptr Sarray
    ## !< data file names
    plotdata* {.importc: "plotdata".}: ptr Sarray
    ## !< plot data (1 string/file)
    plotlabels* {.importc: "plotlabels".}: ptr Sarray
    ## !< label for each individual plot
    plotstyles* {.importc: "plotstyles".}: ptr Numa
    ## !< plot style for individual plots
    nplots* {.importc: "nplots".}: LInt32
    ## !< current number of plots
    outname* {.importc: "outname".}: cstring
    ## !< output file name
    outformat* {.importc: "outformat".}: LInt32
    ## !< GPLOT_OUTPUT values
    scaling* {.importc: "scaling".}: LInt32
    ## !< GPLOT_SCALING values
    title* {.importc: "title".}: cstring
    ## !< optional
    xlabel* {.importc: "xlabel".}: cstring
    ## !< optional x axis label
    ylabel* {.importc: "ylabel".}: cstring
    ## !< optional y axis label

