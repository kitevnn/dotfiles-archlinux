;; 
;; theme-light.el 亮色emacs主题
;;      > nano-light
;; 

(use-package nano-theme
  :ensure nil
  :defer t
  :init
  (load-theme 'nano-light t t)

  ;; 在当天时间08:00~22:59时，自动切换到亮色主题
  (run-at-time "08:00" (* 60 60 24) (lambda () 
                                      (disable-theme  'ample)
                                      (disable-theme  'ample-flat)
                                      (enable-theme   'nano-light))))

(provide 'theme-light)
