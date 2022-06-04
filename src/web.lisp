(defpackage up.web
  (:use :cl :quri :yason :babel :up.head)
  (:export
   :web-get
   :web-post-json))

(in-package :up.web)

(defun generate-url (host command)
  (format nil "http://~A/~A" host command))

(defun make-url (host command args)
  (make-uri :defaults (generate-url host command)
            :query args))

(defun web-get (host command &key args (jsonp nil))
  (let ((text (dex:get (make-url host command args))))
    (if jsonp
        (parse text)
        text)))

(defun web-post-json (host command &key args (jsonp t) (isbyte t))
  (let ((result (dex:post (generate-url host command)
                          :content (if isbyte
                                       (string-to-octets (to-json-a args))
                                       (to-json-a args))
                          :headers '(("content-type" . "application/json; charset=utf-8")))))
    (if jsonp
        (parse result)
        result)))
