;; 
;; LSP客户端: zprogramming-lsp-eglot.el 
;; 
(use-package eglot
             :ensure t
             :defer t)

;; 给eglot加速的包
(use-package eglot-booster
	:after eglot
	:config	(eglot-booster-mode))

;; eglot用法
; 代码行动  eglot-code-actions
; 打开补全  completion-at-point
; 诊断信息  依赖flycheck
; 悬浮信息  自动有的
; 重设名称  eglot-rename
; 寻找定义  依赖xref-find-definitions (M-.)
; 寻找引用  依赖xref-find-references  (M-?)


(provide 'zprogramming-lsp-eglot)
