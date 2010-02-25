(in-package :cl-freeimage)

(defmacro with-fi-image (var (format filename flags) &body body)
  "Runs ,@body with var bound to the result of (fi-load format filename flags) then
   unloads the image at the end."
  `(let ((,var (fi-load ,format ,filename ,flags)))
     (prog1
	 (progn ,@body)
       (fi-unload ,var))))