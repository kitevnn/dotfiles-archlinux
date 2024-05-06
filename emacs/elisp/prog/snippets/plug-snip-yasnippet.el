;; 
;; plug-snip-yasnippet.el 代码片段
;; 
(use-package yasnippet
             :ensure t
             :demand
             :init
             (yas-global-mode 1))

;; yasnippet的snippets代码片段信息提供处。
(use-package yasnippet-snippets
             :ensure t)

(provide 'plug-snip-yasnippet)
