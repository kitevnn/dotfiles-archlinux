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
;; 自动添加文本
;; =======================================
(defun custom-org-add-latex-header ()
  "在org-mode里添加可能需要的LaTeX Header来成功导出pdf文档"
  (interactive)
  (goto-char (point-min))
  (insert "#+LATEX_HEADER: \\usepackage[usenames]{color}\n")
  (insert "#+LATEX_HEADER: \\usepackage{amsmath}\n")
  (insert "#+LATEX_HEADER: \\usepackage{esint}\n")
  (insert "#+LATEX_HEADER: \\usepackage{fontspec}\n")
  (insert "#+LATEX_HEADER: \\setsansfont{Noto Sans CJK TC}\n")
  (insert "#+LATEX_HEADER: \\setmainfont{Noto Serif CJK TC}\n")
  (insert "#+LATEX_HEADER: xelatex\n\n"))
(eval-after-load 'org
  '(define-key org-mode-map (kbd "C-z C-x C-e") 'custom-org-add-latex-header))


;; =======================================
;; 编辑增强
;; from https://stackoverflow.com/a/998472
;; =======================================
(defun custom-duplicate-line (arg)
  "重复上一行，并保持光标在原位置不变"
  (interactive "*p")  
  (setq buffer-undo-list (cons (point) buffer-undo-list))
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion            
      (end-of-line)
      (setq eol (point))
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        (while (> count 0)          
          (newline)
          (insert line)
          (setq count (1- count))))      
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list))))
  (next-line arg))


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
  (setq dashboard-startup-banner "/home/une/.wallpaper/dashboard-zoom-out-light.png")
  (dashboard-refresh-buffer)
  (set-face-attribute 'vertico-group-separator nil :background "#37474f" :foreground "#FFFFFF")
  (set-face-attribute 'vertico-group-title nil :background "#37474f" :foreground "#FFFFFF")
  (set-face-attribute 'vertico-posframe nil :background "#FFFFFF" :foreground "#37474f")
  (set-face-attribute 'vertico-current nil :background "#b5ffd1" :foreground "#37474f")
  (set-face-attribute 'region nil :background "#eceff1")
  (with-eval-after-load 'corfu
    (set-face-attribute 'corfu-default nil :background "#ffffff")
    (set-face-attribute 'corfu-border nil :background "#37474f")
    (set-face-attribute 'corfu-current nil :background "#cfd8dc" :foreground "#37474f"))  
  (with-eval-after-load 'dirvish
    (set-face-attribute 'dirvish-hl-line nil :background "#cfd8dc" :foreground "#37474f")))

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
  (setq dashboard-startup-banner "/home/une/.wallpaper/dashboard-zoom-out-dark.png")
  (dashboard-refresh-buffer)
  (set-face-attribute 'vertico-current nil :background "#444444" :foreground "#67fbc8")
  (set-face-attribute 'vertico-group-separator nil :background "#64fbc8" :foreground "#191919")
  (set-face-attribute 'vertico-group-title nil :background "#64fbc8" :foreground "#191919")
  (set-face-attribute 'vertico-posframe nil :background "#191919" :foreground "#3bb1df")
  (with-eval-after-load 'corfu
    (set-face-attribute 'corfu-default nil :background "#191919" :foreground "#3bb1df")
    (set-face-attribute 'corfu-border nil :background "#37474f")
    (set-face-attribute 'corfu-current nil :background "#444444" :foreground "#64fbc8"))
  (with-eval-after-load 'dirvish
    (set-face-attribute 'dirvish-hl-line nil :background "#444444" :foreground "#64fbc8")))


;; =======================================
;; 禁用Messages与scratch
;; =======================================
(defun custom-close-scratch-and-messages-buffer ()
  "禁用Messages与scratch"
    (when (get-buffer "*scratch*")
      (kill-buffer "*scratch*") 
    (when (get-buffer "*Messages*") 
      (kill-buffer "*Messages*"))))


;; =======================================
;; 动态选择引擎来渲染
;; from chatGPT 4o
;; =======================================
(defun custom-format-org-latex-preview-with-utf8 ()
  "渲染在org-mode下渲染含有utf-8字符的equation之前的格式化准备"
  (interactive)
  ;; 找到 \[\] 的 \[
  (let ((thing (thing-at-point 'line t)))
    (if (and thing (string-match "\\[.*\\]" thing))
        (search-backward "\\[" nil t)
      (message "no such equation, please check again...")))
  (forward-char 2)
  (delete-all-space)
  ;; 找到 \[\] 的 \]
  (let ((thing (thing-at-point 'line t)))
    (if (and thing (string-match "\\[.*\\]" thing))
        (search-forward "\\]" nil t)
      (message "no such equation, please check again...")))
  (backward-char 3)
  (delete-all-space))

(defun custom-org-latex-preview-with-utf8 ()
  "在org-mode下渲染含有utf-8字符的equation"
  (interactive)
  (let* ((latex-code (thing-at-point 'line t))
         (is-utf8 (and latex-code
                       (string-match "\\[.*\\]" latex-code)
                       (string-match-p "[^\x00-\x7F]" latex-code))))
    (if is-utf8
        ;; 如果包含 UTF-8 字符，就使用 xelatex-chinese 引擎
        (progn
          (setq org-preview-latex-default-process 'xelatex-chinese)
          (message "目前使用了xelatex-chinese引擎渲染此equation"))
      ;; 如果不包含 UTF-8 字符，就使用 dvipng、dvisvgm、imagemagick 引擎
      (setq org-preview-latex-default-process 'dvipng)                       
      (message "目前使用了org-mode默认的dvipng、dvisvgm、imagemagick引擎渲染此equation"))
    (org-latex-preview)
    ;; 每次执行完毕后都恢复为 dvipng、dvisvgm、imagemagick 引擎
    (setq org-preview-latex-default-process 'dvipng)
    (message "Creating Latex previews in section...(and recover dvipng...) done.")))

(defun custom-render-equation-utf8 ()
  "在org-mode下渲染含有utf-8字符的equation的组合函数"
  (interactive)
  (custom-format-org-latex-preview-with-utf8)
  (custom-org-latex-preview-with-utf8))


;; =======================================
;; 在org-mode的公式上下文的光标跳转
;; from chatGPT 4o
;; =======================================
(defun custom-jump-the-beginning-of-the-equation (arg)
  "根据 prefix(C-u) 参数决定是否手动或自动进入选区模式，并跳转到公式块\[\]的\["
  (interactive "P")
  (let ((thing (thing-at-point 'line t)))
    (if (and thing (string-match "\\[.*\\]" thing))
        (progn
          (if arg
              (call-interactively 'set-mark-command)
            (execute-kbd-macro (kbd "C-SPC")))
          (search-backward "\\[" nil t))
      (message "No such equation, please check again..."))))

(defun custom-jump-the-ending-of-the-equation (arg)
  "根据 prefix(C-u) 参数决定是否手动或自动进入选区模式，并跳转到公式块\[\]的\]"
  (interactive "P")
  (let ((thing (thing-at-point 'line t)))
    (if (and thing (string-match "\\[.*\\]" thing))
        (progn
          (if arg
              (call-interactively 'set-mark-command)
            (execute-kbd-macro (kbd "C-SPC")))
          (search-forward "\\]" nil t))
      (message "No such equation, please check again..."))))

(defun custom-inside-escaped-bracket-pair-p ()
  "判断公式块\[ \]的谓词"
  (let ((thing (thing-at-point 'line t)))
    (and thing
         (string-match-p "\\[.*\\]" thing))))

(defun custom-jump-the-previous-equation-formatting ()
  "光标跳转到上一个公式块前的格式化"
  (interactive)
  (if (custom-inside-escaped-bracket-pair-p)
      (search-backward "\\[" nil t)))

(defun custom-jump-the-next-equation-formatting ()
  "光标跳转到下一个公式块前的格式化"
  (interactive)
  (if (custom-inside-escaped-bracket-pair-p)
      (search-forward "\\]" nil t)))

(defun custom-jump-the-previous-equation ()
  "当光标在公式块\[ \]时，跳转到此上一个公式块的\[ \]"
  (interactive)
  (custom-jump-the-previous-equation-formatting)
  (if (custom-inside-escaped-bracket-pair-p)
      (progn
        (forward-char 2)
        (search-backward "\\[" nil t))
    (message "no previous equation, please check again...")))

(defun custom-jump-the-next-equation ()
  "当光标在公式块\[ \]时，跳转到此下一个公式块的\[ \]"
  (interactive)
  (custom-jump-the-next-equation-formatting)
  (if (custom-inside-escaped-bracket-pair-p)
      (progn
        (backward-char 2)
        (search-forward "\\]" nil t))
    (message "no next equation, please check again...")))


(provide 'custom-defun)
