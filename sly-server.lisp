(push #p"./" asdf:*central-registry*)
(push #p"~/sly/" asdf:*central-registry*)
(push #p"~/sly/slynk/" asdf:*central-registry*)

(ql:quickload :water)
(asdf:require-system :slynk)

(slynk:create-server :dont-close t)
