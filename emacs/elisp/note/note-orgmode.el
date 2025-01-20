;; ========================================
;; org"开发" note-orgmode.el
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
;; org-mode 添加 lataex-header
;; ========================================
(setq org-format-latex-header "\\documentclass{article}
                               \\usepackage[usenames]{color}
                               [DEFAULT-PACKAGES]
                               [PACKAGES]
                               \\usepackage{esint}
                               \\pagestyle{empty}             % do not remove
                               % The settings below are copied from fullpage.sty
                               \\setlength{\\textwidth}{\\paperwidth}
                               \\addtolength{\\textwidth}{-3cm}
                               \\setlength{\\oddsidemargin}{1.5cm}
                               \\addtolength{\\oddsidemargin}{-2.54cm}
                               \\setlength{\\evensidemargin}{\\oddsidemargin}
                               \\setlength{\\textheight}{\\paperheight}
                               \\addtolength{\\textheight}{-\\headheight}
                               \\addtolength{\\textheight}{-\\headsep}
                               \\addtolength{\\textheight}{-\\footskip}
                               \\addtolength{\\textheight}{-3cm}
                               \\setlength{\\topmargin}{1.5cm}
                               \\addtolength{\\topmargin}{-2.54cm}")    ; 设置org-mode的latex-header(+esint)


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
      '((sequence "TODO" "DOING" "WAIT" "MY" "DONE")))


(provide 'note-orgmode)
