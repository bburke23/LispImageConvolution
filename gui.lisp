(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")
(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/cl-jpeg-master/package")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/cl-jpeg-master/package")
(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/cl-jpeg-master/jpeg")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/cl-jpeg-master/jpeg")
(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/pixels")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/pixels")

(defun load-file (path BW R G B)
  (let (arr (JPEG:Decode-Image path))
    (setf arr (JPEG:Decode-Image path))
    (setf out (format nil "~{/~a~}" (cdr (pathname-directory path))))
    (if BW 
        (setf app "/BW-")
      (setf app "/RGB-"))
    (setf filename (concatenate 'string out app (first (last (pathname-directory (concatenate 'string path "/"))))))
    (princ filename)
    (if BW
        (rgbToGrayScale arr)
      (changeColor arr .5 .5 .5))
    (JPEG:Encode-Image filename arr 3 354 630)))

(defun createGUI()
  (LTK:with-ltk ()
       (let* ((f (make-instance 'LTK:frame
                 :height 500
                 :width 500))
              (e (make-instance 'ltk:entry
                 :master f))
              (mR (make-instance 'ltk:Message
                  :master f
                  :width 70
                  :text "R scale"))
              (mG (make-instance 'ltk:Message
                  :master f
                  :width 70
                  :text "G scale"))
              (mB (make-instance 'ltk:Message
                  :master f
                  :width 70
                  :text "B scale"))
              (eR (make-instance 'ltk:scale
                 :master f
                 :length 100))
              (eG (make-instance 'ltk:scale
                 :master f
                 :length 100))
              (eB (make-instance 'ltk:scale
                 :master f
                 :length 100))
              (m (make-instance 'ltk:Message
                  :master f
                  :width 500
                  :text "Enter absolute path to file and select filter you would like applied."))
              (r1 (make-instance 'ltk:check-button
                   :master f
                   :text "Convert to Black and White"))
              (alert (make-instance 'LTK:frame
                 :height 500
                 :width 500))
             (b (make-instance 'ltk:button
                 :master f
                 :text "Apply Filter"
                 :command (lambda ()
                            (if (ltk:value eR) 
                                (setf R (*(ltk:value eR) 2))
                              (setf R 0))
                            (if (ltk:value eG) 
                                (setf G (*(ltk:value eG) 2))
                              (setf G 0))
                            (if (ltk:value eB) 
                                (setf B (*(ltk:value eB) 2))
                              (setf B 0))
                            (load-file (ltk:text e) (ltk:value r1) R G B)
                            (ltk:pack alert)))))
      (ltk:pack f)
      (ltk:pack m :side :top)
      (ltk:pack e :side :left)
      (ltk:pack b :side :left)
      (ltk:pack r1 :side :bottom)
      (ltk:pack eB :side :bottom)
      (ltk:pack mB :side :bottom)
      (ltk:pack eG :side :bottom)
      (ltk:pack mG :side :bottom)
      (ltk:pack eR :side :bottom)
      (ltk:pack mR :side :bottom)
      (ltk:configure f :borderwidth 3)
      (ltk:configure f :relief :sunken))))

