;; 
;; init-keybindings.el 全局快捷键设置
;; 

;; -- 全局Buffer管理 --
(global-set-key (kbd "C-c C-<up>")         'next-buffer)
(global-set-key (kbd "C-c C-<down>")       'previous-buffer)

;; -- plug-centaur-tabs.el 局部Buffer管理 --
(global-set-key (kbd "C-c C-<left>")       'centaur-tabs-backward)
(global-set-key (kbd "C-c C-<right>")      'centaur-tabs-forward)
(global-set-key (kbd "C-c C-<return>")     'centaur-tabs--create-new-tab)

;; -- 切换theme主题管理 --
(global-set-key (kbd "C-c d 1")
                (lambda () (interactive)
                  (disable-theme  'nano-light)
                  (disable-theme  'ample)
                  (disable-theme  'bliss)
                  (load-theme     'ample-flat t)))
(global-set-key (kbd "C-c d 2")
                (lambda () (interactive)
                  (disable-theme  'nano-light)
                  (disable-theme  'ample-flat)
                  (disable-theme  'bliss)                  
                  (load-theme     'ample t)))
(global-set-key (kbd "C-c d 3")
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

;; -- 窗口window管理 --
(global-set-key (kbd "C-c w l")                               ;; 开启向右分屏的1个空白初始页
                (lambda () (interactive)                     
                  (split-window-right)                       
                  (windmove-right)                           
                  (switch-to-buffer "初始页")))               ;; 关闭向右分屏的1个空白初始页
(global-set-key (kbd "C-c w x")                              
                (lambda () (interactive)                     
                  (kill-buffer "初始页")                     
                  (delete-other-windows)))                   
(global-set-key (kbd "C-c w <right>")                         ;; 向右(forward)分屏的1个当前buffer
                (lambda () (interactive)                      ;;    > 只有 split-window-right
                  (split-window-right)                        ;;    > 只有 split-window-below
                  (windmove-right)))                         
(global-set-key (kbd "C-c w <down>")                          ;; 向下(next)分屏的1个当前buffer
                (lambda () (interactive)                      ;;    > 只有 split-window-right
                  (split-window-below)                        ;;    > 只有 split-window-below
                  (windmove-down)))
(global-set-key (kbd "C-c k")            'delete-window)      ;; kill掉当前光标所在的window

;; -- 选区MarkSet管理 --
(global-set-key (kbd "C-c v")            'set-mark-command)   ;; 进入MarkSet(开始框选)

;; -- emacs-mode-style 分屏 --
(global-set-key (kbd "C-c f")            'windmove-right)     ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c b")            'windmove-left)      ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c n")            'windmove-down)      ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c p")            'windmove-up)        ;; emacs-mode-style 分屏

;; -- package.el 管理packages --
;; (global-set-key (kbd "M-f")           'list-packages)

;; -- plug-restart-emacs.el 重启GNU Emacs --
(global-set-key (kbd "M-r")              'restart-emacs)      ;; 原本M-r绑定的是 move-to-window-line-top-bottom

;; -- 老色批客户端eglot --
(global-set-key (kbd "M-s")              'eglot)

;; -- 文件管理器dirvish --
(global-set-key (kbd "C-c d o")          'dirvish-side)
(global-set-key (kbd "C-c d q")          'dirvish-quit)
(global-set-key (kbd "C-c d g")          'dirvish)

;; -- 移动光标 --
;; 移动到顶部，可以通过 M-g g + 移动到的目标行(M-x goto-line + 移动到的目标行) 来完成
;; 移动到底部，可以通过 M-g g + 移动到的目标行(M-x goto-line + 移动到的目标行) 来完成
(global-set-key (kbd "M-n")            'move-next-five-line)        ;; 光标向下移动5行
(global-set-key (kbd "M-p")            'move-prev-five-line)        ;; 光标向上移动5行

;; -- eglot相关 --
(global-set-key (kbd "C-c s o")        'flymake-show-diagnostic)    ;; 通过flymake(built-in)，给eglot提供diagnostic诊断信息
(global-set-key (kbd "C-c s n")        'flymake-goto-next-error)    ;; 前往下一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c s p")        'flymake-goto-prev-error)    ;; 前往上一个错误(会用波浪线来展示错误的)
(global-set-key (kbd "C-c s g")        'flymake-goto-diagnostic)    ;; 前往diagnostic诊断信息
(global-set-key (kbd "C-c s c")        'eglot-code-actions)         ;; 进行代码行动
(global-set-key (kbd "C-c s r")        'eglot-rename)               ;; 重命名相同名称的symbol符号
;; (global-set-key (kbd "M-.")         'xref-find-definitions)      ;; 寻找definitions定义(默认xref快捷键: M-.)
;; (global-set-key (kbd "M-?")         'xref-find-references)       ;; 寻找references引用(默认xref快捷键: M-?)
(global-set-key (kbd "C-c g d")        'eglot-find-declaration)     ;; 寻找declaration声明
(global-set-key (kbd "C-c g i")        'eglot-find-implementation)  ;; 寻找implementation执行
(global-set-key (kbd "C-c g t")        'eglot-find-typeDefinition)  ;; 寻找typeDefinition类型定义

;; -- helm相关 -- 
(global-set-key (kbd "M-x")            'helm-M-x)                   ;; 用helm的M-x，代替了原生的M-x(比Emacs 29.3的M-x，多了历史history-commands的功能)
(global-set-key (kbd "C-x r b")        'helm-filtered-bookmarks)    ;; 用helm的helm-filtered-bookmarks，代替原生的filtered-bookmarks
(global-set-key (kbd "C-x C-f")        'helm-find-files)            ;; 用helm的helm-find-files，代替原生的find-files

;; -- org相关 --
(global-set-key (kbd "C-c h o")        'org-preview-html-mode)      ;; 开启org的html预览模式

;; -- ansi-term相关 --
(global-set-key (kbd "C-c t o")        'ansi-term)                  ;; 开启ansi-term终端模拟器

;; -- buffer相关 --
(global-set-key (kbd "C-x C-b")        'ibuffer)                    ;; 用ibuffer(built-in)代替原生的C-x C-b

;; -- 软屏蔽相关 --
(global-unset-key (kbd "C-\\"))                                     ;; 软屏蔽emacs-rime，原本C-\绑定的是 toggle-input-method 
                                                                    ;;      > 因为现在发现用系统的fcitx5也是可以的
                                                                    ;;      > 可能只是我个人养成习惯了
                                                                    ;;      > 但必须要说的是
                                                                    ;;      > 狗哥做的emacs-rime与佛振的rime确实很厉害
                                                                    ;; 
(global-unset-key (kbd "C-z"))                                      ;; 软屏蔽suspend-emacs，(在emacs-GUI下重新启动要M-!来打开同步版的Shell，然后输入%emacs来恢复启动)

;; -- magit相关 --
(global-set-key (kbd "C-c g o")        'magit)

(provide 'init-keybindings)
