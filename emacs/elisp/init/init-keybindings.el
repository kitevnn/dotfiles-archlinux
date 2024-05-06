;; 
;; init-keybindings.el 全局快捷键设置
;; 

;; -- 全局Buffer管理 --
(global-set-key (kbd "C-c <up>")         'next-buffer)
(global-set-key (kbd "C-c <down>")       'previous-buffer)

;; -- 切换theme主题管理 --
(global-set-key (kbd "C-c d 1")
                (lambda () (interactive)
                  (disable-theme  'ample)
                  (load-theme     'ample-flat t)))
(global-set-key (kbd "C-c d 2")
                (lambda () (interactive)
                  (disable-theme  'ample-flat)
                  (load-theme     'ample t)))
(global-set-key (kbd "C-c l 1")
                (lambda () (interactive)
                  (disable-theme  'ample)
                  (disable-theme  'ample-flat)
                  (load-theme     'nano-light t)))

;; -- 窗口window管理 --
(global-set-key (kbd "C-c w l")                   ;; 开启向右分屏的1个空白初始页
                (lambda () (interactive)
                  (split-window-right)
                  (windmove-right)
                  (switch-to-buffer "初始页")))   ;; 关闭向右分屏的1个空白初始页
(global-set-key (kbd "C-c w x")
                (lambda () (interactive)
                  (kill-buffer "初始页")
                  (delete-other-windows)))


;; -- emacs-mode-style 分屏 --
(global-set-key (kbd "C-c f")            'windmove-right)     ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c b")            'windmove-left)      ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c n")            'windmove-down)      ;; emacs-mode-style 分屏
(global-set-key (kbd "C-c p")            'windmove-up)        ;; emacs-mode-style 分屏

;; -- package.el 管理packages --
(global-set-key (kbd "M-f")              'list-packages)

;; -- plug-centaur-tabs.el 局部Buffer管理 --
(global-set-key (kbd "C-c <left>")       'centaur-tabs-backward)
(global-set-key (kbd "C-c <right>")      'centaur-tabs-forward)

;; -- plug-restart-emacs.el 重启GNU Emacs --
(global-set-key (kbd "M-l")              'restart-emacs)

;; -- 老色批客户端eglot --
(global-set-key (kbd "M-s")              'eglot)

;; -- 文件管理器dirvish --
(global-set-key (kbd "C-c d o")          'dirvish-side)
(global-set-key (kbd "C-c d q")          'dirvish-quit)

(provide 'init-keybindings)
