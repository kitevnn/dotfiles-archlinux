;; 
;; 自定义快捷键 key-keybindings.el
;; 

;; 关于软屏蔽                                                                  
(global-unset-key (kbd "C-\\"))                                               ; 屏蔽C-\ (原功能: 切换GNU Emacs输入法)
(global-unset-key (kbd "C-z"))                                                ; 屏蔽C-z (原功能: 挂起)

;; 全局Buffer管理
(global-set-key (kbd "C-c t p")         'next-buffer)                         ; 跳转到下一个全局Buffer
(global-set-key (kbd "C-c t n")         'previous-buffer)                     ; 跳转到上一个全局Buffer
                                                                              
;; 局部Buffer管理                                                             
(global-set-key (kbd "C-c t b")         'centaur-tabs-backward)               ; 跳转到上一个局部Buffer
(global-set-key (kbd "C-c t f")         'centaur-tabs-forward)                ; 跳转到下一个局部Buffer
(global-set-key (kbd "C-c t c")         'centaur-tabs--create-new-tab)        ; 创建新的Buffer
(global-set-key (kbd "C-c t j")         'centaur-tabs-ace-jump)               ; 跳转到特定Buffer
                                                                               
;; 主题管理                                                                    
(global-set-key (kbd "C-c l 1")         'toggle-light-theme)                   ; 切换主题到nano-light
                                                                               
;; 窗口管理                                                                    
(global-set-key (kbd "C-c k")           'delete-window)                       ; 关闭当前窗口
(global-set-key (kbd "C-c f")           'windmove-right)                      ; 光标跳转到右边窗口
(global-set-key (kbd "C-c b")           'windmove-left)                       ; 光标跳转到左边窗口
(global-set-key (kbd "C-c n")           'windmove-down)                       ; 光标跳转到下边窗口
(global-set-key (kbd "C-c p")           'windmove-up)                         ; 光标跳转到上边窗口
                                                                              
;; 选区管理                                                                   
(global-set-key (kbd "C-c v")           'set-mark-command)                    ; 进入单行选区
(global-set-key (kbd "C-c SPC")         'rectangle-mark-mode)                 ; 进入矩形选区
                                                                       
;; 调整屏幕
(global-set-key (kbd "M--")             'resize-top-five-unit)                ; 当前窗口向上调整5个单位
(global-set-key (kbd "M-=")             'resize-bottom-five-unit)             ; 当前窗口向下调整5个单位
(global-set-key (kbd "M-9")             'resize-left-five-unit)               ; 当前窗口向左调整5个单位
(global-set-key (kbd "M-0")             'resize-right-five-unit)              ; 当前窗口向右调整5个单位

;; 重启GNU Emacs
(global-set-key (kbd "M-r")             'restart-emacs)                       ; 重启GNU Emacs
                                                                              
;; 文件管理器dirvish                                                          
(global-set-key (kbd "C-c d o")         'dirvish-side)                        ; 左侧打开dirvish
(global-set-key (kbd "C-c d q")         'dirvish-quit)                        ; 退出关闭dirvish
(global-set-key (kbd "C-c d g")         'dirvish)                             ; 全局打开dirvish
                                                                              
;; 移动光标                                                                   
(global-set-key (kbd "M-n")             'move-next-five-lines)                ; 光标向下移动5行
(global-set-key (kbd "M-p")             'move-prev-five-lines)                ; 光标向上移动5行
                                                                              
;; 关于eglot                                                                  
(global-set-key (kbd "C-c e o")         'eglot)                               ; 开启
(global-set-key (kbd "C-c e r")         'eglot-reconnect)                     ; 重连
(global-set-key (kbd "C-c e s")         'eglot-shutdown)                      ; 关闭
(global-set-key (kbd "C-c e d s")       'flymake-show-diagnostic)             ; 通过flymake(built-in)，给eglot提供diagnostic诊断信息
(global-set-key (kbd "C-c e d n")       'flymake-goto-next-error)             ; 前往下一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e d p")       'flymake-goto-prev-error)             ; 前往上一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e d g")       'flymake-goto-diagnostic)             ; 前往diagnostic诊断信息
(global-set-key (kbd "C-c e d c")       'eglot-code-actions)                  ; 进行代码行动
(global-set-key (kbd "C-c e d r")       'eglot-rename)                        ; 重命名相同名称的symbol符号
(global-set-key (kbd "C-c e d f d")     'eglot-find-declaration)              ; 寻找declaration声明
(global-set-key (kbd "C-c e d f x")     'xref-find-definitions)               ; 寻找来源(放在哪一行内)definitions定义(默认xref快捷键: M-.)
(global-set-key (kbd "C-c e d f r")     'xref-find-references)                ; 寻找出处(放在哪个文件内)references引用(默认xref快捷键: M-?)
(global-set-key (kbd "C-c e d f i")     'eglot-find-implementation)           ; 寻找implementation执行
(global-set-key (kbd "C-c e d f t")     'eglot-find-typeDefinition)           ; 寻找typeDefinition类型定义
                                                                              
;; 关于helm                                                                   
(global-set-key (kbd "M-x")             'helm-M-x)                            ; 用helm的M-x，代替了原生的M-x(比Emacs 29.3的M-x，多了历史history-commands的功能)
(global-set-key (kbd "C-x r b")         'helm-filtered-bookmarks)             ; 用helm的helm-filtered-bookmarks，代替原生的filtered-bookmarks
(global-set-key (kbd "C-x C-f")         'helm-find-files)                     ; 用helm的helm-find-files，代替原生的find-files
                                                                              
;; 关于org                                                                    
(global-set-key (kbd "C-c h o")         'org-preview-html-mode)               ; 开启org的html预览模式
(global-set-key (kbd "C-c C-x C-.")     'org-metaright)                       ; 用 C-z C-x C-. 替代原本的 Meta+<right>
(global-set-key (kbd "C-c C-x C-,")     'org-metaleft)                        ; 用 C-z C-x C-, 替代原本的 Meta+<left>
(global-set-key (kbd "C-c C-x C-=")     'org-shiftright)                      ; 用 C-z C-x C-= 替代原本的 Shift+<right>
(global-set-key (kbd "C-c C-x C--")     'org-shiftleft)                       ; 用 C-z C-x C-- 替代原本的 Shift+<left>
                                                                              
;; 关于ansi-term                                                              
(global-set-key (kbd "C-c t o o o")     'ansi-term)                           ; 开启ansi-term终端模拟器
                                                                              
;; 关于buffer                                                                 
(global-set-key (kbd "C-x C-b")         'ibuffer)                             ; 用ibuffer(built-in)代替原生的C-x C-b
                                                                              
;; deadgrep相关
(global-set-key (kbd "C-c r o")         'deadgrep)                            ; 打开deapgrep
                                                                              
;; 关于magit版本控制 --                                                    
(global-set-key (kbd "C-c g o")         'magit)                               ; 打开magit
                                                                              
;; 关于org议题                                                             
(global-set-key (kbd "C-c C-z a")       'org-agenda)                          ; 当前文件放进org议题内
                                                                              
;; 关于括号匹配                                                               
(global-set-key (kbd "C-c C-z C-n")     'forward-list)                        ; 向后一组括号
(global-set-key (kbd "C-c C-z C-p")     'backward-list)                       ; 向前一组括号
(global-set-key (kbd "C-c C-z C-b")     'backward-up-list)                    ; 向上一组括号
(global-set-key (kbd "C-c C-z C-f")     'down-list)                           ; 向下一组括号
                                                                               
;; 关于lisp计算子
(define-key emacs-lisp-mode-map (kbd "C-c C-x C-e") 'eval-elisp-sexp)         ; C-cxe快速计算lisp式子

;; 关于编辑增强
(global-set-key (kbd "C-<down>")                    'duplicate-line)          ; 复制当前行到下一行并保持光标水平位置不变


(provide 'key-keybindings)
