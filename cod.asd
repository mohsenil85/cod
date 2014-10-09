#|
  This file is a part of cod project.
|#

(in-package :cl-user)
(defpackage cod-asd
  (:use :cl :asdf))
(in-package :cod-asd)

(defsystem cod
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:tcod)
  :components ((:module "src"
                :components
                ((:file "cod"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cod-test))))
