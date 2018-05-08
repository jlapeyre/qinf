;; flip a qubit
(defun $flip (x) (mod (+ x 1) 2))

;; create a two qubit schmidt ket
(defun $schmidt_ket (a) (add* (mul* (power a (div* 1 2)) (mfuncall '$ketz 0 0) )
                               (mul* (power (sub* 1 a) (div* 1 2)) (mfuncall '$ketz 1 1) )))

;; purity
(defun $purity (rho) (mfuncall '$mat_trace (ncmul2 rho rho)))

;; identitiymatrixp
(defun $identitymatrixp (a) (mfuncall '$zeromatrixp (add* a (*mminus ($ident ($length a))))))

;; this helper function could be elimintated
;(defun add-digit (val posn base)
;  (* val (power base posn)))

(defun $ptrace_numeration_to_int (vec b)
  ( let ( (res 0))
    ( dotimes ( i (- (length vec) 1 ) res)
      (setf res (+ res (* (marrayref vec (+ i 1)) (power b i)))))))

(defun $ptrace_increment_numeration (vec b)
  (loop for i from 1 to (+ (length vec) -1)  do
	(marrayset (+ 1 (marrayref vec i)) vec i)
	(if (= (marrayref vec i) b)
	    (loop for j from 1 to i do
		  (marrayset 0 vec j))
	  (return))))

(defun $commutator (a b)
  (add* (ncmul2 a b) (*mminus (ncmul2 b a))))

(defun $anticommutator (a b)
  (add* (ncmul2 a b) (ncmul2 b a)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Following are functions for playing around
;;
;; transpose lisp matrix [ that is ( ( a b ) ( c d ) )

(defun transpose (x)
   (apply #'mapcar (cons #'list x)))

;;  These two transformations use undocumented lisp fncs from the source
;; they transform between lisp style matrix and maxima matrix
(defun mxc1 (x)
  (cons '($matrix) (mxc x)))

; cant overwrite the builtin ones
;(defun mxc1 (x)
;  (mapcar #'(lambda (y) (cons '(mlist) y)) x)) ; Matrix to MACSYMA conversion

; macsyma matrix to matrix	
(defun mcx1 (x)
  (mcx (cdr x)))

;(defun mcx1 (x)
;  (mapcar #'cdr x))

; lst-to-mx
(defun  lst-to-mx (x)
  (cons '(mlist simp) x))

(defun  mx-to-lst (x)
  (cdr x))

(defun $mident (x)
  (lst-to-mx ( mx-to-lst x)))



;; as an example, this will transpose a matrix
(defun $mymattrans (m) 
  (mxc1 (transpose ( mcx1 m))))

;(defun $mentropy (rho)
;  (let ( (x) (evs) (sum 0))
;    (setf evs (mfunction-call $eivals rho))
    

; work on this one
;(defun $myptrace (b A q) 
;  (let ((nB 2))
;    ( $zeromatrix 2 2)))


