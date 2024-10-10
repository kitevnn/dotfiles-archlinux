;; ===============================================
;; 补全框架: enhance-corfu.el 
;; ===============================================

;; ===============================================
;; 轻量补全本体
;; ===============================================
(use-package corfu
  :config
  (setq corfu-auto t
        corfu-cycle t
        corfu-quit-at-boundary t
        corfu-quit-no-match t
        corfu-preview-current nil
        corfu-min-width 80
        corfu-max-width 100
        corfu-auto-delay 0.2
        corfu-auto-prefix 1
        corfu-on-exact-match nil)
  :init
  (global-corfu-mode))
(with-eval-after-load 'corfu
  (set-face-attribute 'corfu-default nil :background "#ffffff")
  (set-face-attribute 'corfu-border nil :background "#37474f")  
  (set-face-attribute 'corfu-current nil :background "#b5ffd1" :foreground "#37474f"))


(provide 'enhance-corfu)
