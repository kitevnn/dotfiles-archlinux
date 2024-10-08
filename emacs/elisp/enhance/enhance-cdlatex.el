;;
;; 快速输入数学符号 enhance-cdlatex.el
;; 
(use-package cdlatex
  :ensure t
  :defer nil
  :hook
  (LaTeX-mode-hook . cdlatex-mode)
  (org-mode-hook . cdlatex-mode)
  :init 
  (setq cdlatex-paired-parens "$([{\\[")
  (setq cdlatex-paired-pairs "$\["))


(provide 'enhance-cdlatex)
