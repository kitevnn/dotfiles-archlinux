;; ========================================
;; 快速输入数学符号 enhance-cdlatex.el
;; ========================================
(use-package cdlatex
  :ensure t
  :defer nil
  :after tex-site
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab))
  :init 
  (setq cdlatex-paired-parens "")
  (setq cdlatex-use-dollar-to-ensure-math nil)

  ;; ==================================
  ;; cdlatex的TAB补全
  ;; ==================================
  (setq cdlatex-command-alist
    '(("Bm" "" "\\begin{Bmatrix}  ? \\end{Bmatrix}" cdlatex-position-cursor nil nil t)
      ("vm" "" "\\begin{vmatrix}  ? \\end{vmatrix}" cdlatex-position-cursor nil nil t)
      ("bm" "" "\\begin{bmatrix}  ? \\end{bmatrix}" cdlatex-position-cursor nil nil t)
      ("ve" "" "\\vert{} ?" cdlatex-position-cursor nil t t)
      ("or" "" "\\overrightarrow{?} " cdlatex-position-cursor nil t t)
      ("ii" "" "\\textit{?} " cdlatex-position-cursor nil t t)
      ("bb" "" "\\textbf{?} " cdlatex-position-cursor nil t t)
      ("tt" "" "\\text{?} " cdlatex-position-cursor nil t t)
      ("dd" "" "\\mathrm{d}? " cdlatex-position-cursor nil t t)
      ("nn" "" "\\\\ ?" cdlatex-position-cursor nil t t)
      ("nl" "" "\\\\ ?" cdlatex-position-cursor nil t t)
      ("xl" "" "\\xleftarrow[?]{} " cdlatex-position-cursor nil nil t)      
      ("xr" "" "\\xrightarrow[?]{} " cdlatex-position-cursor nil nil t)
      ("R" "" "\\Re ?" cdlatex-position-cursor nil nil t)
      ("to" "" "{? \\to }" cdlatex-position-cursor nil nil t)
      ("liml" "" "\\lim_{? \\to } " cdlatex-position-cursor nil nil t)      
      ("intl" "" "\\int_{?}^{} \\mathrm{d} " cdlatex-position-cursor nil nil t)
      ("iintl" "" "\\iint\\limits_{L} ? \\mathrm{d}\\sigma " cdlatex-position-cursor nil nil t)
      ("inf" "" "\\infty?" cdlatex-position-cursor nil nil t)
      ("app" "" "\\approx?" cdlatex-position-cursor nil nil t))))

  ;; ==================================
  ;; cdlatex的`补全
  ;; ==================================
  (setq cdlatex-math-symbol-alist
        '((112 ("" "\\pi"))
          (33 ("" "" "\\neq"))
          (46 ("\\cdot" "\\cdots"))
          (97 ("\\alpha" "" "\\ast"))
          (39 ("" "" "`"))
          (109 ("\\mu" "" "\\lim"))))


;; ========================================
;; cdlatex的括号匹配
;; ========================================
(defun custom-insert-inline-OCDL ()
  (interactive)
  (insert "\\[ ")
  (save-excursion (insert " \\]")))
(eval-after-load 'org
  '(define-key org-cdlatex-mode-map (kbd "$")   'custom-insert-inline-OCDL))
(defun custom-insert-bra-OCDL ()
  (interactive)
  (insert "(")
  (save-excursion (insert ")")))
(eval-after-load 'org
   '(define-key org-cdlatex-mode-map (kbd "(")   'custom-insert-bra-OCDL))
(defun custom-insert-sq-bra-OCDL ()
  (interactive)
  (insert "[")
  (save-excursion (insert "]")))
(eval-after-load 'org
   '(define-key org-cdlatex-mode-map (kbd "[")   'custom-insert-sq-bra-OCDL))
(defun custom-insert-curly-bra-OCDL ()
  (interactive)
  (insert "{")
  (save-excursion (insert "}")))
(eval-after-load 'org
   '(define-key org-cdlatex-mode-map (kbd "{")   'custom-insert-curly-bra-OCDL))


(provide 'enhance-cdlatex)
