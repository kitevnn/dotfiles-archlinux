;;
;; 快速输入数学符号 enhance-cdlatex.el
;; 
(use-package cdlatex
  :ensure t
  :defer nil
  :after tex-site
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab))
  :init 
  (setq cdlatex-paired-parens "")
  (setq cdlatex-use-dollar-to-ensure-math nil))

  ;; cdlatex + TAB命令
  (setq cdlatex-command-alist
   '(("ii" "" "\\textit{?}" cdlatex-position-cursor nil t t)
     ("vm" "" "\\begin{vmatrix} ? \\end{vmatrix}" cdlatex-position-cursor nil nil t)
     ("Bm" "" "\\begin{Bmatrix} ? \\end{Bmatrix}" cdlatex-position-cursor nil nil t)
     ("bm" "" "\\begin{bmatrix} ? \\end{bmatrix}" cdlatex-position-cursor nil nil t)
     ("bb" "" "\\textbf{?}" cdlatex-position-cursor nil t t)
     ("te" "\\insert text{}" "\\text{?}" cdlatex-position-cursor nil nil t)))
  (setq cdlatex-math-modify-alist nil)
  (setq cdlatex-math-symbol-alist nil)


(provide 'enhance-cdlatex)
