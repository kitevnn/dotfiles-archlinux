;; 
;; plug-filemanager-dirvish.el 文件管理器dirvish
;; 
(use-package dirvish
  ;; dirvish的基本设置
  :init
  (dirvish-override-dired-mode)
  (dirvish-peek-mode)
  (dirvish-side-follow-mode)

  ;; dirvish的其它设置
  :init
  (setq dirvish-mode-line-format '(:left (sort symlink) :right (omit yank index))
        dirvish-mode-line-height 16  ; 可能是缓存的问题，这里设置了高度为16后，telephone-line的高度，与dirvish-mode的高度就对准对齐了。(我自己实在也不知道为啥-_-)
        dirvish-header-line-height 9
        delete-by-moving-to-trash t
        dired-listing-switches "-l --almost-all --human-readable --group-directories-first --no-group"))


(provide 'plug-filemanager-dirvish)

