;;; ----------------------------------------------------------------------------
;;; pango.cairo-rendering.lisp
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
;;; Cairo Rendering
;;;
;;;     Font handling and rendering with Cairo
;;;
;;; Types and Values
;;;
;;;     PangoCairoFont
;;;     PangoCairoFontMap
;;;
;;; Functions
;;;
;;;     pango_cairo_font_map_get_default
;;;     pango_cairo_font_map_set_default
;;;     pango_cairo_font_map_new
;;;     pango_cairo_font_map_new_for_font_type
;;;     pango_cairo_font_map_get_font_type
;;;     pango_cairo_font_map_set_resolution
;;;     pango_cairo_font_map_get_resolution
;;;     pango_cairo_font_map_create_context
;;;     pango_cairo_font_get_scaled_font
;;;     pango_cairo_context_set_resolution
;;;     pango_cairo_context_get_resolution
;;;     pango_cairo_context_set_font_options
;;;     pango_cairo_context_get_font_options
;;;
;;;     PangoCairoShapeRendererFunc
;;;
;;;     pango_cairo_context_set_shape_renderer
;;;     pango_cairo_context_get_shape_renderer
;;;     pango_cairo_create_context
;;;     pango_cairo_update_context
;;;     pango_cairo_create_layout
;;;     pango_cairo_update_layout
;;;     pango_cairo_show_glyph_string
;;;     pango_cairo_show_glyph_item
;;;     pango_cairo_show_layout_line
;;;     pango_cairo_show_layout
;;;     pango_cairo_show_error_underline
;;;     pango_cairo_glyph_string_path
;;;     pango_cairo_layout_line_path
;;;     pango_cairo_layout_path
;;;     pango_cairo_error_underline_path
;;;
;;; Object Hierarchy
;;;
;;;     GInterface
;;;     ├── PangoCairoFont
;;;     ╰── PangoCairoFontMap
;;;
;;; Prerequisites
;;;
;;;     PangoCairoFont requires PangoFont.
;;;     PangoCairoFontMap requires PangoFontMap.
;;;
;;; Description
;;;
;;; The Cairo library is a vector graphics library with a powerful rendering
;;; model. It has such features as anti-aliased primitives, alpha-compositing,
;;; and gradients. Multiple backends for Cairo are available, to allow rendering
;;; to images, to PDF files, and to the screen on X and on other windowing
;;; systems. The functions in this section allow using Pango to render to Cairo
;;; surfaces.
;;;
;;; Using Pango with Cairo is straightforward. A PangoContext created with
;;; pango_cairo_font_map_create_context() can be used on any Cairo context
;;; (cairo_t), but needs to be updated to match the current transformation
;;; matrix and target surface of the Cairo context using
;;; pango_cairo_update_context(). The convenience functions
;;; pango_cairo_create_layout() and pango_cairo_update_layout() handle the
;;; common case where the program does not need to manipulate the properties
;;; of the PangoContext.
;;;
;;; When you get the metrics of a layout or of a piece of a layout using
;;; functions such as pango_layout_get_extents(), the reported metrics are in
;;; user-space coordinates. If a piece of text is 10 units long, and you call
;;; cairo_scale (cr, 2.0), it still is more-or-less 10 units long. However, the
;;; results will be affected by hinting (that is, the process of adjusting the
;;; text to look good on the pixel grid), so you shouldn't assume they are
;;; completely independent of the current transformation matrix. Note that the
;;; basic metrics functions in Pango report results in integer Pango units. To
;;; get to the floating point units used in Cairo divide by PANGO_SCALE.
;;;
;;; Using Pango with Cairo
;;;
;;; #include <math.h>
;;; #include <pango/pangocairo.h>
;;; static void
;;; draw_text (cairo_t *cr)
;;; {
;;; #define RADIUS 150
;;; #define N_WORDS 10
;;; #define FONT "Sans Bold 27"
;;;   PangoLayout *layout;
;;;   PangoFontDescription *desc;
;;;   int i;
;;;   /* Center coordinates on the middle of the region we are drawing
;;;    */
;;;   cairo_translate (cr, RADIUS, RADIUS);
;;;   /* Create a PangoLayout, set the font and text */
;;;   layout = pango_cairo_create_layout (cr);
;;;   pango_layout_set_text (layout, "Text", -1);
;;;   desc = pango_font_description_from_string (FONT);
;;;   pango_layout_set_font_description (layout, desc);
;;;   pango_font_description_free (desc);
;;;   /* Draw the layout N_WORDS times in a circle */
;;;   for (i = 0; i < N_WORDS; i++)
;;;     {
;;;       int width, height;
;;;       double angle = (360. * i) / N_WORDS;
;;;       double red;
;;;       cairo_save (cr);
;;;       /* Gradient from red at angle == 60 to blue at angle == 240 */
;;;       red   = (1 + cos ((angle - 60) * G_PI / 180.)) / 2;
;;;       cairo_set_source_rgb (cr, red, 0, 1.0 - red);
;;;       cairo_rotate (cr, angle * G_PI / 180.);
;;;       /* Inform Pango to re-layout the text with the new transformation */
;;;       pango_cairo_update_layout (cr, layout);
;;;       pango_layout_get_size (layout, &width, &height);
;;;       cairo_move_to (cr, - ((double)width / PANGO_SCALE) / 2, - RADIUS);
;;;       pango_cairo_show_layout (cr, layout);
;;;       cairo_restore (cr);
;;;     }
;;;   /* free the layout object */
;;;   g_object_unref (layout);
;;; }
;;; int main (int argc, char **argv)
;;; {
;;;   cairo_t *cr;
;;;   char *filename;
;;;   cairo_status_t status;
;;;   cairo_surface_t *surface;
;;;   if (argc != 2)
;;;     {
;;;       g_printerr ("Usage: cairosimple OUTPUT_FILENAME\n");
;;;       return 1;
;;;     }
;;;   filename = argv[1];
;;;   surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32,
;;;                     2 * RADIUS, 2 * RADIUS);
;;;   cr = cairo_create (surface);
;;;   cairo_set_source_rgb (cr, 1.0, 1.0, 1.0);
;;;   cairo_paint (cr);
;;;   draw_text (cr);
;;;   cairo_destroy (cr);
;;;   status = cairo_surface_write_to_png (surface, filename);
;;;   cairo_surface_destroy (surface);
;;;   if (status != CAIRO_STATUS_SUCCESS)
;;;     {
;;;       g_printerr ("Could not save png to '%s'\n", filename);
;;;       return 1;
;;;     }
;;;   return 0;
;;; }
;;;
;;; Figure 2. Output of Example 1, "Using Pango with Cairo"
;;; Output of Example 1, "Using Pango with Cairo"
;;; ----------------------------------------------------------------------------

(in-package :pango)

;;; ----------------------------------------------------------------------------
;;; PangoCairoFont
;;; ----------------------------------------------------------------------------

(define-g-interface "PangoCairoFont" cairo-font
  (:export t
   :type-initializer "pango_cairo_font_get_type")
  nil)

#+liber-documentation
(setf (liber:alias-for-class 'cairo-font)
      "Interface"
      (documentation 'cairo-font 'type)
 "@version{#2021-1-8}
  @begin{short}
    The @sym{pango:cairo-font} interface is an interface exported by fonts for
    use with Cairo.
  @end{short}
  The actual type of the font will depend on the particular font technology
  Cairo was compiled to use.
  @see-class{pango:cairo-font-map}")

;;; ----------------------------------------------------------------------------
;;; PangoCairoFontMap
;;; ----------------------------------------------------------------------------

(define-g-interface "PangoCairoFontMap" cairo-font-map
  (:export t
   :type-initializer "pango_cairo_font_map_get_type")
  nil)

#+liber-documentation
(setf (liber:alias-for-class 'cairo-font-map)
      "Interface"
      (documentation 'cairo-font-map 'type)
 "@version{#2021-1-8}
  @begin{short}
    The @sym{pango:cairo-font-map} interface is an interface exported by font
    maps for use with Cairo.
  @end{short}
  The actual type of the font map will depend on the particular font technology
  Cairo was compiled to use.
  @see-class{pango:cairo-font}
  @see-function{pango:cairo-font-map-new}")

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_get_default ()
;;; pango_cairo_font_map_set_default () -> cairo-font-map-default
;;; ----------------------------------------------------------------------------

(defun (setf cairo-font-map-default) (fontmap)
  (cffi:foreign-funcall "pango_cairo_font_map_set_default"
                        (g:object font-map) fontmap
                        :void)
  fontmap)

(defcfun ("pango_cairo_font_map_get_default" cairo-font-map-default)
    (g:object font-map)
 #+liber-documentation
 "@version{#2021-1-5}
  @syntax[]{(pango:cairo-font-map-default) => fontmap}
  @syntax[]{(setf (pango:cairo-font-map-default) fontmap)}
  @argument[fontmap]{a @class{pango:font-map} object, or @code{nil}}
  @begin{short}
    The function @sym{pango:cairo-font-map-default} gets a default PangoCairo
    font map to use with Cairo.
  @end{short}
  Note that the type of the returned object will depend on the particular font
  backend Cairo was compiled to use. You generally should only use the
  PangoFontMap and PangoCairoFontMap interfaces on the returned object.

  The function @sym{(setf pango:cairo-font-map-default)} sets a default
  PangoCairo font map to use with Cairo.

  This can be used to change the Cairo font backend that the default font map
  uses for example. The old default font map is unreffed and the new font map
  referenced.

  Note that since Pango 1.32, the default font map is per-thread. This function
  only changes the default fontmap for the current thread. Default fontmaps of
  exisiting threads are not changed. Default fontmaps of any new threads will
  still be created using the function @fun{pango:cairo-font-map-new}.

  A value of @code{nil} for @arg{fontmap} will cause the current default font
  map to be released and a new default font map to be created on demand, using
  the function @fun{pango:cairo-font-map-new}.
  @see-class{pango:font-map}
  @see-function{pango:cairo-font-map-new}")

(export 'cairo-font-map-default)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_new ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_font_map_new" cairo-font-map-new)
    (g:object font-map)
 #+liber-documentation
 "@version{#2021-1-9}
  @begin{return}
    The newly allocated @class{pango:font-map} object.
  @end{return}
  @begin{short}
    Creates a new PangoCairoFontMap object
  @end{short}
  A fontmap is used to cache information about available fonts, and holds
  certain global parameters such as the resolution. In most cases, you can use
  the function @fun{pango:cairo-font-map-default} instead.

  Note that the type of the returned object will depend on the particular font
  backend Cairo was compiled to use. You generally should only use the
  @class{pango:font-map} and @class{pango:cairo-font-map} interfaces on the
  returned object.
  @see-class{pango:font-map}
  @see-class{pango:cairo-font-map}")

(export 'cairo-font-map-new)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_new_for_font_type ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_font_map_new_for_font_type"
           cairo-font-map-new-for-font-type) (g:object font-map)
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[fonttype]{desired value of the @symbol{cairo:font-type-t}
    enumeration}
  @begin{return}
    The newly allocated @class{pango:font-map} object of suitable type, or
    @code{nil} if the requested Cairo font backend is not supported or compiled
    in.
  @end{return}
  @begin{short}
    Creates a new @class{pango:cairo-font-map} object of the type suitable to
    be used with Cairo font backend of type fonttype.
  @end{short}

  In most cases one should simply use the function
  @fun{pango:cairo-font-map-new}, or in fact in most of those cases, just use
  the function @fun{pango:cairo-font-map-default}.
  @see-class{pango:font-map}
  @see-class{pango:cairo-font-map}
  @see-function{pango:cairo-font-map-new}
  @see-function{pango:cairo-font-map-default}"
  (fonttype cairo:font-type-t))

(export 'cairo-font-map-new-for-font-type)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_get_font_type () -> cairo-font-map-font-type
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_font_map_get_font_type" %cairo-font-map-font-type)
    cairo:font-type-t
  (fontmap :pointer)) ; font-map

(defun cairo-font-map-font-type (fontmap)
 #+liber-documentation
 "@version{#2021-1-19}
  @argument[fontmap]{a @class{pango:cairo-font-map} object}
  @begin{return}
    A value of the @symbol{cairo:font-type-t} enumeration for the Cairo font
    backend type.
  @end{return}
  @begin{short}
    Gets the type of Cairo font backend that @arg{fontmap} uses.
  @end{short}
  @begin[Example]{dictionary}
    @begin{pre}
(pango:cairo-font-map-font-type (pango:cairo-font-map-default)) => :FT
    @end{pre}
  @end{dictionary}
  @see-class{pango:cairo-font-map}
  @see-symbol{cairo:font-type-t}"
  (%cairo-font-map-font-type (if (cffi:pointerp fontmap)
                                 fontmap
                                 (g:object-pointer fontmap))))

(export 'cairo-font-map-font-type)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_get_resolution ()
;;; pango_cairo_font_map_set_resolution () cairo-font-map-resolution
;;; ----------------------------------------------------------------------------

(defun (setf cairo-font-map-resolution) (dpi fontmap)
  (cffi:foreign-funcall "pango_cairo_font_map_set_resolution"
                        :pointer (if (cffi:pointerp fontmap)
                                     fontmap
                                     (g:object-pointer fontmap))
                        :double dpi
                        :void)
  dpi)

(defcfun ("pango_cairo_font_map_get_resolution"
          %cairo-font-map-resolution) :double
  (fontmap :pointer))

(defun cairo-font-map-resolution (fontmap)
 #+liber-documentation
 "@version{#2021-1-19}
  @argument[fontmap]{a @class{pango:cairo-font-map} object}
  @argument[dpi]{a double float with the resolution in \"dots per inch\",
    physical inches are not actually involved, the terminology is conventional}
  @begin{short}
    Accesor of the resolution of a Cairo font map in \"dots per inch\".
  @end{short}

  The function @sym{pango:cairo-font-map-resolution} gets the resolution for
  the fontmap. The function @sym{(setf pango:cairo-font-map-resolution)} sets
  the resolution for the fontmap. This is a scale factor between points
  specified in a @class{pango:font-description} and Cairo units. The default
  value is 96, meaning that a 10 point font will be 13 units high:
  (10 * 96 / 72 = 13.3).
  @begin[Example]{dictionary}
    @begin{pre}
(pango:cairo-font-map-resolution (pango:cairo-font-map-default)) => 96.0d0
    @end{pre}
  @end{dictionary}
  @see-class{pango:cairo-font-map}
  @see-class{pango:font-description}"
  (%cairo-font-map-resolution (if (cffi:pointerp fontmap)
                                  fontmap
                                  (g:object-pointer fontmap))))

(export 'cairo-font-map-resolution)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_map_create_context ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_font_map_create_context"
           cairo-font-map-create-context) (g:object context)
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[fontmap]{a @class{pango:cairo-font-map} object}
  @return{The newly created @class{pango:context} object.}
  @begin{short}
    Create a Pango context for the given @arg{fontmap}.
  @end{short}
  @begin[Warning]{dictionary}
    The @sym{pango:cairo-font-map-create-context} function has been deprecated
    since version 1.22 and should not be used in newly written code. Use the
    @fun{pango:font-map-create-context} function instead.
  @end{dictionary}
  @see-class{pango:cairo-font-map}
  @see-class{pango:context}
  @see-function{pango:font-map-create-context}"
  (fontmap (g:object cairo-font-map)))

(export 'cairo-font-map-create-context)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_font_get_scaled_font () -> cairo-font-scaled-font
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_font_get_scaled_font" cairo-font-scaled-font)
    (:pointer (:struct cairo:scaled-font-t))
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[font]{a @class{pango:font} object from a
    @class{pango:cairo-font-map} object}
  @begin{return}
    The @symbol{cairo:scaled-font-t} instance used by @arg{font}, or
    @code{nil} if @arg{font} is @code{nil}.
  @end{return}
  @begin{short}
    Gets the @symbol{cairo:scaled-font-t} instance used by @arg{font}.
  @end{short}
  The scaled font can be referenced and kept using the function
  @fun{cairo-scaled-font-reference}.
  @see-class{pango:cairo-font}
  @see-symbol{cairo:scaled-font-t}
  @see-function{cairo:scaled-font-reference}"
  (font (g:object cairo-font)))

(export 'cairo-font-scaled-font)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_context_get_resolution ()
;;; pango_cairo_context_set_resolution () -> cairo-context-resolution
;;; ----------------------------------------------------------------------------

(defun (setf cairo-context-resolution) (dpi context)
  (cffi:foreign-funcall "pango_cairo_context_set_resolution"
                        (g:object context) context
                        :double dpi
                        :void)
  dpi)

(defcfun ("pango_cairo_context_get_resolution" cairo-context-resolution)
    :double
 #+liber-documentation
 "@version{#2021-1-9}
  @syntax[]{(pango:cairo-context-resolution context) => dpi}
  @syntax[]{(setf (pango:cairo-context-resolution context) dpi)}
  @argument[context]{a @class{pango:context} object, from a PangoCairo font map}
  @argument[dpi]{the resolution in \"dots per inch\", physical inches are not
    actually involved, the terminology is conventional, a 0 or negative value
    means to use the resolution from the font map}
  @begin{short}
    Accessor of the resolution in \"dots per inch\" for the Pango context.
  @end{short}

  The function @sym{pango:cairo-context-resolution} gets the resolution for the
  context. The function @sym{(setf pango:cairo-context-resolution)} sets the
  resolution for the context. This is a scale factor between points specified
  in a @class{pango:font-description} instance and Cairo units. The default
  value is 96, meaning that a 10 point font will be 13 units high:
  (10 * 96 / 72 = 13.3).
  @see-class{pango:context}
  @see-class{pango:font-description}"
  (context (g:object context)))

(export 'cairo-context-resolution)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_context_get_font_options ()
;;; pango_cairo_context_set_font_options () -> cairo-context-font-options
;;; ----------------------------------------------------------------------------

(defun (setf cairo-context-font-options) (options context)
  (cffi:foreign-funcall "pango_cairo_context_set_font_options"
                        (g:object context) context
                        (:pointer (:struct cairo:font-options-t))
                          (if options options (cffi:null-pointer))
                        :void)
  options)

(defcfun ("pango_cairo_context_get_font_options"
          %cairo-context-font-options)
    (:pointer (:struct cairo:font-options-t))
  (context (g:object context)))

(defun cairo-context-font-options (context)
 #+liber-documentation
 "@version{#2021-10-28}
  @argument[context]{a @class{pango:context} object, from a PangoCairo font map}
  @argument[options]{a @symbol{cairo:font-options-t} instance, or @code{nil} to
    unset any previously set font options}
  @begin{short}
    Accessor of the font options set on the Pango context.
  @end{short}

  The @sym{pango:cairo-context-font-options} function retrieves any font
  rendering options. This function does not report options that are derived
  from the target surface by the @fun{pango:cairo-update-context} function.

  The @sym{(setf pango:cairo-context-font-options)} function sets the font
  options used when rendering text with the Pango context. These font options
  override any font options that the @fun{pango:cairo-update-context} function
  derives from the target surface.
  @see-class{pango:context}
  @see-symbol{cairo:font-options-t}
  @see-function{pango:cairo-update-context}"
  (let ((options (%cairo-context-font-options context)))
    (unless (cffi:null-pointer-p options)
      options)))

(export 'cairo-context-font-options)

;;; ----------------------------------------------------------------------------
;;; PangoCairoShapeRendererFunc ()
;;;
;;; void (*PangoCairoShapeRendererFunc) (cairo_t *cr,
;;;                                      PangoAttrShape *attr,
;;;                                      gboolean do_path,
;;;                                      gpointer data);
;;;
;;; Function type for rendering attributes of type PANGO_ATTR_SHAPE with Pango's
;;; Cairo renderer.
;;;
;;; cr :
;;;     a Cairo context with current point set to where the shape should be
;;;     rendered
;;;
;;; attr :
;;;     the PANGO_ATTR_SHAPE to render
;;;
;;; do_path :
;;;     whether only the shape path should be appended to current path of cr and
;;;     no filling/stroking done. This will be set to TRUE when called from
;;;     pango_cairo_layout_path() and pango_cairo_layout_line_path() rendering
;;;     functions.
;;;
;;; data :
;;;     user data passed to pango_cairo_context_set_shape_renderer()
;;; ----------------------------------------------------------------------------

(cffi:defcallback cairo-shape-renderer-func-cb :void
    ((cr (:pointer (:struct cairo:context-t)))
     (attr (:pointer (:struct attr-shape)))
     (do-path :boolean)
     (data :pointer))
  (restart-case
    (funcall (glib:get-stable-pointer-value data) cr attr do-path)
    (return-from-callback () nil)))

;;; ----------------------------------------------------------------------------
;;; pango_cairo_context_get_shape_renderer ()
;;; pango_cairo_context_set_shape_renderer ()
;;;   -> cairo-context-shape-renderer
;;; ----------------------------------------------------------------------------

(defun (setf cairo-context-shape-renderer) (func context)
  (cffi:foreign-funcall "pango_cairo_context_set_shape_renderer"
                        (g:object context) context
                        :pointer (cffi:callback cairo-shape-renderer-func-cb)
                        :pointer (glib:allocate-stable-pointer func)
                        :pointer (cffi:callback glib:stable-pointer-destroy-notify)
                        :void)
  func)

(defcfun ("pango_cairo_context_get_shape_renderer"
          %cairo-context-shape-renderer) :pointer
  (context (g:object context))
  (data :pointer))

(defun cairo-context-shape-renderer (context)
 #+liber-documentation
 "@version{#2021-1-9}
  @syntax[]{(pango:cairo-context-shape-renderer context) func}
  @syntax[]{(setf (pango:cairo-context-shape-renderer context) func)}
  @argument[context]{a @class{pango:context} object, from a PangoCairo font map}
  @argument[func]{callback function for rendering attributes of type
    @symbol{pango:attr-shape}, or @code{nil} to disable shape rendering}
  @begin{short}
    Accessor of the shape rendering callback function set on the context.
  @end{short}

  The function @sym{pango:cairo-context-shape-renderer} retrieves the callback
  function for rendering attributes of type @symbol{pango:attr-shape}. The
  function @sym{(pango:cairo-context-shape-renderer)} sets the callback
  function for context to use for rendering attributes.
  @see-class{pango:context}
  @see-symbol{pango:attr-shape}"
  (%cairo-context-shape-renderer context (cffi:null-pointer)))

(export 'cairo-context-shape-renderer)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_create_context ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_create_context" cairo-create-context)
    (g:object context)
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @return{The newly created @class{pango:context} object.}
  @begin{short}
    Creates a context object set up to match the current transformation and
    target surface of the Cairo context.
  @end{short}
  This context can then be used to create a layout using the function
  @fun{pango:layout-new}.

  This function is a convenience function that creates a context using the
  default font map, then updates it to @arg{cr}. If you just need to create a
  layout for use with @arg{cr} and do not need to access the
  @class{pango:context} object directly, you can use the function
  @fun{pango:cairo-create-layout} instead.
  @see-class{pango:context}
  @see-symbol{cairo:context-t}
  @see-function{pango:layout-new}
  @see-function{pango:cairo-create-layout}"
  (cr (:pointer (:struct cairo:context-t))))

(export 'cairo-create-context)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_update_context ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_update_context" cairo-update-context) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[context]{a @class{pango:context} object, from a PangoCairo font map}
  @begin{short}
    Updates a @class{pango:context} object previously created for use with
    Cairo to match the current transformation and target surface of a Cairo
    context.
  @end{short}
  If any layouts have been created for the context, it is necessary to call the
  function @fun{pango:layout-context-changed} on those layouts.
  @see-class{pango:context}
  @see-symbol{cairo:context-t}
  @see-function{pango:layout-context-changed}"
  (cr (:pointer (:struct cairo:context-t)))
  (context (g:object context)))

(export 'cairo-update-context)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_create_layout ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_create_layout" cairo-create-layout)
    (g:object layout)
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @return{The newly created @class{pango:layout} object.}
  @begin{short}
    Creates a layout object set up to match the current transformation and
    target surface of the Cairo context.
  @end{short}
  This layout can then be used for text measurement with functions like
  @fun{pango:layout-size} or drawing with functions like
  @fun{pango:cairo-show-layout}. If you change the transformation or target
  surface for @arg{cr}, you need to call the function
  @fun{pango:cairo-update-layout}.

  This function is the most convenient way to use Cairo with Pango, however it
  is slightly inefficient since it creates a separate @class{pango:context}
  object for each layout. This might matter in an application that was laying
  out large amounts of text.
  @see-symbol{cairo:context-t}
  @see-class{pango:layout}
  @see-class{pango:context}
  @see-function{pango:layout-size}
  @see-function{pango:cairo-show-layout}
  @see-function{pango:cairo-update-layout}"
  (cr (:pointer (:struct cairo:context-t))))

(export 'cairo-create-layout)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_update_layout ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_update_layout" cairo-update-layout) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[layout]{a @class{pango:layout} object, from
    the function @fun{pango:cairo-create-layout}.}
  @begin{short}
    Updates the private @class{pango:context} object of a @class{pango:layout}
    object created with the function @fun{pango:cairo-create-layout} to match
    the current transformation and target surface of a Cairo context.
  @end{short}
  @see-symbol{cairo:context-t}
  @see-class{pango:layout}
  @see-class{pango:context}
  @see-function{pango:cairo-create-layout}"
  (cr (:pointer (:struct cairo:context-t)))
  (layout (g:object layout)))

(export 'cairo-update-layout)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_show_glyph_string ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_show_glyph_string" cairo-show-glyph-string) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[font]{a @class{pango:font} from a PangoCairoFontMap}
  @argument[glyphs]{a @class{pango:glyph-string} instance}
  @begin{short}
    Draws the glyphs in @arg{glyphs} in the specified Cairo context.
  @end{short}
  The origin of the glyphs (the left edge of the baseline) will be drawn at the
  current point of the Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:font}
  @see-class{pango:glyph-string}"
  (cr (:pointer (:struct cairo:context-t)))
  (font (g:object font))
  (glyphs (g:boxed glyph-string)))

(export 'cairo-show-glyph-string)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_show_glyph_item ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_show_glyph_item" cairo-show-glyph-item) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[text]{a string with the UTF-8 text that @arg{glyph-item} refers to}
  @argument[glyph-item]{a @class{pango:glyph-ttem} instance}
  @begin{short}
    Draws the glyphs in @arg{glyph-item} in the specified Cairo context,
    embedding the text associated with the glyphs in the output if the output
    format supports it (PDF for example), otherwise it acts similar to the
    function @fun{pango:cairo-show-glyph-string}.
  @end{short}

  The origin of the glyphs (the left edge of the baseline) will be drawn at
  the current point of the Cairo context.

  Note that text is the start of the text for layout, which is then indexed by
  @code{glyph_item->item->offset}.
  @see-symbol{cairo:context-t}
  @see-class{pango:glyph-item}
  @see-function{pango:cairo-show-glyph-string}"
  (cr (:pointer (:struct cairo:context-t)))
  (text :string)
  (glyph-item (g:boxed glyph-item)))

(export 'cairo-show-glyph-item)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_show_layout_line ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_show_layout_line" cairo-show-layout-line) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[line]{a @class{pango:layout-line} instance}
  @begin{short}
    Draws a Pango layout line in the specified Cairo context.
  @end{short}
  The origin of the glyphs, the left edge of the line, will be drawn at the
  current point of the Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:layout-line}"
  (cr (:pointer (:struct cairo:context-t)))
  (line (g:boxed layout-line)))

(export 'cairo-show-layout-line)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_show_layout ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_show_layout" cairo-show-layout) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[layout]{a @class{pango:layout} object}
  @begin{short}
    Draws a Pango layout in the specified Cairo context.
  @end{short}
  The top-left corner of the @class{pango:layout} object will be drawn at the
  current point of the Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:layout}"
  (cr (:pointer (:struct cairo:context-t)))
  (layout (g:object layout)))

(export 'cairo-show-layout)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_show_error_underline ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_show_error_underline" cairo-show-error-underline)
    :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[x]{a double float x coordinate of one corner of the rectangle}
  @argument[y]{a double float y coordinate of one corner of the rectangle}
  @argument[width]{a double float non-negative width of the rectangle}
  @argument[height]{a double float non-negative height of the rectangle}
  @begin{short}
    Draw a squiggly line in the specified Cairo context that approximately
    covers the given rectangle in the style of an underline used to indicate
    a spelling error.
  @end{short}
  The width of the underline is rounded to an integer number of up/down
  segments and the resulting rectangle is centered in the original rectangle.
  @see-symbol{cairo:context-t}"
  (cr (:pointer (:struct cairo:context-t)))
  (x :double)
  (y :double)
  (width :double)
  (height :double))

(export 'cairo-show-error-underline)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_glyph_string_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_glyph_string_path" cairo-glyph-string-path) :void
 #+liber-documentation
 "@version{#21-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[font]{a @class{pango:font} object from a PangoCairoFontMap}
  @argument[glyphs]{a @class{pango:glyph-string} instance}
  @begin{short}
    Adds the glyphs in @arg{glyphs} to the current path in the specified Cairo
    context.
  @end{short}
  The origin of the glyphs (the left edge of the baseline) will be at the
  current point of the Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:font}
  @see-class{pango:glyph-string}"
  (cr (:pointer (:struct cairo:context-t)))
  (font (g:object font))
  (glyphs (g:boxed glyph-string)))

(export 'cairo-glyph-string-path)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_layout_line_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_layout_line_path" cairo-layout-line-path) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[line]{a @class{pango:layout-line} instance}
  @begin{short}
    Adds the text in the @class{pango:layout-line} instance to the current path
    in the specified Cairo context.
  @end{short}
  The origin of the glyphs (the left edge of the line) will be at the current
  point of the Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:layout-line}"
  (cr (:pointer (:struct cairo:context-t)))
  (line (g:object layout-line)))

(export 'cairo-layout-line-path)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_layout_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_layout_path" cairo-layout-path) :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[layout]{a @class{pango:layout} object}
  @begin{short}
    Adds the text in a Pango layout to the current path in the specified Cairo
    context.
  @end{short}
  The top-left corner of the Pango layout will be at the current point of the
  Cairo context.
  @see-symbol{cairo:context-t}
  @see-class{pango:layout}"
  (cr (:pointer (:struct cairo:context-t)))
  (layout (g:object layout)))

(export 'cairo-layout-path)

;;; ----------------------------------------------------------------------------
;;; pango_cairo_error_underline_path ()
;;; ----------------------------------------------------------------------------

(defcfun ("pango_cairo_error_underline_path" cairo-error-underline-path)
    :void
 #+liber-documentation
 "@version{#2021-1-9}
  @argument[cr]{a @symbol{cairo:context-t} context}
  @argument[x]{a double float x coordinate of one corner of the rectangle}
  @argument[y]{a double float < coordinate of one corner of the rectangle}
  @argument[width]{a double float non-negative width of the rectangle}
  @argument[height]{a double float non-negative height of the rectangle}
  @begin{short}
    Add a squiggly line to the current path in the specified Cairo context that
    approximately covers the given rectangle in the style of an underline used
    to indicate a spelling error.
  @end{short}
  The width of the underline is rounded to an integer number of up/down segments
  and the resulting rectangle is centered in the original rectangle.
  @see-symbol{cairo:context-t}"
  (cr (:pointer (:struct cairo:context-t)))
  (x :double)
  (y :double)
  (width :double)
  (height :double))

(export 'cairo-error-underline-path)

;;; --- End of file pango.cairo-rendering.lisp ---------------------------------
