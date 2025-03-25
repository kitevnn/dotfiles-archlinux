;; =======================================
;; 标签页 enhance-tabs.el 
;; =======================================
(use-package centaur-tabs
  :ensure t
  :defer nil
  :demand
  :config
  (centaur-tabs-mode t)
  ;; 设置buffer基本状态
  :init 
  (setq centaur-tabs-style "box"
        centaur-tabs-height 9  ;; 16
        centaur-tabs-set-icons t
        centaur-tabs-plain-icons t
        centaur-tabs-gray-out-icons 'buffer
        ;; 设置buffer的当前活跃的图标
        centaur-tabs-set-bar 'left
        ;; 设置buffer的关闭图标
        centaur-tabs-set-close-button nil
        centaur-tabs-close-button "X"
        ;; 设置buffer的未保存状态的图标
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "*"
        ;; 设置buffer可循环
        centaur-tabs-cycle-scope 'tabs
        ;; 设置buffer的最大长度(0值代表动态长度)
        centaur-tabs-label-fixed-length 15)
  ;; 禁用centaur-tabs-local-mode
  :hook
  (dired-mode . centaur-tabs-local-mode))


(provide 'enhance-tabs)
