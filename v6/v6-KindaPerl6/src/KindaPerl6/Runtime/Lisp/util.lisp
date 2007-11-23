(in-package #:kp6-lisp)

(declaim (inline defined))
(defun defined (object)
  "Test OBJECT for definedness.  Returns T if OBJECT is non-NIL, NIL otherwise."
  (not (null object)))

(defun ensure-list (object)
  (if (listp object) object (list object)))

;;; WITH-UNIQUE-NAMES and related macros from CL-UTILITIES
(defmacro with-unique-names ((&rest bindings) &body body)
  "Executes a series of forms with each var bound to a fresh,
uninterned symbol. See http://www.cliki.net/WITH-UNIQUE-NAMES"
  `(let ,(mapcar #'(lambda (binding)
                     (multiple-value-bind (var prefix)
			 (%with-unique-names-binding-parts binding)
		       (check-type var symbol)
		       `(,var (gensym ,(format nil "~A"
					       (or prefix var))))))
                 bindings)
    ,@body))

(defun %with-unique-names-binding-parts (binding)
  "Return (values var prefix) from a WITH-UNIQUE-NAMES binding
form. If PREFIX is not given in the binding, NIL is returned to
indicate that the default should be used."
  (if (consp binding)
      (values (first binding) (second binding))
      (values binding nil)))

;; AUTHORS
;;
;; The Pugs Team perl6-compiler@perl.org.
;;
;; SEE ALSO
;;
;; The Perl 6 homepage at http://dev.perl.org/perl6.
;;
;; The Pugs homepage at http://pugscode.org/.
;;
;; COPYRIGHT
;;
;; Copyright 2007 by Flavio Soibelmann Glock and others.
;;
;; This program is free software; you can redistribute it and/or modify it
;; under the same terms as Perl itself.
;;
;; See http://www.perl.com/perl/misc/Artistic.html
