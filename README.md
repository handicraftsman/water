# Water

An ES6-compatible class definition for ParenScript.

## Using

This library exports macros which can be used to create an es6-compatible class.

```lisp
(push #p"./" asdf:*central-registry*)

(ql:quickload :parenscript)
(ql:quickload :cl-who)
(ql:quickload :hunchentoot)
(ql:quickload :water)

(defpackage :water-test
  (:use :cl :ps :cl-who :water))
(in-package :water-test)

(hunchentoot:define-easy-handler (index-page :uri "/") ()
  (with-html-output-to-string (s)
    (:html
     (:head
      (:script :crossorigin t :src "https://unpkg.com/react@16/umd/react.development.js")
      (:script :crossorigin t :src "https://unpkg.com/react-dom@16/umd/react-dom.development.js"))
     (:body
      (:div :id "demo")
      (:script
       (ps-to-stream s
         (defwclass *demo
           (wsuperlst (@ *react *component) arguments)
           (defwmethod render ()
             ((@ *react create-element) "p" () (list "Hello, World!"))))
         (chain *react-d-o-m (render
                              (chain *react (create-element *demo () (list)))
                              (chain document (get-element-by-id "demo"))))))))))

(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 6789))
```

## API

I guess library's code is small enough to be self-documenting.
Although i added some docstrings to all macros i defined.
You can find them in the water.lisp file.