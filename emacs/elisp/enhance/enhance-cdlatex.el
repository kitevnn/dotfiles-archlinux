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
    '(("Bm" "" "\\begin{Bmatrix} ? \\end{Bmatrix}" cdlatex-position-cursor nil nil t)
      ("vm" "" "\\begin{vmatrix} ? \\end{vmatrix}" cdlatex-position-cursor nil nil t)
      ("bm" "" "\\begin{bmatrix} ? \\end{bmatrix}" cdlatex-position-cursor nil nil t)
      ("ve" "" "\\vert{} ?" cdlatex-position-cursor nil t t)
      ("or" "" "\\overrightarrow{?}" cdlatex-position-cursor nil t t)
      ("ii" "" "\\textit{?}" cdlatex-position-cursor nil t t)
      ("bb" "" "\\textbf{?}" cdlatex-position-cursor nil t t)
      ("cb" "" "\\colorbox{cyan}{?}" cdlatex-position-cursor nil nil t)
      ("cbt" "" "\\colorbox{yellow}{todo}?" cdlatex-position-cursor nil nil t)
      ("cbd" "" "\\colorbox{cyan}{done}?" cdlatex-position-cursor nil nil t)
      ("xl" "" "\\xleftarrow[?]{}" cdlatex-position-cursor nil nil t)      
      ("xr" "" "\\xrightarrow[?]{}" cdlatex-position-cursor nil nil t)
      ("liml" "" "\\lim_{x \\to ?}" cdlatex-position-cursor nil nil t)      
      ("intl" "" "\\int_{?}^{} d" cdlatex-position-cursor nil nil t)      
      ("intlx" "" "\\int_{?}^{} dx" cdlatex-position-cursor nil nil t)      
      ("intly" "" "\\int_{?}^{} dy" cdlatex-position-cursor nil nil t)      
      ("intls" "" "\\int_{?}^{} ds" cdlatex-position-cursor nil nil t)      
      ("intlq" "" "\\int_{?}^{} d\\Theta" cdlatex-position-cursor nil nil t)      
      ("intlf" "" "\\int_{?}^{} r^{2}\\sin \\Phi d\\Phi" cdlatex-position-cursor nil nil t)      
      ("intlr" "" "\\int_{?}^{} rdr" cdlatex-position-cursor nil nil t)      
      ("iintl" "" "\\iint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("iintld" "" "\\iint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("iintlg" "" "\\iint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("iintls" "" "\\iint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("iintlo" "" "\\iint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("iiintl" "" "\\iiint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("iiintld" "" "\\iiint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("iiintlg" "" "\\iiint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("iiintls" "" "\\iiint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("iiintlo" "" "\\iiint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("ointl" "" "\\oint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("ointld" "" "\\oint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("ointlg" "" "\\oint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("ointls" "" "\\oint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("ointlo" "" "\\oint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("oiintl" "" "\\oiint\\limits_{L} ? d" cdlatex-position-cursor nil nil t)
      ("oiintld" "" "\\oiint\\limits_{D} ? d" cdlatex-position-cursor nil nil t)
      ("oiintlg" "" "\\oiint\\limits_{\\Gamma} ? d" cdlatex-position-cursor nil nil t)
      ("oiintls" "" "\\oiint\\limits_{\\Sigma} ? d" cdlatex-position-cursor nil nil t)
      ("oiintlo" "" "\\oiint\\limits_{\\Omega} ? d" cdlatex-position-cursor nil nil t)
      ("inf" "" "\\infty?" cdlatex-position-cursor nil nil t)
      ("app" "" "\\approx" cdlatex-position-cursor nil nil t))))

  ;; ==================================
  ;; cdlatex的`补全
  ;; ==================================
  (setq cdlatex-math-symbol-alist
        '((112 ("" "\\pi")) 
          (33  ("" "" "\\neq")) 
          (46  ("\\cdot" "\\cdots"))
          (97  ("" "" "\\ast"))
          (39  ("" "" "~")) 
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
