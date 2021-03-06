(in-package :v)

(defun x (v)
  (aref v 0))

(defun y (v)
  (aref v 1))

(defun z (v)
  (aref v 2))

(defun add (v1 v2)
  "Sums two vectors"
  (vector
   (+ (x v1) (x v2))
   (+ (y v1) (y v2))
   (+ (z v1) (z v2))))

(defun sub (v1 v2)
  "Subtracts one vector from another"
  (vector 
   (- (x v1) (x v2))
   (- (y v1) (y v2))
   (- (z v1) (z v2))))

(defun mul-num (vect num)
  (vector (* num (x vect))
	  (* num (y vect))
	  (* num (z vect))))

(defun mag (vec)
  "Returns vector magnitude"
  (sqrt 
   (reduce (lambda (c x)
	     (+ c (* x x)))
	   vec
	   :initial-value 0.0)))

(defun normalize (vec)
  "Returns normalized vector"
  (let ((len (mag vec)))
    (if (= len 0.0)
	(make-array (length vec) :initial-element 0.0)
	(map 'vector 
	     (lambda (x)
	       (/ x len))
	     vec))))
		   	
(defun cross (a b)
  "Computes cross product of two vectors"
  (let ((a-x (x a))
	(a-y (y a))
	(a-z (z a))
	
	(b-x (x b))
	(b-y (y b))
	(b-z (z b)))
    (make-array 3 
		:initial-contents
		(list (- (* a-y b-z) (* b-y a-z))
		      (- (* a-z b-x) (* b-z a-x))
		      (- (* a-x b-y) (* b-x a-y))))))
