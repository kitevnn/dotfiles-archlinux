;; 
;; plug-lspcilent-eglot.el 老色批客户端eglot
;; 
(use-package eglot
             :ensure t
             :defer t)

;; eglot-booster: 给eglot加速的包
(use-package eglot-booster
	:after eglot
	:config	(eglot-booster-mode))

;; eglot-diagnose依赖的包: flycheck
;; (use-package flycheck
;;              :ensure t
;;              :defer t)

;; eglot用法
;; - 代码行动     :    eglot-code-actions
;; - 打开补全     :    completion-at-point
;; - 诊断信息     :    依赖flycheck
;; - 悬浮信息     :    自动有的
;; - 重设名称     :    eglot-rename
;; - 寻找定义     :    依赖xref-find-definitions (M-.)
;; - 寻找引用     :    依赖xref-find-references  (M-?)

(provide 'plug-lspcilent-eglot)
