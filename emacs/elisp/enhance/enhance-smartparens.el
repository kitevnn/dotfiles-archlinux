;; 
;; 括号匹配: enhance-smartparens.el 
;; 
(use-package tex-site)

(use-package smartparens
  :ensure t
  :defer nil
  :hook (prog-mode text-mode org-mode LaTeX-mode)
  :after tex-site
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab)))


(provide 'enhance-smartparens)
