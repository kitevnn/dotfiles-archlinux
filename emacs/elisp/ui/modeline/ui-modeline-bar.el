;; ===============================================
;; 关于mode-line
;; ===============================================

;% (defun update-mode-line-with-scripts-output ()
;%   (let ((calendar-month-output (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/calendar-month.sh"))))
;%     (setq global-mode-string
;%           (list calendar-month-output)))
;% 
;% 
;% ;; 定时更新模式行
;%   (run-at-time "0 sec" 43200 'update-mode-line-with-scripts-output)
;; ===============================================
;; 关于mode-line
;; ===============================================
(defvar modeline-output-calendar-month "")        ; 定义全局变量来存储输出
(defvar modeline-output-calendar-day "")          ; 定义全局变量来存储输出
(defvar modeline-output-time-hour "")             ; 定义全局变量来存储输出
(defvar modeline-output-time-minute "")           ; 定义全局变量来存储输出
(defvar modeline-output-battery-percentage "")    ; 定义全局变量来存储输出
(defvar modeline-output-distribution "")          ; 定义全局变量来存储输出
(defvar modeline-output-disk-usage "")            ; 定义全局变量来存储输出
(defvar modeline-output-cpu-temperature "")       ; 定义全局变量来存储输出
(defvar modeline-output-ram-usage "")             ; 定义全局变量来存储输出
(defvar modeline-output-pacman-packages "")       ; 定义全局变量来存储输出


;; ===============================================
;; 关于当前日期
;; ===============================================
(defun update-modeline-output-calendar-month ()
  (setq modeline-output-calendar-month (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/calendar-month.sh"))))
(defun update-modeline-output-calendar-day ()
  (setq modeline-output-calendar-day (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/calendar-day.sh"))))
;; ===============================================
;; 关于当前时间
;; ===============================================
(defun update-modeline-output-time-hour ()
  (setq modeline-output-time-hour (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/time-hour.sh"))))
(defun update-modeline-output-time-minute ()
  (setq modeline-output-time-minute (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/time-minute.sh"))))
;; ===============================================
;; 关于电池信息
;; ===============================================
(defun update-modeline-output-battery-percentage ()
  (setq modeline-output-battery-percentage (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/battery-percentage.sh"))))
;; ===============================================
;; 关于发行版信息
;; ===============================================
(defun update-modeline-output-distribution ()
  (setq modeline-output-distribution (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/distribution.sh"))))
(defun update-modeline-output-pacman-packages ()
  (setq modeline-output-pacman-packages (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/pacman-packages.sh"))))
;; ===============================================
;; 关于使用率
;; ===============================================
(defun update-modeline-output-disk-usage ()
  (setq modeline-output-disk-usage (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/disk-usage.sh"))))
(defun update-modeline-output-cpu-temperature ()
  (setq modeline-output-cpu-temperature (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/cpu-temperature.sh"))))
(defun update-modeline-output-ram-usage ()
  (setq modeline-output-ram-usage (string-trim (shell-command-to-string "/home/une/.config/emacs/elisp/ui/modeline/ram-usage.sh"))))


(defun update-modeline-with-all-scripts ()
  (setq global-mode-string 
        (list "  󰃯 "
              modeline-output-calendar-month
              modeline-output-calendar-day
              "   "
              modeline-output-time-hour
              ":"
              modeline-output-time-minute
              "   ."
              modeline-output-battery-percentage
              "   "
              modeline-output-distribution              
              "   "
              modeline-output-cpu-temperature              
              "°C   ."
              modeline-output-disk-usage
              "  󰄨 "
              modeline-output-ram-usage
              "G "
              " 󰏖 "
              modeline-output-pacman-packages)))
              

;; ===============================================
;; 定时更新每个脚本
;; ===============================================
(run-at-time "0 sec" 1800  'update-modeline-output-time-hour)           ; 每30分钟更新一次时间小时信息
(run-at-time "0 sec" 60    'update-modeline-output-time-minute)         ; 每1分钟更新一次时间分钟信息
(run-at-time "0 sec" 43200 'update-modeline-output-calendar-day)        ; 每12小时更新一次日历月份信息
(run-at-time "0 sec" 86400 'update-modeline-output-calendar-month)      ; 每24小时更新一次日历月份信息
(run-at-time "0 sec" 120   'update-modeline-output-battery-percentage)  ; 每2分钟更新一次电池信息
(run-at-time "0 sec" 86400 'update-modeline-output-distribution)        ; 每1天更新一次发行版信息
(run-at-time "0 sec" 86400 'update-modeline-output-disk-usage)          ; 每1天更新一次磁盘使用量信息
(run-at-time "0 sec" 15    'update-modeline-output-cpu-temperature)     ; 每15秒更新一次CPU温度信息
(run-at-time "0 sec" 15    'update-modeline-output-ram-usage)           ; 每15秒更新一次内存使用量信息
(run-at-time "0 sec" 43200 'update-modeline-output-pacman-packages)     ; 每12小时更新一次包使用量

;; ===============================================
;; 定时更新模式行，设置为每分钟检查一次
;; ===============================================
(run-at-time "0 sec" 60 'update-modeline-with-all-scripts)


(provide 'ui-modeline-bar)  


