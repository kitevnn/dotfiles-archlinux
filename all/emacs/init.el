;; =======================================
;; 
;; 路径加载
;; 
;; =======================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/basic")))
(require 'basic-path)
(require 'basic-file)


;; =======================================
;; 
;; 模块加载
;; 
;; =======================================
(require 'custom-defun)
(require 'basic-elpa)
(require 'basic-init)
(require 'basic-mode)
(require 'enhance-cdlatex)
(require 'enhance-deadgrep)
(require 'enhance-dirvish)
(require 'enhance-minibuffer)
(require 'enhance-indentline)
(require 'enhance-magit)
(require 'enhance-pdftools)
(require 'enhance-restart)
(require 'enhance-smartparens)
(require 'enhance-tabs)
(require 'enhance-term)
(require 'enhance-history)
(require 'ui-font-sauce)
(require 'ui-icon-nerdfont)
(require 'ui-theme-light)
(require 'ui-theme-dark)
(require 'ui-decorate-dashboard)
(require 'ui-modeline-bar)
(require 'note-auctex)
(require 'note-orgmode)
(require 'note-orgroam)
(require 'zprogramming-cmp-corfu)
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-snips-yasnippet)
(require 'zprogramming-ts-treesitter)
(require 'zprogramming-mode-cmake)
(require 'im-telega)
(require 'key-keybindings)

;; =======================================
;; 
;; 钩子加载
;; 
;; =======================================
(require 'hooks-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5"
     "3001510be1be4a38508ff07633e97b810c0a52c6fa2f4c7153d22cc7596d9172"
     "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(package-selected-packages
   '(auctex bliss-theme cdlatex centaur-tabs cmake-mode corfu dashboard deadgrep
            dirvish eat embark-consult highlight-indent-guides magit marginalia
            nano-theme nerd-icons-corfu nerd-icons-dired nerd-icons-ibuffer
            orderless org org-roam-ui pdf-tools pkg-info posframe
            rainbow-identifiers restart-emacs smartparens telega
            tree-sitter-langs valign vertico vertico-posframe yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
