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
;; 亮色vertico
;; ========================================
(dolist (face-attr '((vertico-group-separator  :background "#37474f" :foreground "#ffffff")
                       (vertico-group-title      :background "#37474f" :foreground "#ffffff")
                       (vertico-posframe         :background "#ffffff" :foreground "#37474f")
                       (vertico-current          :background "#b5ffd1" :foreground "#37474f")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))


;; ========================================
;; 亮色org-keyword-faces
;; ========================================
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#ffffff" :background "#37474f"))
        ("WAIT"  . (:foreground "#673ab7" :background "#ffffff"))
        ("DOING" . (:foreground "#673ab7" :background "#ffffff"))
        ("DONE"  . (:foreground "#cfd8dc" :background "#ffffff"))))


;; ========================================
;; 亮色isearch
;; ========================================
(dolist (face-attr '((isearch-fail :foreground "#37474f" :background "#ffffff")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))


;; ========================================
;; 亮色agenda
;; ========================================
(with-eval-after-load 'org
  (dolist (face-attr '((org-agenda-structure     :background "#37474f" :foreground "#ffffff")
                       (org-agenda-date          :background "#ffffff" :foreground "#673ab7")
                       (org-agenda-date-today    :background "#cfd8dc" :foreground "#37474f")
                       (org-agenda-current-time  :background "#ffffff" :foreground "#673ab7")
                       (org-time-grid            :background "#ffffff" :foreground "#37474f")
                       (org-scheduled-today      :background "#ffffff" :foreground "#000000")
                       (org-imminent-deadline    :background "#ffffff" :foreground "#37474f")
                       (org-scheduled-previously :background "#ffffff" :foreground "#cfd8dc")
                       (org-todo                 :background "#ffffff" :foreground "#673ab7")
                       (org-upcoming-deadline    :background "#ffffff" :foreground "#673ab7")
                       (org-default              :background "#ffffff" :foreground "#37474f")
                       (org-special-keyword                            :foreground "#a5acaf")
                       (org-date                                       :foreground "#a5acaf")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))


;; ========================================
;; 亮色region
;; ========================================
(dolist (face-attr '((region  :background "#eceff1")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr)))


;; ========================================
;; 亮色emms
;; ========================================
(with-eval-after-load 'emms                                                                            
  (dolist (face-attr '((emms-playlist-selected-face :background "#37474f" :foreground "#ffffff")
                       (emms-playlist-track-face                          :foreground "#673ab7")))
    (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))


;; ========================================
;; 亮色corfu
;; ========================================
(with-eval-after-load 'corfu                                                                            
    (dolist (face-attr '((corfu-default :background "#ffffff")
                         (corfu-border  :background "#37474f")
                         (corfu-current :background "#cfd8dc"  :foreground "#37474f")))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))


;; ========================================
;; 亮色dirvish
;; ========================================
(with-eval-after-load 'dirvish                                                                    
    (dolist (face-attr '((dirvish-hl-line :background "#cfd8dc" :foreground "#37474f")))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))


;; ========================================
;; 亮色telega
;; ========================================
(with-eval-after-load 'telega
    (dolist (face-attr '((telega-msg-heading  :background "#ffffff" )
                         (help-key-binding    :background "#ffffff" :foreground "#673ab7" :height 90 :box nil )))
      (apply #'set-face-attribute (car face-attr) nil (cdr face-attr))))


(provide 'ui-theme-light)
