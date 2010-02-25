;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;;
;;; cl-matlab.asd - ASDF system definition for matlab bindings

(asdf:defsystem cl-freeimage
  :description "Bindings to Freeimage using CFFI."
  :author "Malcolm Reynolds <malcolm.reynolds@gmail.com>"
  :version "0.0.1"
  :licence "BSD"
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "bindings" :depends-on ("package"))
               (:file "macros" :depends-on ("package"))))