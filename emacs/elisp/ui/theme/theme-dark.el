;; 
;; theme-dark.el 暗色emacs主题
;;      > ample         :   橙色光标
;;      > ample-flat    :   偏绿色光标
;; 

(use-package ample-theme
  :defer t
  :ensure t
  :init
  (load-theme 'ample t t)

  ;; 在当天时间18:01~07:59时，自动切换到暗色主题
  (run-at-time "18:00" (* 60 60 24) (lambda () 
                                      (disable-theme  'ample-flat)
                                      (enable-theme   'ample))))

(provide 'theme-dark)

