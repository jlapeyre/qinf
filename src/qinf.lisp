;; flip a qubit
(defun $flip (x) (mod (+ x 1) 2))

;; create a two qubit schmidt ket
(defun $schmidt_ket (a) (add* (mul* (power a (div* 1 2)) (mfuncall '$ketz 0 0) )
                               (mul* (power (sub* 1 a) (div* 1 2)) (mfuncall '$ketz 1 1) )))

;; purity
(defun $purity (rho) (mfuncall '$mat_trace (ncmul2 rho rho)))

;; identitiymatrixp
(defun $identitymatrixp (a) (mfuncall '$zeromatrixp (add* a (*mminus ($ident ($length a))))))

;; Return integer value from vector (or list) of numeration.
;; vec -- vector of numerals.
;; b   --  the base.
;; bits are arranged here from least to most significant
;; left to right.
;; the same as fromdigits, but the order of digits is reversed. This situation
;; should be rationalized and a generically named function should be used
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

;; Following are functions for playing around
;;
;; transpose lisp matrix [ that is ( ( a b ) ( c d ) )

(defun transpose (x)
   (apply #'mapcar (cons #'list x)))

;; These two transformations use undocumented lisp fncs from the source
;; they transform between lisp style matrix and maxima matrix
(defun mxc1 (x)
  (cons '($matrix) (mxc x)))

; macsyma matrix to matrix
(defun mcx1 (x)
  (mcx (cdr x)))

; lst-to-mx
(defun  lst-to-mx (x)
  (cons '(mlist simp) x))

(defun  mx-to-lst (x)
  (cdr x))

(defun $mident (x)
  (lst-to-mx ( mx-to-lst x)))

;; As an example, this will transpose a matrix
(defun $mymattrans (m)
  (mxc1 (transpose ( mcx1 m))))
