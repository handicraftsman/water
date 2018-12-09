(defsystem "water"
  :description "An ES6-compatible class definition for Parenscript"
  :version "0.1.0"
  :author "Nickolay (handicraftsman) Ilyushin <nickolay02@inbox.ru>"
  :license "MIT"
  :depends-on (:parenscript)
  :components ((:file "packages")
               (:file "water" :depends-on ("packages"))))
