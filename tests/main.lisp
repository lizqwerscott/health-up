(defpackage health-up/tests/main
  (:use :cl
        :health-up
        :rove))
(in-package :health-up/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :health-up)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
