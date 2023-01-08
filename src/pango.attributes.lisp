;;; ----------------------------------------------------------------------------
;;; pango.attributes.lisp
;;;
;;; The documentation of this file is taken from the Pango Reference Manual
;;; Version 1.50 and modified to document the Lisp binding to the Pango library.
;;; See <http://www.pango.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2022 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------
;;;
;;; Text Attributes
;;;
;;;     Font and other attributes for annotating text
;;;
;;; Types and Values
;;;
;;;     PANGO_SCALE_XX_SMALL
;;;     PANGO_SCALE_X_SMALL
;;;     PANGO_SCALE_SMALL
;;;     PANGO_SCALE_MEDIUM
;;;     PANGO_SCALE_LARGE
;;;     PANGO_SCALE_X_LARGE
;;;     PANGO_SCALE_XX_LARGE
;;;
;;;     PangoAttrType
;;;     PangoUnderline
;;;     PangoOverline                                      Since 1.46
;;;     PangoShowFlags                                     Since 1.44
;;;     PangoTextTransform                                 Since 1.50
;;;     PangoBaseLineShift                                 Since 1.50
;;;     PangoFontScale                                     Since 1.50
;;;
;;;     PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING
;;;     PANGO_ATTR_INDEX_TO_TEXT_END
;;;
;;;     PangoAttrClass
;;;     PangoAttribute
;;;     PangoAttrString
;;;     PangoAttrLanguage
;;;     PangoAttrColor
;;;     PangoAttrInt
;;;     PangoAttrFloat
;;;     PangoAttrFontDesc
;;;     PangoAttrShape
;;;     PangoAttrSize
;;;     PangoAttrFontFeatures
;;;
;;;     PangoColor
;;;     PangoAttrList
;;;     PangoAttrIterator
;;;
;;; Functions
;;;
;;;     pango_attr_type_register
;;;     pango_attr_type_get_name
;;;     pango_attribute_init
;;;     pango_attribute_copy
;;;     pango_attribute_equal
;;;     pango_attribute_destroy
;;;
;;;     pango_attr_language_new
;;;     pango_attr_family_new
;;;     pango_attr_style_new
;;;     pango_attr_variant_new
;;;     pango_attr_stretch_new
;;;     pango_attr_weight_new
;;;     pango_attr_size_new
;;;     pango_attr_size_new_absolute
;;;     pango_attr_font_desc_new
;;;     pango_attr_foreground_new
;;;     pango_attr_background_new
;;;     pango_attr_strikethrough_new
;;;     pango_attr_strikethrough_color_new
;;;     pango_attr_underline_new
;;;     pango_attr_underline_color_new
;;;     pango_attr_overline_new
;;;     pango_attr_overline_color_new
;;;     pango_attr_shape_new
;;;     pango_attr_shape_new_with_data
;;;
;;;     PangoAttrDataCopyFunc
;;;
;;;     pango_attr_scale_new
;;;     pango_attr_rise_new
;;;     pango_attr_letter_spacing_new
;;;     pango_attr_fallback_new
;;;     pango_attr_gravity_new
;;;     pango_attr_gravity_hint_new
;;;     pango_attr_font_features_new
;;;     pango_attr_foreground_alpha_new
;;;     pango_attr_background_alpha_new
;;;     pango_attr_allow_breaks_new
;;;     pango_attr_insert_hyphens_new
;;;     pango_attr_show_new
;;;
;;;     pango_color_parse
;;;     pango_color_parse_with_alpha
;;;     pango_color_copy
;;;     pango_color_free
;;;     pango_color_to_string
;;;
;;;     pango_attr_list_new
;;;     pango_attr_list_ref
;;;     pango_attr_list_unref
;;;     pango_attr_list_copy
;;;     pango_attr_list_insert
;;;     pango_attr_list_insert_before
;;;     pango_attr_list_change
;;;     pango_attr_list_splice
;;;     pango_attr_list_filter
;;;     pango_attr_list_update
;;;
;;;     PangoAttrFilterFunc
;;;
;;;     pango_attr_list_get_attributes
;;;     pango_attr_list_equal
;;;     pango_attr_list_get_iterator
;;;     pango_attr_iterator_copy
;;;     pango_attr_iterator_next
;;;     pango_attr_iterator_range
;;;     pango_attr_iterator_get
;;;     pango_attr_iterator_get_font
;;;     pango_attr_iterator_get_attrs
;;;     pango_attr_iterator_destroy
;;;
;;; Object Hierarchy
;;;
;;;     GBoxed
;;;     ├── PangoAttrIterator
;;;     ├── PangoAttrList
;;;     ├── PangoAttribute
;;;     ╰── PangoColor
;;;
;;;     GEnum
;;;     ├── PangoAttrType
;;;     ├── PangoUnderline
;;;     ├── PangoOverline
;;;     ├── PangoTextTransform
;;;     ├── PangoBaseLineShift
;;;     ╰── PangoFontScale
;;;
;;;     GFlags
;;;     ╰── PangoShowFlags
;;;
;;; Description
;;;
;;;     Attributed text is used in a number of places in Pango. It is used as
;;;     the input to the itemization process and also when creating a
;;;     PangoLayout. The data types and functions in this section are used to
;;;     represent and manipulate sets of attributes applied to a portion of
;;;     text.
;;; ----------------------------------------------------------------------------

(in-package :pango)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_XX_SMALL
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-xx-small+) "Constant")

(defconstant +pango-scale-xx-small+ #.(/ 1.0d0 (* 1.2d0 1.2d0 1.2d0))
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{(/ 1.0d0 (* 1.2d0 1.2d0 1.2d0))}}
  @begin{short}
    The scale factor for three shrinking steps.
  @end{short}")

(export '+pango-scale-xx-small+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_X_SMALL
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-x-small+) "Constant")

(defconstant +pango-scale-x-small+ #.(/ 1.0d0 (* 1.2d0 1.2d0))
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{(/ 1.0d0 (* 1.2d0 1.2d0))}}
  @begin{short}
    The scale factor for two shrinking steps.
  @end{short}")

(export '+pango-scale-x-small+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_SMALL
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-small+) "Constant")

(defconstant +pango-scale-small+ #.(/ 1.0d0 1.2d0)
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{(/ 1.0d0 1.2d0)}}
  @begin{short}
    The scale factor for one shrinking step.
  @end{short}")

(export '+pango-scale-small+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_MEDIUM
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-medium+) "Constant")

(defconstant +pango-scale-medium+ 1.0d0
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{1.0d0}}
  @begin{short}
    The scale factor for normal size.
  @end{short}")

(export '+pango-scale-medium+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_LARGE
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-large+) "Constant")

(defconstant +pango-scale-large+ 1.2d0
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{1.2d0}}
  @begin{short}
    The scale factor for one magnification step.
  @end{short}")

(export '+pango-scale-large+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_X_LARGE
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-x-large+) "Constant")

(defconstant +pango-scale-x-large+ (* 1.2d0 1.2d0)
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{(* 1.2d0 1.2d0)}}
  @begin{short}
    The scale factor for two magnification steps.
  @end{short}")

(export '+pango-scale-x-large+)

;;; ----------------------------------------------------------------------------
;;; PANGO_SCALE_XX_LARGE
;;; ----------------------------------------------------------------------------

#+liber-documentation
(setf (liber:alias-for-variable '+pango-scale-xx-large+) "Constant")

(defconstant +pango-scale-xx-large+ #.(* 1.2d0 1.2d0 1.2d0)
 #+liber-documentation
 "@version{2022-12-4}
  @variable-value{@code{(* 1.2d0 1.2d0 1.2d0)}}
  @begin{short}
    The scale factor for three magnification steps.
  @end{short}")

(export '+pango-scale-xx-large+)

;;; ----------------------------------------------------------------------------
;;; enum PangoAttrType
;;; ----------------------------------------------------------------------------

(define-g-enum "PangoAttrType" attr-type
  (:export t
   :type-initializer "pango_attr_type_get_type")
  (:invalid 0)
  (:language 1)
  (:family 2)
  (:style 3)
  (:weight 4)
  (:variant 5)
  (:stretch 6)
  (:size 7)
  (:font-desc 8)
  (:foreground 9)
  (:background 10)
  (:underline 11)
  (:strikethrough 12)
  (:rise 13)
  (:shape 14)
  (:scale 15)
  (:fallback 16)
  (:letter-spacing 17)
  (:underline-color 18)
  (:strikethrough-color 19)
  (:absolute-size 20)
  (:gravity 21)
  (:gravity-hint 22)
  (:font-features 23)
  (:foreground-alpha 24)
  (:background-alpha 25)
  #+pango-1-44
  (:allow-breaks 26)
  #+pango-1-44
  (:show 27)
  #+pango-1-44
  (:insert-hyphens 28)
  #+pango-1-46
  (:overline 29)
  #+pango-1-46
  (:overline-color 30)
  #+pango-1-50
  (:line-height 31)
  #+pango-1-50
  (:absolute-line-height 32)
  #+pango-1-50
  (:text-transform 33)
  #+pango-1-50
  (:word 34)
  #+pango-1-50
  (:sentence 35)
  #+pango-1-50
  (:baseline-shift 36)
  #+pango-1-50
  (:font-scale 37)
)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-type)
      "GEnum"
      (liber:symbol-documentation 'attr-type)
 "@version{2022-12-4}
  @begin{short}
    The @sym{pango:attr-type} enumeration distinguishes between different types
    of attributes.
  @end{short}
  Along with the predefined values, it is possible to allocate additional
  values for custom attributes using the @fun{pango:attr-type-register}
  function. The predefined values are given below. The type of structure used
  to store the attribute is listed in parentheses after the description.
  @begin{pre}
(define-g-enum \"PangoAttrType\" attr-type
  (:export t
   :type-initializer \"pango_attr_type_get_type\")
  (:invalid 0)
  (:language 1)
  (:family 2)
  (:style 3)
  (:weight 4)
  (:variant 5)
  (:stretch 6)
  (:size 7)
  (:font-desc 8)
  (:foreground 9)
  (:background 10)
  (:underline 11)
  (:strikethrough 12)
  (:rise 13)
  (:shape 14)
  (:scale 15)
  (:fallback 16)
  (:letter-spacing 17)
  (:underline-color 18)
  (:strikethrough-color 19)
  (:absolute-size 20)
  (:gravity 21)
  (:gravity-hint 22)
  (:font-features 23)
  (:foreground-alpha 24)
  (:background-alpha 25)
  (:allow-breaks 26)
  (:show 27)
  (:insert-hyphens 28)
  (:overline 29)
  (:overline-color 30)
  (:line-height 31)
  (:absolute-line-height 32)
  (:text-transform 33)
  (:word 34)
  (:sentence 35)
  (:baseline-shift 36)
  (:font-scale 37))
  @end{pre}
  @begin[code]{table}
    @entry[:invalid]{Does not happen.}
    @entry[:language]{Language (PangoAttrLanguage).}
    @entry[:family]{Font family name list (PangoAttrString).}
    @entry[:style]{Font slant style (PangoAttrInt).}
    @entry[:weight]{Font weight (PangoAttrInt).}
    @entry[:variant]{Font variant (normal or small caps) (PangoAttrInt).}
    @entry[:stretch]{Font stretch (PangoAttrInt).}
    @entry[:size]{Font size in points scaled by @var{+pango-scale+}
      (PangoAttrInt).}
    @entry[:font-desc]{Font description (PangoAttrFontDesc).}
    @entry[:foreground]{Foreground color (PangoAttrColor).}
    @entry[:background]{Background color (PangoAttrColor).}
    @entry[:underline]{Whether the text has an underline (PangoAttrInt).}
    @entry[:strikethrough]{Whether the text is struck-through (PangoAttrInt).}
    @entry[:rise]{Baseline displacement (PangoAttrInt).}
    @entry[:shape]{Shape (PangoAttrShape).}
    @entry[:scale]{Font size scale factor (PangoAttrFloat).}
    @entry[:fallback]{Whether fallback is enabled (PangoAttrInt).}
    @entry[:letter-spacing]{Letter spacing (PangoAttrInt).}
    @entry[:underline-color]{Underline color (PangoAttrColor).}
    @entry[:strikethrough-color]{Strikethrough color (PangoAttrColor).}
    @entry[:absolute-size]{Font size in pixels scaled by @var{+pango-scale+}
      (PangoAttrInt).}
    @entry[:gravity]{Base text gravity (PangoAttrInt).}
    @entry[:gravity-hint]{Gravity hint (PangoAttrInt).}
    @entry[:font-features]{OpenType font features (PangoAttrString).}
    @entry[:foreground-alpha]{Foreground alpha (PangoAttrInt).}
    @entry[:background-alpha]{Background alpha (PangoAttrInt).}
    @entry[:allow-breaks]{Whether breaks are allowed (PangoAttrInt). Since 1.44}
    @entry[:show]{How to render invisible characters (PangoAttrInt). Since 1.44}
    @entry[:insert-hyphens]{Whether to insert hyphens at intra-word line breaks
      (PangoAttrInt). Since 1.44}
    @entry[:overline]{Whether the text has an overline (PangoAttrInt).
      Since 1.46}
    @entry[:overline-color]{Overline color (PangoAttrColor). Since 1.46}
    @entry[:line-height]{Line height factor (PangoAttrFloat). Since 1.50}
    @entry[:absolute-line-height]{Line height (PangoAttrInt). Since 1.50}
    @entry[:text-transform]{No description available. Since 1.50}
    @entry[:word]{Override segmentation to classify the range of the attribute
      as a single word (PangoAttrInt). Since 1.50}
    @entry[:sentence]{Override segmentation to classify the range of the
      attribute as a single sentence (PangoAttrInt). Since 1.50}
    @entry[:baseline-shift]{Baseline displacement (PangoAttrInt). Since 1.50}
    @entry[:font-scale]{Font-relative size change (PangoAttrInt). Since 1.50}
  @end{table}
  @see-class{pango:attribute}
  @see-class{pango:attr-list}
  @see-function{pango:attr-type-register}")

;;; ----------------------------------------------------------------------------
;;; enum PangoUnderline
;;; ----------------------------------------------------------------------------

(define-g-enum "PangoUnderline" underline
  (:export t
   :type-initializer "pango_underline_get_type")
  (:none 0)
  (:single 1)
  (:double 2)
  (:low 3)
  (:error 4)
  #+pango-1-46
  (:single-line 5)
  #+pango-1-46
  (:double-line 6)
  #+pango-1-46
  (:error-line 7)
)

#+liber-documentation
(setf (liber:alias-for-symbol 'underline)
      "GEnum"
      (liber:symbol-documentation 'underline)
 "@version{2022-12-4}
  @begin{short}
    The @sym{pango:underline} enumeration is used to specify whether text
    should be underlined, and if so, the type of underlining.
  @end{short}
  @begin{pre}
(define-g-enum \"PangoUnderline\" underline
  (:export t
   :type-initializer \"pango_underline_get_type\")
  (:none 0)
  (:single 1)
  (:double 2)
  (:low 3)
  (:error 4)
  (:single-line 5)
  (:double-line 6)
  (:error-line 7))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No underline should be drawn.}
    @entry[:single]{A single underline should be drawn.}
    @entry[:double]{A double underline should be drawn.}
    @entry[:low]{A single underline should be drawn at a position beneath the
      ink extents of the text being underlined. This should be used only for
      underlining single characters, such as for keyboard accelerators. The
      @code{:single} value should be used for extended portions of text.}
    @entry[:error]{A wavy underline should be drawn below. This underline is
      typically used to indicate an error such as a possible mispelling. In
      some cases a contrasting color may automatically be used.}
    @entry[:single-line]{Like the @code{:single} value, but drawn continuously
      across multiple runs. Since 1.46}
    @entry[:double-line]{Like the @code{:double} value, but drawn continuously
      across multiple runs. Since 1.46}
    @entry[:error-line]{Like the @code{:error} value, but drawn continuously
      across multiple runs. Since 1.46}
  @end{table}
  @see-symbol{pango:overline}")

;;; ----------------------------------------------------------------------------
;;; enum PangoOverline
;;; ----------------------------------------------------------------------------

#+pango-1-46
(define-g-enum "PangoOverline" overline
  (:export t
   :type-initializer "pango_overline_get_type")
  (:none 0)
  (:single 1))

#+(and pango-1-46 liber-documentation)
(setf (liber:alias-for-symbol 'overline)
      "GEnum"
      (liber:symbol-documentation 'overline)
 "@version{2022-12-4}
  @begin{short}
    The @sym{pango:overline} enumeration is used to specify whether text should
    be overlined, and if so, the type of line.
  @end{short}
  Since 1.46
  @begin{pre}
(define-g-enum \"PangoOverline\" overline
  (:export t
   :type-initializer \"pango_overline_get_type\")
  (:none 0)
  (:single 1))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No overline should be drawn.}
    @entry[:single]{Draw a single line above the ink extents of the text being
      underlined.}
  @end{table}
  @see-symbol{pango:underline}")

;;; ----------------------------------------------------------------------------
;;; enum PangoShowFlags
;;; ----------------------------------------------------------------------------

(define-g-flags "PangoShowFlags" show-flags
  (:export t
   :type-initializer "pango_show_flags_get_type")
  (:none 0)
  (:spaces #.(ash 1 0))
  (:line-breaks #.(ash 1 1))
  (:ignorables #.(ash 1 2)))

#+liber-documentation
(setf (liber:alias-for-symbol 'show-flags)
      "GFlags"
      (liber:symbol-documentation 'show-flags)
 "@version{2022-12-4}
  @begin{short}
    These flags affect how Pango treats characters that are normally not
    visible in the output.
  @end{short}
  @begin{pre}
(define-g-flags \"PangoShowFlags\" show-flags
  (:export t
   :type-initializer \"pango_show_flags_get_type\")
  (:none 0)
  (:spaces #.(ash 1 0))
  (:line-breaks #.(ash 1 1))
  (:ignorables #.(ash 1 2)))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No special treatment for invisible characters.}
    @entry[:spaces]{Render spaces, tabs and newlines visibly.}
    @entry[:line-breaks]{Render line breaks visibly.}
    @entry[:ignorables]{Render default-ignorable Unicode characters visibly.}
  @end{table}
  @see-function{pango:attr-show-new}")

;;; ----------------------------------------------------------------------------
;;; enum PangoTextTransform
;;; ----------------------------------------------------------------------------

(define-g-enum "PangoTextTransform" text-transform
  (:export t
   :type-initializer "pango_text_transform_get_type")
  :none
  :lowercase
  :uppercase
  :capitalize)

#+liber-documentation
(setf (liber:alias-for-symbol 'text-transform)
      "GEnum"
      (liber:symbol-documentation 'text-transform)
 "@version{2022-12-4}
  @begin{short}
    An enumeration that affects how Pango treats characters during shaping.
  @end{short}
  Since 1.50
  @begin{pre}
(define-g-enum \"PangoTextTransform\" text-transform
  (:export t
   :type-initializer \"pango_text_transform_get_type\")
  :none
  :lowercase
  :uppercase
  :capitalize)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Leave text unchanged.}
    @entry[:lowercase]{Display letters and numbers as lowercase.}
    @entry[:uppercase]{Display letters and numbers as uppercase.}
    @entry[:capitalize]{Display the first character of a word in titlecase.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum PangoBaselineShift
;;; ----------------------------------------------------------------------------

(define-g-enum "PangoBaselineShift" baseline-shift
  (:export t
   :type-initializer "pango_baseline_shift_get_type")
  :none
  :superscript
  :subscript)

#+liber-documentation
(setf (liber:alias-for-symbol 'baseline-shift)
      "GEnum"
      (liber:symbol-documentation 'baseline-shift)
 "@version{2022-12-4}
  @begin{short}
    An enumeration that affects baseline shifts between runs.
  @end{short}
  Since 1.50
  @begin{pre}
(define-g-enum \"PangoBaselineShift\" baseline-shift
  (:export t
   :type-initializer \"pango_baseline_shift_get_type\")
  :none
  :superscript
  :subscript)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Leave the baseline unchanged.}
    @entry[:superscript]{Shift the baseline to the superscript position,
      relative to the previous run.}
    @entry[:subscript]{Shift the baseline to the subscript position, relative
      to the previous run.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum PangoFontScale
;;; ----------------------------------------------------------------------------

(define-g-enum "PangoFontScale" font-scale
  (:export t
   :type-initializer "pango_font_scale_get_type")
  :none
  :superscript
  :subscript
  :small-caps)

#+liber-documentation
(setf (liber:alias-for-symbol 'font-scale)
      "GEnum"
      (liber:symbol-documentation 'font-scale)
 "@version{2022-12-4}
  @begin{short}
    An enumeration that affects font sizes for superscript and subscript
    positioning and for (emulated) Small Caps.
  @end{short}
  Since 1.50
  @begin{pre}
(define-g-enum \"PangoFontScale\" font-scale
  (:export t
   :type-initializer \"pango_font_scale_get_type\")
  :none
  :superscript
  :subscript
  :small-caps)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Leave the font size unchanged.}
    @entry[:superscript]{Change the font to a size suitable for superscripts.}
    @entry[:subscript]{Change the font to a size suitable for subscripts.}
    @entry[:small-caps]{Change the font to a size suitable for Small Caps.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrClass
;;;
;;; struct PangoAttrClass {
;;;   PangoAttrType type;
;;;   PangoAttribute * (*copy) (const PangoAttribute *attr);
;;;   void             (*destroy) (PangoAttribute *attr);
;;;   gboolean         (*equal) (const PangoAttribute *attr1,
;;;                              const PangoAttribute *attr2);
;;; };
;;;
;;; PangoAttrType type;
;;;     the type ID for this attribute
;;;
;;; copy ()
;;;     function to duplicate an attribute of this type
;;;     (see pango_attribute_copy())
;;;
;;; destroy ()
;;;     function to free an attribute of this type
;;;     (see pango_attribute_destroy())
;;;
;;; equal ()
;;;     function to check two attributes of this type for equality
;;;     (see pango_attribute_equal())
;;; ----------------------------------------------------------------------------

(defcstruct attr-class)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-class)
      "CStruct"
      (liber:symbol-documentation 'attr-class)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-class} structure stores the type and operations for a
    particular type of attribute.
  @end{short}
  The functions in this structure should not be called directly. Instead, one
  should use the wrapper functions provided for the @class{pango:attribute}
  structure.
  @see-class{pango:attribute}
  @see-symbol{pango:attr-type}")

(export 'attr-class)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttribute
;;;
;;; struct PangoAttribute {
;;;   const PangoAttrClass *klass;
;;;   guint start_index; /* in bytes */
;;;   guint end_index; /*in bytes. The character at this index is not included*/
;;; };
;;;
;;; const PangoAttrClass *klass;
;;;     the class structure holding information about the type of the attribute
;;;
;;; guint start_index;
;;;     the start index of the range (in bytes).
;;;
;;; guint end_index;
;;;     end index of the range (in bytes). The character at this index is not
;;;     included in the range
;;; ----------------------------------------------------------------------------

(glib-init:at-init ()
  (cffi:foreign-funcall "pango_attribute_get_type" :size))

(define-g-boxed-opaque attribute "PangoAttribute"
  :alloc (error "PangoAttribute cannot be created from the Lisp side."))

#+liber-documentation
(setf (liber:alias-for-class 'attribute)
      "Boxed CStruct"
      (documentation 'attribute 'type)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attribute} structure represents the common portions of all
    attributes.
  @end{short}
  Particular types of attributes include this structure as their initial
  portion. The common portion of the attribute holds the range to which the
  value in the type-specific part of the attribute applies and should be
  initialized using the function @fun{pango:attribute-init}. By default an#
  attribute will have an all-inclusive range of [0,G_MAXUINT].
  @see-symbol{pango:attr-type}")

(export (boxed-related-symbols 'attribute))

;;; ----------------------------------------------------------------------------
;;; PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING
;;;
;;; #define PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING 0
;;;
;;; This value can be used to set the start_index member of a PangoAttribute
;;; such that the attribute covers from the beginning of the text.
;;;
;;; Since 1.24
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; PANGO_ATTR_INDEX_TO_TEXT_END
;;;
;;; #define PANGO_ATTR_INDEX_TO_TEXT_END G_MAXUINT
;;;
;;; This value can be used to set the end_index member of a PangoAttribute such
;;; that the attribute covers to the end of the text.
;;;
;;; Since 1.24
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrString
;;;
;;; struct PangoAttrString {
;;;   PangoAttribute attr;
;;;   char *value;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; char *value;
;;;     the string which is the value of the attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-string)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-string)
      "CStruct"
      (liber:symbol-documentation 'attr-string)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-string} structure is used to represent attributes with
    a string value.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-string)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrLanguage
;;;
;;; struct PangoAttrLanguage {
;;;   PangoAttribute attr;
;;;   PangoLanguage *value;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; PangoLanguage *value;
;;;     the PangoLanguage which is the value of the attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-language)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-language)
      "CStruct"
      (liber:symbol-documentation 'attr-language)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-language} structure is used to represent attributes
    that are languages.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-language)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrColor
;;;
;;; struct PangoAttrColor {
;;;   PangoAttribute attr;
;;;   PangoColor color;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; PangoColor color;
;;;     the PangoColor which is the value of the attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-color)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-color)
      "CStruct"
      (liber:symbol-documentation 'attr-color)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-color} structure is used to represent attributes
    that are colors.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-color)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrInt
;;;
;;; struct PangoAttrInt {
;;;   PangoAttribute attr;
;;;   int value;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; int value;
;;;     the value of the attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-int)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-int)
      "CStruct"
      (liber:symbol-documentation 'attr-int)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-int} structure is used to represent attributes with
    an integer or enumeration value.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-int)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrFloat
;;;
;;; struct PangoAttrFloat {
;;;   PangoAttribute attr;
;;;   double value;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; double value;
;;;     the value of the attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-float)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-float)
      "CStruct"
      (liber:symbol-documentation 'attr-float)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-float} structure is used to represent attributes with
    a float or double value.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-float)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrFontDesc
;;;
;;; struct PangoAttrFontDesc {
;;;   PangoAttribute attr;
;;;   PangoFontDescription *desc;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; PangoFontDescription *desc;
;;;     the font description which is the value of this attribute
;;; ----------------------------------------------------------------------------

(defcstruct attr-font-desc)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-font-desc)
      "CStruct"
      (liber:symbol-documentation 'attr-font-desc)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-font-desc} structure is used to store an attribute that
    sets all aspects of the font description at once.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-font-desc)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrShape
;;;
;;; struct PangoAttrShape {
;;;   PangoAttribute attr;
;;;   PangoRectangle ink_rect;
;;;   PangoRectangle logical_rect;
;;;
;;;   gpointer              data;
;;;   PangoAttrDataCopyFunc copy_func;
;;;   GDestroyNotify        destroy_func;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; PangoRectangle ink_rect;
;;;     the ink rectangle to restrict to
;;;
;;; PangoRectangle logical_rect;
;;;     the logical rectangle to restrict to
;;;
;;; gpointer data;
;;;     user data set (see pango_attr_shape_new_with_data())
;;;
;;; PangoAttrDataCopyFunc copy_func;
;;;     copy function for the user data
;;;
;;; GDestroyNotify destroy_func;
;;;     destroy function for the user data
;;; ----------------------------------------------------------------------------

(defcstruct attr-shape)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-shape)
      "CStruct"
      (liber:symbol-documentation 'attr-shape)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-shape} structure is used to represent attributes which
    impose shape restrictions.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-shape)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrSize
;;;
;;; struct PangoAttrSize {
;;;   PangoAttribute attr;
;;;   int size;
;;;   guint absolute : 1;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; int size;
;;;     size of font, in units of 1/PANGO_SCALE of a point (for PANGO_ATTR_SIZE)
;;;     or of a device uni (for PANGO_ATTR_ABSOLUTE_SIZE)
;;;
;;; guint absolute : 1;
;;;     whether the font size is in device units or points. This field is only
;;;     present for compatibility with Pango-1.8.0 (PANGO_ATTR_ABSOLUTE_SIZE
;;;     was added in 1.8.1); and always will be FALSE for PANGO_ATTR_SIZE and
;;;     TRUE for PANGO_ATTR_ABSOLUTE_SIZE.
;;; ----------------------------------------------------------------------------

(defcstruct attr-size)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-size)
      "CStruct"
      (liber:symbol-documentation 'attr-size)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-size} structure is used to represent attributes which
    set font size.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-size)

;;; ----------------------------------------------------------------------------
;;; struct PangoAttrFontFeatures
;;;
;;; struct PangoAttrFontFeatures {
;;;   PangoAttribute attr;
;;;   gchar *features;
;;; };
;;;
;;; PangoAttribute attr;
;;;     the common portion of the attribute
;;;
;;; gchar *features;
;;;     the featues, as a string in CSS syntax
;;;
;;; Since 1.38
;;; ----------------------------------------------------------------------------

(defcstruct attr-font-features)

#+liber-documentation
(setf (liber:alias-for-symbol 'attr-font-features)
      "CStruct"
      (liber:symbol-documentation 'attr-font-features)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:attr-font-features} structure is used to represent OpenType
    font features as an attribute.
  @end{short}
  @see-class{pango:attribute}")

(export 'attr-font-features)

;;; ----------------------------------------------------------------------------
;;; struct PangoColor
;;; ----------------------------------------------------------------------------

(glib-init:at-init ()
  (cffi:foreign-funcall "pango_color_get_type" :size))

(define-g-boxed-cstruct color "PangoColor"
  (red :uint16 :initform 0)
  (green :uint16 :initform 0)
  (blue :uint16 :initform 0))

#+liber-documentation
(setf (liber:alias-for-class 'color)
      "CStruct"
      (documentation 'color 'type)
 "@version{#2021-1-17}
  @begin{short}
    The @sym{pango:color} structure is used to represent a color in an
    uncalibrated RGB color-space.
  @end{short}
  @begin{pre}
(define-g-boxed-cstruct color \"PangoColor\"
  (red :uint16 :initform 0)
  (green :uint16 :initform 0)
  (blue :uint16 :initform 0))
  @end{pre}")

(export 'color)

;;; ----------------------------------------------------------------------------
;;; PangoAttrList
;;; ----------------------------------------------------------------------------

(glib-init:at-init ()
  (cffi:foreign-funcall "pango_attr_list_get_type" :size))

(define-g-boxed-opaque attr-list "PangoAttrList"
  :alloc (%attr-list-new))

#+liber-documentation
(setf (liber:alias-for-class 'attr-list)
      "GBoxed"
      (documentation 'attr-list 'type)
 "@version{#2021-5-21}
  @begin{short}
    The @sym{pango:attr-list} structure represents a list of attributes that
    apply to a section of text.
  @end{short}
  The attributes are, in general, allowed to overlap in an arbitrary fashion,
  however, if the attributes are manipulated only through the function
  @fun{pango:attr-list-change}, the overlap between properties will meet
  stricter criteria.

  Since the @sym{pango:attr-list} structure is stored as a linear list, it is
  not suitable for storing attributes for large amounts of text. In general,
  you should not use a single @sym{pango:attr-list} instance for more than one
  paragraph of text.
  @see-class{pango:attr-iterator}
  @see-function{pango:attr-list-change}")

(export (boxed-related-symbols 'attr-list))

;;; ----------------------------------------------------------------------------
;;; PangoAttrIterator
;;; ----------------------------------------------------------------------------

(glib-init:at-init ()
  (cffi:foreign-funcall "pango_attr_iterator_get_type" :size))

(define-g-boxed-opaque attr-iterator "PangoAttrIterator"
  :alloc (error "PangoAttrIterator cannot be created from the Lisp side."))

#+liber-documentation
(setf (liber:alias-for-class 'attr-iterator)
      "Boxed CStruct"
      (documentation 'attr-iterator 'type)
 "@version{#2021-1-11}
  @begin{short}
    The @sym{pango:attr-iterator} structure is used to represent an iterator
    through a @class{pango:attr-list} structure.
  @end{short}
  A new iterator is created with the function @fun{pango:attr-list-iterator}.
  Once the iterator is created, it can be advanced through the style changes in
  the text using the function @fun{pango:attr-iterator-next}. At each style
  change, the range of the current style segment and the attributes currently
  in effect can be queried.
  @see-class{pango:attr-list}
  @see-function{pango:attr-list-iterator}
  @see-function{pango:attr-iterator-next}")

(export (boxed-related-symbols 'attr-iterator))

;;; ----------------------------------------------------------------------------
;;; pango_attr_type_register ()
;;;
;;; PangoAttrType pango_attr_type_register (const gchar *name);
;;;
;;; Allocate a new attribute type ID. The attribute type name can be accessed
;;; later by using pango_attr_type_get_name().
;;;
;;; name :
;;;     an identifier for the type
;;;
;;; Returns :
;;;     the new type ID
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_type_get_name ()
;;;
;;; const char * pango_attr_type_get_name (PangoAttrType type);
;;;
;;; Fetches the attribute type name passed in when registering the type using
;;; pango_attr_type_register().
;;;
;;; The returned value is an interned string (see g_intern_string() for what
;;; that means) that should not be modified or freed.
;;;
;;; type :
;;;     an attribute type ID to fetch the name for
;;;
;;; Returns :
;;;     the type ID name (which may be NULL), or NULL if type is a built-in
;;;     Pango attribute type or invalid.
;;;
;;; Since 1.22
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attribute_init ()
;;;
;;; void pango_attribute_init (PangoAttribute *attr,
;;;                            const PangoAttrClass *klass);
;;;
;;; Initializes attr's klass to klass, it's start_index to
;;; PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING and end_index to
;;; PANGO_ATTR_INDEX_TO_TEXT_END such that the attribute applies to the entire
;;; text by default.
;;;
;;; attr :
;;;     a PangoAttribute
;;;
;;; klass :
;;;     a PangoAttributeClass
;;;
;;; Since 1.20
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attribute_copy ()
;;;
;;; PangoAttribute * pango_attribute_copy (const PangoAttribute *attr);
;;;
;;; Make a copy of an attribute.
;;;
;;; attr :
;;;     a PangoAttribute
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attribute_equal ()
;;;
;;; gboolean pango_attribute_equal (const PangoAttribute *attr1,
;;;                                 const PangoAttribute *attr2);
;;;
;;; Compare two attributes for equality. This compares only the actual value of
;;; the two attributes and not the ranges that the attributes apply to.
;;;
;;; attr1 :
;;;     a PangoAttribute
;;;
;;; attr2 :
;;;     another PangoAttribute
;;;
;;; Returns :
;;;     TRUE if the two attributes have the same value
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attribute_destroy ()
;;;
;;; void pango_attribute_destroy (PangoAttribute *attr);
;;;
;;; Destroy a PangoAttribute and free all associated memory.
;;;
;;; attr :
;;;     a PangoAttribute
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_language_new ()
;;;
;;; PangoAttribute * pango_attr_language_new (PangoLanguage *language);
;;;
;;; Create a new language tag attribute.
;;;
;;; language :
;;;     language tag
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_family_new ()
;;;
;;; PangoAttribute * pango_attr_family_new (const char *family);
;;;
;;; Create a new font family attribute.
;;;
;;; family :
;;;     the family or comma separated list of families
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_style_new ()
;;;
;;; PangoAttribute * pango_attr_style_new (PangoStyle style);
;;;
;;; Create a new font slant style attribute.
;;;
;;; style :
;;;     the slant style
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_variant_new ()
;;;
;;; PangoAttribute * pango_attr_variant_new (PangoVariant variant);
;;;
;;; Create a new font variant attribute (normal or small caps)
;;;
;;; variant :
;;;     the variant
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_stretch_new ()
;;;
;;; PangoAttribute * pango_attr_stretch_new (PangoStretch stretch);
;;;
;;; Create a new font stretch attribute
;;;
;;; stretch :
;;;     the stretch
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_weight_new ()
;;;
;;; PangoAttribute * pango_attr_weight_new (PangoWeight weight);
;;;
;;; Create a new font weight attribute.
;;;
;;; weight :
;;;     the weight
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_size_new ()
;;;
;;; PangoAttribute * pango_attr_size_new (int size);
;;;
;;; Create a new font-size attribute in fractional points.
;;;
;;; size :
;;;     the font size, in PANGO_SCALEths of a point.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_size_new_absolute ()
;;;
;;; PangoAttribute * pango_attr_size_new_absolute (int size);
;;;
;;; Create a new font-size attribute in device units.
;;;
;;; size :
;;;     the font size, in PANGO_SCALEths of a device unit.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_font_desc_new ()
;;;
;;; PangoAttribute * pango_attr_font_desc_new (const PangoFontDescription *desc)
;;;
;;; Create a new font description attribute. This attribute allows setting
;;; family, style, weight, variant, stretch, and size simultaneously.
;;;
;;; desc :
;;;     the font description
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_foreground_new ()
;;;
;;; PangoAttribute * pango_attr_foreground_new (guint16 red,
;;;                                             guint16 green,
;;;                                             guint16 blue);
;;;
;;; Create a new foreground color attribute.
;;;
;;; red :
;;;     the red value (ranging from 0 to 65535)
;;;
;;; green :
;;;     the green value
;;;
;;; blue :
;;;     the blue value
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_background_new ()
;;;
;;; PangoAttribute * pango_attr_background_new (guint16 red,
;;;                                             guint16 green,
;;;                                             guint16 blue);
;;;
;;; Create a new background color attribute.
;;;
;;; red :
;;;     the red value (ranging from 0 to 65535)
;;;
;;; green :
;;;     the green value
;;;
;;; blue :
;;;     the blue value
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_strikethrough_new ()
;;;
;;; PangoAttribute * pango_attr_strikethrough_new (gboolean strikethrough);
;;;
;;; Create a new strike-through attribute.
;;;
;;; strikethrough :
;;;     TRUE if the text should be struck-through.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_strikethrough_color_new ()
;;;
;;; PangoAttribute * pango_attr_strikethrough_color_new (guint16 red,
;;;                                                      guint16 green,
;;;                                                      guint16 blue);
;;;
;;; Create a new strikethrough color attribute. This attribute modifies the
;;; color of strikethrough lines. If not set, strikethrough lines will use the
;;; foreground color.
;;;
;;; red :
;;;     the red value (ranging from 0 to 65535)
;;;
;;; green :
;;;     the green value
;;;
;;; blue :
;;;     the blue value
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;;
;;; Since 1.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_underline_new ()
;;;
;;; PangoAttribute * pango_attr_underline_new (PangoUnderline underline);
;;;
;;; Create a new underline-style attribute.
;;;
;;; underline :
;;;     the underline style.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_underline_color_new ()
;;;
;;; PangoAttribute * pango_attr_underline_color_new (guint16 red,
;;;                                                  guint16 green,
;;;                                                  guint16 blue);
;;;
;;; Create a new underline color attribute. This attribute modifies the color
;;; of underlines. If not set, underlines will use the foreground color.
;;;
;;; red :
;;;     the red value (ranging from 0 to 65535)
;;;
;;; green :
;;;     the green value
;;;
;;; blue :
;;;     the blue value
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_overline_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_overline_new (PangoOverline overline);
;;;
;;; Create a new overline-style attribute.
;;;
;;; overline :
;;;     the overline style
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.46
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_overline_color_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_overline_color_new (guint16 red,
;;;                                guint16 green,
;;;                                guint16 blue);
;;;
;;; Create a new overline color attribute. This attribute modifies the color of
;;; overlines. If not set, overlines will use the foreground color.
;;;
;;; red :
;;;     the red value (ranging from 0 to 65535)
;;;
;;; green :
;;;     the green value
;;;
;;; blue :
;;;     the blue value
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.46
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_shape_new ()
;;;
;;; PangoAttribute * pango_attr_shape_new (const PangoRectangle *ink_rect,
;;;                                        const PangoRectangle *logical_rect);
;;;
;;; Create a new shape attribute. A shape is used to impose a particular ink
;;; and logical rectangle on the result of shaping a particular glyph. This
;;; might be used, for instance, for embedding a picture or a widget inside a
;;; PangoLayout.
;;;
;;; ink_rect :
;;;     ink rectangle to assign to each character
;;;
;;; logical_rect :
;;;     logical rectangle to assign to each character
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_shape_new_with_data ()
;;;
;;; PangoAttribute * pango_attr_shape_new_with_data
;;;                                         (const PangoRectangle *ink_rect,
;;;                                          const PangoRectangle *logical_rect,
;;;                                          gpointer data,
;;;                                          PangoAttrDataCopyFunc copy_func,
;;;                                          GDestroyNotify destroy_func);
;;;
;;; Like pango_attr_shape_new(), but a user data pointer is also provided; this
;;; pointer can be accessed when later rendering the glyph.
;;;
;;; ink_rect :
;;;     ink rectangle to assign to each character
;;;
;;; logical_rect :
;;;     logical rectangle to assign to each character
;;;
;;; data :
;;;     user data pointer
;;;
;;; copy_func :
;;;     function to copy data when the attribute is copied. If NULL, data is
;;;     simply copied as a pointer
;;;
;;; destroy_func :
;;;     function to free data when the attribute is freed, or NULL
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; PangoAttrDataCopyFunc ()
;;;
;;; gpointer (*PangoAttrDataCopyFunc) (gconstpointer data);
;;;
;;; A copy function passed to attribute new functions that take user data.
;;;
;;; data :
;;;     the user data
;;;
;;; Returns :
;;;     a new copy of data
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_scale_new ()
;;;
;;; PangoAttribute * pango_attr_scale_new (double scale_factor);
;;;
;;; Create a new font size scale attribute. The base font for the affected text
;;; will have its size multiplied by scale_factor.
;;;
;;; scale_factor :
;;;     factor to scale the font
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_rise_new ()
;;;
;;; PangoAttribute * pango_attr_rise_new (int rise);
;;;
;;; Create a new baseline displacement attribute.
;;;
;;; rise :
;;;     the amount that the text should be displaced vertically, in Pango units.
;;;     Positive values displace the text upwards.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_letter_spacing_new ()
;;;
;;; PangoAttribute * pango_attr_letter_spacing_new (int letter_spacing);
;;;
;;; Create a new letter-spacing attribute.
;;;
;;; letter_spacing :
;;;     amount of extra space to add between graphemes of the text, in Pango
;;;     units.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.6
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_fallback_new ()
;;;
;;; PangoAttribute * pango_attr_fallback_new (gboolean enable_fallback);
;;;
;;; Create a new font fallback attribute.
;;;
;;; If fallback is disabled, characters will only be used from the closest
;;; matching font on the system. No fallback will be done to other fonts on the
;;; system that might contain the characters in the text.
;;;
;;; enable_fallback :
;;;     TRUE if we should fall back on other fonts for characters the active
;;;     font is missing.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_gravity_new ()
;;;
;;; PangoAttribute * pango_attr_gravity_new (PangoGravity gravity);
;;;
;;; Create a new gravity attribute.
;;;
;;; gravity :
;;;     the gravity value; should not be PANGO_GRAVITY_AUTO.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.16
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_gravity_hint_new ()
;;;
;;; PangoAttribute * pango_attr_gravity_hint_new (PangoGravityHint hint);
;;;
;;; Create a new gravity hint attribute.
;;;
;;; hint :
;;;     the gravity hint value.
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.16
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_font_features_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_font_features_new (const gchar *features);
;;;
;;; Create a new font features tag attribute.
;;;
;;; features :
;;;     a string with OpenType font features, in CSS syntax
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.38
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_foreground_alpha_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_foreground_alpha_new (guint16 alpha);
;;;
;;; Create a new foreground alpha attribute.
;;;
;;; alpha :
;;;     the alpha value, between 1 and 65536
;;;
;;; Returns :
;;;     the new allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.38
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_background_alpha_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_background_alpha_new (guint16 alpha);
;;;
;;; Create a new background alpha attribute.
;;;
;;; alpha :
;;;     the alpha value, between 1 and 65536
;;;
;;; Returns :
;;;     the new allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.38
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_allow_breaks_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_allow_breaks_new (gboolean allow_breaks);
;;;
;;; Create a new allow-breaks attribute.
;;;
;;; If breaks are disabled, the range will be kept in a single run, as far as
;;; possible.
;;;
;;; allow_breaks :
;;;     TRUE if we line breaks are allowed
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.44
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_insert_hyphens_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_insert_hyphens_new (gboolean insert_hyphens);
;;;
;;; Create a new insert-hyphens attribute.
;;;
;;; Pango will insert hyphens when breaking lines in the middle of a word. This
;;; attribute can be used to suppress the hyphen.
;;;
;;; insert_hyphens :
;;;     TRUE if hyphens should be inserted
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.44
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_show_new ()
;;;
;;; PangoAttribute *
;;; pango_attr_show_new (PangoShowFlags flags);
;;;
;;; Create a new attribute that influences how invisible characters are
;;; rendered.
;;;
;;; flags :
;;;     PangoShowFlags to apply
;;;
;;; Returns :
;;;     the newly allocated PangoAttribute, which should be freed with
;;;     pango_attribute_destroy().
;;;
;;; Since 1.44
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_color_parse ()
;;;
;;; gboolean pango_color_parse (PangoColor *color, const char *spec);
;;;
;;; Fill in the fields of a color from a string specification. The string can
;;; either one of a large set of standard names. (Taken from the X11 rgb.txt
;;; file), or it can be a hex value in the form '#rgb' '#rrggbb' '#rrrgggbbb'
;;; or '#rrrrggggbbbb' where 'r', 'g' and 'b' are hex digits of the red, green,
;;; and blue components of the color, respectively. (White in the four forms is
;;; '#fff' '#ffffff' '#fffffffff' and '#ffffffffffff')
;;;
;;; color :
;;;     a PangoColor structure in which to store the result, or NULL
;;;
;;; spec :
;;;     a string specifying the new color
;;;
;;; Returns :
;;;     TRUE if parsing of the specifier succeeded, otherwise false
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_color_parse_with_alpha ()
;;;
;;; gboolean
;;; pango_color_parse_with_alpha (PangoColor *color,
;;;                               guint16 *alpha,
;;;                               const char *spec);
;;;
;;; Fill in the fields of a color from a string specification. The string can
;;; either one of a large set of standard names. (Taken from the CSS
;;; specification), or it can be a hexadecimal value in the form '#rgb'
;;; '#rrggbb' '#rrrgggbbb' or '#rrrrggggbbbb' where 'r', 'g' and 'b' are hex
;;; digits of the red, green, and blue components of the color, respectively.
;;; (White in the four forms is '#fff' '#ffffff' '#fffffffff' and
;;; '#ffffffffffff')
;;;
;;; Additionally, parse strings of the form '#rgba', '#rrggbbaa',
;;; '#rrrrggggbbbbaaaa', if alpha is not NULL, and set alpha to the value
;;; specified by the hex digits for 'a'. If no alpha component is found in
;;; spec , alpha is set to 0xffff (for a solid color).
;;;
;;; color :
;;;     a PangoColor structure in which to store the result, or NULL.
;;;
;;; alpha :
;;;     return location for alpha, or NULL.
;;;
;;; spec :
;;;     a string specifying the new color
;;;
;;; Returns :
;;;     TRUE if parsing of the specifier succeeded, otherwise false.
;;;
;;; Since 1.46
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_color_copy ()
;;;
;;; PangoColor * pango_color_copy (const PangoColor *src);
;;;
;;; Creates a copy of src, which should be freed with pango_color_free().
;;; Primarily used by language bindings, not that useful otherwise (since colors
;;; can just be copied by assignment in C).
;;;
;;; src :
;;;     color to copy, may be NULL
;;;
;;; Returns :
;;;     the newly allocated PangoColor, which should be freed with
;;;     pango_color_free(), or NULL if src was NULL
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_color_free ()
;;;
;;; void pango_color_free (PangoColor *color);
;;;
;;; Frees a color allocated by pango_color_copy().
;;;
;;; color :
;;;     an allocated PangoColor, may be NULL
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_color_to_string ()
;;;
;;; gchar * pango_color_to_string (const PangoColor *color);
;;;
;;; Returns a textual specification of color in the hexadecimal form
;;; #rrrrggggbbbb, where r, g and b are hex digits representing the red, green,
;;; and blue components respectively.
;;;
;;; color :
;;;     a PangoColor
;;;
;;; Returns :
;;;     a newly-allocated text string that must be freed with g_free()
;;;
;;; Since 1.16
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_new ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_attr_list_new" %attr-list-new) :pointer)

(defcfun ("pango_attr_list_new" attr-list-new)
    (g:boxed attr-list)
 #+liber-documentation
 "@version{#2021-1-17}
  @begin{return}
    The newly allocated @sym{pango:attr-list}.
  @end{return}
  @begin{short}
    Create a new empty attribute list with a reference count of one.
  @end{short}
  @see-class{pango:attr-list}
  @see-function{pango:attr-list-unref}")

(export 'attr-list-new)

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_ref ()
;;;
;;; PangoAttrList * pango_attr_list_ref (PangoAttrList *list);
;;;
;;; Increase the reference count of the given attribute list by one.
;;;
;;; list :
;;;     a PangoAttrList, may be NULL
;;;
;;; Returns :
;;;     The attribute list passed in
;;;
;;; Since 1.10
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_unref ()
;;;
;;; void pango_attr_list_unref (PangoAttrList *list);
;;;
;;; Decrease the reference count of the given attribute list by one. If the
;;; result is zero, free the attribute list and the attributes it contains.
;;;
;;; list :
;;;     a PangoAttrList, may be NULL
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_copy ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_attr_list_copy" attr-list-copy)
    (g:boxed attr-list)
 #+liber-documentation
 "@version{#2021-1-17}
  @argument[attr-list]{a @class{pango:attr-list} instance, may be @code{nil}}
  @begin{return}
    The newly allocated @class{pango:attr-list} instance. Returns @code{nil}
    if @arg{attr-list} was @code{nil}.
  @end{return}
  @begin{short}
    Copy @arg{attr-list} and return an identical new attribute list.
  @end{short}
  @see-class{pango:attr-list}"
  (attr-list (g:boxed attr-list)))

(export 'attr-list-copy)

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_insert ()
;;;
;;; void pango_attr_list_insert (PangoAttrList *list, PangoAttribute *attr);
;;;
;;; Insert the given attribute into the PangoAttrList. It will be inserted
;;; after all other attributes with a matching start_index.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; attr :
;;;     the attribute to insert. Ownership of this value is assumed by the list
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_insert_before ()
;;;
;;; void pango_attr_list_insert_before (PangoAttrList *list,
;;;                                     PangoAttribute *attr);
;;;
;;; Insert the given attribute into the PangoAttrList. It will be inserted
;;; before all other attributes with a matching start_index.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; attr :
;;;     the attribute to insert. Ownership of this value is assumed by the list
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_change ()
;;;
;;; void pango_attr_list_change (PangoAttrList *list, PangoAttribute *attr);
;;;
;;; Insert the given attribute into the PangoAttrList. It will replace any
;;; attributes of the same type on that segment and be merged with any adjoining
;;; attributes that are identical.
;;;
;;; This function is slower than pango_attr_list_insert() for creating a
;;; attribute list in order (potentially much slower for large lists). However,
;;; pango_attr_list_insert() is not suitable for continually changing a set of
;;; attributes since it never removes or combines existing attributes.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; attr :
;;;     the attribute to insert. Ownership of this value is assumed by the list
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_splice ()
;;;
;;; void pango_attr_list_splice (PangoAttrList *list,
;;;                              PangoAttrList *other,
;;;                              gint pos,
;;;                              gint len);
;;;
;;; This function opens up a hole in list, fills it in with attributes from the
;;; left, and then merges other on top of the hole.
;;;
;;; This operation is equivalent to stretching every attribute that applies at
;;; position pos in list by an amount len, and then calling
;;; pango_attr_list_change() with a copy of each attribute in other in sequence
;;; (offset in position by pos).
;;;
;;; This operation proves useful for, for instance, inserting a pre-edit string
;;; in the middle of an edit buffer.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; other :
;;;     another PangoAttrList
;;;
;;; pos :
;;;     the position in list at which to insert other
;;;
;;; len :
;;;     the length of the spliced segment. (Note that this must be specified
;;;     since the attributes in other may only be present at some subsection
;;;     of this range)
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_filter ()
;;;
;;; PangoAttrList * pango_attr_list_filter (PangoAttrList *list,
;;;                                         PangoAttrFilterFunc func,
;;;                                         gpointer data);
;;;
;;; Given a PangoAttrList and callback function, removes any elements of list
;;; for which func returns TRUE and inserts them into a new list.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; func :
;;;     callback function; returns TRUE if an attribute should be filtered out
;;;
;;; data :
;;;     Data to be passed to func
;;;
;;; Returns :
;;;     the new PangoAttrList or NULL if no attributes of the given types were
;;;     found
;;;
;;; Since 1.2
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_update ()
;;;
;;; void
;;; pango_attr_list_update (PangoAttrList *list,
;;;                         int pos,
;;;                         int remove,
;;;                         int add);
;;;
;;; Update indices of attributes in list for a change in the text they refer to.
;;;
;;; The change that this function applies is removing remove bytes at position
;;; pos and inserting add bytes instead.
;;;
;;; Attributes that fall entirely in the (pos , pos + remove ) range are
;;; removed.
;;;
;;; Attributes that start or end inside the (pos , pos + remove ) range are
;;; shortened to reflect the removal.
;;;
;;; Attributes start and end positions are updated if they are behind pos +
;;; remove .
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; pos :
;;;     the position of the change
;;;
;;; remove :
;;;     the number of removed bytes
;;;
;;; add :
;;;     the number of added bytes
;;;
;;; Since 1.44
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; PangoAttrFilterFunc ()
;;;
;;; gboolean (*PangoAttrFilterFunc) (PangoAttribute *attribute,
;;;                                  gpointer data);
;;;
;;; A predicate function used by pango_attr_list_filter() to filter out a
;;; subset of attributes for a list.
;;;
;;; attribute :
;;;     a PangoAttribute
;;;
;;; data :
;;;     callback data passed to pango_attr_list_filter()
;;;
;;; Returns :
;;;     TRUE if the attribute should be filtered out
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_get_attributes () -> pango-attr-list-attributes
;;; ----------------------------------------------------------------------------

#+pango-1-44
(defcfun ("pango_attr_list_get_attributes" attr-list-attributes)
    (g:slist-t (g:boxed attribute))
 #+liber-documentation
 "@version{#2021-1-17}
  @argument[attr-list]{a @class{pango:attr-list} instance}
  @begin{return}
    A list of all attributes in @arg{attr-list}.
  @end{return}
  @begin{short}
    Gets a list of all attributes in @arg{attr-list}.
  @end{short}

  Since 1.44
  @see-class{pango:attr-list}
  @see-class{pango:attribute}"
  (attr-list (g:boxed attr-list)))

#+pango-1-44
(export 'attr-list-attributes)

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_equal ()
;;;
;;; gboolean
;;; pango_attr_list_equal (PangoAttrList *list,
;;;                        PangoAttrList *other_list);
;;;
;;; Checks whether list and other_list contain the same attributes and whether
;;; those attributes apply to the same ranges. Beware that this will return
;;; wrong values if any list contains duplicates.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; other_list :
;;;     the other PangoAttrList
;;;
;;; Returns :
;;;     TRUE if the lists are equal, FALSE if they aren't.
;;;
;;; Since 1.46
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_list_get_iterator ()
;;;
;;; PangoAttrIterator * pango_attr_list_get_iterator (PangoAttrList *list);
;;;
;;; Create a iterator initialized to the beginning of the list. list must not
;;; be modified until this iterator is freed.
;;;
;;; list :
;;;     a PangoAttrList
;;;
;;; Returns :
;;;     the newly allocated PangoAttrIterator, which should be freed with
;;;     pango_attr_iterator_destroy()
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_copy ()
;;;
;;; PangoAttrIterator * pango_attr_iterator_copy (PangoAttrIterator *iterator);
;;;
;;; Copy a PangoAttrIterator
;;;
;;; iterator :
;;;     a PangoAttrIterator.
;;;
;;; Returns :
;;;     the newly allocated PangoAttrIterator, which should be freed with
;;;     pango_attr_iterator_destroy().
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_next ()
;;;
;;; gboolean pango_attr_iterator_next (PangoAttrIterator *iterator);
;;;
;;; Advance the iterator until the next change of style.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;;
;;; Returns :
;;;     FALSE if the iterator is at the end of the list, otherwise TRUE
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_range ()
;;;
;;; void pango_attr_iterator_range (PangoAttrIterator *iterator,
;;;                                 gint *start,
;;;                                 gint *end);
;;;
;;; Get the range of the current segment. Note that the stored return values
;;; are signed, not unsigned like the values in PangoAttribute. To deal with
;;; this API oversight, stored return values that wouldn't fit into a signed
;;; integer are clamped to G_MAXINT.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;;
;;; start :
;;;     location to store the start of the range
;;;
;;; end :
;;;     location to store the end of the range
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_get ()
;;;
;;; PangoAttribute * pango_attr_iterator_get (PangoAttrIterator *iterator,
;;;                                           PangoAttrType type);
;;;
;;; Find the current attribute of a particular type at the iterator location.
;;; When multiple attributes of the same type overlap, the attribute whose
;;; range starts closest to the current location is used.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;;
;;; type :
;;;     the type of attribute to find.
;;;
;;; Returns :
;;;     the current attribute of the given type, or NULL if no attribute of
;;;     that type applies to the current location
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_get_font ()
;;;
;;; void pango_attr_iterator_get_font (PangoAttrIterator *iterator,
;;;                                    PangoFontDescription *desc,
;;;                                    PangoLanguage **language,
;;;                                    GSList **extra_attrs);
;;;
;;; Get the font and other attributes at the current iterator position.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;;
;;; desc :
;;;     a PangoFontDescription to fill in with the current values. The family
;;;     name in this structure will be set using
;;;     pango_font_description_set_family_static() using values from an
;;;     attribute in the PangoAttrList associated with the iterator, so if you
;;;     plan to keep it around, you must call: pango_font_description_set_family
;;;     (desc, pango_font_description_get_family (desc)).
;;;
;;; language :
;;;     if non-NULL, location to store language tag for item, or NULL if none
;;;     is found
;;;
;;; extra_attrs :
;;;     if non-NULL, location in which to store a list of non-font attributes
;;;     at the the current position; only the highest priority value of each
;;;     attribute will be added to this list. In order to free this value, you
;;;     must call pango_attribute_destroy() on each member
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_get_attrs ()
;;;
;;; GSList * pango_attr_iterator_get_attrs (PangoAttrIterator *iterator);
;;;
;;; Gets a list of all attributes at the current position of the iterator.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;;
;;; Returns :
;;;     a list of all attributes for the current range. To free this value,
;;;     call pango_attribute_destroy() on each value and g_slist_free() on the
;;;     list
;;;
;;; Since 1.2
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; pango_attr_iterator_destroy ()
;;;
;;; void pango_attr_iterator_destroy (PangoAttrIterator *iterator);
;;;
;;; Destroy a PangoAttrIterator and free all associated memory.
;;;
;;; iterator :
;;;     a PangoAttrIterator
;;; ----------------------------------------------------------------------------

;;; --- End of file pango.attributes.lisp --------------------------------------
