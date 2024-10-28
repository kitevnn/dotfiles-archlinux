;; ===============================================
;; 自定义快捷键 key-keybindings.el
;; ===============================================

;; ===============================================
;; 关于软屏蔽
;; ===============================================
(global-unset-key (kbd "C-z"))                                                                        ; 屏蔽C-z (原功能: 挂起)


;; ===============================================
;; 全局Buffer管理
;; ===============================================
(global-set-key (kbd "C-c t p")                          'next-buffer)                                ; 跳转到下一个全局Buffer
(global-set-key (kbd "C-c t n")                          'previous-buffer)                            ; 跳转到上一个全局Buffer
(global-set-key (kbd "C-c C-x C-<down>")                 'next-buffer)                                ; 跳转到下一个全局Buffer
(global-set-key (kbd "C-c C-x C-<up>")                   'previous-buffer)                            ; 跳转到上一个全局Buffer


;; ===============================================
;; 局部Buffer管理
;; ===============================================
(global-set-key (kbd "C-c t b")                          'centaur-tabs-backward)                      ; 跳转到上一个局部Buffer
(global-set-key (kbd "C-c t f")                          'centaur-tabs-forward)                       ; 跳转到下一个局部Buffer
(global-set-key (kbd "C-c C-x C-<left>")                 'centaur-tabs-backward)                      ; 跳转到上一个局部Buffer
(global-set-key (kbd "C-c C-x C-<right>")                'centaur-tabs-forward)                       ; 跳转到下一个局部Buffer
(global-set-key (kbd "C-c t c")                          'centaur-tabs--create-new-tab)               ; 创建新的Buffer
(global-set-key (kbd "C-c t j")                          'centaur-tabs-ace-jump)                      ; 跳转到特定Buffer


;; ===============================================
;; 主题管理
;; ===============================================
(global-set-key (kbd "C-c l 1")                          'custom-toggle-light-theme)                  ; 切换主题到nano-light


;; ===============================================
;; 窗口管理
;; ===============================================
(global-set-key (kbd "C-c k")                            'delete-window)                              ; 关闭当前窗口
(global-set-key (kbd "C-c f")                            'windmove-right)                             ; 光标跳转到右边窗口
(global-set-key (kbd "C-c b")                            'windmove-left)                              ; 光标跳转到左边窗口
(global-set-key (kbd "C-c n")                            'windmove-down)                              ; 光标跳转到下边窗口
(global-set-key (kbd "C-c p")                            'windmove-up)                                ; 光标跳转到上边窗口


;; ===============================================
;; 选区管理
;; ===============================================
(global-set-key (kbd "C-c v")                            'set-mark-command)                           ; 进入单行选区
(global-set-key (kbd "C-c SPC")                          'rectangle-mark-mode)                        ; 进入矩形选区


;; ===============================================
;; 调整屏幕
;; ===============================================
(global-set-key (kbd "M--")                              'custom-resize-top-five-unit)                ; 当前窗口向上调整5个单位
(global-set-key (kbd "M-=")                              'custom-resize-bottom-five-unit)             ; 当前窗口向下调整5个单位
(global-set-key (kbd "M-9")                              'custom-resize-left-five-unit)               ; 当前窗口向左调整5个单位
(global-set-key (kbd "M-0")                              'custom-resize-right-five-unit)              ; 当前窗口向右调整5个单位


;; ===============================================
;; 重启GNU Emacs
;; ===============================================
(global-set-key (kbd "M-r")                              'restart-emacs)                              ; 重启GNU Emacs


;; ===============================================
;; 文件管理器dirvish
;; ===============================================
(global-set-key (kbd "C-c d o")                          'dirvish-side)                               ; 左侧打开dirvish
(global-set-key (kbd "C-c d q")                          'dirvish-quit)                               ; 退出关闭dirvish
(global-set-key (kbd "C-c d g")                          'dirvish)                                    ; 全局打开dirvish


;; ===============================================
;; 移动光标
;; ===============================================
(global-set-key (kbd "M-n")                              'custom-move-next-five-lines)                ; 光标向下移动5行
(global-set-key (kbd "M-p")                              'custom-move-prev-five-lines)                ; 光标向上移动5行


;; ===============================================
;; 关于eglot
;; ===============================================
(global-set-key (kbd "C-c c o")                          'corfu-mode)                                 ; 开启corfu轻量补全框架


;; ===============================================
;; 关于eglot
;; ===============================================
(global-set-key (kbd "C-c e o")                          'eglot)                                      ; 开启eglot语言服务客户端
(global-set-key (kbd "C-c e r")                          'eglot-reconnect)                            ; 重连eglot语言服务客户端
(global-set-key (kbd "C-c e s")                          'eglot-shutdown)                             ; 关闭eglot语言服务客户端
(global-set-key (kbd "C-c e d s")                        'flymake-show-diagnostic)                    ; 通过flymake(built-in)，给eglot提供diagnostic诊断信息
(global-set-key (kbd "C-c e d n")                        'flymake-goto-next-error)                    ; 前往下一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e d p")                        'flymake-goto-prev-error)                    ; 前往上一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e d g")                        'flymake-goto-diagnostic)                    ; 前往diagnostic诊断信息
(global-set-key (kbd "C-c e d c")                        'eglot-code-actions)                         ; 进行代码行动
(global-set-key (kbd "C-c e d r")                        'eglot-rename)                               ; 重命名相同名称的symbol符号
(global-set-key (kbd "C-c e d f d")                      'eglot-find-declaration)                     ; 寻找declaration声明
(global-set-key (kbd "C-c e d f x")                      'xref-find-definitions)                      ; 寻找来源(放在哪一行内)definitions定义(默认xref快捷键: M-.)
(global-set-key (kbd "C-c e d f r")                      'xref-find-references)                       ; 寻找出处(放在哪个文件内)references引用(默认xref快捷键: M-?)
(global-set-key (kbd "C-c e d f i")                      'eglot-find-implementation)                  ; 寻找implementation执行
(global-set-key (kbd "C-c e d f t")                      'eglot-find-typeDefinition)                  ; 寻找typeDefinition类型定义


;; ===============================================
;; 关于eshell
;; ===============================================
(global-set-key (kbd "C-c t o o o")                      'eshell)                                     ; 开启eshell终端模拟器


;; ===============================================
;; 关于buffer
;; ===============================================
(global-set-key (kbd "C-x C-b")                          'ibuffer)                                    ; 用ibuffer(built-in)代替原生的C-x C-b


;; ===============================================
;; deadgrep相关
;; ===============================================
(global-set-key (kbd "C-c r o")                          'deadgrep)                                   ; 打开deapgrep


;; ===============================================
;; 关于magit版本控制
;; ===============================================
(global-set-key (kbd "C-c g o")                          'magit)                                      ; 打开magit


;; ===============================================
;; 关于括号匹配
;; ===============================================
(global-set-key (kbd "C-c C-z C-n")                      'forward-list)                               ; 向后一组括号
(global-set-key (kbd "C-c C-z C-p")                      'backward-list)                              ; 向前一组括号
(global-set-key (kbd "C-c C-z C-b")                      'backward-up-list)                           ; 向上一组括号
(global-set-key (kbd "C-c C-z C-f")                      'down-list)                                  ; 向下一组括号


;; ===============================================
;; 关于编辑增强
;; ===============================================
(global-set-key (kbd "C-=")                              'custom-duplicate-line)                      ; 复制当前行到下一行并保持光标水平位置不变
(global-set-key (kbd "C-\\")                             'embark-act)                                 ; 增强原始工作流embark
(global-set-key (kbd "M-s")                              'consult-line)                               ; C-s搜索


;; ===============================================
;; 关于emacs-lisp-mode
;; ===============================================
(define-key emacs-lisp-mode-map (kbd "C-c C-x C-e")      'custom-eval-elisp-sexp)                     ; C-cxe快速计算lisp式子


;; ===============================================
;; 关于org-mode
;; ===============================================
(define-key org-mode-map (kbd "C-c C-x C-0")             'valign-mode)                                ; 切换valign-mode
(define-key org-mode-map (kbd "C-c C-x C-a")             'org-agenda)                                 ; 当前文件放进org议题内
(define-key org-mode-map (kbd "C-c C-x C-.")             'org-metaright)                              ; 用 C-z C-x C-. 替代原本的 Meta+<right>
(define-key org-mode-map (kbd "C-c C-x C-,")             'org-metaleft)                               ; 用 C-z C-x C-, 替代原本的 Meta+<left>
(define-key org-mode-map (kbd "C-c C-x C-=")             'org-shiftright)                             ; 用 C-z C-x C-= 替代原本的 Shift+<right>
(define-key org-mode-map (kbd "C-c C-x C--")             'org-shiftleft)                              ; 用 C-z C-x C-- 替代原本的 Shift+<left>
(define-key org-mode-map (kbd "C-c C-x C-v")             'custom-toggle-inline-images-with-valign)    ; 用 C-z C-x C-v 避免valign-mode造成的对齐卡顿来预览图片


;; ===============================================
;; 关于PDFView
;; ===============================================
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


;; ===============================================
;; 关于Dashboard
;; ===============================================
(define-key dashboard-mode-map       (kbd "p")           'dashboard-previous-line)
(define-key dashboard-mode-map       (kbd "n")           'dashboard-next-line)
(define-key dashboard-mode-map       (kbd "j")           nil)
(define-key dashboard-mode-map       (kbd "k")           nil)


(provide 'key-keybindings)
