;; 
;; ui-line.el 下面那条bar
;; 

(use-package telephone-line
  :ensure t
  :init
  (setq telephone-line-primary-left-separator       'telephone-line-identity-left)  
  (telephone-line-mode 1))

(provide 'ui-line)
