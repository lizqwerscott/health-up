(defpackage up.head
  (:import-from :jonathan :to-json)
  (:use :cl :yason :str)
  (:export
   :to-json-a
   :assoc-value
   :load-line-file
   :split-s))

(in-package :up.head)

(setf yason:*parse-object-as* :alist)

(defun to-json-a (alist)
  (to-json alist :from :alist))

(defun assoc-value (plist key)
  (cdr (assoc key plist :test #'string=)))

(defun load-line-file (path)
  (let ((result))
    (with-open-file (in path :direction :input
                             :if-does-not-exist :error)
      (do ((line (read-line in nil 'eof)
                 (read-line in nil 'eof)))
          ((eql line 'eof) result)
        (push line result)))))

(defun split-s (str &optional (deleimiter " "))
  (split deleimiter str))
