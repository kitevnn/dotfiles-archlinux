;; ========================================
;; 字体设置 ui-font-sauce.el
;; ========================================

;; ========================================
;; 全局默认字体设置
;; ========================================
(set-face-attribute 'default nil 
                    :height variable-ui-fonts-size
                    :width 'semi-expanded
                    :font "SauceCodeProNerdFontCompleteMono Nerd Font")



;; ========================================
;; 设置centaur-tabs的字体
;; ========================================
(centaur-tabs-change-fonts "SauceCodeProNerdFontCompleteMono Nerd Font" variable-ui-fonts-size)


;; ========================================
;; 设置特定mode的字体
;; ========================================
; 设置 variable-pitch 字体（用于 org-mode 等可变宽场景）
; 设置 fixed-pitch（等宽，用于代码块）
(defun kivnn/set-mode-font ()
  "在特定的mode设置字体"
  (setq-local face-remapping-alist
              `((default            :family "SauceCodePro Nerd Font"                     :height ,variable-ui-fonts-size)
                (variable-pitch nil :family "Source Han Sans CN"                         :height ,variable-ui-fonts-size)   
                (fixed-pitch nil    :family "SauceCodeProNerdFontCompleteMono Nerd Font" :height ,variable-ui-fonts-size))))

(defun kivnn/set-telega-mode-font ()
  "在特定的telega-mode设置字体"  
  (setq-local face-remapping-alist
              `((default            :family "SauceCodePro Nerd Font"                     :height ,(+ variable-ui-fonts-size 20))
                (variable-pitch nil :family "Source Han Sans CN"                         :height ,(+ variable-ui-fonts-size 20))
                (fixed-pitch nil    :family "SauceCodeProNerdFontCompleteMono Nerd Font" :height ,(+ variable-ui-fonts-size 20)))))


;; ========================================
;; 设置特定mode的字体
;; ========================================
(add-hook 'org-mode-hook #'kivnn/set-mode-font)                ; org-mode
(add-hook 'emms-mode-hook #'kivnn/set-mode-font)               ; emms-mode
(add-hook 'telega-root-mode-hook #'kivnn/set-telega-mode-font) ; telega-root-mode
(add-hook 'telega-chat-mode-hook #'kivnn/set-telega-mode-font) ; telega-chat-mode


(provide 'ui-font-sauce)
