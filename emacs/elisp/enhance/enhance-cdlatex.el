;; ===============================================
;; 快速输入数学符号 enhance-cdlatex.el
;; ===============================================
(use-package cdlatex
  :ensure t
  :defer nil
  :after tex-site
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab))
  :init 
  (setq cdlatex-paired-parens "")
  (setq cdlatex-use-dollar-to-ensure-math nil)

  ;; cdlatex的TAB补全
  (setq cdlatex-command-alist
    '(("Bm" "" "\\begin{Bmatrix} ? \\end{Bmatrix}" cdlatex-position-cursor nil nil t)
      ("vm" "" "\\begin{vmatrix} ? \\end{vmatrix}" cdlatex-position-cursor nil nil t)
      ("bm" "" "\\begin{bmatrix} ? \\end{bmatrix}" cdlatex-position-cursor nil nil t)
      ("ii" "" "\\textit{?}" cdlatex-position-cursor nil t t)
      ("bb" "" "\\textbf{?}" cdlatex-position-cursor nil t t))))

(provide 'enhance-cdlatex)
