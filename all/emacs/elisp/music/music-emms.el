;; ========================================
;; 音乐播放器 music-emms.el
;; ========================================
(use-package emms
  :ensure t
  :defer t
  :config
  (require 'emms-setup)
  (emms-all)
  (setq emms-player-list '(emms-player-mpv)) ; 用 mpv 播放
  (setq emms-source-file-default-directory "~/音乐/") ; 默认音乐目录
  (setq emms-info-asynchronously t))  ; 异步获取音乐信息


(provide 'music-emms)
