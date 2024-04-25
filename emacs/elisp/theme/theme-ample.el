;; 
;; theme-ample: ample-theme, 暗色主题
;; 

(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample-flat))
  :defer t
  :ensure t)

(provide 'theme-ample)
