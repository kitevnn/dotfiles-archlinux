;; 
;; plug-treesitter.el 静态语法抽象树TS
;; 

;; M-x tree-sitter-debug-mode      :  查看语法树
;; M-x tree-sitter-query-builder   :  与树队列(Tree Queries)一起玩
(use-package tree-sitter
             :ensure t
            
             ;; 开启所有tree-sitter支持的语言
             ;; :init
             ;; (global-tree-sitter-mode 1)

             ;; 分别开启tree-sitter支持的语言
             :hook
             ;; PL-C
             (c-mode        .    tree-sitter-mode)
             (c-mode        .    tree-sitter-hl-mode)

             ;; PL-Cpp      
             (c++-mode      .    tree-sitter-mode)
             (c++-mode      .    tree-sitter-hl-mode)

             ;; PL-Go       
             (go-mode       .    tree-sitter-mode)
             (go-mode       .    tree-sitter-hl-mode)

             ;; PL-cs       
             (csharp-mode   .    tree-sitter-mode)
             (csharp-mode   .    tree-sitter-hl-mode)

             ;; PL-rust     
             (rust-mode     .    tree-sitter-mode)
             (rust-mode     .    tree-sitter-hl-mode))

(use-package tree-sitter-langs
             :ensure t)

(provide 'plug-treesitter)
