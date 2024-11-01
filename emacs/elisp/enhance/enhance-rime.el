;; ========================================
;; 狗哥的emacs-rime enhance-rime.el
;; ========================================
(use-package rime
  :ensure t
  :defer nil
  :after posframe
  :custom
  (default-input-method "rime")
  :init
  (setq rime-show-candidate 'posframe)
  (setq rime-cursor "˰"))

(use-package posframe
  :ensure t
  :defer nil)


(provide 'enhance-rime)
