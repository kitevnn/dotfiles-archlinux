;; 
;; init-elpa.el 软件包源配置
;; 
(use-package package
  :init 
  (setq package-archives 
        '(("melpa" . "https://melpa.org/packages/")
          ("gnu" . "https://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (setq use-package-always-ensure t
        use-package-always-defer t
        use-package-always-demand nil
        use-package-expand-minimally t
        use-package-verbose t)

  :autoload
  (package-initialize))

(provide 'init-elpa)
