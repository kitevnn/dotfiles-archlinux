;; ========================================
;; mode-line设置 ui-modeline-bar.el
;; ========================================
(defvar modeline-calendar-month "")
(defvar modeline-calendar-day "")
(defvar modeline-calendar-week "")
(defvar modeline-time-hour "")
(defvar modeline-time-minute "")
(defvar modeline-battery-percentage "")
(defvar modeline-distribution "")
(defvar modeline-disk-usage "")
(defvar modeline-cpu-temperature "")
(defvar modeline-ram-usage "")
(defvar modeline-pacman-packages "")
(defvar modeline-weather-situation "")
(defvar modeline-agenda-todo-count 0)
(defvar modeline-agenda-doing-count 0)
(defvar modeline-agenda-wait-count 0)
(defvar modeline-agenda-file-name "")
(defvar modeline-emacs-uptime "")


;; ========================================
;; 关于当前日期
;; ========================================
(defun update-modeline-calendar-month ()
  (setq modeline-calendar-month
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "calendar-month.sh")))))
(defun update-modeline-calendar-day ()
  (setq modeline-calendar-day
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "calendar-day.sh")))))
(defun update-modeline-calendar-week ()
  (setq modeline-calendar-week
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "calendar-week.sh")))))
;; ========================================
;; 关于当前时间
;; ========================================
(defun update-modeline-time-hour ()
  (setq modeline-time-hour
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "time-hour.sh")))))
(defun update-modeline-time-minute ()
  (setq modeline-time-minute
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "time-minute.sh")))))
;; ========================================
;; 关于电池信息
;; ========================================
(defun update-modeline-battery-percentage ()
  (setq modeline-battery-percentage 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "battery-percentage.sh")))))
;; ========================================
;; 关于发行版信息
;; ========================================
(defun update-modeline-distribution ()
  (setq modeline-distribution 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "distribution.sh")))))
(defun update-modeline-pacman-packages ()
  (setq modeline-pacman-packages 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "pacman-packages.sh")))))
;; ========================================
;; 关于使用率
;; ========================================
(defun update-modeline-disk-usage ()
  (setq modeline-disk-usage 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "disk-usage.sh")))))
(defun update-modeline-cpu-temperature ()
  (setq modeline-cpu-temperature 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "cpu-temperature.sh")))))
(defun update-modeline-ram-usage ()
  (setq modeline-ram-usage 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "ram-usage.sh")))))
;; ========================================
;; 关于当地天气
;; ========================================
(defun update-modeline-weather-situation ()
  (setq modeline-weather-situation 
        (string-trim
         (shell-command-to-string
          (concat user-emacs-directory directory-modeline-path-suffix "weather-situation.sh")))))
;; ========================================
;; 关于议程
;; ========================================
(defun my-count-agenda-file-tasks (file-path)
  "更新指定路径议程文件的agenda信息"
  (interactive)
  (setq modeline-agenda-todo-count 0)
  (setq modeline-agenda-doing-count 0)
  (setq modeline-agenda-wait-count 0)
  (setq modeline-agenda-file-name (file-name-nondirectory file-path))
  ;; 打开临时buffer
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    (while (re-search-forward org-heading-regexp nil t)
      (let ((headline (match-string 0)))
        (cond
         ((string-match-p "\\*+ TODO" headline) (setq modeline-agenda-todo-count (1+ modeline-agenda-todo-count)))
         ((string-match-p "\\*+ DOING" headline) (setq modeline-agenda-doing-count (1+ modeline-agenda-doing-count)))
         ((string-match-p "\\*+ WAIT" headline) (setq modeline-agenda-wait-count (1+ modeline-agenda-wait-count))))))))
(defun update-modeline-agenda-file-tasks ()
  "统计指定文件2025.org的任务"
  (my-count-agenda-file-tasks file-org-agenda-files))
;; ========================================
;; 累计总时长
;; ========================================
(defun update-modeline-emacs-uptime ()
  (setq modeline-emacs-uptime
        (let ((uptime-text
               (string-trim
                (shell-command-to-string
                 (concat user-emacs-directory directory-site-lisp "calculate-uptime.sh")))))
          (if (string-match "Accompanying With GNU Emacs: \\(.*\\)" uptime-text)
              (match-string 1 uptime-text)))))


;; ========================================
;; 定期更新变量数据
;; ========================================
(run-at-time "0 sec" 180   'update-modeline-time-hour)           ; 每3分钟更新一次时间小时信息
(run-at-time "0 sec" 60    'update-modeline-time-minute)         ; 每1分钟更新一次时间分钟信息
(run-at-time "0 sec" 43200 'update-modeline-calendar-day)        ; 每12小时更新一次日历月份信息
(run-at-time "0 sec" 86400 'update-modeline-calendar-month)      ; 每24小时更新一次日历月份信息
(run-at-time "0 sec" 120   'update-modeline-battery-percentage)  ; 每2分钟更新一次电池信息
(run-at-time "0 sec" 86400 'update-modeline-distribution)        ; 每1天更新一次发行版信息
(run-at-time "0 sec" 86400 'update-modeline-disk-usage)          ; 每1天更新一次磁盘使用量信息
(run-at-time "0 sec" 15    'update-modeline-cpu-temperature)     ; 每15秒更新一次CPU温度信息
(run-at-time "0 sec" 15    'update-modeline-ram-usage)           ; 每15秒更新一次内存使用量信息
(run-at-time "0 sec" 43200 'update-modeline-pacman-packages)     ; 每12小时更新一次包总数信息
(run-at-time "0 sec" 1800  'update-modeline-weather-situation)   ; 每30分钟更新一次当前天气信息
(run-at-time "0 sec" 43200 'update-modeline-calendar-week)       ; 每12小时更新一次当前星期信息
(run-at-time "0 sec" 1800  'update-modeline-agenda-file-tasks)   ; 每30分钟更新一次时间tasks任务信息
(run-at-time "0 sec" 300   'update-modeline-emacs-uptime)        ; 每5分钟更新一次累计使用总时长


;; ========================================
;; 关于状态栏
;; ========================================
(defun update-modeline-with-all-scripts ()
  "显示状态栏除议程数量之外的信息"
  (setq global-mode-string
        (list "   󰃯 " ;
              modeline-calendar-month
              modeline-calendar-day
              "  "
              modeline-calendar-week              
              "  "                           
              modeline-time-hour
              ":"
              modeline-time-minute
              "     ."
              modeline-battery-percentage
              "  "
              modeline-distribution              
              "    "
              modeline-cpu-temperature              
              "°C  ."
              modeline-disk-usage
              " 󰄨 "
              modeline-ram-usage
              " 󰏖 "
              modeline-pacman-packages
              "  "
              modeline-weather-situation
              "  "
              (format "󰄒 TODO %d " modeline-agenda-todo-count)
              (format "󱞿 DOING %d " modeline-agenda-doing-count)
              (format "󰝕 WAIT %d " modeline-agenda-wait-count)
              "-  "
              modeline-agenda-file-name
              "    :Acc "
              modeline-emacs-uptime)))


;; ========================================
;; 设置不同的信息更新定时器
;; ========================================
(run-at-time "0 sec" 60    'update-modeline-with-all-scripts)    ; 每60秒更新一次状态栏除议程数量之外的信息


(provide 'ui-modeline-bar)
