;; ===============================================
;; 关于mode-line
;; ===============================================
(defvar modeline-output-calendar-month "")        ; 定义全局变量来存储输出
(defvar modeline-script-calendar-day "")          ; 定义全局变量来存储输出
(defvar modeline-script-time-hour "")             ; 定义全局变量来存储输出
(defvar modeline-script-time-minute "")           ; 定义全局变量来存储输出
(defvar modeline-script-battery-percentage "")    ; 定义全局变量来存储输出


;; ===============================================
;; 关于当前日期
;; ===============================================
(defun update-modeline-script-calendar-month ()
  (setq modeline-output-calendar-month (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/calendar-month.sh"))))
(defun update-modeline-script-calendar-day ()
  (setq modeline-script-calendar-day (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/calendar-day.sh"))))
;; ===============================================
;; 关于当前时间
;; ===============================================
(defun update-modeline-script-time-hour ()
  (setq modeline-script-time-hour (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/time-hour.sh"))))
(defun update-modeline-script-time-minute ()
  (setq modeline-script-time-minute (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/time-minute.sh"))))
;; ===============================================
;; 关于电池信息
;; ===============================================
(defun update-modeline-script-battery-percentage ()
  (setq modeline-script-battery-percentage (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/battery-percentage.sh"))))

(defun update-modeline-with-all-scripts ()
  (setq global-mode-string 
        (list update-modeline-script-calendar-month
              " 月"
              update-modeline-script-calendar-day
              "日     "
              update-modeline-script-time-hour
              ":"
              update-modeline-script-time-minute
              "  "
              update-modeline-script-battery-percentage)))

;; ===============================================
;; 定时更新每个脚本
;; ===============================================
; (run-at-time "0 sec" 3600  'update-modeline-script-time-hour)
; (run-at-time "0 sec" 60    'update-modeline-script-time-minute)
; (run-at-time "0 sec" 43200 'update-modeline-script-calendar-day)
; (run-at-time "0 sec" 86400 'update-modeline-script-calendar-month)

;; ===============================================
;; 定时更新模式行，设置为每天更新一次
;; ===============================================
(run-at-time "0 sec" 86400 'update-modeline-with-all-scripts)


;; (provide 'ui-modeline-bar)
