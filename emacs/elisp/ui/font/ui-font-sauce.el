;; ========================================
;; 字体设置 ui-font-sauce.el
;; ========================================

;; ========================================
;; 全局默认字体设置
;; ========================================
(set-face-attribute 'default nil 
                    :height 90
                    :font "SauceCodeProNerdFontCompleteMono Nerd Font")

;; ========================================
;; 设置buffer的字体
;; ========================================
(centaur-tabs-change-fonts "SauceCodeProNerdFontCompleteMono Nerd Font" 90)


(provide 'ui-font-sauce)
