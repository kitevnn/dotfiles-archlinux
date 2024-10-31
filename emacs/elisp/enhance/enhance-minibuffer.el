;; ===============================================
;; 迷你显示菜单 enhance-minibuffer.el
;; ===============================================
(use-package vertico
  :ensure t
  :defer nil
  :init
  (vertico-mode t))

(use-package orderless
  :ensure t
  :defer nil
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :defer nil
  :init
  (marginalia-mode t))

(use-package embark
  :ensure t
  :defer nil
  :init
  (setq prefix-help-command 'embark-prefix-help-command))
(use-package embark-consult
  :ensure t
  :defer nil)
(use-package consult
  :ensure t
  :defer nil)


(provide 'enhance-minibuffer)
