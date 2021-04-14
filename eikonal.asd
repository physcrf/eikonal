(defsystem :eikonal
  :description "eikonal"
  :version "0.1"
  :author "Chen Ruofan <physcrf@qq.com>"
  :licence "GPL"
  :depends-on (:alexandria  ;; https://common-lisp.net/project/alexandria/
;;	       :trivia      ;; https://github.com/guicho271828/trivia
;;	       :cffi        ;; https://common-lisp.net/project/cffi/
	       :cl-cffi-gtk ;; http://www.crategus.com/books/cl-gtk/gtk-tutorial.html
	       :eikonal/package
	       ))


(defsystem :eikonal/package
  :components ((:file "package")
	       (:file "exercise")))
		
