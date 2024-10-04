;; 
;; theme-dark.el 暗色emacs主题
;;      > ample         :   橙色光标
;;      > ample-flat    :   偏绿色光标
;;      > bliss         :   更暗色主题

(use-package bliss-theme
  :defer t
  :ensure t
  :init
  (load-theme 'bliss t t))

  ;; 在当天时间23:00~07:59时，自动切换到更暗色主题
  ; (run-at-time "23:00" (* 60 60 24) (lambda ()
  ;                                     (disable-theme  'nano-light)
  ;                                     (disable-theme  'ample-flat)
  ;                                     (disable-theme  'ample)
  ;                                     (enable-theme   'bliss))))

(provide 'theme-dark)

