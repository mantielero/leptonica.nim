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
##  \file arrayaccess.h
##
##  <pre>
##   1, 2, 4, 8, 16 and 32 bit data access within an array of 32-bit words
##
##   This is used primarily to access 1, 2, 4, 8, 16 and 32 bit pixels
##   in a line of image data, represented as an array of 32-bit words.
##
##      pdata:  pointer to first 32-bit word in the array
##      n:      index of the pixel in the array
##
##   Function calls for these accessors are defined in arrayaccess.c.
##
##   However, for efficiency we use the inline macros for all accesses.
##   Even though the 2 and 4 bit set* accessors are more complicated,
##   they are about 10% faster than the function calls.
##
##   The 32 bit access is just a cast and ptr arithmetic.  We include
##   it so that the input ptr can be void*.
##
##   At the end of this file is code for invoking the function calls
##   instead of inlining.
##
##   The macro SET_DATA_BIT_VAL(pdata, n, val) is a bit slower than
##       if (val == 0)
##           CLEAR_DATA_BIT(pdata, n);
##       else
##           SET_DATA_BIT(pdata, n);
##
##   Some compilers complain when the SET macros are surrounded by
##   parentheses, because parens require an evaluation and it is not
##   defined for SET macros.  If SET_DATA_QBIT were defined as a
##   compound macro, in analogy to l_setDataQbit(), it requires
##   surrounding braces:
##  \code
##      #define  SET_DATA_QBIT(pdata, n, val) \
##         {l_uint32 *_TEMP_WORD_PTR_; \
##          _TEMP_WORD_PTR_ = (l_uint32 *)(pdata) + ((n) >> 3); \
##          *_TEMP_WORD_PTR_ &= ~(0xf0000000 >> (4 * ((n) & 7))); \
##          *_TEMP_WORD_PTR_ |= (((val) & 15) << (28 - 4 * ((n) & 7)));}
##  \endcode
##   but if used in an if/else
##  \code
##       if (x)
##          SET_DATA_QBIT(...);
##       else
##          ...
##  \endcode
##   the compiler sees
##  \code
##       if (x)
##          {......};
##       else
##          ...
##  \endcode
##   The semicolon comes after the brace and will not compile.
##   This can be fixed in the call by either omitting the semicolon
##   or requiring another set of braces around SET_DATA_QBIT(), but
##   both these options break compatibility with current code, and
##   require special attention by anyone using the macros.
##
##   There are (at least) two ways to fix this in the macro definitions,
##   suggested by Dave Bryan.
##   (1) Surround the braces in the macro above with
##          do {....} while(0)
##       Then the semicolon just terminates the expression.
##   (2) Reduce the blocks to a single expression; e.g,
##          *((l_uint32 *)(pdata) + ((n) >> 3)) = \
##            *((l_uint32 *)(pdata) + ((n) >> 3)) \
##            & ~(0xf0000000 >> (4 * ((n) & 7))) \
##            | (((val) & 15) << (28 - 4 * ((n) & 7)))
##       This appears to cause redundant computation, but the compiler
##       should evaluate the common subexpression only once.
##   All these methods have the same performance, giving about 300M
##   SET_DATA_QBIT operations per second on a fast 64 bit system.
##   Using the function calls instead of the macros results in about 250M
##   SET_DATA_QBIT operations per second, a performance hit of nearly 20%.
##  </pre>
##

const
  USE_INLINE_ACCESSORS* = 1

when use_Inline_Accessors:
  ## =============================================================
  ##                 Faster: use in line accessors
  ## =============================================================
  ## --------------------------------------------------*
  ##                      1 bit access                 *
  ## --------------------------------------------------
  ## ! 1 bit access - get
  template get_Data_Bit*(pdata, n: untyped): untyped =
    (((cast[ptr LUint32]((pdata)) + ((n) shr 5))[] shr (31 - ((n) and 31))) and
        1)

  ## ! 1 bit access - set
  template set_Data_Bit*(pdata, n: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 5))[] = (
        cast[ptr LUint32]((pdata)) + ((n) shr 5))[] or
        (0x80000000 shr ((n) and 31))

  ## ! 1 bit access - clear
  template clear_Data_Bit*(pdata, n: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 5))[] = (
        cast[ptr LUint32]((pdata)) + ((n) shr 5))[] and
        not (0x80000000 shr ((n) and 31))

  ## ! 1 bit access - set value (0 or 1)
  template set_Data_Bit_Val*(pdata, n, val: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 5))[] = (((
        cast[ptr LUint32]((pdata)) + ((n) shr 5))[] and
        (not (0x80000000 shr ((n) and 31)))) or
        ((lUint32)(val) shl (31 - ((n) and 31))))

  ## --------------------------------------------------*
  ##                      2 bit access                 *
  ## --------------------------------------------------
  ## ! 2 bit access - get
  template get_Data_Dibit*(pdata, n: untyped): untyped =
    (((cast[ptr LUint32]((pdata)) + ((n) shr 4))[] shr (2 * (15 - ((n) and 15)))) and
        3)

  ## ! 2 bit access - set value (0 ... 3)
  template set_Data_Dibit*(pdata, n, val: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 4))[] = (((
        cast[ptr LUint32]((pdata)) + ((n) shr 4))[] and
        (not (0xc0000000 shr (2 * ((n) and 15))))) or
        ((lUint32)((val) and 3) shl (30 - 2 * ((n) and 15))))

  ## ! 2 bit access - clear
  template clear_Data_Dibit*(pdata, n: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 4))[] = (
        cast[ptr LUint32]((pdata)) + ((n) shr 4))[] and
        not (0xc0000000 shr (2 * ((n) and 15)))

  ## --------------------------------------------------*
  ##                      4 bit access                 *
  ## --------------------------------------------------
  ## ! 4 bit access - get
  template get_Data_Qbit*(pdata, n: untyped): untyped =
    (((cast[ptr LUint32]((pdata)) + ((n) shr 3))[] shr (4 * (7 - ((n) and 7)))) and
        0xf)

  ## ! 4 bit access - set value (0 ... 15)
  template set_Data_Qbit*(pdata, n, val: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 3))[] = (((
        cast[ptr LUint32]((pdata)) + ((n) shr 3))[] and
        (not (0xf0000000 shr (4 * ((n) and 7))))) or
        ((lUint32)((val) and 15) shl (28 - 4 * ((n) and 7))))

  ## ! 4 bit access - clear
  template clear_Data_Qbit*(pdata, n: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + ((n) shr 3))[] = (
        cast[ptr LUint32]((pdata)) + ((n) shr 3))[] and
        not (0xf0000000 shr (4 * ((n) and 7)))

  ## --------------------------------------------------*
  ##                      8 bit access                 *
  ## --------------------------------------------------
  when defined(L_BIG_ENDIAN):
    ## ! 8 bit access - get
    template get_Data_Byte*(pdata, n: untyped): untyped =
      ((cast[ptr LUint8]((pdata)) + (n))[])

  else:
    ## ! 8 bit access - get
    template get_Data_Byte*(pdata, n: untyped): untyped =
      (cast[ptr LUint8](((lUintptrT)(cast[ptr LUint8]((pdata)) + (n)) xor 3))[])

  when defined(L_BIG_ENDIAN):
    ## ! 8 bit access - set value (0 ... 255)
    template set_Data_Byte*(pdata, n, val: untyped): untyped =
      (cast[ptr LUint8]((pdata)) + (n))[] = (val)

  else:
    ## ! 8 bit access - set value (0 ... 255)
    template set_Data_Byte*(pdata, n, val: untyped): untyped =
      cast[ptr LUint8](((lUintptrT)(cast[ptr LUint8]((pdata)) + (n)) xor 3))[] = (
          val)

  ## --------------------------------------------------*
  ##                     16 bit access                 *
  ## --------------------------------------------------
  when defined(L_BIG_ENDIAN):
    ## ! 16 bit access - get
    template get_Data_Two_Bytes*(pdata, n: untyped): untyped =
      ((cast[ptr LUint16]((pdata)) + (n))[])

  else:
    ## ! 16 bit access - get
    template get_Data_Two_Bytes*(pdata, n: untyped): untyped =
      (cast[ptr LUint16](((lUintptrT)(cast[ptr LUint16]((pdata)) + (n)) xor 2))[])

  when defined(L_BIG_ENDIAN):
    ## ! 16 bit access - set value (0 ... 65535)
    template set_Data_Two_Bytes*(pdata, n, val: untyped): untyped =
      (cast[ptr LUint16]((pdata)) + (n))[] = (val)

  else:
    ## ! 16 bit access - set value (0 ... 65535)
    template set_Data_Two_Bytes*(pdata, n, val: untyped): untyped =
      cast[ptr LUint16](((lUintptrT)(cast[ptr LUint16]((pdata)) + (n)) xor 2))[] = (
          val)

  ## --------------------------------------------------*
  ##                     32 bit access                 *
  ## --------------------------------------------------
  ## ! 32 bit access - get
  template get_Data_Four_Bytes*(pdata, n: untyped): untyped =
    ((cast[ptr LUint32]((pdata)) + (n))[])

  ## ! 32 bit access - set (0 ... 4294967295)
  template set_Data_Four_Bytes*(pdata, n, val: untyped): untyped =
    (cast[ptr LUint32]((pdata)) + (n))[] = (val)

else:
  ## =============================================================
  ##          Slower: use function calls for all accessors
  ## =============================================================
  template get_Data_Bit*(pdata, n: untyped): untyped =
    lGetDataBit(pdata, n)

  template set_Data_Bit*(pdata, n: untyped): untyped =
    lSetDataBit(pdata, n)

  template clear_Data_Bit*(pdata, n: untyped): untyped =
    lClearDataBit(pdata, n)

  template set_Data_Bit_Val*(pdata, n, val: untyped): untyped =
    lSetDataBitVal(pdata, n, val)

  template get_Data_Dibit*(pdata, n: untyped): untyped =
    lGetDataDibit(pdata, n)

  template set_Data_Dibit*(pdata, n, val: untyped): untyped =
    lSetDataDibit(pdata, n, val)

  template clear_Data_Dibit*(pdata, n: untyped): untyped =
    lClearDataDibit(pdata, n)

  template get_Data_Qbit*(pdata, n: untyped): untyped =
    lGetDataQbit(pdata, n)

  template set_Data_Qbit*(pdata, n, val: untyped): untyped =
    lSetDataQbit(pdata, n, val)

  template clear_Data_Qbit*(pdata, n: untyped): untyped =
    lClearDataQbit(pdata, n)

  template get_Data_Byte*(pdata, n: untyped): untyped =
    lGetDataByte(pdata, n)

  template set_Data_Byte*(pdata, n, val: untyped): untyped =
    lSetDataByte(pdata, n, val)

  template get_Data_Two_Bytes*(pdata, n: untyped): untyped =
    lGetDataTwoBytes(pdata, n)

  template set_Data_Two_Bytes*(pdata, n, val: untyped): untyped =
    lSetDataTwoBytes(pdata, n, val)

  template get_Data_Four_Bytes*(pdata, n: untyped): untyped =
    lGetDataFourBytes(pdata, n)

  template set_Data_Four_Bytes*(pdata, n, val: untyped): untyped =
    lSetDataFourBytes(pdata, n, val)
