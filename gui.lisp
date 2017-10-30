(compile-file "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")
(load "/Users/jordanvega/Desktop/LISP/final/LispImageConvolution/ltk/ltk")

(defun createGUI()
  (LTK:with-ltk ()
       (let* ((f (make-instance 'LTK:frame
                 :height 500
                 :width 500))
              (e (make-instance 'ltk:entry
                 :master f))
              (b (make-instance 'ltk:button
                 :master f
                 :text "Apply Filter"
                 :command nil))
              (m (make-instance 'ltk:Message
                  :master f
                  :width 500
                  :text "Enter absolute path to file and select filter you would like applied."))
              (r1 (make-instance 'ltk:Radio-button
                   :master f
                   :text "Filter 1"))
              (r2 (make-instance 'ltk:Radio-button
                   :master f
                   :text "Filter 2"))
              (r3 (make-instance 'ltk:Radio-button
                   :master f
                   :text "Filter 3"))
              (r4 (make-instance 'ltk:Radio-button
                   :master f
                   :text "Filter 4"))
              (r5 (make-instance 'ltk:Radio-button
                   :master f
                   :text "Filter 5")))
      (ltk:pack f)
      (ltk:pack m :side :top)
      (ltk:pack e :side :left)
      (ltk:pack b :side :left)
      (ltk:pack r5 :side :bottom)
      (ltk:pack r4 :side :bottom)
      (ltk:pack r3 :side :bottom)
      (ltk:pack r2 :side :bottom)
      (ltk:pack r1 :side :bottom)
      (ltk:configure f :borderwidth 3)
      (ltk:configure f :relief :sunken))))