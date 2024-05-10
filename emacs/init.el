;; 
;; 初始化加载目录
;; 

;; -- init/初始化加载 --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/init")))

;; -- custom/活在Emacs即GTD(live-in-emacs) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/custom/live-in-emacs")))

;; -- custom/好玩的elisp函数(fun-elisp) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/custom/fun-elisp")))

;; -- enhance/体验增强加载 --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/enhance")))

;; -- icons/图标加载 --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/icons")))

;; -- note/笔记相关加载 --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/note")))

;; -- prog/编程相关加载(format) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/format")))

;; -- prog/编程相关加载(lsp) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/lsp")))

;; -- prog/编程相关加载(snippets) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/snippets")))

;; -- prog/编程相关加载(completions) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/completions")))

;; -- prog/编程相关加载(modes) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/modes")))

;; -- prog/编程相关加载(treesitter) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/prog/treesitter")))

;; -- ui/装饰相关加载(theme) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/ui/theme")))

;; -- ui/装饰相关加载(decorate) --
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/ui/decorate")))













;; 
;; 初始化加载模块
;; 

;; -- icon/图标加载 --
(require 'icon-nerdfont)

;; -- custom/活在Emacs即GTD(live-in-emacs) --
(require 'plug-pdftools)

;; -- custom/好玩的elisp函数(fun-elisp) --
(require 'defun-for-fun)

;; -- init/初始化加载 --
(require 'init-elpa)
(require 'init-basic)
(require 'init-keybindings)

;; -- note/笔记相关加载 --
(require 'note-orgmode)
(require 'note-auctex)

;; -- enhance/体验增强加载 --
(require 'plug-centaur-tabs)
(require 'plug-restart-emacs)
(require 'plug-which-key)
(require 'plug-pair-smartparens)
(require 'plug-filemanager-dirvish)
(require 'plug-show-indentline)
(require 'plug-show-keystroke)
(require 'plug-undoredo-tree)
(require 'plug-quicksearch-helm)
(require 'plug-git-magit)

;; -- ui/装饰相关加载(theme) --
(require 'theme-dark)
(require 'theme-light)

;; -- ui/装饰相关加载(decorate) --
(require 'ui-line)
(require 'ui-dashboard)

;; -- prog/编程相关加载(lsp) --
(require 'plug-lspcilent-eglot)

;; -- prog/编程相关加载(snippets) --
(require 'plug-snip-yasnippet)

;; -- prog/编程相关加载(completions) --
(require 'plug-cmp-company)

;; -- prog/编程相关加载(modes) --
(require 'plug-rust-mode)
(require 'plug-go-mode)

;; -- prog/编程相关加载(treesitter) --
(require 'plug-treesitter)



















;; -- 某次打开GNU Emacs 29.3后，自动append添加上的 --
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/une/桌面/back/archlinux/blog/BTWIUSEARCH/emacs/EMACS-USAGE-用法.org"))
 '(package-selected-packages
   '(bliss-theme org-preview-html magit keycast pdf-tools auctex go-mode vundo undo-tree highlight-indent-guides dirvish tree-sitter tree-sitter-langs rust-mode smartparens company eglot-booster yasnippet yasnippet-snippets eglot telephone-line spaceline spaceline-all-the-icons dashboard nano-theme restart-emacs centaur-tabs nerd-icons-dired nerd-icons-completion nerd-icons))
 '(package-vc-selected-packages
   '((eglot-booster :vc-backend Git :url "https://github.com/jdtsmith/eglot-booster"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
