;; =======================================
;; 自定义 custom-defun.el
;; =======================================


;; =======================================
;; 光标移动
;; =======================================
(defun kivnn/move-next-five-lines ()
  "光标向下移动5行"
  (interactive)
  (next-line 5))
(defun kivnn/move-prev-five-lines ()
  "光标向上移动5行"
  (interactive)
  (previous-line 5))


;; =======================================
;; 窗口移动
;; =======================================
(defun kivnn/resize-top-five-unit ()
  "当前窗口向上5个单位"
  (interactive)
  (shrink-window 5))
(defun kivnn/resize-bottom-five-unit ()
  "当前窗口向下5个单位"
  (interactive)
  (enlarge-window 5))
(defun kivnn/resize-left-five-unit ()
  "当前窗口向左5个单位"
  (interactive)
  (shrink-window-horizontally 5))
(defun kivnn/resize-right-five-unit ()
  "当前窗口向右5个单位"
  (interactive)
  (enlarge-window-horizontally 5))


;; =======================================
;; 软空格: 保证每次TAB都是2个字符宽度的整数倍单位
;; =======================================
(defun kivnn/tab-stops-generate (&optional width max)
  "Return a sequence suitable for `tab-stop-list'."
  (let* ((max-column (or max 200))
         (tab-width (or width tab-width))
         (count (/ max-column tab-width)))
    (number-sequence tab-width (* tab-width count) tab-width)))
;; 软空格
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq tab-stop-list (kivnn/tab-stops-generate))


;; =======================================
;; 自动添加文本
;; =======================================
(defun kivnn/org-add-latex-header ()
  "在org-mode里添加可能需要的LaTeX Header来成功导出pdf文档"
  (interactive)
  (goto-char (point-min))
  (progn
    (insert "#+LATEX_HEADER: \\usepackage[usenames]{color}\n")
    (insert "#+LATEX_HEADER: \\usepackage{amsmath}\n")
    (insert "#+LATEX_HEADER: \\usepackage{esint}\n")
    (insert "#+LATEX_HEADER: \\usepackage{fontspec}\n")
    (insert "#+LATEX_HEADER: \\setsansfont{Noto Sans CJK TC}\n")
    (insert "#+LATEX_HEADER: \\setmainfont{Noto Serif CJK TC}\n")
    (insert "#+LATEX_HEADER: xelatex\n\n")))
(eval-after-load 'org
  '(define-key org-mode-map (kbd "C-z C-x C-e") 'kivnn/org-add-latex-header))


;; =======================================
;; 编辑增强
;; from https://stackoverflow.com/a/998472
;; =======================================
(defun kivnn/duplicate-line (arg)
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
(defun kivnn/toggle-inline-images-with-valign ()
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
(defun kivnn/org-table-with-cdlatex ()
  (when (and (derived-mode-p 'org-mode) (not (minibufferp)))
  (if (org-at-table-p)
      (progn
        (local-set-key (kbd "TAB")     'cdlatex-tab)
        (local-set-key (kbd "C-l")     'org-table-next-field))
      (local-set-key (kbd "TAB")       'org-cycle))))


;; =======================================
;; 关于PDFView
;; =======================================
(defun kivnn/move-prev-ten-pages ()
  "pdf向上翻10页"
  (interactive)
  (pdf-view-previous-page-command 10))
(defun kivnn/move-next-ten-pages ()
  "pdf向下翻10页"
  (interactive)
  (pdf-view-next-page-command 10))
(defun kivnn/pdf-view-mode-hook-with-yas ()
  "禁用 yasnippet"
  (yas-minor-mode -1))


;; =======================================
;; 关于theme
;; =======================================
(defun kivnn/load-theme-light ()
  "切换为亮色light主题"
  (interactive)
  ;; 亮色初始化
  (disable-theme 'bliss)
  (load-theme 'nano-light)
  ;; 亮色tab
  (dolist (face-attr '((tab-line :background "#ffffff")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色vertico                                                                                           
  (dolist (face-attr '((vertico-group-separator  :background "#37474f" :foreground "#ffffff")
                       (vertico-group-title      :background "#37474f" :foreground "#ffffff")
                       (vertico-posframe         :background "#ffffff" :foreground "#37474f")
                       (vertico-current          :background "#b5ffd1" :foreground "#37474f")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色logo图                                                                                           
  (setq dashboard-startup-banner
        (concat user-emacs-directory directory-emacs-archive "dashboard-zoom-out-light.png"))
  (dashboard-refresh-buffer)
  ;; 亮色org-todo-keyword-faces
  (setq org-todo-keyword-faces
        '(("TODO"  . (:foreground "#ffffff" :background "#37474f"))
          ("WAIT"  . (:foreground "#673ab7" :background "#ffffff"))
          ("DOING" . (:foreground "#673ab7" :background "#ffffff"))
          ("DONE"  . (:foreground "#cfd8dc" :background "#ffffff"))))
  ;; 亮色isearch                                                                                           
  (dolist (face-attr '((isearch-fail :foreground "#37474f" :background "#ffffff")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色agenda                                                                                           
  (dolist (face-attr '((org-agenda-structure     :background "#37474f" :foreground "#ffffff")
                       (org-agenda-date          :background "#ffffff" :foreground "#673ab7")
                       (org-agenda-date-today    :background "#cfd8dc" :foreground "#37474f")
                       (org-agenda-current-time  :background "#ffffff" :foreground "#673ab7")
                       (org-time-grid            :background "#ffffff" :foreground "#37474f")
                       (org-scheduled-today      :background "#ffffff" :foreground "#000000")
                       (org-imminent-deadline    :background "#ffffff" :foreground "#37474f")
                       (org-scheduled-previously :background "#ffffff" :foreground "#cfd8dc")
                       (org-todo                 :background "#ffffff" :foreground "#673ab7")
                       (org-upcoming-deadline    :background "#ffffff" :foreground "#673ab7")
                       (org-default              :background "#ffffff" :foreground "#37474f")
                       (org-special-keyword                            :foreground "#a5acaf")
                       (org-date                                       :foreground "#a5acaf")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色region
  (dolist (face-attr '((region  :background "#eceff1")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色emms
  (dolist (face-attr '((emms-playlist-selected-face :background "#37474f" :foreground "#ffffff")
                       (emms-playlist-track-face                          :foreground "#673ab7")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 亮色corfu
  (with-eval-after-load 'corfu                                                                            
    (dolist (face-attr '((corfu-default :background "#ffffff")
                         (corfu-border  :background "#37474f")
                         (corfu-current :background "#cfd8dc"  :foreground "#37474f")))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))
  ;; 亮色dirvish
  (with-eval-after-load 'dirvish                                                                    
    (dolist (face-attr '((dirvish-hl-line :background "#cfd8dc" :foreground "#37474f")))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))
  ;; 亮色telega
  (with-eval-after-load 'telega
    (dolist (face-attr '((telega-msg-heading  :background "#ffffff" )
                         (help-key-binding    :background "#ffffff" :foreground "#673ab7" :height 90 :box nil )))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))))

(defun kivnn/load-theme-dark ()
  "切换为暗色dark主题"
  (interactive)
  ;; 暗色初始化  
  (disable-theme 'nano-light)
  (load-theme 'bliss)
  ;; 暗色tab
  (dolist (face-attr '((tab-line   :background "#191919" )))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色vertico
  (dolist (face-attr '((vertico-group-separator :background "#64fbc8" :foreground "#191919")
                       (vertico-group-title     :background "#64fbc8" :foreground "#191919")
                       (vertico-posframe        :background "#191919" :foreground "#3bb1df")
                       (vertico-current         :background "#444444" :foreground "#67fbc8")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色logo图
  (setq dashboard-startup-banner
        (concat user-emacs-directory directory-emacs-archive "dashboard-zoom-out-dark.png"))
  (dashboard-refresh-buffer)
  ;; 暗色org-todo-keyword-faces
  (setq org-todo-keyword-faces
        '(("TODO"  . (:foreground "#191919" :background "#64fbc8"))
          ("WAIT"  . (:foreground "#1277a7" :background "#191919"))
          ("DOING" . (:foreground "#3bb1df" :background "#191919"))
          ("DONE"  . (:foreground "#444444" :background "#191919"))))
  ;; 暗色isearch
  (dolist (face-attr '((isearch-fail :foreground "#ffffff" :background "#191919")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色agenda
  (dolist (face-attr '((org-agenda-structure     :background "#64fbc8" :foreground "#444444")
                       (org-agenda-date          :background "#191919" :foreground "#64fbc8")
                       (org-agenda-date-today    :background "#444444" :foreground "#64fbc8")
                       (org-agenda-current-time  :background "#444444" :foreground "#64fbc8")
                       (org-time-grid            :background "#191919" :foreground "#3bb1df")
                       (org-scheduled-today      :background "#191919" :foreground "#ffffff")
                       (org-imminent-deadline    :background "#191919" :foreground "#3bb1df")
                       (org-scheduled-previously :background "#191919" :foreground "#444444")
                       (org-todo                 :background "#191919" :foreground "#1277a7")
                       (org-upcoming-deadline    :background "#191919" :foreground "#64fbc8")
                       (org-default              :background "#191919" :foreground "#1277a7")
                       (org-special-keyword                            :foreground "#1277a7")
                       (org-date                                       :foreground "#1277a7")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色region
  (dolist (face-attr '((region  :background "#3bb1df" :foreground "#444444")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色emms
  (dolist (face-attr '((emms-playlist-selected-face :background "#444444" :foreground "#64fbc8")
                       (emms-playlist-track-face                          :foreground "#3bb1df")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))
  ;; 暗色corfu
  (with-eval-after-load 'corfu                                                       
    (dolist (face-attr '((corfu-default        :background "#191919" :foreground "#3bb1df" )
                         (corfu-border         :background "#37474f" )
                         (corfu-current        :background "#444444" :foreground "#64fbc8" )))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))
  ;; 暗色dirvish
  (with-eval-after-load 'dirvish
    (dolist (face-attr '((dirvish-hl-line       :background "#444444" :foreground "#64fbc8")))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))
  ;; 暗色telega
  (with-eval-after-load 'telega
    (dolist (face-attr '((telega-msg-heading   :background "#191919" )
                         (help-key-binding     :background "#191919" :foreground "#64fbc8" :height 90 :box nil )))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))))


;; =======================================
;; 禁用Messages与scratch
;; =======================================
(defun kivnn/close-scratch-and-messages-buffer ()
  "禁用Messages与scratch"
    (when (get-buffer "*scratch*")
      (kill-buffer "*scratch*") 
    (when (get-buffer "*Messages*") 
      (kill-buffer "*Messages*"))))


;; =======================================
;; 动态选择引擎来渲染
;; from chatGPT 4o
;; =======================================
(defun kivnn/format-org-latex-preview-with-utf8 ()
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

(defun kivnn/org-latex-preview-with-utf8 ()
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

(defun kivnn/render-equation-utf8 ()
  "在org-mode下渲染含有utf-8字符的equation的组合函数"
  (interactive)
  (kivnn/format-org-latex-preview-with-utf8)
  (kivnn/org-latex-preview-with-utf8))


;; =======================================
;; 在org-mode的公式上下文的光标跳转
;; from chatGPT 4o
;; =======================================
(defun kivnn/jump-the-beginning-of-the-equation (arg)
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

(defun kivnn/jump-the-ending-of-the-equation (arg)
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

(defun kivnn/jump-the-previous-equation ()
  "当光标在公式块\[ \]时，跳转到此上一个公式块的\[ \]"
  (interactive)
  (call-interactively 'kivnn/jump-the-beginning-of-the-equation nil)
  (forward-char 3)
  (call-interactively 'kivnn/jump-the-beginning-of-the-equation nil)
  (keyboard-quit))

(defun kivnn/jump-the-next-equation ()
  "当光标在公式块\[ \]时，跳转到此下一个公式块的\[ \]"
  (interactive)
  (call-interactively 'kivnn/jump-the-ending-of-the-equation nil)
  (backward-char 3)
  (call-interactively 'kivnn/jump-the-ending-of-the-equation nil)
  (keyboard-quit))


;; =======================================
;; 议程任务信息
;; =======================================
(defun kivnn/update-modeline-output-agenda-tasks ()
  "手动更新议程任务信息 TODO: a DOING: b WAIT: c"
  (interactive)
  (kivnn/update-modeline-output-agenda-file-tasks))

(defun kivnn/org-agenda-change-headline-to-what (what)
  "将当前任务状态改为特定状态"
  (if (org-at-heading-p)
      (progn
        (org-beginning-of-line)
        (forward-word)
        (save-excursion
          (delete-region (point) (progn (backward-word) (point)))
          (insert what)))
    (progn
      (org-previous-visible-heading 1)
      (org-beginning-of-line)
      (forward-word)
      (save-excursion
        (delete-region (point) (progn (backward-word) (point)))
        (insert what)))))

(defun kivnn/org-agenda-change-headline-to-done ()
  "将当前任务状态改为DONE"
  (interactive)
  (kivnn/org-agenda-change-headline-to-what "DONE"))

(defun kivnn/org-agenda-change-headline-to-doing ()
  "将当前任务状态改为DOING"
  (interactive)
  (kivnn/org-agenda-change-headline-to-what "DOING"))
  
(defun kivnn/org-agenda-change-headline-to-wait ()
  "将当前任务状态改为WAIT"
  (interactive)
  (kivnn/org-agenda-change-headline-to-what "WAIT"))


;; =======================================
;; 手动更新modeline上的已有信息
;; =======================================
(defun kivnn/update-modeline-all-information ()
  "手动更新modeline上的已有信息"
  (interactive)
  ;; 更新变量数据
  (kivnn/update-modeline-agenda-file-tasks)  
  ;; 更新modeline信息
  (kivnn/update-modeline-with-all-scripts))


;; =======================================
;; 关于GNU Emacs累计使用总时长
;; =======================================
(defun kivnn/save-emacs-uptime ()
  "通过设置钩子hooks，在每次退出Emacs后，自动保存emacs-uptime数据到指定文件内"
  (let ((uptime (emacs-uptime)))
    (with-temp-buffer
      (insert (format "Uptime: %s\n" uptime))
      (append-to-file (point-min) (point-max)  (concat user-emacs-directory directory-emacs-archive "uptime")))))

(defun kivnn/show-emacs-uptime ()
  "通过site-lisp的sh脚本实现，获取Emacs的累计使用总时长"
  (interactive)
  (let ((uptime-output
         (string-trim (shell-command-to-string
                       (concat user-emacs-directory directory-site-lisp "calculate-uptime.sh")))))
    (insert uptime-output)))


;; =======================================
;; 关于模拟vim的f(find char)
;; from GPT 4o
;; =======================================
(defun kivnn/expand-region-like-vim-find-char ()
  "在选区模式下，不改变左边界，只改变选区右边界，来扩展选区"
  (interactive)
  (when (use-region-p)
    (let ((start (region-beginning))
          (end (region-end))
          (char (read-char "Find char: ")))
      (deactivate-mark)
      (goto-char end)
      (search-forward (string char) nil t)
      (set-mark start))))


;; =======================================
;; 关于telega字体大小
;; from GPT 4o
;; =======================================
(defun kivnn/telega-buffer-face-height ()
  "调整telega的字体大小为1.3倍"
  (setq buffer-face-mode-face '(:height 1.3))
  (buffer-face-mode))


;; =======================================
;; 关于frame删除管理
;; =======================================
(defun kivnn/delete-frame-or-other ()
  "通过 C-u + key 来只保留当前 frame，通过 key 来只关闭当前 frame"
  (interactive)
  (if current-prefix-arg
      (delete-other-frames)
    (delete-frame)))


;; =======================================
;; 关于个人提交信息模板
;; =======================================
(defun kivnn/magit-commit-template ()
  "个人提交信息模板: 第1次询问标题，第2次询问子项数量"
  (interactive)
  (let* ((software (read-string "what's been changed (GNU Emacs by default): " "GNU Emacs"))
         (item-count (read-number "the count of items (1 by default): " 1))
         (commit-msg (concat "更新了 " software " 配置文件\n\n"
                             (mapconcat (lambda (_) "+ ") (make-list item-count "+ ") "\n\n"))))
    (insert commit-msg)
    (beginning-of-buffer)
    (beginning-of-visual-line)
    (next-line 2)
    (end-of-visual-line)))


;; =======================================
;; 关于括号匹配parentheses
;; =======================================
(defun kivnn/goto-match-paren (arg)
  "括号匹配parentheses"
  (interactive "P")
  (cond
    ;; 括号匹配: () [] {}
   ((eq (char-after) ?\() (forward-sexp 1))
   ((eq (char-after) ?\[) (forward-sexp 1))
   ((eq (char-after) ?\{) (forward-sexp 1))
   ((eq (char-before) ?\)) (backward-sexp 1))
   ((eq (char-before) ?\]) (backward-sexp 1))
   ((eq (char-before) ?\}) (backward-sexp 1))))


;; =======================================
;; 关于音乐前进后退emms
;; =======================================
(defun emms-seek-forward-minute ()
  "Seek sixty seconds forward."
  (lambda ()
  (when emms-player-playing-p
    (emms-player-seek 60))))
(defun emms-seek-backward-minute ()
  "Seek sixty seconds backward."
  (lambda ()
  (interactive)
  (when emms-player-playing-p
    (emms-player-seek (- 60)))))


(provide 'custom-defun)
