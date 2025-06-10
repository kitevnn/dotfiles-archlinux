;; ========================================
;; dvipng: 渲染非utf-8片段引擎
;; ========================================
(defvar custom-image-size-adjust
  (read (format "(%f . %f)"
                (- variable-latex-fragment-adjust-width 0.3)
                (- variable-latex-fragment-adjust-height 0.3))))
(defvar custom-transparent-image-converter
  (concat (format "dvipng -D %%D -T tight -bg '%s' -o %%O %%f" variable-latex-fragment-background) " && "
          (format "convert -density %d -background '%s' -flatten -quality %d %%f %%O"
          (- variable-ui-fonts-size 20)
          variable-latex-fragment-background
          variable-latex-fragment-quality)))
(setq org-preview-latex-process-alist
      (assq-delete-all 'dvipng org-preview-latex-process-alist))
(add-to-list 'org-preview-latex-process-alist
             `(dvipng
               :programs ("latex" "dvipng")
               :description "dvi > png"
               :message "you need to install the programs: latex and dvipng."
               :image-input-type "dvi"
               :image-output-type "png"
               :image-size-adjust ,custom-image-size-adjust
               :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
               :image-converter ("dvipng -D %D -T tight -o %O %f")
               :transparent-image-converter (,custom-transparent-image-converter)))


(provide 'note-orgmode-dvipng)
