(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")

(defun createGUI()
  (LTK:with-ltk ()
            (let ((b (make-instance 'LTK:button
                                    :master nil
                                    :text "Press me"
                                    :command (lambda () 
                                               (format t "Hello World!~&")))))
  (LTK:pack b))))
