;; ========================================
;; 自定义快捷键 key-keybindings.el
;; ========================================

;; ========================================
;; 关于软屏蔽
;; ========================================
(global-unset-key (kbd "C-z"))                                                                        ; 屏蔽C-z (原功能: 挂起)


;; ========================================
;; 关于buffer
;; ========================================
(global-set-key (kbd "C-z C-b C-n")                       'next-buffer)                               ; 跳转到下一个全局buffer
(global-set-key (kbd "C-z C-b C-p")                       'previous-buffer)                           ; 跳转到上一个全局buffer
(global-set-key (kbd "C-z C-b C-b")                       'centaur-tabs-backward)                     ; 跳转到上一个局部buffer
(global-set-key (kbd "C-z C-b C-f")                       'centaur-tabs-forward)                      ; 跳转到下一个局部buffer


;; ========================================
;; 关于theme
;; ========================================
(global-set-key (kbd "C-z C-t C-1")                       'custom-load-theme-light)                   ; 切换为亮色light主题
(global-set-key (kbd "C-z C-t C-2")                       'custom-load-theme-dark)                    ; 切换为暗色dark主题


;; ========================================
;; 窗口管理
;; ========================================
(global-set-key (kbd "C-z C-z C-k")                      'delete-window)                             ; 关闭当前窗口
(global-set-key (kbd "C-z C-z C-f")                      'windmove-right)                            ; 光标跳转到右边窗口
(global-set-key (kbd "C-z C-z C-b")                      'windmove-left)                             ; 光标跳转到左边窗口
(global-set-key (kbd "C-z C-z C-n")                      'windmove-down)                             ; 光标跳转到下边窗口
(global-set-key (kbd "C-z C-z C-p")                      'windmove-up)                               ; 光标跳转到上边窗口
(global-set-key (kbd "C-z C-s C-f")                      'windmove-swap-states-right)                ; 向右交换窗口 
(global-set-key (kbd "C-z C-s C-b")                      'windmove-swap-states-left)                 ; 向左交换窗口 
(global-set-key (kbd "C-z C-s C-n")                      'windmove-swap-states-down)                 ; 向下交换窗口 
(global-set-key (kbd "C-z C-s C-p")                      'windmove-swap-states-up)                   ; 向上交换窗口


;; ========================================
;; 关于选区
;; ========================================
(global-set-key (kbd "C-z C-z C-c")                      'set-mark-command)                           ; 进入单行选区
(global-set-key (kbd "C-c SPC")                          'rectangle-mark-mode)                        ; 进入矩形选区


;; ========================================
;; 关于调整屏幕
;; ========================================
(global-set-key (kbd "C-z C-w C-p")                      'custom-resize-top-five-unit)                ; 当前窗口向上调整5个单位
(global-set-key (kbd "C-z C-w C-n")                      'custom-resize-bottom-five-unit)             ; 当前窗口向下调整5个单位
(global-set-key (kbd "C-z C-w C-b")                      'custom-resize-left-five-unit)               ; 当前窗口向左调整5个单位
(global-set-key (kbd "C-z C-w C-f")                      'custom-resize-right-five-unit)              ; 当前窗口向右调整5个单位


;; ========================================
;; 重启GNU Emacs
;; ========================================
(global-set-key (kbd "C-z C-z C-z C-z C-r")              'restart-emacs)                              ; 重启GNU Emacs


;; ========================================
;; 关于dirvish文件管理器
;; ========================================
(global-set-key (kbd "C-c d o")                          'dirvish-side)                               ; 左侧打开dirvish
(global-set-key (kbd "C-z C-z C-d")                      'dirvish-side)                               ; 左侧打开dirvish
(global-set-key (kbd "C-c d q")                          'dirvish-quit)                               ; 退出关闭dirvish
(global-set-key (kbd "C-c d g")                          'dirvish)                                    ; 全局打开dirvish


;; ========================================
;; 关于移动光标
;; ========================================
(global-set-key (kbd "M-n")                              'custom-move-next-five-lines)                ; 光标向下移动5行
(global-set-key (kbd "M-p")                              'custom-move-prev-five-lines)                ; 光标向上移动5行


;; ========================================
;; 关于buffer
;; ========================================
(global-set-key (kbd "C-x C-b")                          'ibuffer)                                    ; 用ibuffer(built-in)代替原生的C-x C-b


;; ========================================
;; 关于编辑增强
;; ========================================
(global-set-key (kbd "C-=")                              'custom-duplicate-line)                      ; 复制当前行到下一行并保持光标水平位置不变
(global-set-key (kbd "C-z C-z C-e")                      'embark-act)                                 ; 增强原始工作流embark
(global-set-key (kbd "M-s l")                            'consult-line)                               ; C-s搜索
(global-set-key (kbd "M-s r")                            'consult-ripgrep)                            ; rg搜索
(global-set-key (kbd "C-c C-x C-h")                      'embark-prefix-help-command)                 ; prefix快捷键


;; ========================================
;; 关于emacs-lisp-mode
;; ========================================
(define-key emacs-lisp-mode-map (kbd "C-c C-x C-e")      'custom-eval-elisp-sexp)                     ; C-cxe快速计算lisp式子


;; ========================================
;; 关于org-mode
;; ========================================
(define-key org-mode-map (kbd "C-c C-x C-0")             'valign-mode)                                ; 切换valign-mode
(define-key org-mode-map (kbd "C-c C-x C-a")             'org-agenda)                                 ; 当前文件放进org议题内
(define-key org-mode-map (kbd "C-c C-x C-v")             'custom-toggle-inline-images-with-valign)    ; 用 C-c C-x C-v 避免valign-mode造成的对齐卡顿来预览图片
(define-key org-mode-map (kbd "C-z C-z C-l")             'custom-org-latex-preview-with-utf8)         ; 用 C-c C-x C-p 进行utf-8的 \[\] 上下文范围的公式渲染
(define-key org-mode-map (kbd "C-z C-x C-f")             'custom-jump-the-ending-of-the-equation)     ; 当光标在\[\]上下文时，光标跳转到\[\]的\[
(define-key org-mode-map (kbd "C-z C-x C-b")             'custom-jump-the-beginning-of-the-equation)  ; 当光标在\[\]上下文时，光标跳转到\[\]的\]
(define-key org-mode-map (kbd "C-z C-x C-n")             'custom-jump-the-next-equation)              ; 当光标在\[\]上下文时，光标跳转到下一个\[\]
(define-key org-mode-map (kbd "C-z C-x C-p")             'custom-jump-the-previous-equation)          ; 当光标在\[\]上下文时，光标跳转到上一个\[\]


;; ========================================
;; 关于org-roam
;; ========================================
(define-key org-mode-map (kbd "C-z C-r C-f")             'org-roam-node-find)                         ; 寻找笔记地图节点
(define-key org-mode-map (kbd "C-z C-r C-a")             'org-roam-node-insert)                       ; 创建笔记地图节点
(define-key org-mode-map (kbd "C-z C-r C-n")             'org-roam-capture)                           ; 创建笔记地图节点
(define-key org-mode-map (kbd "C-z C-r C-t")             'org-roam-buffer-toggle)                     ; 切换笔记地图节点
(define-key org-mode-map (kbd "C-z C-r C-o")             'org-roam-ui-mode)                           ; 打开笔记地图
(define-key org-mode-map (kbd "C-z C-r C-d")             'org-roam-dailies-map)                       ; 打开日记菜单


;; ========================================
;; 关于PDFView
;; ========================================
(define-key pdf-view-mode-map (kbd "d")                  'pdf-view-next-page-command)                 ; PDFView向后翻页
(define-key pdf-view-mode-map (kbd "a")                  'pdf-view-previous-page-command)             ; PDFView向前翻页
(define-key pdf-view-mode-map (kbd "s")                  'pdf-view-scroll-up-or-next-page)            ; PDFView向下滚动
(define-key pdf-view-mode-map (kbd "w")                  'pdf-view-scroll-down-or-previous-page)      ; PDFView向上滚动
(define-key pdf-view-mode-map (kbd "t")                  'custom-move-prev-ten-pages)                 ; PDFView向前翻10页
(define-key pdf-view-mode-map (kbd "b")                  'custom-move-next-ten-pages)                 ; PDFView向后翻10页
(require 'pdf-annot)
(define-key pdf-annot-minor-mode-map (kbd "C-c C-a `")   'pdf-annot-delete)                           ; PDFView删除批注
(define-key pdf-annot-minor-mode-map (kbd "C-c C-a 1")   'pdf-annot-add-highlight-markup-annotation)  ; PDFView高亮
(define-key pdf-annot-minor-mode-map (kbd "C-c C-a 2")   'pdf-annot-add-underline-markup-annotation)  ; PDFView下划线
(define-key pdf-annot-minor-mode-map (kbd "C-c C-a 3")   'pdf-annot-add-squiggly-markup-annotation)   ; PDFView波浪下划线
(define-key pdf-annot-minor-mode-map (kbd "C-c C-a 5")   'pdf-annot-add-text-annotation)              ; PDFView文本批注


;; ========================================
;; 关于Dashboard
;; ========================================
(define-key dashboard-mode-map       (kbd "p")           'dashboard-previous-line)                    ; 设置在仅有dashboard-item下按下p来移动光标
(define-key dashboard-mode-map       (kbd "n")           'dashboard-next-line)                        ; 设置在仅有dashboard-item下按下n来移动光标
(define-key dashboard-mode-map       (kbd "j")           nil)                                         ; 取消在仅有dashboard-item下按下j来移动光标
(define-key dashboard-mode-map       (kbd "k")           nil)                                         ; 取消在仅有dashboard-item下按下k来移动光标
(global-set-key                      (kbd "C-z C-d C-r") 'consult-recent-file)                        ; C-z C-d C-r 来打开最近文件
(global-set-key                      (kbd "C-z C-d C-b") 'bookmark-bmenu-list)                        ; C-z C-d C-b 来打开书签文件
(global-set-key                      (kbd "C-z C-d C-a") 'org-agenda-list)                            ; C-z C-d C-a 来打开议程文件


;; ========================================
;; 关于进程process
;; ========================================
(global-set-key (kbd "C-z C-p C-e")                      'telega)                                     ; 打开telega
(global-set-key (kbd "C-z C-p C-d")                      'deadgrep)                                   ; 打开deapgrep
(global-set-key (kbd "C-z C-p C-s")                      'eshell)                                     ; 开启eshell壳
(global-set-key (kbd "C-z C-p C-t")                      'eat)                                        ; 开启eat终端模拟器
(global-set-key (kbd "C-c C-p C-l")                      'eglot)                                      ; 开启eglot语言服务客户端
(global-set-key (kbd "C-c C-p C-c")                      'corfu-mode)                                 ; 开启corfu轻量补全框架
(global-set-key (kbd "C-z C-z C-1")                      'magit)                                      ; 打开magit


;; ========================================
;; 关于输入法
;; ========================================
(global-set-key (kbd "C-\\")                             'toggle-input-method)                       ; 切换输入法


(provide 'key-keybindings)
