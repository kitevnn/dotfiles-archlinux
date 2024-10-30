;; ===============================================
;; 
;; 路径加载
;; 
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/basic")))
(require 'basic-path)


;; ===============================================
;; 
;; 模块加载
;; 
;; ===============================================
(require 'custom-defun)
(require 'basic-elpa)
(require 'basic-init)
(require 'basic-mode)
(require 'enhance-cdlatex)
(require 'enhance-deadgrep)
(require 'enhance-dirvish)
(require 'enhance-minibuffer)
(require 'enhance-indentline)
(require 'enhance-keystroke)
(require 'enhance-magit)
(require 'enhance-pdftools)
(require 'enhance-restart)
(require 'enhance-smartparens)
(require 'enhance-tabs)
(require 'enhance-unre)
(require 'ui-font-sauce)
(require 'ui-icon-nerdfont)
(require 'ui-theme-light)
(require 'ui-decorate-dashboard)
(require 'ui-modeline-bar)
(require 'note-auctex)
(require 'note-orgmode)
(require 'note-orgroam)
(require 'zprogramming-cmp-corfu)
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-snips-yasnippet)
(require 'zprogramming-ts-treesitter)
(require 'im-telega)
(require 'key-keybindings)

;; ===============================================
;; 
;; 钩子加载
;; 
;; ===============================================
(require 'hooks-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex cdlatex centaur-tabs corfu dashboard dirvish embark-consult helm
            highlight-indent-guides keycast magit marginalia nano-theme
            nerd-icons-completion nerd-icons-corfu nerd-icons-dired orderless
            org-roam-ui pdf-tools restart-emacs smartparens telega
            tree-sitter-langs valign vertico vundo yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
