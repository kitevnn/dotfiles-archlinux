;; 
;; init-keyutils: 快捷键的utils(此处可收集缝合别人的elisp函数的收集处)
;; 

;; 用一个新的emacs，打开一个叫untitled的buffer
(defun a-custom-create-new-buffer-frame-A ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

;; 用一个新的emacs，打开一个叫untitled的buffer
(defun a-custom-create-new-buffer-frame-B ()
  "Open a new frame with a buffer named untitled<N>.

The buffer is not associated with a file."
  (interactive)
  (switch-to-buffer-other-frame (generate-new-buffer "untitled")))

(provide 'init-keyutils)
