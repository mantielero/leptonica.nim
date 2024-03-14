{.push header:"environ.h".}
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

## ------------------------------------------------------------------------*
##   Defines and includes differ for Unix and Windows.  Also for Windows,  *
##   differentiate between conditionals based on platform and compiler.    *
##       For platforms:                                                    *
##           _WIN32       =>     Windows, 32- or 64-bit                    *
##           _WIN64       =>     Windows, 64-bit only                      *
##           __CYGWIN__   =>     Cygwin                                    *
##       For compilers:                                                    *
##           __GNUC__     =>     gcc                                       *
##           _MSC_VER     =>     msvc                                      *
## ------------------------------------------------------------------------
##  MS VC++ does not provide stdint.h, so define the missing types here

# when not defined(_MSC_VER):
#   discard
# else:
#   ##  Note that _WIN32 is defined for both 32 and 64 bit applications,
#   ##    whereas _WIN64 is defined only for the latter
#   when defined(_WIN64):
#     type
#       intptrT* = c__int64
#       uintptrT* = cu__int64
#   else:
#     type
#       intptrT* = cint
#       uintptrT* = cuint
#   ##  VC++6 doesn't seem to have powf, expf.
#   when (msc_Ver < 1400):
#     template powf*(x, y: untyped): untyped =
#       cast[cfloat](pow((double)(x), (double)(y)))

#     template expf*(x: untyped): untyped =
#       cast[cfloat](exp((double)(x)))

# when defined(stdc_Version) and (stdc_Version >= 201112'i32) and
#     not defined(stdc_No_Atomics):
#   type
#     LAtomic* = AtomicInt
# else:
type
  LAtomic* = cint

# when not defined(LEPT_DLL):
#   ##  Windows specifics
#   when defined(_WIN32):
#     ##  DLL EXPORTS and IMPORTS
#     when defined(liblept_Exports):
#       discard
#     elif defined(liblept_Imports):
#       discard
#     else:
#       discard
#   else:
#     discard
# when not defined(_WIN32):   ##  non-Windows specifics
#   discard
# when defined(__APPLE__):
#   discard

# type
#   LIntptrT* = intptrT
#   LUintptrT* = uintptrT

## --------------------------------------------------------------------*
##  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
##                           USER CONFIGURABLE                         *
##  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
##                Environment variables with I/O libraries             *
##                Manual Configuration Only: NOT AUTO_CONF             *
## --------------------------------------------------------------------
##
##   Leptonica provides interfaces to link to several external image
##   I/O libraries, plus zlib.  Setting any of these to 0 here causes
##   non-functioning stubs to be linked.
##

# when not defined(have_Config_H) and not defined(android_Build) and
#     not defined(os_Ios):
#   when not defined(have_Libjpeg):
#     const
#       HAVE_LIBJPEG* = 1
#   when not defined(have_Libtiff):
#     const
#       HAVE_LIBTIFF* = 1
#   when not defined(have_Libpng):
#     const
#       HAVE_LIBPNG* = 1
#   when not defined(have_Libz):
#     const
#       HAVE_LIBZ* = 1
#   when not defined(have_Libgif):
#     const
#       HAVE_LIBGIF* = 0
#   when not defined(have_Libungif):
#     const
#       HAVE_LIBUNGIF* = 0
#   when not defined(have_Libwebp):
#     const
#       HAVE_LIBWEBP* = 0
#   when not defined(have_Libwebp_Anim):
#     const
#       HAVE_LIBWEBP_ANIM* = 0
#   when not defined(have_Libjp2k):
#     const
#       HAVE_LIBJP2K* = 0
## -----------------------------------------------------------------------*
##  Leptonica supports OpenJPEG 2.1+.  If you have a version of openjpeg  *
##  (HAVE_LIBJP2K == 1) that is >= 2.1, set the path to the openjpeg.h    *
##  header in angle brackets here.                                        *
## -----------------------------------------------------------------------
## --------------------------------------------------------------------*
##  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
##                           USER CONFIGURABLE                         *
##  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
##      Environ variables for image I/O without external libraries     *
## --------------------------------------------------------------------
##
##   Leptonica supplies I/O support without using external libraries for:
##      * image read/write for bmp, pnm
##      * header read for jp2k
##      * image wrapping write for pdf and ps.
##   Setting any of these to 0 causes non-functioning stubs to be linked.
##

const
  USE_BMPIO* = 1
  USE_PNMIO* = 1
  USE_JP2KHEADER* = 1
  USE_PDFIO* = 1
  USE_PSIO* = 1

## -------------------------------------------------------------------------*
##  On linux, BSD, macOS (> 10.12), android (sdk >= 23) and iOS(>= 11.0),
##  you can redirect writing data from a filestream to memory using
##  open_memstream() and redirect reading data from a filestream to
##  reading from memory using fmemopen().
##  Specifically, you can compress (write compressed data to memory
##  from raster data in a Pix) and uncompress (read from compressed data
##  in memory to raster data in a Pix).
##  For png, tiff and webp, data is compressed and uncompressed directly
##  to memory without the use of the POSIX.1 (2008) functions fmemopen()
##  and open_memstream().
##  For jpeg, jp2k, gif, pnm and bmp, these functions are used on systems
##  that support them, and for those we define HAVE_FMEMOPEN to 1.
## -------------------------------------------------------------------------

# when not defined(have_Config_H) and
#     (not defined(android_Build) or android_Api >= 23) and
#     (not defined(iphone_Os_Version_Min_Required) or
#     iphone_Os_Version_Min_Required >= 110000) and
#     (not defined(mac_Os_X_Version_Min_Required) or
#     mac_Os_X_Version_Min_Required > 101200) and
#     not defined(win32):
#   const
#     HAVE_FMEMOPEN* = 1
## -------------------------------------------------------------------------*
##  fstatat() is defined by POSIX, but some systems do not support it.      *
##  One example is older macOS systems (pre-10.10).                         *
##  Also, dirfd() is required by fstatat().                                 *
##  Play it safe and set the default values to 0.                           *
## -------------------------------------------------------------------------

# when not defined(have_Config_H):
#   const
#     HAVE_FSTATAT* = 0
#     HAVE_DIRFD* = 0
## --------------------------------------------------------------------*
##  It is desirable on Windows to have all temp files written to the same
##  subdirectory of the Windows <Temp> directory, because files under <Temp>
##  persist after reboot, and the regression tests write a lot of files.
##  We write all test files to /tmp/lept or subdirectories of /tmp/lept.
##  Windows temp files are specified as in unix, but have the translation
##         /tmp/lept/xxx  -->   <Temp>/lept/xxx
## --------------------------------------------------------------------
## --------------------------------------------------------------------*
##                           Built-in types                            *
## --------------------------------------------------------------------

type
  LOk* = cint

## !< return 0 if OK, 1 on error

type
  LInt8* = cchar

## !< signed 8-bit value

type
  LUint8* = uint8

## !< unsigned 8-bit value

type
  LInt16* = cshort

## !< signed 16-bit value

type
  LUint16* = cushort

## !< unsigned 16-bit value

type
  LInt32* = cint

## !< signed 32-bit value

type
  LUint32* = cuint

## !< unsigned 32-bit value

type
  LFloat32* = cfloat

## !< 32-bit floating point value

type
  LFloat64* = cdouble

## !< 64-bit floating point value

# when defined(COMPILER_MSVC):
#   type
#     LInt64* = c__int64
#   ## !< signed 64-bit value
#   type
#     LUint64* = cu__int64
#   ## !< unsigned 64-bit value
# else:
type
  LInt64* = clonglong
## !< signed 64-bit value
type
  LUint64* = culonglong
  ## !< unsigned 64-bit value
## -------------------------------------------------------------------------*
##  For security, the library is distributed in a configuration that does   *
##  not permit (1) forking with 'system', which is used for displaying      *
##  images and generating gnuplots, and (2) writing files with specified    *
##  compiled-in file names.  All such writes are with functions such as     *
##  pixWriteDebug() where the "Debug" is appended to the usual name.        *
##  Whether the "Debug" version defaults to the standard version or is a    *
##  no-op depends on the value of this global variable.  The default value  *
##  of LeptDebugOK is 0, and it is set in writefile.c.  This value can be   *
##  over-ridden, for development and debugging, by setLeptDebugOK().        *
## -------------------------------------------------------------------------

var leptDebugOK* {.importc: "LeptDebugOK", header: "environ.h".}: LInt32

##  default is 0
## ------------------------------------------------------------------------*
##                             Standard macros                             *
## ------------------------------------------------------------------------

# when not defined(L_MIN):
#   ## ! Minimum of %x and %y
#   template l_Min*(x, y: untyped): untyped =
#     (if ((x) < (y)): (x) else: (y))

# when not defined(L_MAX):
#   ## ! Maximum of %x and %y
#   template l_Max*(x, y: untyped): untyped =
#     (if ((x) > (y)): (x) else: (y))

# when not defined(L_ABS):
#   ## ! Absolute value of %x
#   template l_Abs*(x: untyped): untyped =
#     (if ((x) < 0): (-(1 * (x))) else: (x))

# when not defined(L_SIGN):
#   ## ! Sign of %x
#   template l_Sign*(x: untyped): untyped =
#     (if ((x) < 0): -1 else: 1)

# when not defined(UNDEF):
#   ## ! Undefined value
#   const
#     UNDEF* = -1
# when not defined(NULL):
#   ## ! NULL value
#   const
#     NULL* = 0
# when not defined(TRUE):
#   ## ! True value
#   const
#     TRUE* = 1
# when not defined(FALSE):
#   ## ! False value
#   const
#     FALSE* = 0
## --------------------------------------------------------------------*
##             Environment variables for endian dependence             *
## --------------------------------------------------------------------
##
##   To control conditional compilation, one of two variables
##
##        L_LITTLE_ENDIAN  (e.g., for Intel X86)
##        L_BIG_ENDIAN     (e.g., for Sun SPARC, Mac Power PC)
##
##   is defined when the GCC compiler is invoked.
##   All code should compile properly for both hardware architectures.
##
## ------------------------------------------------------------------------*
##                     Simple search state variables                       *
## ------------------------------------------------------------------------
## ! Search State

const
  L_NOT_FOUND* = 0
  L_FOUND* = 1

## ------------------------------------------------------------------------*
##                      Path separator conversion                          *
## ------------------------------------------------------------------------
## ! Path Separators

const
  UNIX_PATH_SEPCHAR* = 0
  WIN_PATH_SEPCHAR* = 1

## ------------------------------------------------------------------------*
##                           Timing structs                                *
## ------------------------------------------------------------------------

type
  L_Timer* = pointer

## ! Timing struct

type
  L_WallTimer* {.importc: "L_WallTimer", header: "environ.h", bycopy.} = object
    startSec* {.importc: "start_sec".}: LInt32
    startUsec* {.importc: "start_usec".}: LInt32
    stopSec* {.importc: "stop_sec".}: LInt32
    stopUsec* {.importc: "stop_usec".}: LInt32


## ------------------------------------------------------------------------*
##                       Standard memory allocation                        *
##                                                                         *
##   All default heap allocation is through the system malloc and free.    *
##                                                                         *
##   Leptonica also provides non-default allocation in two situations:     *
##                                                                         *
##   (1) A special allocator/deallocator pair can be provided for the      *
##       pix image data array.  This might be useful to prevent memory     *
##       fragmentation when large images are repeatedly allocated and      *
##       freed.  See the PixMemoryManager in pix1.c for details,           *
##       where the default is defined.                                     *
##                                                                         *
##   (2) Special allocator/deallocators can be provided for ALL heap       *
##       allocation if required, for example, for embedded systems.        *
##       For such builds, define LEPTONICA_INTERCEPT_ALLOC, and provide    *
##       custom leptonica_{malloc, calloc, realloc, free} functions.       *
## ------------------------------------------------------------------------

# when defined(LEPTONICA_INTERCEPT_ALLOC):
#   template lept_Malloc*(blocksize: untyped): untyped =
#     leptonicaMalloc(blocksize)

#   template lept_Calloc*(numelem, elemsize: untyped): untyped =
#     leptonicaCalloc(numelem, elemsize)

#   template lept_Realloc*(`ptr`, blocksize: untyped): untyped =
#     leptonicaRealloc(`ptr`, blocksize)

#   template lept_Free*(`ptr`: untyped): untyped =
#     leptonicaFree(`ptr`)

#   proc leptonicaMalloc*(blocksize: csize_t): pointer {.
#       importc: "leptonica_malloc", header: "environ.h".}
#   proc leptonicaCalloc*(numelem: csize_t; elemsize: csize_t): pointer {.
#       importc: "leptonica_calloc", header: "environ.h".}
#   proc leptonicaRealloc*(`ptr`: pointer; blocksize: csize_t): pointer {.
#       importc: "leptonica_realloc", header: "environ.h".}
#   proc leptonicaFree*(`ptr`: pointer) {.importc: "leptonica_free",
#                                         header: "environ.h".}
# else:
#   template lept_Malloc*(blocksize: untyped): untyped =
#     malloc(blocksize)

#   template lept_Calloc*(numelem, elemsize: untyped): untyped =
#     calloc(numelem, elemsize)

#   template lept_Realloc*(`ptr`, blocksize: untyped): untyped =
#     realloc(`ptr`, blocksize)

#   template lept_Free*(`ptr`: untyped): untyped =
#     free(`ptr`)

## ------------------------------------------------------------------------*
##          Control printing of error, warning, and info messages          *
##                                                                         *
##   Leptonica never sends output to stdout.  By default, all messages     *
##   go to stderr.  However, we provide a mechanism for runtime            *
##   redirection of output, using a custom stderr handler defined          *
##   by the user.  See utils1.c for details and examples.                  *
##                                                                         *
##   To omit all messages to stderr, simply define NO_CONSOLE_IO on the    *
##   command line.  For finer grained control, we have a mechanism         *
##   based on the message severity level.  The following assumes that      *
##   NO_CONSOLE_IO is not defined.                                         *
##                                                                         *
##   Messages are printed if the message severity is greater than or equal *
##   to the current severity threshold.  The current severity threshold    *
##   is the greater of the compile-time severity, which is the minimum     *
##   severity that can be reported, and the run-time severity, which is    *
##   the severity threshold at the moment.                                 *
##                                                                         *
##   The compile-time threshold determines which messages are compiled     *
##   into the library for potential printing.  Messages below the          *
##   compile-time threshold are omitted and can never be printed.  The     *
##   default compile-time threshold is L_SEVERITY_INFO, but this may be    *
##   overridden by defining MINIMUM_SEVERITY to the desired enumeration    *
##   identifier on the compiler command line.  Defining NO_CONSOLE_IO on   *
##   the command line is the same as setting MINIMUM_SEVERITY to           *
##   L_SEVERITY_NONE.                                                      *
##                                                                         *
##   The run-time threshold determines which messages are printed during   *
##   library execution.  It defaults to the compile-time threshold but     *
##   may be changed either statically by defining DEFAULT_SEVERITY to      *
##   the desired enumeration identifier on the compiler command line, or   *
##   dynamically by calling setMsgSeverity() to specify a new threshold.   *
##   The run-time threshold may also be set from the value of the          *
##   environment variable LEPT_MSG_SEVERITY by calling setMsgSeverity()   *
##   and specifying L_SEVERITY_EXTERNAL.                                   *
##                                                                         *
##   In effect, the compile-time threshold setting says, "Generate code    *
##   to permit messages of equal or greater severity than this to be       *
##   printed, if desired," whereas the run-time threshold setting says,    *
##   "Print messages that have an equal or greater severity than this."    *
## ------------------------------------------------------------------------
## ! Control printing of error, warning and info messages
## ! Message Control

const
  L_SEVERITY_EXTERNAL* = 0   ##  Get the severity from the environment
  L_SEVERITY_ALL* = 1        ##  Lowest severity: print all messages
  L_SEVERITY_DEBUG* = 2      ##  Print debugging and higher messages
  L_SEVERITY_INFO* = 3       ##  Print informational and higher messages
  L_SEVERITY_WARNING* = 4    ##  Print warning and higher messages
  L_SEVERITY_ERROR* = 5      ##  Print error and higher messages
  L_SEVERITY_NONE* = 6

##   No message less than the compile-time threshold will ever be
##   reported, regardless of the current run-time threshold.  This allows
##   selection of the set of messages to include in the library.  For
##   example, setting the threshold to L_SEVERITY_WARNING eliminates all
##   informational messages from the library.  With that setting, both
##   warning and error messages would be printed unless setMsgSeverity()
##   was called, or DEFAULT_SEVERITY was redefined, to set the run-time
##   severity to L_SEVERITY_ERROR.  In that case, only error messages
##   would be printed.
##
##   This mechanism makes the library smaller and faster, by eliminating
##   undesired message reporting and the associated run-time overhead for
##   message threshold checking, because code for messages whose severity
##   is lower than MINIMUM_SEVERITY won't be generated.
##
##   A production library might typically permit ERROR messages to be
##   generated, and a development library might permit DEBUG and higher.
##   The actual messages printed (as opposed to generated) would depend
##   on the current run-time severity threshold.
##
##   This is a complex mechanism and a few examples may help.
##   (1) No output permitted under any circumstances.
##       Use:  -DNO_CONSOLE_IO  or  -DMINIMUM_SEVERITY=6
##   (2) Suppose you want to only allow error messages, and you don't
##       want to permit info or warning messages at runtime.
##       Use:  -DMINIMUM_SEVERITY=5
##   (3) Suppose you want to only allow error messages by default,
##       but you will permit this to be over-ridden at runtime.
##       Use:  -DDEFAULT_SEVERITY=5
##             and to allow info and warning override:
##                  setMsgSeverity(L_SEVERITY_INFO);
##

# when defined(NO_CONSOLE_IO):
#   const
#     MINIMUM_SEVERITY* = L_SEVERITY_NONE
#     DEFAULT_SEVERITY* = L_SEVERITY_NONE
# else:
#   when not defined(MINIMUM_SEVERITY):
#     const
#       MINIMUM_SEVERITY* = L_SEVERITY_INFO
#   when not defined(DEFAULT_SEVERITY):
#     const
#       DEFAULT_SEVERITY* = minimum_Severity
## !  The run-time message severity threshold is defined in utils1.c.

var leptMsgSeverity* {.importc: "LeptMsgSeverity", header: "environ.h".}: LInt32

##
##  <pre>
##   Usage
##   =====
##   Messages are of three types.
##
##   (1) The messages
##       ERROR_INT(a,b,c)       : returns l_int32
##       ERROR_FLOAT(a,b,c)     : returns l_float32
##       ERROR_PTR(a,b,c)       : returns void*
##   are used to return from functions and take three parameters:
##       a : <message string>
##       b : __func__   (the procedure name)
##       c : <return value from function>
##   A newline is added by the function after the message.
##
##   (2) The messages
##       ERROR_INT_1(a,f,b,c)     : returns l_int32
##       ERROR_FLOAT_1(a,f,b,c)   : returns l_float32
##       ERROR_PTR_1(a,f,b,c)     : returns void*
##   are used to return from functions and take four parameters:
##       a : <message string>
##       f : <second message string> (typically, a filename for an fopen()))
##       b : __func__   (the procedure name)
##       c : <return value from function>
##   A newline is added by the function after the message.
##
##   (3) The purely informational L_* messages
##       L_ERROR(a,...)
##       L_WARNING(a,...)
##       L_INFO(a,...)
##   do not take a return value, but they take at least two parameters:
##       a  :  <message string> with optional format conversions
##       v1 : procName    (this must be included as the first vararg)
##       v2, ... :  optional varargs to match format converters in the message
##   Unlike the messages that return a value in (2) and (3) above,
##   here a newline needs to be included at the end of the message string.
##
##   To return an error from a function that returns void, use:
##       L_ERROR(<message string>, procName, [...])
##       return;
##
##   Implementation details
##   ======================
##   Messages are defined with the IF_SEV macro.  The first parameter is
##   the message severity, the second is the function to call if the
##   message is to be printed, and the third is the return value if the
##   message is to be suppressed.  For example, we might have an
##   informational message defined as:
##
##     IF_SEV(L_SEVERITY_INFO, fprintf(.......), 0)
##
##   The macro expands into a conditional.  Because the first comparison
##   is between two constants, an optimizing compiler will remove either
##   the comparison (if it's true) or the entire macro expansion (if it
##   is false).  This means that there is no run-time overhead for
##   messages whose severity falls below the minimum specified at compile
##   time, and for others the overhead is one (not two) comparisons.
##
##   The L_nnn() macros below do not return a value, but because the
##   conditional operator requires one for the false condition, we
##   specify a void expression.
##  </pre>
##
##  #ifdef  NO_CONSOLE_IO
##    #define PROCNAME(name)
##    #define ERROR_INT(a, b, c)            ((l_int32)(c))
##    #define ERROR_FLOAT(a, b, c)          ((l_float32)(c))
##    #define ERROR_PTR(a, b, c)            ((void *)(c))
##    #define ERROR_INT_1(a, f, b, c)       ((l_int32)(c))
##    #define ERROR_FLOAT_1(a, f, b, c)     ((l_float32)(c))
##    #define ERROR_PTR_1(a, f, b, c)       ((void *)(c))
##    #define L_ERROR(a, ...)
##    #define L_WARNING(a, ...)
##    #define L_INFO(a, ...)
##  #else
##    // #define PROCNAME(name)              static const char procName[] = name
##    // #define IF_SEV(l, t, f) \
##    //     ((l) >= MINIMUM_SEVERITY && (l) >= LeptMsgSeverity ? (t) : (f))
##    // #define ERROR_INT(a, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorInt((a), (b), (c)), (l_int32)(c))
##    // #define ERROR_FLOAT(a, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorFloat((a), (b), (c)), (l_float32)(c))
##    // #define ERROR_PTR(a, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorPtr((a), (b), (c)), (void *)(c))
##    // #define ERROR_INT_1(a, f, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorInt1((a), (f), (b), (c)), \
##    //            (l_int32)(c))
##    // #define ERROR_FLOAT_1(a, f, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorFloat1((a), (f), (b), (c)), \
##    //            (l_float32)(c))
##    // #define ERROR_PTR_1(a, f, b, c) \
##    //     IF_SEV(L_SEVERITY_ERROR, returnErrorPtr1((a), (f), (b), (c)), \
##    //            (void *)(c))
##    // #define L_ERROR(a, ...) \
##    //     IF_SEV(L_SEVERITY_ERROR, \
##    //            (void)lept_stderr("Error in %s: " a, __VA_ARGS__), \
##    //            (void)0)
##    // #define L_WARNING(a, ...) \
##    //     IF_SEV(L_SEVERITY_WARNING, \
##    //            (void)lept_stderr("Warning in %s: " a, __VA_ARGS__), \
##    //            (void)0)
##    // #define L_INFO(a, ...) \
##    //     IF_SEV(L_SEVERITY_INFO, \
##    //            (void)lept_stderr("Info in %s: " a, __VA_ARGS__), \
##    //            (void)0)
##  #if 0  /* Alternative method for controlling L_* message output */
##    #define L_ERROR(a, ...) \
##      { if (L_SEVERITY_ERROR >= MINIMUM_SEVERITY && \
##            L_SEVERITY_ERROR >= LeptMsgSeverity) \
##            lept_stderr("Error in %s: " a, __VA_ARGS__) \
##      }
##    #define L_WARNING(a, ...) \
##      { if (L_SEVERITY_WARNING >= MINIMUM_SEVERITY && \
##            L_SEVERITY_WARNING >= LeptMsgSeverity) \
##            lept_stderr("Warning in %s: " a, __VA_ARGS__) \
##      }
##    #define L_INFO(a, ...) \
##      { if (L_SEVERITY_INFO >= MINIMUM_SEVERITY && \
##            L_SEVERITY_INFO >= LeptMsgSeverity) \
##            lept_stderr("Info in %s: " a, __VA_ARGS__) \
##      }
##  #endif
##  #endif  /* NO_CONSOLE_IO */
## ------------------------------------------------------------------------*
##               snprintf() renamed in MSVC (pre-VS2015)                   *
## ------------------------------------------------------------------------

# when defined(msc_Ver) and msc_Ver < 1900:
#   template snprintf*(buf, size: untyped; xargs: varargs[untyped]): untyped =
#     snprintfS(buf, size, truncate, va_Args)
{.pop.}