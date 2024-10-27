;; ===============================================
;; org"开发" note-orgmode.el
;; ===============================================
(use-package org
  :ensure t
  :defer nil)
  
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((latex . t)))  ; org-babel 能加载 LaTeX

(use-package valign
  :ensure t
  :defer nil)

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


(provide 'note-orgmode)
