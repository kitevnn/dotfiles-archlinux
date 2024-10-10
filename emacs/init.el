;; ===============================================
;; 
;; init.el 启动入口文件
;; 
;; ===============================================

;; ===============================================
;; 关于源
;; ===============================================
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


;; ===============================================
;; add-to-list - 关于add-to-list的加载配置目录
;; ===============================================
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
              (concat user-emacs-directory "elisp/zprogramming/lsp")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/ts")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/key")))
;; ===============================================
;; 关于add-to-list的模式识别
;; ===============================================
(add-to-list 'auto-mode-alist '("\\.el\\'"  . emacs-lisp-mode))  ; 根据文件后缀自动设置mode


;; ===============================================
;; 关于require与provide1
;; ===============================================
(require 'custom-fn)
(require 'init-basic)
(require 'ui-theme-light)
(require 'ui-icon-icons)
(require 'ui-decorate-dashboard)
(require 'enhance-cdlatex)
(require 'enhance-deadgrep)
(require 'enhance-dirvish)
(require 'enhance-indentline)
(require 'enhance-keystroke)
(require 'enhance-magit)
(require 'enhance-restart)
(require 'enhance-smartparens)
(require 'enhance-tabs)
(require 'enhance-unre)
(require 'enhance-pdftools)
(require 'enhance-minibuffer)
(require 'enhance-corfu)
(require 'note-auctex)
(require 'note-orgmode)
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-ts-treesitter)
(require 'key-keybindings)


;; ===============================================
;; 添加主题的哈希到安全主题列表
;; ===============================================
(add-to-list 'custom-safe-themes "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02")
(load-theme 'nano-light t)


;; ===============================================
;; corfu的图标
;; ===============================================
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)


;; ===============================================
;; 关于add-hook钩子
;; ===============================================
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
(add-hook 'LaTeX-mode-hook #'cdlatex-mode)                  ; 在LaTeX-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'org-mode-hook #'valign-mode)                     ; 在org-mode使用valign对齐不等宽字体


;; ===============================================
;; 关于require与provide2
;; ===============================================
(require 'custom-after)


;; ===============================================
;; 自动append加上的
;; ===============================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(custom-safe-themesdefault
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(package-selected-packages
   '(auctex cape cdlatex centaur-tabs company consult corfu dashboard deadgrep
            dirvish eglot embark embark-consult highlight-indent-guides keycast
            magit marginalia nano-theme nerd-icons-completion nerd-icons-corfu
            nerd-icons-dired orderless org pdf-tools restart-emacs smartparens
            tree-sitter-langs valign vertico vundo wfnames yasnippet-snippets))
 '(package-vc-selected-packages
   '((eglot-booster :vc-backend Git :url
                    "https://github.com/jdtsmith/eglot-booster"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
