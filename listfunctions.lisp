;;(defun $nest (f x n)
;;  (cond 
;;    ((like n 0) x)
;;    (t (mfuncall f ($nest f x (- n 1))))))

;; work on where to put simplification. or remove it.
(defun $fold (f x v)
  (cond
    ((eql ($length v) 1)
     (mfuncall f x (marrayref v 1)))
     (t (  mfuncall f (mfunction-call $fold f x ($rest v -1)) ($last v)))))

;; m -- maxima matrix
;; return - nested list
(defun $mat_to_list (m)
  (cons '(mlist simp) (rest m)))


