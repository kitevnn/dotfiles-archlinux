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
(require 'enhance-helm)
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
(require 'note-auctex)
(require 'note-orgmode)
(require 'zprogramming-cmp-corfu)
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-snips-yasnippet)
(require 'zprogramming-ts-treesitter)
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
   '(auctex cdlatex centaur-tabs corfu dashboard dirvish helm
            highlight-indent-guides keycast magit nano-theme
            nerd-icons-completion nerd-icons-corfu nerd-icons-dired pdf-tools
            restart-emacs smartparens tree-sitter-langs valign vundo
            yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
