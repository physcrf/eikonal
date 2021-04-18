(in-package :eikonal)

(defun example-simple-window ()
  (within-main-loop
    (let ((window (gtk-window-new :toplevel)))
      (g-signal-connect window "destroy"
                        (lambda (widget)
                          (declare (ignore widget))
                          (leave-gtk-main)))
      (gtk-widget-show-all window))))

(defun example-getting-started ()
  (within-main-loop
    (let ((window (make-instance 'gtk-window
				 :type :toplevel
				 :title "Getting started"
				 :default-width 250)))
      (g-signal-connect window "destroy" (lambda (widget)
					   (declare (ignore widget))
					   (leave-gtk-main)))
      (gtk-widget-show-all window))))
			

(defun example-hello-world ()
  (within-main-loop
    (let ((window (make-instance 'gtk-window
				 :type :toplevel
				 :title "Hello World"
				 :default-width 250
				 :border-width 12))
	  (button (make-instance 'gtk-button :label "Hello World")))
      (g-signal-connect button "clicked" (lambda (widget)
					   (declare (ignore widget))
					   (format t "Hello World~%")
					   (gtk-widget-destroy window)))
      (g-signal-connect window "destroy" (lambda (widget)
					   (declare (ignore widget))
					   (leave-gtk-main)))
      (g-signal-connect window "delete-event" (lambda (widget event)
						(declare (ignore widget event))
						(format t "Delete Event Occured~%")
						+gdk-event-stop+))
      (gtk-container-add window button)
      (gtk-widget-show-all window))))
							
			
(defun example-upgraded-hello-world ()
  (within-main-loop
    (let ((window (gtk-window-new :toplevel))
	  (box (gtk-box-new :horizontal 6))
	  (button nil))
      (g-signal-connect window "destroy" (lambda (widget)
					   (declare (ignore widget))
					   (leave-gtk-main)))
      (setf (gtk-window-title window) "Hello Buttons")
      (setf (gtk-window-default-size window) '(250 75))
      (setf (gtk-container-border-width window) 12)
      (setf button (gtk-button-new-with-label "Button 1"))
      (g-signal-connect button "clicked" (lambda (widget)
					   (declare (ignore widget))
					   (format t "Button 1 was pressed.~%")))
      (gtk-box-pack-start box button :expand t :fill t :padding 0)
      (setf button (gtk-button-new-with-label "Button 2"))
      (g-signal-connect button "clicked" (lambda (widget)
					   (declare (ignore widget))
					   (format t "Button 2 was pressed.~%")))
      (gtk-box-pack-start box button :expand t :fill t :padding 0)
      (gtk-container-add window box)
      (gtk-widget-show-all window))))
			
