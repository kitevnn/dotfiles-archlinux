;; =======================================
;; 自定义 custom-defun.el
;; =======================================

;; =======================================
;; 切换主题
;; =======================================
(defun my-toggle-light-theme ()
  "切换主题到nano-light"
  (lambda () (interactive)    
    (load-theme     'nano-light t)))


;; =======================================
;; 光标移动
;; =======================================
(defun my-move-next-five-lines ()
  "光标向下移动5行"
  (interactive)
  (next-line 5))
(defun my-move-prev-five-lines ()
  "光标向上移动5行"
  (interactive)
  (previous-line 5))


;; =======================================
;; 窗口移动
;; =======================================
(defun my-resize-top-five-unit ()
  "当前窗口向上5个单位"
  (interactive)
  (shrink-window 5))
(defun my-resize-bottom-five-unit ()
  "当前窗口向下5个单位"
  (interactive)
  (enlarge-window 5))
(defun my-resize-left-five-unit ()
  "当前窗口向左5个单位"
  (interactive)
  (shrink-window-horizontally 5))
(defun my-resize-right-five-unit ()
  "当前窗口向右5个单位"
  (interactive)
  (enlarge-window-horizontally 5))


;; =======================================
;; 软空格: 保证每次TAB都是2个字符宽度的整数倍单位
;; =======================================
(defun my-tab-stops-generate (&optional width max)
  "Return a sequence suitable for `tab-stop-list'."
  (let* ((max-column (or max 200))
         (tab-width (or width tab-width))
         (count (/ max-column tab-width)))
    (number-sequence tab-width (* tab-width count) tab-width)))
;; 软空格
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq tab-stop-list (my-tab-stops-generate))


;; =======================================
;; 自动添加文本
;; =======================================
(defun my-org-add-latex-header ()
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
  '(define-key org-mode-map (kbd "C-z C-x C-e") 'my-org-add-latex-header))


;; =======================================
;; 编辑增强
;; from https://stackoverflow.com/a/998472
;; =======================================
(defun my-duplicate-line (arg)
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
(defun my-toggle-inline-images-with-valign ()
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
(defun my-org-table-with-cdlatex ()
  (when (and (derived-mode-p 'org-mode) (not (minibufferp)))
  (if (org-at-table-p)
      (progn
        (local-set-key (kbd "TAB")     'cdlatex-tab)
        (local-set-key (kbd "C-l")     'org-table-next-field))
      (local-set-key (kbd "TAB")       'org-cycle))))


;; =======================================
;; 关于PDFView
;; =======================================
(defun my-move-prev-ten-pages ()
  "pdf向上翻10页"
  (interactive)
  (pdf-view-previous-page-command 10))
(defun my-move-next-ten-pages ()
  "pdf向下翻10页"
  (interactive)
  (pdf-view-next-page-command 10))
(defun my-pdf-view-mode-hook-with-yas ()
  "禁用 yasnippet"
  (yas-minor-mode -1))


;; =======================================
;; 关于theme
;; =======================================
(defun my-load-theme-light ()
  "切换为亮色light主题"
  (interactive)
  ;; 亮色初始化
  (disable-theme 'bliss)                                                                                  ; 关闭暗色主题
  (load-theme 'nano-light)                                                                                ; 启用亮色主题
  ;; 亮色tab                                                                                              
  (custom-set-faces                                                                                       
   '(tab-line                 ((t (:background "#ffffff")))))                                             ; 标签项
  ;; 亮色vertico                                                                                           
  (custom-set-faces                                                                                        
   '(vertico-group-separator  ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 组分隔线
   '(vertico-group-title      ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 组标题
   '(vertico-posframe         ((t (:background "#ffffff" :foreground "#37474f"))))                        ; child frame
   '(vertico-current          ((t (:background "#b5ffd1" :foreground "#37474f")))))                       ; 当前条目  
  ;; 亮色logo图                                                                                           
  (setq dashboard-startup-banner
        (concat user-emacs-directory directory-emacs-archive "dashboard-zoom-out-light.png"))             ; 启用亮色logo图
  (dashboard-refresh-buffer)
  ;; 亮色org-keyword-faces
  (setq org-todo-keyword-faces
        '(("TODO"  . (:foreground "#ffffff" :background "#37474f"))
          ("WAIT"  . (:foreground "#673ab7" :background "#ffffff"))
          ("DOING" . (:foreground "#673ab7" :background "#ffffff"))
          ("DONE"  . (:foreground "#cfd8dc" :background "#ffffff")))))                                    ; 亮色org-keyword-faces
  ;; 亮色isearch                                                                                           
  (custom-set-faces                                                                                        
   '(isearch-fail             ((t (:foreground "#37474f" :background "#ffffff")))))                       ; 未匹配的字符串高亮
  ;; 亮色agenda                                                                                           
  (custom-set-faces                                                                                       
   '(org-agenda-structure     ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 结构信息
   '(org-agenda-date          ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 星期信息 
   '(org-agenda-date-today    ((t (:background "#cfd8dc" :foreground "#37474f"))))                        ; 今天时间
   '(org-agenda-current-time  ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 当前时间 
   '(org-time-grid            ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 时间刻度线
   '(org-scheduled-today      ((t (:background "#ffffff" :foreground "#000000"))))                        ; 今天的安排 
   '(org-imminent-deadline    ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 即将到期的议程
   '(org-scheduled-previously ((t (:background "#ffffff" :foreground "#cfd8dc"))))                        ; 先前完成或先前未完成的议程
   '(org-todo                 ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 议程状态
   '(org-upcoming-deadline    ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 即将过期的
   '(org-default              ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 剩余议程
   '(org-special-keyword      ((t (                      :foreground "#cfd8dc"))))                        ; 控制SCHEDULE与DEADLINE
   '(org-date                 ((t (                      :foreground "#cfd8dc")))))                       ; 控制SCHEDULE与DEADLINE的日期时间
  (custom-set-faces                                                                                       
   '(region                   ((t (:background "#eceff1")))))                                             ; 选区
  ;; 亮色corfu                                                                                            
  (with-eval-after-load 'corfu                                                                            
    (custom-set-faces                                                                                     
     '(corfu-default          ((t (:background "#ffffff"))))                                              ; 补全窗口背景
     '(corfu-border           ((t (:background "#37474f"))))                                              ; 补全窗口边框
     '(corfu-current          ((t (:background "#cfd8dc" :foreground "#37474f"))))))                      ; 补全窗口当前条目
  ;; 亮色dirvish                                                                                    
  (with-eval-after-load 'dirvish                                                                    
    (custom-set-faces                                                                               
     '(dirvish-hl-line        ((t (:background "#cfd8dc" :foreground "#37474f"))))))                      ; 侧边文件管理器高亮  
  (with-eval-after-load 'telega
    '(telega-msg-heading      ((t (:background "#ffffff"))))                                              ; 消息标题颜色
    '(help-key-binding        ((t (:background "#ffffff" :foreground "#673ab7" :height 90 :box nil)))))   ; 提示帮助颜色


(defun my-load-theme-dark ()
  "切换为暗色dark主题"
  (interactive)
  ;; 暗色初始化  
  (disable-theme 'nano-light)                                                                             ; 关闭亮色主题
  (load-theme 'bliss)                                                                                     ; 启用暗色主题
  ;; 暗色tab
  (custom-set-faces
   '(tab-line                 ((t (:background "#191919")))))                                             ; 标签项
  ;; 暗色vertico
  (custom-set-faces   
   '(vertico-group-separator  ((t (:background "#64fbc8" :foreground "#191919"))))                        ; 组分隔线
   '(vertico-group-title      ((t (:background "#64fbc8" :foreground "#191919"))))                        ; 组标题
   '(vertico-posframe         ((t (:background "#191919" :foreground "#3bb1df"))))                        ; child frame
   '(vertico-current          ((t (:background "#444444" :foreground "#67fbc8")))))                       ; 当前条目  
  ;; 暗色logo图
  (setq dashboard-startup-banner
        (concat user-emacs-directory directory-emacs-archive "dashboard-zoom-out-dark.png"))              ; 启用暗色logo图
  (dashboard-refresh-buffer)
  ;; 暗色org-keyword-faces
  (setq org-todo-keyword-faces
        '(("TODO"  . (:foreground "#191919" :background "#64fbc8"))
          ("WAIT"  . (:foreground "#1277a7" :background "#191919"))
          ("DOING" . (:foreground "#3bb1df" :background "#191919"))
          ("DONE"  . (:foreground "#444444" :background "#191919"))))                                     ; 暗色org-keyword-faces
  ;; 暗色isearch
  (custom-set-faces
   '(isearch-fail             ((t (:foreground "#ffffff" :background "#191919")))))                       ; 未匹配的字符串高亮
  ;; 暗色agenda
  (custom-set-faces
   '(org-agenda-structure     ((t (:background "#64fbc8" :foreground "#444444"))))                        ; 结构信息
   '(org-agenda-date          ((t (:background "#191919" :foreground "#64fbc8"))))                        ; 星期信息 
   '(org-agenda-date-today    ((t (:background "#444444" :foreground "#64fbc8"))))                        ; 今天时间
   '(org-agenda-current-time  ((t (:background "#444444" :foreground "#64fbc8"))))                        ; 当前时间
   '(org-time-grid            ((t (:background "#191919" :foreground "#3bb1df"))))                        ; 时间刻度线
   '(org-scheduled-today      ((t (:background "#191919" :foreground "#ffffff"))))                        ; 今天的安排 
   '(org-imminent-deadline    ((t (:background "#191919" :foreground "#3bb1df"))))                        ; 即将到期的议程
   '(org-scheduled-previously ((t (:background "#191919" :foreground "#444444"))))                        ; 先前完成或先前未完成的议程
   '(org-todo                 ((t (:background "#191919" :foreground "#1277a7"))))                        ; 议程状态
   '(org-upcoming-deadline    ((t (:background "#191919" :foreground "#64fbc8"))))                        ; 即将过期的
   '(org-default              ((t (:background "#191919" :foreground "#1277a7"))))                        ; 剩余议程
   '(org-special-keyword      ((t (                      :foreground "#1277a7"))))                        ; SCHEDULE与DEADLINE   
   '(org-date                 ((t (                      :foreground "#1277a7")))))                       ; SCHEDULE与DEADLINE的日期时间
  ;; 暗色set-mark
  (custom-set-faces
   '(region                   ((t (:background "#3bb1df" :foreground "#444444")))))                       ; 选区
  (with-eval-after-load 'telega
    (custom-set-faces     
     '(telega-msg-heading     ((t (:background "#191919"))))                                              ; 消息标题颜色
     '(help-key-binding       ((t (:background "#191919" :foreground "#64fbc8" :height 90 :box nil))))))  ; 提示帮助颜色
  ;; 暗色corfu                                                                       
  (with-eval-after-load 'corfu                                                       
    (custom-set-faces                                                                
     '(corfu-default          ((t (:background "#191919" :foreground "#3bb1df"))))                        ; 补全窗口背景
     '(corfu-border           ((t (:background "#37474f"))))                                              ; 补全窗口边框
     '(corfu-current          ((t (:background "#444444" :foreground "#64fbc8"))))))                      ; 补全窗口当前条目
  ;; 暗色dirvish
  (with-eval-after-load 'dirvish
    (custom-set-faces
     '(dirvish-hl-line        ((t (:background "#444444" :foreground "#64fbc8")))))))                     ; 侧边文件管理器高亮


;; =======================================
;; 禁用Messages与scratch
;; =======================================
(defun my-close-scratch-and-messages-buffer ()
  "禁用Messages与scratch"
    (when (get-buffer "*scratch*")
      (kill-buffer "*scratch*") 
    (when (get-buffer "*Messages*") 
      (kill-buffer "*Messages*"))))


;; =======================================
;; 动态选择引擎来渲染
;; from chatGPT 4o
;; =======================================
(defun my-format-org-latex-preview-with-utf8 ()
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

(defun my-org-latex-preview-with-utf8 ()
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

(defun my-render-equation-utf8 ()
  "在org-mode下渲染含有utf-8字符的equation的组合函数"
  (interactive)
  (my-format-org-latex-preview-with-utf8)
  (my-org-latex-preview-with-utf8))


;; =======================================
;; 在org-mode的公式上下文的光标跳转
;; from chatGPT 4o
;; =======================================
(defun my-jump-the-beginning-of-the-equation (arg)
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

(defun my-jump-the-ending-of-the-equation (arg)
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

(defun my-inside-escaped-bracket-pair-p ()
  "判断公式块\[ \]的谓词"
  (let ((thing (thing-at-point 'line t)))
    (and thing
         (string-match-p "\\[.*\\]" thing))))

(defun my-jump-the-previous-equation-formatting ()
  "光标跳转到上一个公式块前的格式化"
  (interactive)
  (if (my-inside-escaped-bracket-pair-p)
      (search-backward "\\[" nil t)))

(defun my-jump-the-next-equation-formatting ()
  "光标跳转到下一个公式块前的格式化"
  (interactive)
  (if (my-inside-escaped-bracket-pair-p)
      (search-forward "\\]" nil t)))

(defun my-jump-the-previous-equation ()
  "当光标在公式块\[ \]时，跳转到此上一个公式块的\[ \]"
  (interactive)
  (my-jump-the-previous-equation-formatting)
  (if (my-inside-escaped-bracket-pair-p)
      (progn
        (forward-char 2)
        (search-backward "\\[" nil t))
    (message "no previous equation, please check again...")))

(defun my-jump-the-next-equation ()
  "当光标在公式块\[ \]时，跳转到此下一个公式块的\[ \]"
  (interactive)
  (my-jump-the-next-equation-formatting)
  (if (my-inside-escaped-bracket-pair-p)
      (progn
        (backward-char 2)
        (search-forward "\\]" nil t))
    (message "no next equation, please check again...")))


;; =======================================
;; 手动更新议程任务信息
;; =======================================
(defun my-update-modeline-output-agenda-tasks ()
  "手动更新议程任务信息 TODO: a DOING: b WAIT: c"
  (interactive)
  (update-modeline-output-agenda-file-tasks))


;; =======================================
;; 快速更改议程任务信息
;; =======================================
(defun my-org-agenda-change-headline-to-done ()
  "将当前任务状态改为DONE"
  (interactive)
  (if (org-at-heading-p)
      (progn
        (org-beginning-of-line)
        (forward-word)
        (save-excursion
          (delete-region (point) (progn (backward-word) (point)))
          (insert "DONE")))
    (progn
      (org-previous-visible-heading 1)
      (org-beginning-of-line)
      (forward-word)
      (save-excursion
        (delete-region (point) (progn (backward-word) (point)))
        (insert "DONE")))))

(defun my-org-agenda-change-headline-to-doing ()
  "将当前任务状态改为DOING"
  (interactive)
  (if (org-at-heading-p)
      (progn
        (org-beginning-of-line)
        (forward-word)
        (save-excursion
          (delete-region (point) (progn (backward-word) (point)))
          (insert "DOING")))
    (progn
      (org-previous-visible-heading 1)
      (org-beginning-of-line)
      (forward-word)
      (save-excursion
        (delete-region (point) (progn (backward-word) (point)))
        (insert "WAIT")))))

(defun my-org-agenda-change-headline-to-wait ()
  "将当前任务状态改为WAIT"
  (interactive)
  (if (org-at-heading-p)
      (progn
        (org-beginning-of-line)
        (forward-word)
        (save-excursion
          (delete-region (point) (progn (backward-word) (point)))
          (insert "WAIT")))
    (progn
      (org-previous-visible-heading 1)
      (org-beginning-of-line)
      (forward-word)
      (save-excursion
          (delete-region (point) (progn (backward-word) (point)))
          (insert "WAIT")))))


;; =======================================
;; 手动更新modeline上的已有信息
;; =======================================
(defun my-update-modeline-all-information ()
  "手动更新modeline上的已有信息"
  (interactive)
  ;; 更新变量数据
  (update-modeline-agenda-file-tasks)  
  ;; 更新modeline信息
  (update-modeline-with-all-scripts))


;; =======================================
;; 手动更新已使用的GNU Emacs累加时长
;; =======================================
(defun my-save-emacs-uptime ()
  "通过添加hooks的方式，在每次退出Emacs后，自动将emacs-uptime保存到指定的 uptime 文件"
  (let ((uptime (emacs-uptime)))
    (with-temp-buffer
      (insert (format "Uptime: %s\n" uptime))
      (append-to-file (point-min) (point-max)  (concat user-emacs-directory directory-emacs-archive "uptime")))))

(defun my-sumize-emacs-uptime ()
  "通过添加hooks的方式，在每次退出Emacs后，自动地对指定的 uptime 文件求和时长"
  (let ((uptime-file (concat user-emacs-directory directory-emacs-archive "uptime")))
    (let ((uptime-output
           (string-trim (shell-command-to-string
                         (concat user-emacs-directory directory-site-lisp "calculate-uptime.sh")))))
      (with-temp-buffer
        (insert (format "%s\n" uptime-output))
        (append-to-file (point-min) (point-max) uptime-file)))))

(defun my-show-emacs-uptime ()
  "获得最新的 calculate-uptime.sh 的输出"
  (interactive)
  (let ((uptime-output
         (string-trim (shell-command-to-string
                       (concat user-emacs-directory directory-site-lisp "calculate-uptime.sh")))))
    (insert uptime-output)))


(provide 'custom-defun)
