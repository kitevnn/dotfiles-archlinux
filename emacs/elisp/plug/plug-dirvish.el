;; 
;; plug-dirvish: 可以当做是side-file-tree(类似nvim-tree.lua)，也可以当做是TUI file-mangaer(joshuto/yazi/ranger)来使用，非常强大。
;; 

;; Dirvish先决条件
;; 
;; 必须 
;;     This package requires GNU ls (gls on macOS)
;; 
;; 可选 
;;     and optionally, fd as a faster alternative to find
;;     imagemagick for image preview
;;     poppler | pdf-tools for pdf preview
;;     ffmpegthumbnailer for video preview  (zypper is 'ffmpegthumbs')
;;     mediainfo for audio/video metadata generation
;;     tar and unzip for archive files preview

(use-package dirvish
  ;; 自动开启dirvish-override-dired-mode(dirvish覆盖dired的模式)
  :init
  (dirvish-override-dired-mode)

  ;; 关于图标的配置(好像dirvish它已经帮忙配置了nf-icon图标，于是这里就注释了)
  ;; :config
  ;; (setq dirvish-mode-line-format
  ;;       '(:left (sort symlink) :right (omit yank index)))
  ;; (setq dirvish-mode-line-height 10)
  ;; (setq dirvish-attributes
  ;;       '(nerd-icons file-time file-size collapse subtree-state vc-state git-msg))
  ;; (setq dirvish-subtree-state-style 'nerd)
  ;; (setq delete-by-moving-to-trash t)
  ;; (setq dirvish-path-separators (list
  ;;                                (format "  %s " (nerd-icons-codicon "nf-cod-home"))
  ;;                                (format "  %s " (nerd-icons-codicon "nf-cod-root_folder"))
  ;;                                (format " %s " (nerd-icons-faicon "nf-fa-angle_right"))))
  ;; (setq dired-listing-switches
  ;;       "-l --almost-all --human-readable --group-directories-first --no-group")
  ;; (dirvish-peek-mode) ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
)

(provide 'plug-dirvish)
