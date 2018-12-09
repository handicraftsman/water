(in-package :water)

(defpsmacro defwclass (name &rest b)
  "Define a new class. To inherit another class, invoke wsuper or wsuperlst macro as the first expression in the body"
  `(defvar ,name
     (lambda ()
       ,@b
       (when (@ this ctor)
         (chain this (ctor arguments)))
       this)))

(defpsmacro defwctor (args &rest b)
  "Define a class constructor. Should be used inside of a defwclass body"
  `(setf (@ this ctor)
         (lambda (,@args)
           ,@b
           this)))

(defpsmacro defwmethod (name args &rest b)
  "Define a class method. Should be used inside of a defwclass body"
  `(progn
     (setf (@ this ,name)
           (lambda (,@args)
             ,@b))
     (setf (@ this ,name)
           (chain this ,name (bind this)))))

(defpsmacro defwsmethod (cl name args &rest b)
  "Define a static method. Should be used outside of a defwclass body"
  `(setf (@ ,cl ,name)
         (lambda (,@args)
           ,@b)))

(defpsmacro wsuper (parent &rest args)
  "Call the superclass constructor inheriting the aforementioned class. Should be used as a first statement in a defwclass body (if used)"
  `(chain ,parent (call this ,@args)))

(defpsmacro wsuperlst (parent lst)
  "Same as wsuper, but accepts a single argument - a list of arguments passed to the superclass constructor"
  `(chain ,parent (apply this ,lst)))
