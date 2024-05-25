;;
;; clean.el 一些软清理的elisp编码
;; 

;; (use-package ample-theme
;;   :defer t
;;   :ensure t
;;   :init
;;   (load-theme 'ample t t)
;;  
;;   ;; 在当天时间18:01~22:59时，自动切换到暗色主题
;;   (run-at-time "18:00" (* 60 60 24) (lambda () 
;;                                       (disable-theme  'nano-light)
;;                                       (disable-theme  'bliss)
;;                                       (disable-theme  'ample-flat)
;;                                       (enable-theme   'ample))))

;; (global-set-key (kbd "C-c d 1")
;;                 (lambda () (interactive)
;;                   (disable-theme  'nano-light)
;;                   (disable-theme  'ample)
;;                   (disable-theme  'bliss)
;;                   (load-theme     'ample-flat t)))
;; (global-set-key (kbd "C-c d 2")
;;                 (lambda () (interactive)
;;                   (disable-theme  'nano-light)
;;                   (disable-theme  'ample-flat)
;;                   (disable-theme  'bliss)
;;                   (load-theme     'ample t)))
