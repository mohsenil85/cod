#|
  This file is a part of cod project.
|#

(in-package :cl-user)
(defpackage cod-test-asd
  (:use :cl :asdf))
(in-package :cod-test-asd)

(defsystem cod-test
  :author ""
  :license ""
  :depends-on (:cod
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cod"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
