;; ===============================================
;; 必须加载上的配置 custom-after.el
;; ===============================================

;; ===============================================
;; 关于cdlatex括号匹配
;; ===============================================
(defun custom-insert-inline-OCDL ()
  (interactive)
  (insert "\\[ ")
  (save-excursion (insert " \\]")))
(defun custom-insert-bra-OCDL ()
  (interactive)
  (insert "(")
  (save-excursion (insert ")")))
(defun custom-insert-sq-bra-OCDL ()
  (interactive)
  (insert "[")
  (save-excursion (insert "]")))
(defun custom-insert-curly-bra-OCDL ()
  (interactive)
  (insert "{")
  (save-excursion (insert "}")))
(define-key org-cdlatex-mode-map (kbd "$")   'custom-insert-inline-OCDL)
(define-key org-cdlatex-mode-map (kbd "(")   'custom-insert-bra-OCDL)
(define-key org-cdlatex-mode-map (kbd "[")   'custom-insert-sq-bra-OCDL)
(define-key org-cdlatex-mode-map (kbd "{")   'custom-insert-curly-bra-OCDL)


(provide 'custom-after)
