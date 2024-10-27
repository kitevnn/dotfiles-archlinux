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
      ("ve" "" "\\vert{} ?" cdlatex-position-cursor nil t t)
      ("or" "" "\\overrightarrow{?}" cdlatex-position-cursor nil t t)
      ("ii" "" "\\textit{?}" cdlatex-position-cursor nil t t)
      ("bb" "" "\\textbf{?}" cdlatex-position-cursor nil t t)
      ("xl" "" "\\xleftarrow[?]{}" cdlatex-position-cursor nil nil t)      
      ("xr" "" "\\xrightarrow[?]{}" cdlatex-position-cursor nil nil t)
      ("liml" "" "\\lim_{x \\to ?}" cdlatex-position-cursor nil nil t)      
      ("intl" "" "\\int_{?}^{} d" cdlatex-position-cursor nil nil t)      
      ("iintl" "" "\\iint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("iintd" "" "\\iint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("iintg" "" "\\iint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("iints" "" "\\iint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("iinto" "" "\\iint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("iiintl" "" "\\iiint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("iiintd" "" "\\iiint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("iiintg" "" "\\iiint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("iiints" "" "\\iiint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("iiinto" "" "\\iiint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("ointl" "" "\\oint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("ointd" "" "\\oint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("ointg" "" "\\oint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("oints" "" "\\oint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("ointo" "" "\\oint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("oiintl" "" "\\oiint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("oiintd" "" "\\oiint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("oiintg" "" "\\oiint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("oiints" "" "\\oiint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("oiinto" "" "\\oiint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)))

  ;; cdlatex的`补全
  (setq cdlatex-math-symbol-alist '((112 ("" "\\pi")) (33 ("" "" "\\neq")) (46 ("\\cdot" "\\cdots")))))

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
