;; 
;; org"开发" note-orgmode.el
;; 
(use-package org
  :ensure t
  :defer nil)
  
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((latex . t)))  ; org-babel 能加载 LaTeX

(use-package valign
  :ensure t
  :defer nil)

(provide 'note-orgmode)
