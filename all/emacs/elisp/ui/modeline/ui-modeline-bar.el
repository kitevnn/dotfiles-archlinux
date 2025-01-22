;; ========================================
;; mode-line设置 ui-modeline-bar.el
;; ========================================
(defvar modeline-output-calendar-month "")
(defvar modeline-output-calendar-day "")
(defvar modeline-output-calendar-week "")
(defvar modeline-output-time-hour "")
(defvar modeline-output-time-minute "")
(defvar modeline-output-battery-percentage "")
(defvar modeline-output-distribution "")
(defvar modeline-output-disk-usage "")
(defvar modeline-output-cpu-temperature "")
(defvar modeline-output-ram-usage "")
(defvar modeline-output-pacman-packages "")
(defvar modeline-output-weather-situation "")
(defvar modeline-agenda-output-todo-count 0)
(defvar modeline-agenda-output-doing-count 0)
(defvar modeline-agenda-output-wait-count 0)
(defvar modeline-agenda-output-file-name "")


;; ========================================
;; 关于当前日期
;; ========================================
(defun update-modeline-output-calendar-month ()
  (setq modeline-output-calendar-month (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/calendar-month.sh"))))
(defun update-modeline-output-calendar-day ()
  (setq modeline-output-calendar-day (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/calendar-day.sh"))))
(defun update-modeline-output-calendar-week ()
  (setq modeline-output-calendar-week (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/calendar-week.sh"))))
;; ========================================
;; 关于当前时间
;; ========================================
(defun update-modeline-output-time-hour ()
  (setq modeline-output-time-hour (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/time-hour.sh"))))
(defun update-modeline-output-time-minute ()
  (setq modeline-output-time-minute (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/time-minute.sh"))))
;; ========================================
;; 关于电池信息
;; ========================================
(defun update-modeline-output-battery-percentage ()
  (setq modeline-output-battery-percentage (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/battery-percentage.sh"))))
;; ========================================
;; 关于发行版信息
;; ========================================
(defun update-modeline-output-distribution ()
  (setq modeline-output-distribution (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/distribution.sh"))))
(defun update-modeline-output-pacman-packages ()
  (setq modeline-output-pacman-packages (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/pacman-packages.sh"))))
;; ========================================
;; 关于使用率
;; ========================================
(defun update-modeline-output-disk-usage ()
  (setq modeline-output-disk-usage (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/disk-usage.sh"))))
(defun update-modeline-output-cpu-temperature ()
  (setq modeline-output-cpu-temperature (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/cpu-temperature.sh"))))
(defun update-modeline-output-ram-usage ()
  (setq modeline-output-ram-usage (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/ram-usage.sh"))))
;; ========================================
;; 关于当地天气
;; ========================================
(defun update-modeline-output-weather-situation ()
  (setq modeline-output-weather-situation (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/weather-situation.sh"))))
;; ========================================
;; 关于议程
;; ========================================
(defun custom-count-agenda-file-tasks (file-path)
  "更新指定路径议程文件的agenda信息"
  (interactive)
  (setq modeline-agenda-output-todo-count 0)
  (setq modeline-agenda-output-doing-count 0)
  (setq modeline-agenda-output-wait-count 0)
  (setq modeline-agenda-output-file-name (file-name-nondirectory file-path))
  ;; 打开临时buffer
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    (while (re-search-forward org-heading-regexp nil t)
      (let ((headline (match-string 0)))
        (cond
         ((string-match-p "\\*+ TODO" headline) (setq modeline-agenda-output-todo-count (1+ modeline-agenda-output-todo-count)))
         ((string-match-p "\\*+ DOING" headline) (setq modeline-agenda-output-doing-count (1+ modeline-agenda-output-doing-count)))
         ((string-match-p "\\*+ WAIT" headline) (setq modeline-agenda-output-wait-count (1+ ))))))))

(defun update-modeline-output-agenda-file-tasks ()
  "统计指定文件2025.org的任务"
  (custom-count-agenda-file-tasks "~/桌面/back/archlinux/org/GTD/agenda/2025.org"))


;; ========================================
;; 显示具体信息
;; ========================================
(defun update-modeline-with-all-scripts ()
  (setq global-mode-string
        (list "   󰃯 " ;
              modeline-output-calendar-month
              modeline-output-calendar-day
              "  "
              modeline-output-calendar-week              
              "  "                           
              modeline-output-time-hour
              ":"
              modeline-output-time-minute
              "     ."
              modeline-output-battery-percentage
              "  "
              modeline-output-distribution              
              "    "
              modeline-output-cpu-temperature              
              "°C  ."
              modeline-output-disk-usage
              " 󰄨 "
              modeline-output-ram-usage
              " 󰏖 "
              modeline-output-pacman-packages
              "  "
              modeline-output-weather-situation
              "  "
              (format "󰄒 TODO %d " modeline-agenda-output-todo-count)
              (format "󱞿 DOING %d " modeline-agenda-output-doing-count)
              (format "󰝕 WAIT %d " modeline-agenda-output-wait-count)
              "-  "
              modeline-agenda-output-file-name
              "")))


;; ========================================
;; 定时更新每个脚本
;; ========================================
(run-at-time "0 sec" 180   'update-modeline-output-time-hour)           ; 每3分钟更新一次时间小时信息
(run-at-time "0 sec" 60    'update-modeline-output-time-minute)         ; 每1分钟更新一次时间分钟信息
(run-at-time "0 sec" 43200 'update-modeline-output-calendar-day)        ; 每12小时更新一次日历月份信息
(run-at-time "0 sec" 86400 'update-modeline-output-calendar-month)      ; 每24小时更新一次日历月份信息
(run-at-time "0 sec" 120   'update-modeline-output-battery-percentage)  ; 每2分钟更新一次电池信息
(run-at-time "0 sec" 86400 'update-modeline-output-distribution)        ; 每1天更新一次发行版信息
(run-at-time "0 sec" 86400 'update-modeline-output-disk-usage)          ; 每1天更新一次磁盘使用量信息
(run-at-time "0 sec" 15    'update-modeline-output-cpu-temperature)     ; 每15秒更新一次CPU温度信息
(run-at-time "0 sec" 15    'update-modeline-output-ram-usage)           ; 每15秒更新一次内存使用量信息
(run-at-time "0 sec" 43200 'update-modeline-output-pacman-packages)     ; 每12小时更新一次包总数信息
(run-at-time "0 sec" 1800  'update-modeline-output-weather-situation)   ; 每30分钟更新一次当前天气信息
(run-at-time "0 sec" 43200 'update-modeline-output-calendar-week)       ; 每12小时更新一次当前星期信息
(run-at-time "0 sec" 1800  'update-modeline-output-agenda-file-tasks)   ; 每30分钟更新一次时间tasks任务信息



;; ========================================
;; 定时更新模式行，设置为每分钟检查一次
;; ========================================
(run-at-time "0 sec" 60    'update-modeline-with-all-scripts)


(provide 'ui-modeline-bar)
