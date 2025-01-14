;; ========================================
;; mode-line设置 ui-modeline-bar.el
;; ========================================
(defvar modeline-output-calendar-month "")
(defvar modeline-output-calendar-day "")
(defvar modeline-output-time-hour "")
(defvar modeline-output-time-minute "")
(defvar modeline-output-battery-percentage "")
(defvar modeline-output-distribution "")
(defvar modeline-output-disk-usage "")
(defvar modeline-output-cpu-temperature "")
(defvar modeline-output-ram-usage "")
(defvar modeline-output-pacman-packages "")
(defvar modeline-output-weather-situation "")


;; ========================================
;; 关于当前日期
;; ========================================
(defun update-modeline-output-calendar-month ()
  (setq modeline-output-calendar-month (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/calendar-month.sh"))))
(defun update-modeline-output-calendar-day ()
  (setq modeline-output-calendar-day (string-trim (shell-command-to-string "~/.config/emacs/elisp/ui/modeline/calendar-day.sh"))))
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
;; 显示具体信息
;; ========================================
(defun update-modeline-with-all-scripts ()
  (setq global-mode-string
        (list "   󰃯 " ;
              modeline-output-calendar-month
              modeline-output-calendar-day
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
              "   "
              modeline-output-weather-situation
              " ")))


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

;; ========================================
;; 定时更新模式行，设置为每分钟检查一次
;; ========================================
(run-at-time "0 sec" 60    'update-modeline-with-all-scripts)


(provide 'ui-modeline-bar)
