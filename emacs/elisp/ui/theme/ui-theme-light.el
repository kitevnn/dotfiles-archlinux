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
(set-face-attribute 'vertico-current nil :background "#b5ffd1")


;; ========================================
;; 为telega-heading添加face颜色
;; ========================================
(with-eval-after-load 'telega
  (set-face-attribute 'telega-msg-heading nil :background "#ffffff" :extend nil))


;; ========================================
;; corfu弹出窗口颜色设置
;; ========================================
(with-eval-after-load 'corfu
  (set-face-attribute 'corfu-default nil :background "#ffffff")
  (set-face-attribute 'corfu-border nil :background "#37474f")
  (set-face-attribute 'corfu-current nil :background "#cfd8dc" :foreground "#37474f"))


;; ========================================
;; 为dirvish-hl-line添加face颜色
;; ========================================
(with-eval-after-load 'dirvish
  (set-face-attribute 'dirvish-hl-line nil :background "#cfd8dc" :foreground "#37474f"))


;; ========================================
;; 为vertico-posframe添加face颜色
;; ========================================
(set-face-attribute 'vertico-group-separator nil :background "#37474f" :foreground "#FFFFFF")
(set-face-attribute 'vertico-group-title nil :background "#37474f" :foreground "#FFFFFF")


(provide 'ui-theme-light)
