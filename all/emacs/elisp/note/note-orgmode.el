;; ========================================
;; org笔记及任务管理 note-orgmode.el
;; ========================================
(use-package org
  :ensure t
  :defer nil)
 

;; ========================================
;; org-babel(C-c ') 能加载 LaTeX
;; ========================================
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((latex . t)))


;; ========================================
;; valign 虚拟对齐
;; ========================================
(use-package valign
  :ensure t
  :defer nil)


;; ========================================
;; 使用 xelatex 渲染 latex-fragment
;; ========================================
(add-to-list 'org-preview-latex-process-alist
                     '(xelatex-chinese
                       :programs ("xelatex" "convert")
                       :description "XeLaTeX with Chinese support dvi > png"
                       :message "you need to install the programs: xelatex and divpng."
                       :image-input-type "pdf"
                       :image-output-type "png"
                       :image-size-adjust (1.7 . 1.5)
                       :latex-header "\\documentclass[11pt]{standalone}
                                      \\usepackage{fontspec}
                                      \\setmainfont{Source Han Sans CN}
                                      \\setsansfont{Source Han Sans CN}
                                      \\usepackage[usenames]{color}
                                      \\usepackage{amsmath}
                                      \\pagestyle{empty}"
                       :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
                       :image-converter ("convert -density 90 %f %O")))


;; ========================================
;; 设置更多可用的org-todo
;; ========================================
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "WAIT" "DONE" "MY")))


(provide 'note-orgmode)
