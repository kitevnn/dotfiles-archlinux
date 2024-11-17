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
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
        `(
          (
           ;; Recent Files
           (,
            "  最近 R" ""
            (lambda (&rest _) (consult-recent-file))
            nil "")

           ;; Bookmarks
           (,
            "  书签 B" ""
            (lambda (&rest _) (bookmark-bmenu-list))
            nil "")

           ;; Agenda
           (,
            "󱇘  议程 A" ""
            (lambda (&rest _) (org-agenda))
            nil ""))))

  ;; ========================================
  ;; 设置要展示的dashboard信息
  ;; ========================================
  (setq dashboard-startupify-list '(dashboard-insert-newline
                                    dashboard-insert-banner
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-banner-title
                                    dashboard-insert-newline
                                    dashboard-insert-navigator
                                    dashboard-insert-newline
                                    dashboard-insert-init-info
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline
                                    dashboard-insert-newline))

    ;; 启用 recentf-mode
    (recentf-mode 1)

    ;; 设置最近文件列表的最大长度
    (setq recentf-max-saved-items 100)  ;; 设置最多记录 100 个文件

    ;; 完成初始化
    (dashboard-open))

;; ========================================
;; 设置快捷键
;; ========================================
(with-eval-after-load 'dashboard
  (define-key dashboard-mode-map (kbd "R") #'consult-recent-file)
  (define-key dashboard-mode-map (kbd "B") #'bookmark-bmenu-list)
  (define-key dashboard-mode-map (kbd "A") #'org-agenda-list))


(provide 'ui-decorate-dashboard)
