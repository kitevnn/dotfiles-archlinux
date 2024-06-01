;; 
;; init-keybindings.el 全局快捷键设置
;; 

;; -- 全局Buffer管理 --
(global-set-key (kbd "C-c t p")         'next-buffer)
(global-set-key (kbd "C-c t n")         'previous-buffer)

;; -- 局部Buffer管理 --
(global-set-key (kbd "C-c t b")         'centaur-tabs-backward)
(global-set-key (kbd "C-c t f")         'centaur-tabs-forward)
(global-set-key (kbd "C-c t o")         'centaur-tabs--create-new-tab)

;; -- 切换theme主题管理 --
(global-set-key (kbd "C-c d 1")
                (lambda () (interactive)
                  (disable-theme  'nano-light)
                  (disable-theme  'ample)
                  (disable-theme  'ample-flat)
                  (load-theme     'bliss t)))
(global-set-key (kbd "C-c l 1")
                (lambda () (interactive)
                  (disable-theme  'ample)
                  (disable-theme  'ample-flat)
                  (disable-theme  'bliss)
                  (load-theme     'nano-light t)))

;; -- 窗口window管理: 分离window -- 
(global-set-key (kbd "C-c w f")                                         ; 向右(forward)分屏的1个当前buffer
                (lambda () (interactive)                                ;    > 只有 split-window-right
                  (split-window-right)                                  ;    > 只有 split-window-below
                  (windmove-right)))                                   
(global-set-key (kbd "C-c w n")                                         ; 向下(next)分屏的1个当前buffer
                (lambda () (interactive)                                ;    > 只有 split-window-right
                  (split-window-below)                                  ;    > 只有 split-window-below
                  (windmove-down)))                                    
                                                                       
;; -- 窗口window管理: 关闭window --                                    
(global-set-key (kbd "C-c k")            'delete-window)                ; kill掉当前光标所在的window
                                                                       
;; -- 选区MarkSet管理 --                                               
(global-set-key (kbd "C-c v")            'set-mark-command)             ; 进入MarkSet(单行选择)
(global-set-key (kbd "C-c SPC")          'rectangle-mark-mode)          ; 进入MarkSet(矩形选择)
                                                                       
;; -- emacs-mode-style 分屏 --                                         
(global-set-key (kbd "C-c f")            'windmove-right)               ; emacs-mode-style 分屏
(global-set-key (kbd "C-c b")            'windmove-left)                ; emacs-mode-style 分屏
(global-set-key (kbd "C-c n")            'windmove-down)                ; emacs-mode-style 分屏
(global-set-key (kbd "C-c p")            'windmove-up)                  ; emacs-mode-style 分屏

;; -- package.el 管理packages --
;; (global-set-key (kbd "M-f")           'list-packages)

;; -- plug-restart-emacs.el 重启GNU Emacs --
(global-set-key (kbd "M-r")              'restart-emacs)                ; 原本M-r绑定的是 move-to-window-line-top-bottom


;; -- 文件管理器dirvish --
(global-set-key (kbd "C-c d o")          'dirvish-side)
(global-set-key (kbd "C-c d q")          'dirvish-quit)
(global-set-key (kbd "C-c d g")          'dirvish)

;; -- 移动光标 --
;; 移动到顶部，可以通过 M-g g + 移动到的目标行(M-x goto-line + 移动到的目标行) 来完成
;; 移动到底部，可以通过 M-g g + 移动到的目标行(M-x goto-line + 移动到的目标行) 来完成
(global-set-key (kbd "M-n")              'move-next-five-line)          ; 光标向下移动5行
(global-set-key (kbd "M-p")              'move-prev-five-line)          ; 光标向上移动5行

;; -- eglot相关 --
(global-set-key (kbd "C-c e o")          'eglot)
(global-set-key (kbd "C-c e s")          'flymake-show-diagnostic)      ; 通过flymake(built-in)，给eglot提供diagnostic诊断信息
(global-set-key (kbd "C-c e n")          'flymake-goto-next-error)      ; 前往下一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e p")          'flymake-goto-prev-error)      ; 前往上一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c e g")          'flymake-goto-diagnostic)      ; 前往diagnostic诊断信息
(global-set-key (kbd "C-c e c")          'eglot-code-actions)           ; 进行代码行动
(global-set-key (kbd "C-c e r")          'eglot-rename)                 ; 重命名相同名称的symbol符号
(global-set-key (kbd "C-c e f d")        'xref-find-definitions)        ; 寻找来源(放在哪一行内)definitions定义(默认xref快捷键: M-.)
(global-set-key (kbd "C-c e f g d")      'eglot-find-declaration)       ; 寻找declaration声明
(global-set-key (kbd "C-c e f r")        'xref-find-references)         ; 寻找出处(放在哪个文件内)references引用(默认xref快捷键: M-?)
(global-set-key (kbd "C-c e f i")        'eglot-find-implementation)    ; 寻找implementation执行
(global-set-key (kbd "C-c e f t")        'eglot-find-typeDefinition)    ; 寻找typeDefinition类型定义
                                                                        
;; -- helm相关 --                                                       
(global-set-key (kbd "M-x")              'helm-M-x)                     ; 用helm的M-x，代替了原生的M-x(比Emacs 29.3的M-x，多了历史history-commands的功能)
(global-set-key (kbd "C-x r b")          'helm-filtered-bookmarks)      ; 用helm的helm-filtered-bookmarks，代替原生的filtered-bookmarks
(global-set-key (kbd "C-x C-f")          'helm-find-files)              ; 用helm的helm-find-files，代替原生的find-files
                                                                        
;; -- org相关 --                                                        
(global-set-key (kbd "C-c h o")          'org-preview-html-mode)        ; 开启org的html预览模式
(global-set-key (kbd "C-c C-x C-.")      'org-metaright)                ; 用 C-z C-x C-. 替代原本的 Meta+<right>
(global-set-key (kbd "C-c C-x C-,")      'org-metaleft)                 ; 用 C-z C-x C-, 替代原本的 Meta+<left>
(global-set-key (kbd "C-c C-x C-=")      'org-shiftright)               ; 用 C-z C-x C-= 替代原本的 Shift+<right>
(global-set-key (kbd "C-c C-x C--")      'org-shiftleft)                ; 用 C-z C-x C-- 替代原本的 Shift+<left>
                                                                        
;; -- ansi-term相关 --                                                  
;; (global-set-key (kbd "C-c t o")       'ansi-term)                    ; 开启ansi-term终端模拟器
                                                                        
;; -- buffer相关 --                                                     
(global-set-key (kbd "C-x C-b")          'ibuffer)                      ; 用ibuffer(built-in)代替原生的C-x C-b
                                                                        
;; -- 软屏蔽相关 --                                                     
(global-unset-key (kbd "C-\\"))                                         ; 软屏蔽emacs-rime，原本C-\绑定的是 toggle-input-method 
                                                                        ;      > 因为现在发现用系统的fcitx5也是可以的
                                                                        ;      > 可能只是我个人养成习惯了
                                                                        ;      > 但必须要说的是
                                                                        ;      > 狗哥做的emacs-rime与佛振的rime确实很厉害
                                                                        ; 
(global-unset-key (kbd "C-z"))                                          ; 软屏蔽suspend-emacs，(在emacs-GUI下重新启动要M-!来打开同步版的Shell，然后输入%emacs来恢复启动)

;; -- deadgrep相关 --
(global-set-key (kbd "C-c r o")          'deadgrep)
;; (define-key deadgrep-mode-map (kbd "M-n") 'deadgrep-forward-filename)
;; (define-key deadgrep-mode-map (kbd "M-p") 'deadgrep-backward-filename)

;; -- magit相关 --
(global-set-key (kbd "C-c g o")          'magit)

;; -- org-agenda相关 --
(global-set-key (kbd "C-c a")            'org-agenda)

;; -- moving-by-parens括号匹配相关 --
(global-set-key (kbd "C-c C-z C-n")      'forward-list)
(global-set-key (kbd "C-c C-z C-p")      'backward-list)
(global-set-key (kbd "C-c C-z C-u")      'backward-up-list)
(global-set-key (kbd "C-c C-z C-d")      'down-list)

(provide 'init-keybindings)
