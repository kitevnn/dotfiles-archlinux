;; ===============================================
;; 主题 ui-theme-light.el
;; ===============================================
(use-package nano-theme
  :ensure nil
  :defer t
  :config
  (load-theme 'nano-light t t))


;; ===============================================
;; 添加主题的哈希到安全主题列表
;; ===============================================
(add-to-list 'custom-safe-themes "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02")
(load-theme 'nano-light t)
(setq custom-safe-themes
  '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
(setq custom-safe-themesdefault
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))


(provide 'ui-theme-light)
