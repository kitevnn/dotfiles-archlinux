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
        dirvish-mode-line-height 10
        delete-by-moving-to-trash t
        dired-listing-switches "-l --almost-all --human-readable --group-directories-first --no-group"))

(provide 'plug-filemanager-dirvish)

