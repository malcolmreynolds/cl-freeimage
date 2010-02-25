(in-package :cl-freeimage)

(use-package :cffi)

(define-foreign-library freeimage
  (:darwin "libfreeimage.3.dylib"))
(use-foreign-library freeimage)

(defctype fi-bitmap-p :pointer
  "FIBITMAP* - used in most freeimage calls")

;;enums
(defcenum free-image-format
  (:fif-unknown -1)
  (:fif-bmp 0)
  (:fif-ico 1)
  (:fif-jpeg 2)
  (:fif-jng 3)
  (:fif-koala 4)
  (:fif-lbm 5)
  (:fif-iff 5)
  (:fif-mng 6)
  (:fif-pbm 7)
  (:fif-pbmraw 8)
  (:fif-pcd 9)
  (:fif-pcx 10)
  (:fif-pgm 11)
  (:fif-pgmraw 12)
  (:fif-png 13))
;; FI_ENUM(FREE_IMAGE_FORMAT) {
;; 	FIF_UNKNOWN = -1,
;; 	FIF_BMP		= 0,
;; 	FIF_ICO		= 1,
;; 	FIF_JPEG	= 2,
;; 	FIF_JNG		= 3,
;; 	FIF_KOALA	= 4,
;; 	FIF_LBM		= 5,
;; 	FIF_IFF = FIF_LBM,
;; 	FIF_MNG		= 6,
;; 	FIF_PBM		= 7,
;; 	FIF_PBMRAW	= 8,
;; 	FIF_PCD		= 9,
;; 	FIF_PCX		= 10,
;; 	FIF_PGM		= 11,
;; 	FIF_PGMRAW	= 12,
;; 	FIF_PNG		= 13,
;; 	FIF_PPM		= 14,
;; 	FIF_PPMRAW	= 15,
;; 	FIF_RAS		= 16,
;; 	FIF_TARGA	= 17,
;; 	FIF_TIFF	= 18,
;; 	FIF_WBMP	= 19,
;; 	FIF_PSD		= 20,
;; 	FIF_CUT		= 21,
;; 	FIF_XBM		= 22,
;; 	FIF_XPM		= 23,
;; 	FIF_DDS		= 24,
;; 	FIF_GIF     = 25,
;; 	FIF_HDR		= 26,
;; 	FIF_FAXG3	= 27,
;; 	FIF_SGI		= 28,
;; 	FIF_EXR		= 29,
;; 	FIF_J2K		= 30,
;; 	FIF_JP2		= 31,
;; 	FIF_PFM		= 32,
;; 	FIF_PICT	= 33,
;; 	FIF_RAW		= 34
;; };

(defcenum free-image-color-type
  (:fic-miniswhite 0)
  (:fic-minisblack 1)
  (:fic-rgb 2)
  (:fic-palette 3)
  (:fic-rgbalpha 4)
  (:fic-cmyk 5))

(defcenum free-image-pixel-order
  (:fi-rgba-red 0)
  (:fi-rgba-green 1)
  (:fi-rgba-blue 2)
  (:fi-rgba-alpha 3))

(defcfun ("FreeImage_Load" fi-load) fi-bitmap-p
  "Loads an image using FreeImage"
  (format free-image-format)
  (filename :string)
  (flags :int))

(defcfun ("FreeImage_Unload" fi-unload) :void
  "Deletes a previously loaded FIBITMAP from memory."
  (bitmap fi-bitmap-p))

(defcfun ("FreeImage_GetWidth" fi-get-width) :unsigned-int
  "Gets with width of an image"
  (image fi-bitmap-p))

(defcfun ("FreeImage_GetHeight" fi-get-height) :unsigned-int
  "Gets the height of an image"
  (image fi-bitmap-p))

(defcfun ("FreeImage_GetLine" fi-get-line) :unsigned-int
  "Width of the bitmap in bytes"
  (image fi-bitmap-p))

(defcfun ("FreeImage_GetBPP" fi-get-bpp) :unsigned-int
  "BPP of the image"
  (image fi-bitmap-p))

(defcfun ("FreeImage_GetColorType" fi-get-color-type) free-image-color-type
  "Color type of the image"
  (image fi-bitmap-p))

(defcfun ("FreeImage_GetScanLine" fi-get-scan-line) (:pointer :unsigned-char)
  "Returns pointer to teh start of the given scanline in the bitmap's data bits"
  (image fi-bitmap-p)
  (scanline :int))

