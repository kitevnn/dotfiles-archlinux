;; ===============================================
;; 自定义 custom-defun.el
;; ===============================================


;; ===============================================
;; 切换主题
;; ===============================================
(defun custom-toggle-light-theme ()
  "切换主题到nano-light"
  (lambda () (interactive)    
    (load-theme     'nano-light t)))


;; ===============================================
;; 光标移动
;; ===============================================
(defun custom-move-next-five-lines ()
  "光标向下移动5行"
  (interactive)
  (next-line 5))
(defun custom-move-prev-five-lines ()
  "光标向上移动5行"
  (interactive)
  (previous-line 5))


;; ===============================================
;; 窗口移动
;; ===============================================
(defun custom-resize-top-five-unit ()
  "当前窗口向上5个单位"
  (interactive)
  (shrink-window 5))
(defun custom-resize-bottom-five-unit ()
  "当前窗口向下5个单位"
  (interactive)
  (enlarge-window 5))
(defun custom-resize-left-five-unit ()
  "当前窗口向左5个单位"
  (interactive)
  (shrink-window-horizontally 5))
(defun custom-resize-right-five-unit ()
  "当前窗口向右5个单位"
  (interactive)
  (enlarge-window-horizontally 5))


;; ===============================================
;; 软空格: 保证每次TAB都是2个字符宽度的整数倍单位
;; ===============================================
(defun custom-tab-stops-generate (&optional width max)
  "Return a sequence suitable for `tab-stop-list'."
  (let* ((max-column (or max 200))
         (tab-width (or width tab-width))
         (count (/ max-column tab-width)))
    (number-sequence tab-width (* tab-width count) tab-width)))
;; 软空格
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq tab-stop-list (custom-tab-stops-generate))


;; ===============================================
;; lisp相关
;; ===============================================
(defun custom-eval-elisp-sexp ()
  "C-cxe快速计算lisp式子，来源于emacs-tw"
  (interactive)
  (cond ((equal current-prefix-arg nil)      ;if no prefix
         (let ((OUTPUT (eval (preceding-sexp))))
           (kill-sexp -1)
           (insert (format "%S" OUTPUT))))
        ((equal current-prefix-arg '(4)) ;one C-u prefix
         (save-excursion
           (let ((OUTPUT (eval (preceding-sexp))))
             (insert (format "%s%S" " => " OUTPUT)))))))


;; ===============================================
;; 自动添加文本
;; ===============================================
(defun custom-my-org-add-latex-header ()
  (interactive)
  (goto-char (point-min))
  (insert "#+LATEX_HEADER: \\usepackage{amsmath}\n")
  (insert "#+LATEX_HEADER: \\usepackage{fontspec}\n")
  (insert "#+LATEX_HEADER: \\setsansfont{Noto Sans CJK TC}\n")
  (insert "#+LATEX_HEADER: \\setmainfont{Noto Serif CJK TC}\n")
  (insert "#+LATEX_HEADER: xelatex\n\n"))
(eval-after-load 'org
  '(define-key org-mode-map (kbd "C-c C-x C-f") 'custom-my-org-add-latex-header))


;; ===============================================
;; 编辑增强
;; from https://stackoverflow.com/a/998472
;; ===============================================
(defun custom-duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")  
  (setq buffer-undo-list (cons (point) buffer-undo-list))  ; save the point for undo
  (let ((bol (save-excursion (beginning-of-line) (point))) ; local variables for start and end of line
        eol)
    (save-excursion            
      (end-of-line)        ; don't use forward-line for this, because you would have
      (setq eol (point))   ; to check whether you are at the end of the buffer      
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))   ; store the line and disable the recording of undo information      
        (while (> count 0)          
          (newline)         ; because there is no newline in 'line'
          (insert line)     ; insert the line arg times
          (setq count (1- count))))      
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list))))  ; create the undo information  ; end-of-let      
  (next-line arg))  ; put the point in the lowest line and return


;; ===============================================
;; 在org-mode下避免valign-mode造成的卡顿问题
;; from chatGPT 4o
;; ===============================================
(defun custom-toggle-inline-images-with-valign ()
  (interactive)
  (if (bound-and-true-p valign-mode)
      (progn
        (valign-mode -1)
        (org-toggle-inline-images)
        (valign-mode 1))
    (org-toggle-inline-images)))


(provide 'custom-defun)
