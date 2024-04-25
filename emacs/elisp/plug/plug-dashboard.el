;; 
;; plug-dashboard: GNU Emacs的欢迎界面
;; 

(require 'dashboard)

;; 配置dashboard1
;; Set the title
(setq dashboard-banner-logo-title "
󰙱 Welcome to Emacs Dashboard 
")
;;  󱓞 󱓟

;; Set the banner
(setq dashboard-startup-banner 'logo)  

;; (setq dashboard-startup-banner )
;; Value can be:
;;  - 'official which displays the official emacs logo.
;;  - 'logo which displays an alternative emacs logo.
;;  - an integer which displays one of the text banners
;;    (see dashboard-banners-directory files).
;;  - a string that specifies a path for a custom banner
;;    currently supported types are gif/image/text/xbm.
;;  - a cons of 2 strings which specifies the path of an image to use
;;    and other path of a text file to use if image isn't supported.
;;    ("path/to/image/file/image.png" . "path/to/text/file/text.txt").
;;  - a list that can display an random banner,
;;    supported values are: string (filepath), 'official, 'logo and integers.

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)
;; vertically center content
(setq dashboard-vertically-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)


;; 配置dashboard2
(setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 5)
                        (registers . 5)))

;; 配置dashboard3: 展示dashboard元素排放位置的
(setq dashboard-startupify-list '(dashboard-insert-banner         ;; 展示的个性旗帜banner图片
                                  dashboard-insert-banner-title   ;; 展示的个性旗帜banner标题
                                  dashboard-insert-footer         ;; 那句随机出来的话
                                  dashboard-insert-navigator      ;; 不明觉厉
                                  dashboard-insert-newline        ;; 换行
                                  dashboard-insert-items          ;; 那些 recents | bookmarks | projects | agenda | registers
                                  dashboard-insert-newline        ;; 换行
                                  
                                  ;; 显示加载时间
                                  dashboard-insert-init-info))


;; 配置dashboard3
(setq dashboard-navigation-cycle t)                   ;; To enable cycle navigation between each section:
(setq dashboard-heading-shorcut-format " [%s]")       ;; To customize string format in shortcuts:
(setq dashboard-item-shortcuts '((recents   . "r")
                                 (bookmarks . "m")
                                 (projects  . "p")
                                 (agenda    . "a")
                                 (registers . "e")))  ;; To customize item shortcuts:

;; To modify heading icons with another icon from nerd-icons octicons:
(dashboard-modify-heading-icons '((recents   . "nf-oct-graph")
                                  (bookmarks . "nf-oct-book")
                                  (projects  . "nf-oct-project_symlink")
                                  (agenda    . "nf-oct-briefcase")
                                  (registers . "nf-oct-paperclip")))

(setq dashboard-item-names '(("Recent Files:"               . "Recently opened files:")
                             ("Agenda for today:"           . "Today's agenda:")
                             ("Agenda for the coming week:" . "Agenda:")))  ;; To modify the widget heading name:


;; all-the-icons
;; (setq dashboard-icon-type 'all-the-icons)  ; use `all-the-icons' package  To use all-the-icons package:
;; (dashboard-modify-heading-icons '((recents   . "file-text")  ;; To modify heading icons with another icon from all-the-icons octicons:
;;                                   (bookmarks . "book")))     ;; To modify heading icons with another icon from all-the-icons octicons:

;; nerd-icons
(setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal  To use nerd-icons package:
(setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package                To use nerd-icons package:
(setq dashboard-set-heading-icons t)  ;; To add icons to the widget headings and their items:
(setq dashboard-set-file-icons t)     ;; To add icons to the widget headings and their items:


;; 配置dashboard5: 设置按钮的
;; To customize the buttons of the navigator like this:
;; Format: "(icon title help action face prefix suffix)"
;; 
;; (setq dashboard-navigator-buttons
;;       `(;; line1
;;         ;; 引入图标(all-the-icons的做法): 
;;         ;; ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
;;         ;; all-the-icons-octicon "mark-github"
;;         ((,
;;           "Homepage"
;;           "Browse homepage"
;;           (lambda (&rest _) (browse-url "https://github.com/kitevnn")))  ;; 它这里会打开20个以上，原因未知
;;          ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
;;          ("?" "" "?/h" #'show-help nil "<" ">"))
;;         ;; line 2
;;         ;; 引入图标(all-the-icons的做法): 
;;         ;; ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
;;         ;; all-the-icons-octicon "mark-github"
;;         ((,
;;           "Linkedin"
;;           ""
;;           (lambda (&rest _) (browse-url "homepage")))
;;          ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

;; To use it with counsel-projectile or persp-projectile
;; 
;; (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
;; 
;; Or
;; 
;; (setq dashboard-projects-switch-function 'projectile-persp-switch-project)


;; 配置dashboard4 [agenda议程管理]
;; (add-to-list 'dashboard-items '(agenda) t)  ;; To display today’s agenda items on the dashboard, add agenda to dashboard-items:
;; (setq dashboard-week-agenda t)              ;; To show agenda for the upcoming seven days set the variable dashboard-week-agenda to t.
;; (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)  ;; By default org-agenda entries are filter by time, only showing those task with DEADLINE, SCHEDULE-TIME or TIMESTAMP . To show all agenda entries (except DONE)

;; 打开GNU Emacs就可以看到dashboard
(dashboard-setup-startup-hook)

(provide 'plug-dashboard)
