;;
;; define batchtest, a quieter version of batch

(in-package :maxima)

;; $batchtest is a copy of $batch modified to accept another value of the optional
;; argument, :quiettest. :quiettest is also the default value.
;; The effect of :quiettest to display only failed tests.
(defun $batchtest (filename &optional (demo :quiettest)
	       &aux tem   (possible '(:demo :batch :test :quiettest)))
  "giving a second argument makes it use demo mode, ie pause after evaluation
   of each command line"
  (cond ((setq tem (member ($mkey demo) possible :test #'eq))
	 (setq demo (car tem)))
	(t (format t (intl:gettext "batch: second argument must be 'demo', 'batch', 'test', or 'quiettest'; found: ~A, assumed 'batch'~%") demo)))

  (setq filename ($file_search1 filename
				(if (eql demo :demo)
				    '((mlist) $file_search_demo )
				    '((mlist) $file_search_maxima ))))
  (cond ((eq demo :test)
	 (test-batch filename nil :show-all t))
        ((eq demo :quiettest)
         (test-batch filename nil :show-all nil))
	(t
	 (let (($load_pathname filename) (*read-base* 10.))
	   (with-open-file (in-stream filename)
	     (format t (intl:gettext "~%read and interpret file: ~A~%")
		     (truename in-stream))
	     (catch 'macsyma-quit (continue in-stream demo))
	     (namestring in-stream))))))
