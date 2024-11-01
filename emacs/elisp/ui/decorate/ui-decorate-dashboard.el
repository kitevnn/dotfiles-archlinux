;; ========================================
;; 欢迎界面 ui-decorate-dashboard.el
;; ========================================
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  
  ;; ========================================
  ;; 设置dashboard的基本信息
  ;; ========================================
  :init
  (setq dashboard-banner-logo-title "p😭q 真正的编辑器: GNU Emacs"
        dashboard-startup-banner    "/home/une/.wallpaper/dashboard-zoom-out-light.png"
        dashboard-center-content t
        dashboard-vertically-center-content t
        dashboard-show-shortcuts nil)

  ;; ========================================
  ;; 设置要展示的dashboard信息
  ;; ========================================
  (setq dashboard-startupify-list '(dashboard-insert-newline
                                    dashboard-insert-banner
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-banner-title
                                    dashboard-insert-navigator
                                    dashboard-insert-items
                                    dashboard-insert-newline
                                    dashboard-insert-init-info))
  
  ;; ========================================
  ;; 设置快捷键
  ;; ========================================
  (setq dashboard-navigation-cycle t)
  (setq dashboard-heading-shorcut-format " [%s]")
  (setq dashboard-item-shortcuts '((recents   . "r")
                                 (bookmarks   . "m")))

  ;; ========================================
  ;; 设置item的信息(字符串替换)
  ;; ========================================
  (setq dashboard-item-names '(("Recent Files:"               . "最近打开文件")
                               ("Bookmarks:"                  . "最近打开书签")))

  ;; ========================================
  ;; 图标设置
  ;; ========================================
  (setq dashboard-display-icons-p t
      dashboard-icon-type 'nerd-icons
      dashboard-set-heading-icons t 
      dashboard-set-file-icons t)

  ;; ========================================
  ;; 数量设置
  ;; ========================================
  (setq dashboard-items '((recents   . 20)
                        (bookmarks   . 5)))

  ;; ========================================
  ;; 默认启动dashboard
  ;; ========================================
  (dashboard-open))


(provide 'ui-decorate-dashboard)
