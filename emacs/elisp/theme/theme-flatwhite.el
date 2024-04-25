;; 
;; theme-flatwhite: doom-themes主题包下的一个很好看的亮色主题(doom-flatwhite)
;; 

(use-package doom-themes
  ;; 启动时，加载doom-flatwhite主题
  :init (progn (load-theme 'doom-flatwhite t t)
               (enable-theme 'doom-flatwhite))
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-flatwhite t)

  ;; 进一步的主题配置
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-flatwhite") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(provide 'theme-flatwhite)
