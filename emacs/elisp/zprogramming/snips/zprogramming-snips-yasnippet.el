;; =======================================
;; 快速输入片段 zprogramming-snips-yasnippet.el 
;; =======================================
(use-package yasnippet
             :ensure t
             :demand
             :hook
             (LaTeX-mode . yas-global-mode))  ; 输入片段的本体工具

(use-package yasnippet-snippets
             :ensure t)            ; 提供具体输入片段的工具


(provide 'zprogramming-snips-yasnippet)
