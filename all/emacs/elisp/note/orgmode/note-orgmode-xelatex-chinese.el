
;; ========================================
;; xelatex-chinese: 渲染utf-8片段引擎
;; ========================================
(defvar custom-image-converter
  (format "convert -density %d -background '%s' -flatten -quality %d %%f %%O"
          (- variable-ui-fonts-size 20)
          variable-latex-fragment-background
          variable-latex-fragment-quality))
(defvar custom-image-size-adjust
  (read (format "(%f . %f)"
                variable-latex-fragment-adjust-width
                variable-latex-fragment-adjust-height)))
(defvar custom-image-latex-header
  (format "\\documentclass[%s]{standalone}
                              \\usepackage{fontspec}
                              \\setmainfont{%s}
                              \\setsansfont{%s}
                              \\setmonofont{%s}
                              \\usepackage[usenames]{color}
                              \\usepackage{amsmath}
                              \\usepackage{extpfeil}
                              \\pagestyle{empty}"
          variable-latex-fragment-documentclass-base
          variable-latex-fragment-font-family
          variable-latex-fragment-font-family
          variable-latex-fragment-font-family))
(add-to-list 'org-preview-latex-process-alist
             `(xelatex-chinese
               :programs ("xelatex" "convert")
               :description "pdf > png"
               :message "you need to install the programs: xelatex and dvipng."
               :image-input-type "pdf"
               :image-output-type "png"
               :image-size-adjust ,custom-image-size-adjust
               :latex-header ,custom-image-latex-header
               :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
               :image-converter (,custom-image-converter)))


(provide 'note-orgmode-xelatex-chinese)
