(in-package :cl-user)
(ql:quickload "tcod")
(defpackage cod
  (:use :cl
        :tcod))
(in-package :cod)

(defparameter *width* 100)
(defparameter *x* 50)
(defparameter *y* 30)
(defparameter *height* 80)
(defparameter *fps-limit* 20)

(defparameter *running* t)

(defvar *font* #P"/home/lmohseni/builds/libtcod-1.5.1/data/fonts/arial10x10.png")

(defun main ()
  (tcod:console-set-custom-font *font* '(:font-type-greyscale :font-layout-tcod))
  (tcod:console-init-root *width* *height*
                          :title "my cool tcod" 
                          :fullscreen? nil
                          :renderer :renderer-sdl)
  (loop
    while *running*
    do
       (tcod::console-clear tcod:*root*) 
       (tcod::console-put-char tcod:*root* 
                               *x*
                               *y*
                               (char-code #\@)
                               :set)
       (tcod::console-flush)
       (let ((events (tcod:sys-get-events)))
         (loop for e in events
         do
            (format t "~A~%" e)
            (case (car e)
              (:event-key-release (incf *x*))
              (:event-key (incf *y*))
              (:event-mouse-press (setf *running* nil)))))))

(defun rerun ()
  (setf *running* t)
  (main))

(defun quit ()
  (setf *running* nil))

(main)
(rerun)
(quit)

