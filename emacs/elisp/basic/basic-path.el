;; ===============================================
;; 关于路径加载 basic-path.el
;; ===============================================

;; ===============================================
;; 关于基本设置路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/basic")))
;; ===============================================
;; 关于自定义函数路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/custom")))
;; ===============================================
;; 关于体验增强路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/enhance")))
;; ===============================================
;; 关于ui路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/font")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/icon")))
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/ui/theme")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/decorate")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/ui/modeline")))
;; ===============================================
;; 关于笔记路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/note")))
;; ===============================================
;; 关于编程路径
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/zprogramming/cmp")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/lsp")))
(add-to-list 'load-path
             (expand-file-name 
               (concat user-emacs-directory "elisp/zprogramming/snips")))
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/zprogramming/ts")))
;; ===============================================
;; 关于快捷键设置
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/key")))
;; ===============================================
;; 关于快捷键设置
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/hooks")))
;; ===============================================
;; 关于instant-messaging(IM)设置
;; ===============================================
(add-to-list 'load-path
             (expand-file-name 
              (concat user-emacs-directory "elisp/im")))


(provide 'basic-path)
