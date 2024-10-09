;; 
;; 
;; init.el 启动入口文件
;; 
;; 

;; 
;; 关于源
;; 
(use-package package
  :init 
  (setq package-archives 
        '(("melpa" . "https://melpa.org/packages/")
          ("gnu" . "https://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (setq use-package-expand-minimally t
        use-package-verbose t)
  :autoload
  (package-initialize))


;; 
;; add-to-list
;; 
;; 关于add-to-list的加载配置目录
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/custom")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/init")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/theme")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/icon")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/decorate")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/enhance")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/note")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/snips")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/cmp")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/lsp")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/ts")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/key")))
;; 关于add-to-list的模式识别
(add-to-list 'auto-mode-alist '("\\.el\\'"  . emacs-lisp-mode))  ; 根据文件后缀自动设置mode

;;
;; require
;; 
;; 关于 require 的 custom 加载配置
(require 'custom-fn)
;; 关于 require 的 init 加载配置
(require 'init-basic)
;; 关于 require 的 ui 加载配置
(require 'ui-theme-light)
(require 'ui-icon-icons)
(require 'ui-decorate-dashboard)
;; 关于 require 的 enhance 加载配置
(require 'enhance-cdlatex)
(require 'enhance-deadgrep)
(require 'enhance-dirvish)
(require 'enhance-helm)
(require 'enhance-indentline)
(require 'enhance-keystroke)
(require 'enhance-magit)
(require 'enhance-restart)
(require 'enhance-smartparens)
(require 'enhance-tabs)
(require 'enhance-unre)
(require 'enhance-pdftools)
;; 关于 require 的 note 加载配置
(require 'note-auctex)
(require 'note-orgmode)
;; 关于 require 的 zprogramming 加载配置
(require 'zprogramming-cmp-company)
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-ts-treesitter)
;; 关于 require 的 key 加载配置
(require 'key-keybindings)


;;
;; add-hook
;;
;; 关于add-hook的钩子设置
(add-hook 'prog-mode 'hs-minor-mode)                        ; 折叠展开
(add-hook 'after-init-hook (lambda () 
    (when (get-buffer "*scratch*")
      (kill-buffer "*scratch*") 
    (when (get-buffer "*Messages*") 
      (kill-buffer "*Messages*")))))                        ; 禁用Messages与scratch
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)        ; 单行文本超出一定长度后自动虚拟换行显示(类似于set wrap)
(add-hook 'TeX-after-compilation-finished-functions         ; AUCTeX(14.0.3.2024-03-17)
          #'TeX-revert-document-buffer)
(add-hook 'org-mode-hook #'org-cdlatex-mode)                ; 在org-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'LaTeX-mode-hook #'cdlatex-mode)              ; 在LaTeX-mode使用OCDL(这是OCDL而不是CDL)

;; 添加主题的哈希到安全主题列表
(add-to-list 'custom-safe-themes "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02")
(load-theme 'nano-light t)


;; 关于 require 的 after 加载配置
(require 'custom-after)


;; 自动append加上的
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cdlatex-command-alist
   '(("te" "\\insert text{}" "\\text{?}" cdlatex-position-cursor nil nil t)))
 '(cdlatex-math-modify-alist nil)
 '(custom-safe-themes
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(custom-safe-themesdefault
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(package-selected-packages
   '(auctex cdlatex centaur-tabs company dashboard deadgrep dirvish eglot helm
            highlight-indent-guides keycast magit nano-theme
            nerd-icons-completion nerd-icons-dired org pdf-tools restart-emacs
            smartparens tree-sitter-langs vundo yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
