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
;; 关于require与provide
;; ===============================================
(require 'custom-fn)                    ; 自定义函数
(require 'init-basic)                   ; 基本设置
(require 'ui-theme-light)              
(require 'ui-icon-icons)               
(require 'ui-decorate-dashboard)        ; ui设置
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
(require 'enhance-helm)
(require 'enhance-corfu)                ; 编辑增强           
(require 'note-auctex)                 
(require 'note-orgmode)                 ; 笔记相关
(require 'zprogramming-lsp-eglot)
(require 'zprogramming-ts-treesitter)   ; 编程相关
(require 'key-keybindings)              ; 按键绑定
(require 'custom-hooks)                 ; 钩子设置
(require 'custom-after)                 ; 必须要加载的设置


;; ===============================================
;; 自动append加上的
;; ===============================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex cape cdlatex centaur-tabs company corfu dashboard deadgrep dirvish
            eglot helm highlight-indent-guides keycast magit nano-theme
            nerd-icons-completion nerd-icons-corfu nerd-icons-dired org
            pdf-tools restart-emacs smartparens tree-sitter-langs valign vertico
            vundo wfnames yasnippet-snippets))
 '(package-vc-selected-packages
   '((eglot-booster :vc-backend Git :url
                    "https://github.com/jdtsmith/eglot-booster"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
