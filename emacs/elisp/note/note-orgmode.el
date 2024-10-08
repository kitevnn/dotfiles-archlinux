;; 
;; org"开发" note-orgmode.el
;; 
(use-package org
  :ensure t
  :defer nil)
  
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((latex . t)))  ; org-babel 能加载 LaTeX

;; orgmode行间公式查看中文
; from https://emacs-china.org/t/emacs-org-mode-inline-latex/27450
(add-to-list 'org-preview-latex-process-alist
        	     '(xelatex-chinese
        	       :programs ("xelatex" "convert")
        	       :description "XeLaTeX with Chinese support dvi > png"
        	       :message "you need to install the programs: xelatex and divpng."
        	       :image-input-type "pdf"
        	       :image-output-type "png"
        	       :image-size-adjust (1.7 . 1.6)
        	       :latex-header "\\documentclass[11pt]{standalone}\n\\usepackage{fontspec}\n\\setmainfont{Noto Serif CJK TC}\\setsansfont{Noto Sans CJK TC}\n\\usepackage[usenames]{color}\n\\usepackage{amsmath}\n\\pagestyle{empty}" ;; pagestyle{empty} 是必须的
        	       :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
        	       :image-converter ("convert -density 150 %f %O")))

(setq org-preview-latex-default-process 'xelatex-chinese)  ; 设置默认的预览过程


(provide 'note-orgmode)
