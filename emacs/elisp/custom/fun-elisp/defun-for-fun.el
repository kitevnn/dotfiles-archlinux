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

;; 软空格: 保证每次TAB都是2个字符宽度的整数倍单位
(defun tab-stops-generate (&optional width max)
  "Return a sequence suitable for `tab-stop-list'."
  (let* ((max-column (or max 200))
         (tab-width (or width tab-width))
         (count (/ max-column tab-width)))
    (number-sequence tab-width (* tab-width count) tab-width)))

(provide 'defun-for-fun)
