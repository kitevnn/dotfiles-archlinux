;; 打开1个叫 *scratch* 的页面
(defun create-scratch-window ()
  "create-scratch-window."
  (lambda () (interactive)
    (switch-to-buffer scratch)))

;; 光标向下移动5行的elisp函数
(defun move-next-five-line ()
  (interactive)
  (next-line 5))

;; 光标向上移动5行的elisp函数
(defun move-prev-five-line ()
  (interactive)
  (previous-line 5))

(provide 'defun-for-fun)
