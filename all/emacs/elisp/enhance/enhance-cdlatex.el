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
      ("1a2" "" "? &  " cdlatex-position-cursor nil nil t)
      ("2a1" "" "? \\\\  " cdlatex-position-cursor nil nil t)
      ("2a2" "" "? &  \\\\  &  " cdlatex-position-cursor nil nil t)
      ("2a3" "" "? &  &  \\\\  &  &  " cdlatex-position-cursor nil nil t)
      ("2a4" "" "? &  &  &  \\\\  &  &  &  " cdlatex-position-cursor nil nil t)
      ("3a2" "" "? &  \\\\  &  \\\\  &  " cdlatex-position-cursor nil nil t)
      ("3a3" "" "? &  &  \\\\  &  &  \\\\  &  &  " cdlatex-position-cursor nil nil t)
      ("3a4" "" "? &  &  &  \\\\  &  &  &  \\\\  &  &  &  " cdlatex-position-cursor nil nil t)
      ("4a3" "" "? &  &  \\\\  &  &  \\\\  &  &  \\\\  &  &  " cdlatex-position-cursor nil nil t)
      ("4a4" "" "? &  &  &  \\\\  &  &  &  \\\\  &  &  &  \\\\  &  &  &  " cdlatex-position-cursor nil nil t)
      ("ca" "" "\\begin{cases} ? , &  \\end{cases}" cdlatex-position-cursor nil nil t)
      ("ve" "" "\\vert{} ?" cdlatex-position-cursor nil t t)
      ("or" "" "\\overrightarrow{?} " cdlatex-position-cursor nil t t)
      ("ii" "" "\\textit{?} " cdlatex-position-cursor nil t t)
      ("bb" "" "\\textbf{?} " cdlatex-position-cursor nil t t)
      ("tt" "" "\\text{?} " cdlatex-position-cursor nil t t)
      ("mod" "" "\\text{?} " cdlatex-position-cursor nil t t)
      ("dd" "" "\\mathrm{d} ?" cdlatex-position-cursor nil t t)
      ("Bb" "" "\\Box ?" cdlatex-position-cursor nil t t)
      ("xl" "" "\\xleftarrow[?]{} " cdlatex-position-cursor nil nil t)      
      ("xr" "" "\\xrightarrow[?]{} " cdlatex-position-cursor nil nil t)
      ("ol" "" "\\overline{?} " cdlatex-position-cursor nil nil t)
      ("ae" "" "\\underset{ ? }{\\overset{   }{\\Longleftrightarrow}} " cdlatex-position-cursor nil nil t)
      ("al" "" "\\underset{ ? }{\\overset{   }{\\Longleftarrow}} " cdlatex-position-cursor nil nil t)
      ("ar" "" "\\underset{ ? }{\\overset{   }{\\Longrightarrow}} " cdlatex-position-cursor nil nil t)
      ("RR" "" "\\Re?" cdlatex-position-cursor nil nil t)
      ("to" "" "{? \\to }" cdlatex-position-cursor nil nil t)
      ("liml" "" "\\lim_{? \\to } " cdlatex-position-cursor nil nil t)      
      ("intl" "" "\\int_{?}^{} \\mathrm{d} " cdlatex-position-cursor nil nil t)
      ("iintl" "" "\\iint\\limits_{?} \\mathrm{d} " cdlatex-position-cursor nil nil t)
      ("inf" "" "\\infty?" cdlatex-position-cursor nil nil t)
      ("app" "" "\\approx?" cdlatex-position-cursor nil nil t))))

  ;; ==================================
  ;; cdlatex的`补全
  ;; ==================================
  (setq cdlatex-math-symbol-alist
        '((112 ("" "\\pi"))
          (33 ("\\neq" "" ""))
          (46 ("\\cdot" "\\cdots" "\\ast"))
          (97 ("\\alpha" ""))
          (109 ("\\mu" "" "\\lim"))))


;; ========================================
;; cdlatex的括号匹配
;; ========================================
(defun kivnn/insert-inline-OCDL (prefix)
  (interactive "P")
  (if prefix      
      (insert "$")
    (insert "\\[ ")
    (save-excursion
      (insert " \\]"))))
(eval-after-load 'org  
  '(define-key org-cdlatex-mode-map (kbd "$") 'kivnn/insert-inline-OCDL))

(defun kivnn/insert-bra-OCDL ()
  (interactive)
  (insert "(")
  (save-excursion (insert ")")))
(eval-after-load 'org
  '(define-key org-cdlatex-mode-map (kbd "(")   'kivnn/insert-bra-OCDL))

(defun kivnn/insert-sq-bra-OCDL ()
  (interactive)
  (insert "[")
  (save-excursion (insert "]")))
(eval-after-load 'org
  '(define-key org-cdlatex-mode-map (kbd "[")   'kivnn/insert-sq-bra-OCDL))

(defun kivnn/insert-curly-bra-OCDL ()
  (interactive)
  (insert "{")
  (save-excursion (insert "}")))
(eval-after-load 'org
   '(define-key org-cdlatex-mode-map (kbd "{")   'kivnn/insert-curly-bra-OCDL))

(defun kivnn/insert-backquote-OCDL (prefix)
  (interactive "P")
  (if prefix      
      (insert "`")
    (cdlatex-math-symbol)))
(eval-after-load 'org
  '(define-key org-cdlatex-mode-map (kbd "`")   'kivnn/insert-backquote-OCDL))


(provide 'enhance-cdlatex)
