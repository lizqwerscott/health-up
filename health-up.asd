(defsystem "health-up"
  :version "0.1.0"
  :author "Lizqwer scott"
  :license ""
  :depends-on ("dexador"
               "bordeaux-threads"
               "quri"
               "yason"
               "jonathan"
               "str"
               "patron")
  :components ((:module "src"
                :components
                ((:file "head")
                 (:file "web")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "health-up/tests"))))

(defsystem "health-up/tests"
  :author "Lizqwer scott"
  :license ""
  :depends-on ("health-up"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for health-up"
  :perform (test-op (op c) (symbol-call :rove :run c)))
