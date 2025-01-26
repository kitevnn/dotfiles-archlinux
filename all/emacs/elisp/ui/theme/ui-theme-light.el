;; ========================================
;; 主题设置 ui-theme-light.el
;; ========================================
(use-package nano-theme
  :ensure nil
  :defer t
  :init
  (load-theme 'nano-light t t))


;; ========================================
;; 默认加载nano-light主题
;; ========================================
(add-to-list 'custom-safe-themes "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02")
(load-theme 'nano-light t)
(setq custom-safe-thems '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
(setq custom-safe-themsdefault '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))


;; ========================================
;; 为vertico-current添加face颜色
;; ========================================
(custom-set-faces
 '(vertico-current ((t (:background "#b5ffd1")))))


;; ========================================
;; 为telega-heading添加face颜色
;; ========================================
(with-eval-after-load 'telega
  (custom-set-faces
   '(telega-msg-heading ((t (:background "#ffffff" :extend nil))))))


;; ========================================
;; corfu弹出窗口颜色设置
;; ========================================
(with-eval-after-load 'corfu
  (custom-set-faces
   '(corfu-default ((t (:background "#ffffff"))))
   '(corfu-border  ((t (:background "#37474f"))))
   '(corfu-current ((t (:background "#cfd8dc" :foreground "#37474f"))))))


;; ========================================
;; 为dirvish-hl-line添加face颜色
;; ========================================
(with-eval-after-load 'dirvish
  (custom-set-faces
   '(dirvish-hl-line ((t (:background "#cfd8dc" :foreground "#37474f"))))))


;; ========================================
;; 为vertico-posframe添加face颜色
;; ========================================
(custom-set-faces                                                                                        
 '(vertico-group-separator  ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 组分隔线
 '(vertico-group-title      ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 组标题
 '(vertico-posframe         ((t (:background "#ffffff" :foreground "#37474f"))))                        ; child frame
 '(vertico-current          ((t (:background "#b5ffd1" :foreground "#37474f")))))                       ; 当前条目


;; ========================================
;; 为region添加face颜色
;; ========================================
(custom-set-faces
 '(region ((t (:background "#eceff1")))))


;; ========================================
;; 亮色isearch
;; ========================================
(custom-set-faces
 '(isearch-fail ((t (:foreground "#37474f" :background "#ffffff")))))


;; ========================================
;; 亮色agenda
;; ========================================
(custom-set-faces
 '(org-agenda-structure     ((t (:background "#37474f" :foreground "#ffffff"))))                        ; 结构信息
 '(org-agenda-date          ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 星期信息 
 '(org-agenda-date-today    ((t (:background "#cfd8dc" :foreground "#37474f"))))                        ; 今天时间
 '(org-agenda-current-time  ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 当前时间 
 '(org-time-grid            ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 时间刻度线
 '(org-scheduled-today      ((t (:background "#ffffff" :foreground "#000000"))))                        ; 今天的安排 
 '(org-imminent-deadline    ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 即将到期的议程
 '(org-scheduled-previously ((t (:background "#ffffff" :foreground "#cfd8dc"))))                        ; 先前完成或先前未完成的议程
 '(org-todo                 ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 议程状态
 '(org-upcoming-deadline    ((t (:background "#ffffff" :foreground "#673ab7"))))                        ; 即将过期的
 '(org-default              ((t (:background "#ffffff" :foreground "#37474f"))))                        ; 剩余议程
 '(org-special-keyword      ((t (                      :foreground "#a5acaf"))))                        ; 控制SCHEDULE与DEADLINE
 '(org-date                 ((t (                      :foreground "#a5acaf")))))                       ; 控制SCHEDULE与DEADLINE的日期时间

;; ========================================
;; 亮色isearch
;; ========================================
(custom-set-faces                                                                                        
 '(isearch-fail             ((t (:foreground "#37474f" :background "#ffffff")))))                       ; 未匹配的字符串高亮


;; ========================================
;; 亮色org-keyword-faces
;; ========================================
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#ffffff" :background "#37474f"))
        ("WAIT"  . (:foreground "#673ab7" :background "#ffffff"))
        ("DOING" . (:foreground "#673ab7" :background "#ffffff"))
        ("DONE"  . (:foreground "#cfd8dc" :background "#ffffff"))))                                     ; 亮色 org-keyword-faces


(provide 'ui-theme-light)
