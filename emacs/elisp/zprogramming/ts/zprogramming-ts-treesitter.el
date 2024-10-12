;; ===============================================
;; 静态语法抽象树 zprogramming-ts-treesitter.el 
;; ===============================================
(use-package tree-sitter
             :ensure t)  ; M-x tree-sitter-debug-mode    : 查看语法树
                         ; M-x tree-sitter-query-builder : 与树队列(Tree Queries)一起玩

(use-package tree-sitter-langs
             :ensure t)


(provide 'zprogramming-ts-treesitter)
