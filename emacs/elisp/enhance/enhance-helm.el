;; ===============================================
;; 大而全搜索工具 enhance-helm.el
;; ===============================================
(use-package helm
  :ensure t
  :defer nil
  :init
  (helm-mode 1))

;; ===============================================
;; from r/emacs tuhdo lean helm window
;; ===============================================
(setq helm-display-header-line nil) ;; t by default
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(helm-autoresize-mode 1)


(provide 'enhance-helm)
