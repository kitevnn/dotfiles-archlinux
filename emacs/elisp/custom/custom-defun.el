;; =======================================
;; 自定义 custom-defun.el
;; =======================================

;; =======================================
;; 切换主题
;; =======================================
(defun custom-toggle-light-theme ()
  "切换主题到nano-light"
  (lambda () (interactive)    
    (load-theme     'nano-light t)))


;; =======================================
;; 光标移动
;; =======================================
(defun custom-move-next-five-lines ()
  "光标向下移动5行"
  (interactive)
  (next-line 5))
(defun custom-move-prev-five-lines ()
  "光标向上移动5行"
  (interactive)
  (previous-line 5))


;; =======================================
;; 窗口移动
;; =======================================
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


;; =======================================
;; 软空格: 保证每次TAB都是2个字符宽度的整数倍单位
;; =======================================
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


;; =======================================
;; lisp相关
;; =======================================
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


;; =======================================
;; 自动添加文本
;; =======================================
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


;; =======================================
;; 编辑增强
;; from https://stackoverflow.com/a/998472
;; =======================================
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


;; =======================================
;; 在org-mode下避免valign-mode造成的卡顿问题
;; from chatGPT 4o
;; =======================================
(defun custom-toggle-inline-images-with-valign ()
  (interactive)
  (if (bound-and-true-p valign-mode)
      (progn
        (valign-mode -1)
        (org-toggle-inline-images)
        (valign-mode 1))
    (org-toggle-inline-images)))


;; =======================================
;; 重量级更新: 解耦org-cycle与cdlatex-tab的快捷键
;; from chatGPT 4o
;; =======================================
(defun custom-org-table-with-cdlatex ()
  (when (and (derived-mode-p 'org-mode) (not (minibufferp)))
  (if (org-at-table-p)
      (progn
        (local-set-key (kbd "TAB")     'cdlatex-tab)
        (local-set-key (kbd "C-l")     'org-table-next-field))
      (local-set-key (kbd "TAB")       'org-cycle))))


;; =======================================
;; 关于PDFView
;; =======================================
(defun custom-move-prev-ten-pages ()
  "pdf向上翻10页"
  (interactive)
  (pdf-view-previous-page-command 10))
(defun custom-move-next-ten-pages ()
  "pdf向下翻10页"
  (interactive)
  (pdf-view-next-page-command 10))
(defun custom-pdf-view-mode-hook-with-yas ()
  "禁用 yasnippet"
  (yas-minor-mode -1))


;; =======================================
;; 关于eshell
;; =======================================
(defun custom-eshell-prompt ()
    "设置eshell的prompt的前景色"
    (interactive)
    (set-face-attribute 'eshell-prompt nil :foreground "#673ab7"))
(defun custom-eshell-withcentaur-tabs-mode ()
    (local-set-key (kbd "M--")     'custom-move-prev-five-lines)         ; 在eshell向上移动5行            
    (local-set-key (kbd "M-=")     'custom-move-next-five-lines)         ; 在eshell向下移动5行
    (local-set-key (kbd "M-l")     'eshell/clear)                        ; 清空 eshell
    (local-set-key (kbd "M-j")     'eshell-list-history)                 ; 展开历史命令
    (local-set-key (kbd "C-c C-j") 'corfu-mode))                         ; 手动关闭corfu
(defun custom-eshell-mode-hook ()
  (custom-eshell-prompt)
  (custom-eshell-withcentaur-tabs-mode)
  (message "Window configuration changed!"))


;; =======================================
;; 关于eaf
;; =======================================
(defun custom-eaf-open-browser-homepage ()
  "打开鸭鸭冲"
  (interactive)
  (eaf-open-browser "https://duckduckgo.com"))
(defun custom-eaf-open-browser-soundcloud ()
  "打开声云"
  (interactive)
  (eaf-open-browser "https://soundcloud.com/"))
(defun custom-eaf-open-browser-bilibili ()
  "打开B站"
  (interactive)
  (eaf-open-browser "https://www.bilibili.com"))
(defun custom-eaf-open-browser-github ()
  "打开github"
  (interactive)
  (eaf-open-browser "https://github.com"))
(defun custom-eaf-open-browser-emacs-china ()
  "打开emacs-china"
  (interactive)
  (eaf-open-browser "https://emacs-china.org"))
(defun custom-eaf-open-browser-pan ()
  "打开度盘"
  (interactive)
  (eaf-open-browser "https://pan.baidu.com/"))
(defun custom-eaf-open-browser-org-roam ()
  "打开本地ORUI"
  (interactive)
  (eaf-open-browser "http://localhost:35901"))
(defun custom-eaf-open-browser-proxy ()
  "打开本地代理"
  (interactive)
  (eaf-open-browser "http://localhost:2017"))
(defun custom-eaf-open-browser-chatgpt ()
  "打开chatGPT"
  (interactive)
  (eaf-open-browser "https://chatgpt.com"))
(defun custom-eaf-open-browser-command ()
  (interactive)
  (let ((input (read-string "Input command: " "custom-eaf-open-browser-")))
    (if (string-prefix-p "custom-eaf-open-browser-" input)
        (call-interactively (intern input))
      (message "Invalid command"))))


;; =======================================
;; 关于theme
;; =======================================
(defun custom-load-theme-light ()
  "切换为亮色light主题"
  (interactive)
  (disable-theme 'bliss)
  (load-theme 'nano-light)
  (set-face-attribute 'vertico-current nil :background "#b5ffd1")
  (set-face-attribute 'tab-line nil :background "#ffffff")
  (with-eval-after-load 'telega
    (set-face-attribute 'telega-msg-heading nil :background "#ffffff"))
  (set-face-attribute 'help-key-binding nil
                      :height 90
                      :box nil
                      :foreground "#673ab7"
                      :background "#ffffff")    
  (set-face-attribute 'rime-candidate-num-face nil
                      :height 90                    
                      :foreground "#90a4ae")
  (set-face-attribute 'rime-code-face nil
                      :height 90                    
                      :background "#90a4ae"
                      :foreground "#eceff1")
  (set-face-attribute 'rime-comment-face nil
                      :height 90
                      :foreground "#374f4f")
  (set-face-attribute 'rime-cursor-face nil
                      :height 90
                      :foreground "#ffffff"
                      :background "#37474f")
  (set-face-attribute 'rime-default-face nil
                      :height 90
                      :foreground "#37474f"
                      :background "#ffffff")
  (set-face-attribute 'rime-highlight-candidate-face nil
                      :height 90                    
                      :foreground "#673ab7")
  (set-face-attribute 'rime-indicator-dim-face nil
                      :height 90                                        
                      :foreground "#37474f")
  (set-face-attribute 'rime-preedit-face nil
                      :height 90                    
                      :foreground "#ffffff"
                      :background "#90a4ae")
  (setq dashboard-startup-banner "/home/une/.wallpaper/dashboard-zoom-out-light.png")
  (dashboard-refresh-buffer)
  (with-eval-after-load 'corfu
    (set-face-attribute 'corfu-default nil :background "#ffffff")
    (set-face-attribute 'corfu-border nil :background "#37474f")
    (set-face-attribute 'corfu-current nil :background "#cfd8dc" :foreground "#37474f")))
(defun custom-load-theme-dark ()
  "切换为暗色dark主题"
  (interactive)
  (disable-theme 'nano-light)
  (load-theme 'bliss)
  (set-face-attribute 'vertico-current nil :background "#31343e")
  (set-face-attribute 'tab-line nil :background "#191919")
  (with-eval-after-load 'telega
    (set-face-attribute 'telega-msg-heading nil :background "#191919"))
  (set-face-attribute 'help-key-binding nil
                      :height 90
                      :box nil
                      :foreground "#64fbc8"
                      :background "#191919")  
  (set-face-attribute 'rime-candidate-num-face nil
                      :height 90
                      :foreground "#c5c8c6")
  (set-face-attribute 'rime-code-face nil
                      :height 90
                      :background "#444444"
                      :foreground "#64fbc8")
  (set-face-attribute 'rime-comment-face nil
                      :height 90
                      :foreground "#c5c8c6")
  (set-face-attribute 'rime-cursor-face nil
                      :height 90
                      :foreground "#b5ffd1")
  (set-face-attribute 'rime-default-face nil
                      :height 90
                      :foreground "#64fbc8"
                      :background "#191919")
  (set-face-attribute 'rime-highlight-candidate-face nil
                      :height 90
                                        ; ffea00
                                        ; f6eb61
                                        ; ffd700
                      :foreground "#ffc300")  
  (set-face-attribute 'rime-indicator-dim-face nil
                      :height 90
                      :foreground "#c5c8c6")
  (set-face-attribute 'rime-preedit-face nil
                      :height 90
                      :background "#444444"
                      :foreground "#64fbc8")
  (setq dashboard-startup-banner "/home/une/.wallpaper/dashboard-zoom-out-dark.png")
  (dashboard-refresh-buffer)
  (with-eval-after-load 'corfu
    (set-face-attribute 'corfu-default nil :background "#673ab7")
    (set-face-attribute 'corfu-border nil :background "#37474f")
    (set-face-attribute 'corfu-current nil :background "#6a0c9a" :foreground "#64fbc8")))


(provide 'custom-defun)
