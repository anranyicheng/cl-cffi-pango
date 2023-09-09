(in-package :pango-test)

(def-suite pango-font :in pango-suite)
(in-suite pango-font)

;;; --- Types and Values -------------------------------------------------------

;;;     PangoStyle

(test pango-style
  ;; Check the type
  (is (g:type-is-enum "PangoStyle"))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoStyle")
          (g:gtype (cffi:foreign-funcall "pango_style_get_type" :size))))
  ;; Check the registered name
  (is (eq 'pango:style
          (glib:symbol-for-gtype "PangoStyle")))
  ;; Check the names
  (is (equal '("PANGO_STYLE_NORMAL" "PANGO_STYLE_OBLIQUE" "PANGO_STYLE_ITALIC")
             (list-enum-item-name "PangoStyle")))
  ;; Check the values
  (is (equal '(0 1 2)
             (list-enum-item-value "PangoStyle")))
  ;; Check the nick names
  (is (equal '("normal" "oblique" "italic")
             (list-enum-item-nick "PangoStyle")))
  ;; Check the enum definition
  (is (equal '(GOBJECT:DEFINE-G-ENUM "PangoStyle"
                                     PANGO-STYLE
                                     (:EXPORT T 
                                      :TYPE-INITIALIZER "pango_style_get_type")
                                     (:NORMAL 0)
                                     (:OBLIQUE 1)
                                     (:ITALIC 2))
             (gobject:get-g-type-definition "PangoStyle"))))

;;;     PangoWeight

(test pango-weight
  ;; Check the type
  (is (g:type-is-enum "PangoWeight"))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoWeight")
          (g:gtype (cffi:foreign-funcall "pango_weight_get_type" :size))))
  ;; Check the registered name
  (is (eq 'pango:weight
          (glib:symbol-for-gtype "PangoWeight")))
  ;; Check the names
  (is (equal '("PANGO_WEIGHT_THIN" "PANGO_WEIGHT_ULTRALIGHT" 
               "PANGO_WEIGHT_LIGHT" "PANGO_WEIGHT_SEMILIGHT" "PANGO_WEIGHT_BOOK" 
               "PANGO_WEIGHT_NORMAL" "PANGO_WEIGHT_MEDIUM" 
               "PANGO_WEIGHT_SEMIBOLD" "PANGO_WEIGHT_BOLD" 
               "PANGO_WEIGHT_ULTRABOLD" "PANGO_WEIGHT_HEAVY" 
               "PANGO_WEIGHT_ULTRAHEAVY")
             (list-enum-item-name "PangoWeight")))
  ;; Check the values
  (is (equal '(100 200 300 350 380 400 500 600 700 800 900 1000)
             (list-enum-item-value "PangoWeight")))
  ;; Check the nick names
  (is (equal '("thin" "ultralight" "light" "semilight" "book" "normal" "medium" 
               "semibold" "bold" "ultrabold" "heavy" "ultraheavy")
             (list-enum-item-nick "PangoWeight")))
  ;; Check the enum definition
  (is (equal '(GOBJECT:DEFINE-G-ENUM "PangoWeight" PANGO-WEIGHT
                                     (:EXPORT T 
                                      :TYPE-INITIALIZER "pango_weight_get_type")
                                     (:THIN 100)
                                     (:ULTRALIGHT 200)
                                     (:LIGHT 300)
                                     (:SEMILIGHT 350)
                                     (:BOOK 380)
                                     (:NORMAL 400)
                                     (:MEDIUM 500)
                                     (:SEMIBOLD 600)
                                     (:BOLD 700)
                                     (:ULTRABOLD 800)
                                     (:HEAVY 900)
                                     (:ULTRAHEAVY 1000))
             (gobject:get-g-type-definition "PangoWeight"))))

;;;     PangoVariant

(test pango-variant
  ;; Check the type
  (is (g:type-is-enum "PangoVariant"))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoVariant")
          (g:gtype (cffi:foreign-funcall "pango_variant_get_type" :size))))
  ;; Check the registered name
  (is (eq 'pango:variant
          (glib:symbol-for-gtype "PangoVariant")))
  ;; Check the names
  (is (equal '("PANGO_VARIANT_NORMAL" "PANGO_VARIANT_SMALL_CAPS"
               "PANGO_VARIANT_ALL_SMALL_CAPS" "PANGO_VARIANT_PETITE_CAPS"
               "PANGO_VARIANT_ALL_PETITE_CAPS" "PANGO_VARIANT_UNICASE"
               "PANGO_VARIANT_TITLE_CAPS")
             (list-enum-item-name "PangoVariant")))
  ;; Check the values
  (is (equal '(0 1 2 3 4 5 6)
             (list-enum-item-value "PangoVariant")))
  ;; Check the nick names
  (is (equal '("normal" "small-caps" "all-small-caps" "petite-caps" 
               "all-petite-caps" "unicase" "title-caps")
             (list-enum-item-nick "PangoVariant")))
  ;; Check the enum definition
  (is (equal '(GOBJECT:DEFINE-G-ENUM "PangoVariant" PANGO-VARIANT
                                     (:EXPORT T 
                                      :TYPE-INITIALIZER 
                                      "pango_variant_get_type")
                                     (:NORMAL 0)
                                     (:SMALL-CAPS 1)
                                     (:ALL-SMALL-CAPS 2)
                                     (:PETITE-CAPS 3)
                                     (:ALL-PETITE-CAPS 4)
                                     (:UNICASE 5)
                                     (:TITLE-CAPS 6))
             (gobject:get-g-type-definition "PangoVariant"))))

;;;     PangoStretch

(test pango-stretch
  ;; Check the type
  (is (g:type-is-enum "PangoStretch"))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoStretch")
          (g:gtype (cffi:foreign-funcall "pango_stretch_get_type" :size))))
  ;; Check the registered name
  (is (eq 'pango:stretch
          (glib:symbol-for-gtype "PangoStretch")))
  ;; Check the names
  (is (equal '("PANGO_STRETCH_ULTRA_CONDENSED" "PANGO_STRETCH_EXTRA_CONDENSED"
               "PANGO_STRETCH_CONDENSED" "PANGO_STRETCH_SEMI_CONDENSED"
               "PANGO_STRETCH_NORMAL" "PANGO_STRETCH_SEMI_EXPANDED" 
               "PANGO_STRETCH_EXPANDED" "PANGO_STRETCH_EXTRA_EXPANDED" 
               "PANGO_STRETCH_ULTRA_EXPANDED")
             (list-enum-item-name "PangoStretch")))
  ;; Check the values
  (is (equal '(0 1 2 3 4 5 6 7 8)
             (list-enum-item-value "PangoStretch")))
  ;; Check the nick names
  (is (equal '("ultra-condensed" "extra-condensed" "condensed" "semi-condensed"  
               "normal" "semi-expanded" "expanded" "extra-expanded" 
               "ultra-expanded")
             (list-enum-item-nick "PangoStretch")))
  ;; Check the enum definition
  (is (equal '(GOBJECT:DEFINE-G-ENUM "PangoStretch" PANGO-STRETCH
                                     (:EXPORT T 
                                      :TYPE-INITIALIZER 
                                      "pango_stretch_get_type")
                                     (:ULTRA-CONDENSED 0)
                                     (:EXTRA-CONDENSED 1)
                                     (:CONDENSED 2)
                                     (:SEMI-CONDENSED 3)
                                     (:NORMAL 4)
                                     (:SEMI-EXPANDED 5)
                                     (:EXPANDED 6)
                                     (:EXTRA-EXPANDED 7)
                                     (:ULTRA-EXPANDED 8))
             (gobject:get-g-type-definition "PangoStretch"))))

;;;     PangoFontMask

(test pango-font-mask
  ;; Check the type
  (is (g:type-is-flags "PangoFontMask"))
  ;; Check the registered name
  (is (eq 'pango:font-mask
          (glib:symbol-for-gtype "PangoFontMask")))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoFontMask")
          (g:gtype (cffi:foreign-funcall "pango_font_mask_get_type" :size))))
  ;; Check the names
  (is (equal '("PANGO_FONT_MASK_FAMILY" "PANGO_FONT_MASK_STYLE" 
               "PANGO_FONT_MASK_VARIANT" "PANGO_FONT_MASK_WEIGHT" 
               "PANGO_FONT_MASK_STRETCH" "PANGO_FONT_MASK_SIZE"
               "PANGO_FONT_MASK_GRAVITY" "PANGO_FONT_MASK_VARIATIONS")
             (list-flags-item-name "PangoFontMask")))
  ;; Check the values
  (is (equal '(1 2 4 8 16 32 64 128)
             (list-flags-item-value "PangoFontMask")))
  ;; Check the nick names
  (is (equal '("family" "style" "variant" "weight" "stretch" "size" "gravity" 
               "variations")
             (list-flags-item-nick "PangoFontMask")))
  ;; Check the flags definition
  (is (equal '(GOBJECT:DEFINE-G-FLAGS "PangoFontMask" PANGO-FONT-MASK
                                      (:EXPORT T 
                                       :TYPE-INITIALIZER 
                                       "pango_font_mask_get_type")
                                      (:FAMILY 1)
                                      (:STYLE 2)
                                      (:VARIANT 4)
                                      (:WEIGHT 8)
                                      (:STRETCH 16)
                                      (:SIZE 32)
                                      (:GRAVITY 64)
                                      (:VARIATIONS 128))
             (gobject:get-g-type-definition "PangoFontMask"))))

;;;     PangoFontDescription

(test pango-font-description-boxed
  ;; Type check
  (is (g:type-is-a (g:gtype "PangoFontDescription") g:+g-type-boxed+))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoFontDescription")
          (g:gtype (cffi:foreign-funcall "pango_font_description_get_type"
                                         :size))))
  ;; Check the registered name
  (is (eq 'pango:font-description
          (glib:symbol-for-gtype "PangoFontDescription"))))

;;;     PangoFontMetrics

(test pango-font-metrics-boxed
  ;; Type check
  (is (g:type-is-a (g:gtype "PangoFontMetrics") g:+g-type-boxed+))
  ;; Check the type initializer
  (is (eq (g:gtype "PangoFontMetrics")
          (g:gtype (cffi:foreign-funcall "pango_font_metrics_get_type"
                                         :size))))
  ;; Check the registered name
  (is (eq 'pango:font-metrics
          (glib:symbol-for-gtype "PangoFontMetrics"))))

;;;     PangoFont
;;;     PangoFontFamily
;;;     PangoFontFace
;;;     PangoFontMap
;;;     PangoFontMapClass
;;;     PangoFontset
;;;     PangoFontsetClass

;;; --- Functions --------------------------------------------------------------

;;;     pango_font_description_new

(test pango-font-description-new
  (is (typep (pango:font-description-new) 'pango:font-description)))

;;;     pango_font_description_copy

(test pango-font-description-copy
  (let ((desc (pango:font-description-new)))
    (is (typep (pango:font-description-copy desc) 'pango:font-description))))

;;;     pango_font_description_hash

(test pango-font-description-hash
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (integerp (pango:font-description-hash desc)))))

;;;     pango_font_description_equal

(test pango-font-description-equal
  (let ((desc1 (pango:font-description-from-string "Sans Bold 16"))
        (desc2 (pango:font-description-from-string "Sans Bold 18"))
        (desc3 (pango:font-description-from-string "Sans Bold 18")))
    (is-false (pango:font-description-equal desc1 desc2))
    (is-true (pango:font-description-equal desc1 desc1))
    (is-true (pango:font-description-equal desc2 desc2))
    (is-false (pango:font-description-equal desc1 desc3))
    (is-true (pango:font-description-equal desc2 desc3))))

;;;     pango_font_description_free
;;;     pango_font_descriptions_free

;;;     pango_font_description_set_family
;;;     pango_font_description_get_family

(test pango-font-description-family
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (string= "Sans" (pango:font-description-family desc)))
    (is (string= "Verdana"
                 (setf (pango:font-description-family desc) "Verdana")))
    (is (string= "Verdana Bold 16"
                 (pango:font-description-to-string desc)))))

;;;     pango_font_description_set_style
;;;     pango_font_description_get_style

(test pango-font-description-style
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :normal (pango:font-description-style desc)))
    (is (eq :italic (setf (pango:font-description-style desc) :italic)))
    (is (eq :italic (pango:font-description-style desc)))))

;;;     pango_font_description_set_variant
;;;     pango_font_description_get_variant

(test pango-font-description-variant
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :normal (pango:font-description-variant desc)))
    (is (eq :small-caps
            (setf (pango:font-description-variant desc) :small-caps)))
    (is (eq :small-caps (pango:font-description-variant desc)))))

;;;     pango_font_description_set_weight
;;;     pango_font_description_get_weight

(test pango-font-description-weight.1
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :bold (pango:font-description-weight desc)))
    (is (eq :thin (setf (pango:font-description-weight desc) :thin)))
    (is (eq :thin (pango:font-description-weight desc)))))

;; The PangoWeight enumeration allows undeclared values.

(test pango-font-description-weight.2
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :bold (pango:font-description-weight desc)))
    (is (= 450 (setf (pango:font-description-weight desc) 450)))
    (is (= 450 (pango:font-description-weight desc)))
    (is (= 400 (setf (pango:font-description-weight desc) 400)))
    (is (eq :normal (pango:font-description-weight desc)))))

;;;     pango_font_description_set_stretch
;;;     pango_font_description_get_stretch

(test pango-font-description-stretch
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :normal (pango:font-description-stretch desc)))
    (is (eq :expanded (setf (pango:font-description-stretch desc) :expanded)))
    (is (eq :expanded (pango:font-description-stretch desc)))))

;;;     pango_font_description_set_size
;;;     pango_font_description_get_size

(test pango-font-description-size
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (= (* 16 pango:+pango-scale+) (pango:font-description-size desc)))
    (is (= (* 18 pango:+pango-scale+)
           (setf (pango:font-description-size desc)
                 (* 18 pango:+pango-scale+))))
    (is (= (* 18 pango:+pango-scale+)
           (pango:font-description-size desc)))))

;;;     pango_font_description_set_absolute_size
;;;     pango_font_description_get_size_is_absolute

(test pango-font-description-absolute-size
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is-false (pango:font-description-size-is-absolute desc))
    (is (= (* 16 pango:+pango-scale+) (pango:font-description-size desc)))
    (is-false (pango:font-description-set-absolute-size desc 18))
    (is-true (pango:font-description-size-is-absolute desc))
    (is (= 18 (pango:font-description-size desc)))))

;;;     pango_font_description_set_gravity
;;;     pango_font_description_get_gravity

(test font-description-gravity
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (eq :south (pango:font-description-gravity desc)))
    (is (eq :north (setf (pango:font-description-gravity desc) :north)))
    (is (eq :north (pango:font-description-gravity desc)))))

;;;     pango_font_description_set_variations
;;;     pango_font_description_get_variations

;; no example for a font with variations

(test pango-font-description-variations
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is-false (pango:font-description-variations desc))))

;;;     pango_font_description_get_set_fields
;;;     pango_font_description_unset_fields

(test pango-font-description-set-fields
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (equal '(:FAMILY :STYLE :VARIANT :WEIGHT :STRETCH :SIZE)
               (pango:font-description-set-fields desc)))
    (is-false (pango:font-description-unset-fields desc :family))
    (is (equal '(:STYLE :VARIANT :WEIGHT :STRETCH :SIZE)
               (pango:font-description-set-fields desc)))
    (is-false (pango:font-description-unset-fields desc '(:style :variant)))
    (is (equal '(:WEIGHT :STRETCH :SIZE)
               (pango:font-description-set-fields desc)))))

;;;     pango_font_description_merge

(test pango-font-description-merge.1
  (let ((desc1 (pango:font-description-from-string "16"))
        (desc2 (pango:font-description-from-string "Sans Bold")))
    (is (string= "Normal 16" (pango:font-description-to-string desc1)))
    (is (string= "Sans Bold" (pango:font-description-to-string desc2)))
    (is-false (pango:font-description-merge desc1 desc2 t))
    (is (string= "Sans Bold 16" (pango:font-description-to-string desc1)))))

(test pango-font-description-merge.2
  (let ((desc1 (pango:font-description-from-string "16"))
        (desc2 (pango:font-description-from-string "Sans Bold")))
    (is (string= "Normal 16" (pango:font-description-to-string desc1)))
    (is (string= "Sans Bold" (pango:font-description-to-string desc2)))
    (is-false (pango:font-description-merge desc1 nil t))
    (is (string= "Normal 16" (pango:font-description-to-string desc1)))))

;;;     pango_font_description_better_match

;;;     pango_font_description_from_string
;;;     pango_font_description_to_string
;;;     pango_font_description_to_filename

(test pango-font-description-from-string
  (let ((desc (pango:font-description-from-string "Sans Bold 16")))
    (is (typep desc 'pango:font-description))
    (is (string= "Sans Bold 16" (pango:font-description-to-string desc)))
    (is (string= "sans_bold_16" (pango:font-description-to-filename desc)))))

;;;     pango_font_metrics_ref
;;;     pango_font_metrics_unref

;;;     pango_font_metrics_get_ascent
;;;     pango_font_metrics_get_descent
;;;     pango_font_metrics_get_height
;;;     pango_font_metrics_get_approximate_char_width
;;;     pango_font_metrics_get_approximate_digit_width
;;;     pango_font_metrics_get_underline_thickness
;;;     pango_font_metrics_get_underline_position
;;;     pango_font_metrics_get_strikethrough_thickness
;;;     pango_font_metrics_get_strikethrough_position

#-windows
(test pango-font-metrics.1
  (let* ((fontmap (pango:cairo-font-map-default))
         (context (pango:font-map-create-context fontmap))
         (desc (pango:font-description-from-string "Sans 12"))
         (lang (pango:language-from-string "de-de"))
         (metrics (pango:context-metrics context desc lang)))
    (is (typep metrics 'pango:font-metrics))
    (is (= 15360 (pango:font-metrics-ascent metrics)))
    (is (=  4096 (pango:font-metrics-descent metrics)))
    (is (= 19456 (pango:font-metrics-height metrics)))
    (is (=  8553 (pango:font-metrics-approximate-char-width metrics)))
    (is (= 10240 (pango:font-metrics-approximate-digit-width metrics)))
    (is (=   720 (pango:font-metrics-underline-thickness metrics)))
    (is (=  -320 (pango:font-metrics-underline-position metrics)))
    (is (=   816 (pango:font-metrics-strikethrough-thickness metrics)))
    (is (=  4240 (pango:font-metrics-strikethrough-position metrics)))))

#+windows
(test pango-font-metrics.1
  (let* ((fontmap (pango:cairo-font-map-default))
         (context (pango:font-map-create-context fontmap))
         (desc (pango:font-description-from-string "Sans 12"))
         (lang (pango:language-from-string "de-de"))
         (metrics (pango:context-metrics context desc lang)))
    (is (typep metrics 'pango:font-metrics))
    (is (= 15360 (pango:font-metrics-ascent metrics)))
    (is (=  4096 (pango:font-metrics-descent metrics)))
    (is (= 19456 (pango:font-metrics-height metrics)))
    (is (=  8553 (pango:font-metrics-approximate-char-width metrics)))
    (is (= 10240 (pango:font-metrics-approximate-digit-width metrics)))
    (is (=  1024 (pango:font-metrics-underline-thickness metrics)))
    (is (= -2048 (pango:font-metrics-underline-position metrics)))
    (is (=  1024 (pango:font-metrics-strikethrough-thickness metrics)))
    (is (=  5120 (pango:font-metrics-strikethrough-position metrics)))))

#-windows
(test pango-font-metrics.2
  (let* ((fontmap (pango:cairo-font-map-default))
         (context (pango:font-map-create-context fontmap))
         (desc (pango:font-description-from-string "Sans 18"))
         (lang (pango:language-from-string "de-de"))
         (metrics (pango:context-metrics context desc lang)))
    (is (typep metrics 'pango:font-metrics))
    (is (= 23552 (pango:font-metrics-ascent metrics)))
    (is (=  6144 (pango:font-metrics-descent metrics)))
    (is (= 28672 (pango:font-metrics-height metrics)))
    (is (= 12829 (pango:font-metrics-approximate-char-width metrics)))
    (is (= 15360 (pango:font-metrics-approximate-digit-width metrics)))
    (is (=  1080 (pango:font-metrics-underline-thickness metrics)))
    (is (=  -480 (pango:font-metrics-underline-position metrics)))
    (is (=  1224 (pango:font-metrics-strikethrough-thickness metrics)))
    (is (=  6360 (pango:font-metrics-strikethrough-position metrics)))))

#+windows
(test pango-font-metrics.2
  (let* ((fontmap (pango:cairo-font-map-default))
         (context (pango:font-map-create-context fontmap))
         (desc (pango:font-description-from-string "Sans 18"))
         (lang (pango:language-from-string "de-de"))
         (metrics (pango:context-metrics context desc lang)))
    (is (typep metrics 'pango:font-metrics))
    (is (= 22528 (pango:font-metrics-ascent metrics)))
    (is (=  6144 (pango:font-metrics-descent metrics)))
    (is (= 28672 (pango:font-metrics-height metrics)))
    (is (= 12829 (pango:font-metrics-approximate-char-width metrics)))
    (is (= 15360 (pango:font-metrics-approximate-digit-width metrics)))
    (is (=  2048 (pango:font-metrics-underline-thickness metrics)))
    (is (= -2048 (pango:font-metrics-underline-position metrics)))
    (is (=  2048 (pango:font-metrics-strikethrough-thickness metrics)))
    (is (=  7168 (pango:font-metrics-strikethrough-position metrics)))))

;;;     pango_font_find_shaper
;;;     pango_font_describe
;;;     pango_font_describe_with_absolute_size
;;;     pango_font_get_face
;;;     pango_font_get_coverage
;;;     pango_font_has_char
;;;     pango_font_get_glyph_extents
;;;     pango_font_get_metrics
;;;     pango_font_get_font_map
;;;     pango_font_get_features
;;;     pango_font_get_hb_font

;;;     pango_font_family_get_name

(test pango-font-family-name
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is (string= "Serif" (pango:font-family-name family)))))

;;;     pango_font_family_is_monospace

(test pango-font-family-is-monospace.1
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is-false (pango:font-family-is-monospace family))))

(test pango-font-family-is-monospace.2
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Monospace")))
    (is-true (pango:font-family-is-monospace family))))

;;;     pango_font_family_is_variable

(test pango-font-family-is-variable.1
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is-false (pango:font-family-is-variable family))))

(test pango-font-family-is-variable.2
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Monospace")))
    (is-false (pango:font-family-is-variable family))))

;;;     pango_font_family_list_faces

#-windows
(test pango-font-family-list-faces
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is (every (lambda (x) (typep x 'pango:font-face))
               (pango:font-family-list-faces family)))
    (is (equal '("Regular" "Bold" "Italic" "Bold Italic")
               (mapcar #'pango:font-face-face-name
                       (pango:font-family-list-faces family))))))

#+windows
(test pango-font-family-list-faces
  (let* ((fontmap (pango:cairo-font-map-default))
         (family (pango:font-map-family fontmap "Serif")))
    (is (every (lambda (x) (typep x 'pango:font-face))
               (pango:font-family-list-faces family)))
    (is (equal '("Normal" "Semi-Condensed" "Italic" "Italic Semi-Condensed"
                 "Bold" "Bold Semi-Condensed" "Bold Italic"
                 "Bold Italic Semi-Condensed")
               (mapcar #'pango:font-face-face-name
                       (pango:font-family-list-faces family))))))

;;;     pango_font_family_get_face

#-windows
(test pango-font-family-face
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is (typep (pango:font-family-face family "Regular") 'pango:font-face))
    (is (typep (pango:font-family-face family nil) 'pango:font-face))))

#+windows
(test pango-font-family-face
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif")))
    (is (typep (pango:font-family-face family "Normal") 'pango:font-face))
    (is (typep (pango:font-family-face family nil) 'pango:font-face))))

;;;     pango_font_face_get_face_name

#-windows
(test pango-font-family-face-name.1
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family "Regular")))
    (is (typep face 'pango:font-face))
    (is (string= "Regular" (pango:font-face-face-name face)))))

#+windows ; On Windows it is "Normal" and not "Regular"
(test pango-font-family-face-name.1
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family "Normal")))
    (is (typep face 'pango:font-face))
    (is (string= "Normal" (pango:font-face-face-name face)))))

#-windows
(test pango-font-family-face-name.2
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family nil)))
    (is (typep face 'pango:font-face))
    (is (string= "Regular" (pango:font-face-face-name face)))))

#+windows ; On Windows it is "Normal" and not "Regular"
(test pango-font-family-face-name.2
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family nil)))
    (is (typep face 'pango:font-face))
    (is (string= "Normal" (pango:font-face-face-name face)))))

;;;     pango_font_face_list_sizes

#-windows
(test pango-font-face-list-sizes
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family "Regular")))
    (is (typep face 'pango:font-face))
    (is-false (pango:font-face-list-sizes face))))

#+windows ; On Windows it is not "Regular" but "Normal"
(test pango-font-face-list-sizes
  (let* ((font-map (pango:cairo-font-map-default))
         (family (pango:font-map-family font-map "Serif"))
         (face (pango:font-family-face family "Normal")))
    (is (typep face 'pango:font-face))
    (is-false (pango:font-face-list-sizes face))))

;;;     pango_font_face_describe

;;;     pango_font_face_is_synthesized
;;;     pango_font_face_get_family
;;;
;;;     pango_font_map_create_context
;;;     pango_font_map_load_font
;;;     pango_font_map_load_fontset

;;;     pango_font_map_list_families

(test pango-font-map-list-families
  (let ((fontmap (pango:cairo-font-map-default)))
    (is (every (lambda (x) (typep x 'pango:font-family))
               (pango:font-map-list-families fontmap)))
    (is (every #'stringp
               (mapcar #'pango:font-family-name
                       (pango:font-map-list-families fontmap))))))

;;;     pango_font_map_get_family
;;;     pango_font_map_get_serial
;;;     pango_font_map_changed
;;;     pango_font_map_get_shape_engine_type
;;;
;;;     pango_fontset_get_font
;;;     pango_fontset_get_metrics
;;;     PangoFontsetForeachFunc
;;;     pango_fontset_foreach

;;; --- 2023-8-27 --------------------------------------------------------------
