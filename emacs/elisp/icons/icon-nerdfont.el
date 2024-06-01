;; 
;; icon-nerdfont.el: nf图标支持
;; 

;; M-x list-packages
;; - nerd-icons               (installed)     ; 本体
;; - nerd-icons-completion    (installed)     ; nerd-icons-completion是C-d补全时，也能显示出nf-icon
;; - nerd-icons-dired         (installed)     ; nerd-icons-dired是C-x d展示dired时，也能显示出nf-icon
;; - nerd-icons-ibuffer
;; - nerd-icons-ivy-rich
;; - nerd-icons-corfu

;; 必须通过M-x nerd-icons-install-fonts该 [elisp函数]，来安装给emacs用的Symbols Nerd Font Mono字体，而不是直接使用通用的Symbols Nerd Font Mono字体)
;; 已经安装在了 ~/.local/share/fonts 上了
;; +--------------------------------------------------------+
;; | ~/.local/share/fonts/                                  |
;; |                    └── NFM.ttf                         |
;; +--------------------------------------------------------+
(use-package nerd-icons
  :ensure t
  :custom (nerd-icons-font-family "Symbols Nerd Font Mono")
)

;; - nerd-icons-completion    
;;        > (installed)
;;        > nerd-icons-completion是C-d补全时，也能显示出nf-icon(狂按TAB就能看到效果了)
(use-package nerd-icons-completion
  :ensure t
  :config
  (nerd-icons-completion-mode))

;; - nerd-icons-dired         
;;        > (installed) 
;;        > nerd-icons-dired是C-x d展示dired时，也能显示出nf-icon
(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'icon-nerdfont)
