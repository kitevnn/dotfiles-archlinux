;; 
;; plug-centaur-tabs.el Buffer管理
;; 
(use-package centaur-tabs
  :ensure t

  :demand

  :config
  (centaur-tabs-mode t)

  :init 
  ;; 设置buffer基本状态
  (setq centaur-tabs-style "box"
        centaur-tabs-height 16
        centaur-tabs-set-icons t
        centaur-tabs-plain-icons t
        centaur-tabs-gray-out-icons 'buffer)

  ;; 设置buffer的当前活跃的图标
  (setq centaur-tabs-set-bar 'left)

  ;; 设置buffer的关闭图标
  (setq centaur-tabs-set-close-button nil
        centaur-tabs-close-button "X")

  ;; 设置buffer的未保存状态的图标
  (setq centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "*")
  
  ;; 设置buffer可循环
  (setq centaur-tabs-cycle-scope 'tabs)

  ;; 设置buffer的最大长度(0值代表动态长度)
  (setq centaur-tabs-label-fixed-length 15)

  ;; 禁用centaur-tabs-local-mode
  :hook
  (dired-mode . centaur-tabs-local-mode)

  ;; 设置centaur-tabs默认打开的Buffer(类似tmuxinator)
  ;; github.com/ema2159/centaur-tabs?tab=readme-ov-file#buffer-groups

  ;; 禁止特定名称的buffer，设置为centaur-tabs的buffer(类似kill-buffer)
  ;; github.com/ema2159/centaur-tabs?tab=readme-ov-file#prevent-the-access-to-specified-buffers
)

;; 设置buffer的字体
(centaur-tabs-change-fonts "SauceCodeProNerdFontCompleteMono Nerd Font" 140)

(provide 'plug-centaur-tabs)
