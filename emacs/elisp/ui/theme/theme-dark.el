;; 
;; theme-dark.el 暗色emacs主题
;;      > ample         :   橙色光标
;;      > ample-flat    :   偏绿色光标
;;      > bliss         :   更暗色主题

(use-package ample-theme
  :defer t
  :ensure t
  :init
  (load-theme 'ample t t)

  ;; 在当天时间18:01~22:59时，自动切换到暗色主题
  (run-at-time "18:00" (* 60 60 24) (lambda () 
                                      (disable-theme  'nano-light)
                                      (disable-theme  'bliss)
                                      (disable-theme  'ample-flat)                                      
                                      (enable-theme   'ample))))

(use-package bliss-theme
  :defer t
  :ensure t
  :init
  (load-theme 'bliss t t)

  ;; 在当天时间23:00~07:59时，自动切换到更暗色主题
  (run-at-time "23:00" (* 60 60 24) (lambda ()
                                      (disable-theme  'nano-light)
                                      (disable-theme  'ample-flat)
                                      (disable-theme  'ample)
                                      (enable-theme   'bliss)))
  (run-at-time "00:00" (* 60 60 24) (lambda ()
                                      (disable-theme  'nano-light)
                                      (disable-theme  'ample-flat)
                                      (disable-theme  'ample)
                                      (enable-theme   'bliss))))

(provide 'theme-dark)

