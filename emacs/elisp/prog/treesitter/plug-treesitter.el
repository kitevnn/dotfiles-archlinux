;; 
;; plug-treesitter.el 静态语法抽象树TS
;; 

(use-package tree-sitter
             :ensure t
             :init
             (global-tree-sitter-mode 1))

(use-package tree-sitter-langs
             :ensure t)

(provide 'plug-treesitter)
