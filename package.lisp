(in-package :cl-user)

(defpackage #:cl-freeimage
  (:use #:common-lisp #:cffi)
  (:export #:fi-load
	   #:fi-unload
	   #:fi-get-width
	   #:fi-get-height
	   #:fi-get-line
	   #:fi-get-color-type
	   #:fi-get-scan-line

	   #:with-fi-image))