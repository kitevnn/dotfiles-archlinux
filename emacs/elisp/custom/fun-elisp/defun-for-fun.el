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

;; emacs-tw
;;     > 教程书推荐的C-C C-x C-e执行buffer的格式化输出
;;     > Makes eval elisp sexp more convenient
;;            > 因為覺得內建的 eval 快速鍵要拿來作其他用途有點不方便（例如拿來當作臨時的計算機），所以我自己是另外弄了設定讓他更方便：
;;            > C-c C-x C-e(cxe)         :  Eval 目前的 sexp，輸出其 eval 結果後，直接自動刪除該 sexp。
;;            > C-u C-c C-x C-e(ucxe)    :  加上一個 C-u prefix 就是先按 C-u 再按 key-binding 的話，不刪除 sexp，而且會先插入一個箭頭 ==> 再插入 eval 結果。例如 (+ 1 5) => 6 。
(defun eval-elisp-sexp ()
  "Eval Elisp code at the point, and remove current s-exp
With one `C-u' prefix, insert output following an arrow"
  (interactive)
  (cond ((equal current-prefix-arg nil)      ;if no prefix
         (let ((OUTPUT (eval (preceding-sexp))))
           (kill-sexp -1)
           (insert (format "%S" OUTPUT))))
        ((equal current-prefix-arg '(4)) ;one C-u prefix
         (save-excursion
           (let ((OUTPUT (eval (preceding-sexp))))
             (insert (format "%s%S" " => " OUTPUT)))))))

(global-set-key (kbd "C-c C-x C-e") 'eval-elisp-sexp)
;; avoid key-binding conflict with org
;;     > 由于我自己org-mode懒加载了，所以设置这个配置会出错。(解决做法: 要想在org-mode里也可以这样eval-buffer的格式化输出，最好还是 [不懒加载org-mode])
;; (define-key org-mode-map (kbd "C-c C-x C-e") 'org-clock-modify-effort-estimate)

(provide 'defun-for-fun)
