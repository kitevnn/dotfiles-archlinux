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
;; 设置buffer的字体
;; ========================================
(centaur-tabs-change-fonts "SauceCodeProNerdFontCompleteMono Nerd Font" variable-ui-fonts-size)


(provide 'ui-font-sauce)
