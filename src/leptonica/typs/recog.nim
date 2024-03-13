{.experimental:"codereordering".}
import environ, arrayy, pix_internal, bmf
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
##  \file recog.h
##
##  <pre>
##      This is a simple utility for training and recognizing individual
##      machine-printed text characters.  It is designed to be adapted
##      to a particular set of character images; e.g., from a book.
##
##      There are two methods of training the recognizer.  In the most
##      simple, a set of bitmaps has been labeled by some means, such
##      a generic OCR program.  This is input either one template at a time
##      or as a pixa of templates, to a function that creates a recog.
##      If in a pixa, the text string label must be embedded in the
##      text field of each pix.
##
##      If labeled data is not available, we start with a bootstrap
##      recognizer (BSR) that has labeled data from a variety of sources.
##      These images are scaled, typically to a fixed height, and then
##      fed similarly scaled unlabeled images from the source (e.g., book),
##      and the BSR attempts to identify them.  All images that have
##      a high enough correlation score with one of the templates in the
##      BSR are emitted in a pixa, which now holds unscaled and labeled
##      templates from the source.  This is the generator for a book adapted
##      recognizer (BAR).
##
##      The pixa should always be thought of as the primary structure.
##      It is the generator for the recog, because a recog is built
##      from a pixa of unscaled images.
##
##      New image templates can be added to a recog as long as it is
##      in training mode.  Once training is finished, to add templates
##      it is necessary to extract the generating pixa, add templates
##      to that pixa, and make a new recog.  Similarly, we do not
##      join two recog; instead, we simply join their generating pixa,
##      and make a recog from that.
##
##      To remove outliers from a pixa of labeled pix, make a recog,
##      determine the outliers, and generate a new pixa with the
##      outliers removed.  The outliers are determined by building
##      special templates for each character set that are scaled averages
##      of the individual templates.  Then a correlation score is found
##      between each template and the averaged templates.  There are
##      two implementations; outliers are determined as either:
##       (1) a template having a correlation score with its class average
##           that is below a threshold, or
##       (2) a template having a correlation score with its class average
##           that is smaller than the correlation score with the average
##           of another class.
##      Outliers are removed from the generating pixa.  Scaled averaging
##      is only performed for determining outliers and for splitting
##      characters; it is never used in a trained recognizer for identifying
##      unlabeled samples.
##
##      Two methods using averaged templates are provided for splitting
##      touching characters:
##       (1) greedy matching
##       (2) document image decoding (DID)
##      The DID method is the default.  It is about 5x faster and
##      possibly more accurate.
##
##      Once a BAR has been made, unlabeled sample images are identified
##      by finding the individual template in the BAR with highest
##      correlation.  The input images and images in the BAR can be
##      represented in two ways:
##       (1) as scanned, binarized to 1 bpp
##       (2) as a width-normalized outline formed by thinning to a
##           skeleton and then dilating by a fixed amount.
##
##      The recog can be serialized to file and read back.  The serialized
##      version holds the templates used for correlation (which may have
##      been modified by scaling and turning into lines from the unscaled
##      templates), plus, for arbitrary character sets, the UTF8
##      representation and the lookup table mapping from the character
##      representation to index.
##
##      Why do we not use averaged templates for recognition?
##      Letterforms can take on significantly different shapes (eg.,
##      the letters 'a' and 'g'), and it makes no sense to average these.
##      The previous version of this utility allowed multiple recognizers
##      to exist, but this is an unnecessary complication if recognition
##      is done on all samples instead of on averages.
##  </pre>
##

const
  RECOG_VERSION_NUMBER* = 2

type
  L_Recog* {.importc: "L_Recog", header: "recog.h", bycopy.} = object
    scalew* {.importc: "scalew".}: LInt32
    ## !< scale all examples to this width;
    ## !< use 0 prevent horizontal scaling
    scaleh* {.importc: "scaleh".}: LInt32
    ## !< scale all examples to this height;
    ## !< use 0 prevent vertical scaling
    linew* {.importc: "linew".}: LInt32
    ## !< use a value > 0 to convert the bitmap
    ## !< to lines of fixed width; 0 to skip
    templUse* {.importc: "templ_use".}: LInt32
    ## !< template use: use either the average
    ## !< or all temmplates (L_USE_AVERAGE or
    ## !< L_USE_ALL)
    maxarraysize* {.importc: "maxarraysize".}: LInt32
    ## !< initialize container arrays to this
    setsize* {.importc: "setsize".}: LInt32
    ## !< size of character set
    threshold* {.importc: "threshold".}: LInt32
    ## !< for binarizing if depth > 1
    maxyshift* {.importc: "maxyshift".}: LInt32
    ## !< vertical jiggle on nominal centroid
    ## !< alignment; typically 0 or 1
    charsetType* {.importc: "charset_type".}: LInt32
    ## !< one of L_ARABIC_NUMERALS, etc.
    charsetSize* {.importc: "charset_size".}: LInt32
    ## !< expected number of classes in charset
    minNopad* {.importc: "min_nopad".}: LInt32
    ## !< min number of samples without padding
    numSamples* {.importc: "num_samples".}: LInt32
    ## !< number of training samples
    minwidthU* {.importc: "minwidth_u".}: LInt32
    ## !< min width averaged unscaled templates
    maxwidthU* {.importc: "maxwidth_u".}: LInt32
    ## !< max width averaged unscaled templates
    minheightU* {.importc: "minheight_u".}: LInt32
    ## !< min height averaged unscaled templates
    maxheightU* {.importc: "maxheight_u".}: LInt32
    ## !< max height averaged unscaled templates
    minwidth* {.importc: "minwidth".}: LInt32
    ## !< min width averaged scaled templates
    maxwidth* {.importc: "maxwidth".}: LInt32
    ## !< max width averaged scaled templates
    aveDone* {.importc: "ave_done".}: LInt32
    ## !< set to 1 when averaged bitmaps are made
    trainDone* {.importc: "train_done".}: LInt32
    ## !< set to 1 when training is complete or
    ## !< identification has started
    maxWhRatio* {.importc: "max_wh_ratio".}: LFloat32
    ## !< max width/height ratio to split
    maxHtRatio* {.importc: "max_ht_ratio".}: LFloat32
    ## !< max of max/min template height ratio
    minSplitw* {.importc: "min_splitw".}: LInt32
    ## !< min component width kept in splitting
    maxSplith* {.importc: "max_splith".}: LInt32
    ## !< max component height kept in splitting
    saText* {.importc: "sa_text".}: ptr Sarray
    ## !< text array for arbitrary char set
    dnaTochar* {.importc: "dna_tochar".}: ptr L_Dna
    ## !< index-to-char lut for arbitrary charset
    centtab* {.importc: "centtab".}: ptr LInt32
    ## !< table for finding centroids
    sumtab* {.importc: "sumtab".}: ptr LInt32
    ## !< table for finding pixel sums
    pixaaU* {.importc: "pixaa_u".}: ptr Pixaa
    ## !< all unscaled templates for each class
    ptaaU* {.importc: "ptaa_u".}: ptr Ptaa
    ## !< centroids of all unscaled templates
    naasumU* {.importc: "naasum_u".}: ptr Numaa
    ## !< area of all unscaled templates
    pixaa* {.importc: "pixaa".}: ptr Pixaa
    ## !< all (scaled) templates for each class
    ptaa* {.importc: "ptaa".}: ptr Ptaa
    ## !< centroids of all (scaledl) templates
    naasum* {.importc: "naasum".}: ptr Numaa
    ## !< area of all (scaled) templates
    pixaU* {.importc: "pixa_u".}: ptr Pixa
    ## !< averaged unscaled templates per class
    ptaU* {.importc: "pta_u".}: ptr Pta
    ## !< centroids of unscaled ave. templates
    nasumU* {.importc: "nasum_u".}: ptr Numa
    ## !< area of unscaled averaged templates
    pixa* {.importc: "pixa".}: ptr Pixa
    ## !< averaged (scaled) templates per class
    pta* {.importc: "pta".}: ptr Pta
    ## !< centroids of (scaled) ave. templates
    nasum* {.importc: "nasum".}: ptr Numa
    ## !< area of (scaled) averaged templates
    pixaTr* {.importc: "pixa_tr".}: ptr Pixa
    ## !< all input training images
    pixadbAve* {.importc: "pixadb_ave".}: ptr Pixa
    ## !< unscaled and scaled averaged bitmaps
    pixaId* {.importc: "pixa_id".}: ptr Pixa
    ## !< input images for identifying
    pixdbAve* {.importc: "pixdb_ave".}: ptr Pix
    ## !< debug: best match of input against ave.
    pixdbRange* {.importc: "pixdb_range".}: ptr Pix
    ## !< debug: best matches within range
    pixadbBoot* {.importc: "pixadb_boot".}: ptr Pixa
    ## !< debug: bootstrap training results
    pixadbSplit* {.importc: "pixadb_split".}: ptr Pixa
    ## !< debug: splitting results
    bmf* {.importc: "bmf".}: ptr L_Bmf
    ## !< bmf fonts
    bmfSize* {.importc: "bmf_size".}: LInt32
    ## !< font size of bmf; default is 6 pt
    did* {.importc: "did".}: ptr L_Rdid
    ## !< temp data used for image decoding
    rch* {.importc: "rch".}: ptr L_Rch
    ## !< temp data used for holding best char
    rcha* {.importc: "rcha".}: ptr L_Rcha
    ## !< temp data used for array of best chars


## !
##   Data returned from correlation matching on a single character
##

type
  L_Rch* {.importc: "L_Rch", header: "recog.h", bycopy.} = object
    index* {.importc: "index".}: LInt32
    ## !< index of best template
    score* {.importc: "score".}: LFloat32
    ## !< correlation score of best template
    text* {.importc: "text".}: cstring
    ## !< character string of best template
    sample* {.importc: "sample".}: LInt32
    ## !< index of best sample (within the best
    ## !< template class, if all samples are used)
    xloc* {.importc: "xloc".}: LInt32
    ## !< x-location of template (delx + shiftx)
    yloc* {.importc: "yloc".}: LInt32
    ## !< y-location of template (dely + shifty)
    width* {.importc: "width".}: LInt32
    ## !< width of best template


## !
##   Data returned from correlation matching on an array of characters
##

type
  L_Rcha* {.importc: "L_Rcha", header: "recog.h", bycopy.} = object
    naindex* {.importc: "naindex".}: ptr Numa
    ## !< indices of best templates
    nascore* {.importc: "nascore".}: ptr Numa
    ## !< correlation scores of best templates
    satext* {.importc: "satext".}: ptr Sarray
    ## !< character strings of best templates
    nasample* {.importc: "nasample".}: ptr Numa
    ## !< indices of best samples
    naxloc* {.importc: "naxloc".}: ptr Numa
    ## !< x-locations of templates (delx + shiftx)
    nayloc* {.importc: "nayloc".}: ptr Numa
    ## !< y-locations of templates (dely + shifty)
    nawidth* {.importc: "nawidth".}: ptr Numa
    ## !< widths of best templates


## !
##   Data used for decoding a line of characters.
##

type
  L_Rdid* {.importc: "L_Rdid", header: "recog.h", bycopy.} = object
    pixs* {.importc: "pixs".}: ptr Pix
    ## !< clone of pix to be decoded
    counta* {.importc: "counta".}: ptr ptr LInt32
    ## !< count array for each averaged template
    delya* {.importc: "delya".}: ptr ptr LInt32
    ## !< best y-shift array per average template
    narray* {.importc: "narray".}: LInt32
    ## !< number of averaged templates
    size* {.importc: "size".}: LInt32
    ## !< size of count array (width of pixs)
    setwidth* {.importc: "setwidth".}: ptr LInt32
    ## !< setwidths for each template
    nasum* {.importc: "nasum".}: ptr Numa
    ## !< pixel count in pixs by column
    namoment* {.importc: "namoment".}: ptr Numa
    ## !< first moment of pixels in pixs by cols
    fullarrays* {.importc: "fullarrays".}: LInt32
    ## !< 1 if full arrays are made; 0 otherwise
    beta* {.importc: "beta".}: ptr LFloat32
    ## !< channel coeffs for template fg term
    gamma* {.importc: "gamma".}: ptr LFloat32
    ## !< channel coeffs for bit-and term
    trellisscore* {.importc: "trellisscore".}: ptr LFloat32
    ## !< score on trellis
    trellistempl* {.importc: "trellistempl".}: ptr LInt32
    ## !< template on trellis (for backtrack)
    natempl* {.importc: "natempl".}: ptr Numa
    ## !< indices of best path templates
    naxloc* {.importc: "naxloc".}: ptr Numa
    ## !< x locations of best path templates
    nadely* {.importc: "nadely".}: ptr Numa
    ## !< y locations of best path templates
    nawidth* {.importc: "nawidth".}: ptr Numa
    ## !< widths of best path templates
    boxa* {.importc: "boxa".}: ptr Boxa
    ## !< Viterbi result for splitting input pixs
    nascore* {.importc: "nascore".}: ptr Numa
    ## !< correlation scores: best path templates
    natemplR* {.importc: "natempl_r".}: ptr Numa
    ## !< indices of best rescored templates
    nasampleR* {.importc: "nasample_r".}: ptr Numa
    ## !< samples of best scored templates
    naxlocR* {.importc: "naxloc_r".}: ptr Numa
    ## !< x locations of best rescoredtemplates
    nadelyR* {.importc: "nadely_r".}: ptr Numa
    ## !< y locations of best rescoredtemplates
    nawidthR* {.importc: "nawidth_r".}: ptr Numa
    ## !< widths of best rescoredtemplates
    nascoreR* {.importc: "nascore_r".}: ptr Numa
    ## !< correlation scores: rescored templates


## -------------------------------------------------------------------------*
##              Flags for describing limited character sets                 *
## -------------------------------------------------------------------------
## ! Character Set

const
  L_UNKNOWN* = 0             ## !< character set type is not specified
  L_ARABIC_NUMERALS* = 1     ## !< 10 digits
  L_LC_ROMAN_NUMERALS* = 2   ## !< 7 lower-case letters (i,v,x,l,c,d,m)
  L_UC_ROMAN_NUMERALS* = 3   ## !< 7 upper-case letters (I,V,X,L,C,D,M)
  L_LC_ALPHA* = 4            ## !< 26 lower-case letters
  L_UC_ALPHA* = 5

## -------------------------------------------------------------------------*
##       Flags for selecting between using average and all templates:       *
##                            recog->templ_use                              *
## -------------------------------------------------------------------------
## ! Template Select

const
  L_USE_ALL_TEMPLATES* = 0   ## !< use all templates; default
  L_USE_AVERAGE_TEMPLATES* = 1
