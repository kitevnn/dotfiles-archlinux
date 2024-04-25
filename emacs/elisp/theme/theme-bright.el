;; 
;; theme-bright: leuven-theme, 感觉像是在使用VisualStudio
;; 

(use-package leuven-theme
  :init (progn (load-theme 'leuven t t)
               (enable-theme 'leuven))
  :defer t
  :ensure t)

(provide 'theme-bright)
