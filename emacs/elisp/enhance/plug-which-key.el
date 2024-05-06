;; 
;; plug-which-key.el: 提示下一步按键信息的插件
;; 
(use-package which-key
  :init
  (which-key-setup-side-window-right)

  :config
  (which-key-mode 1))

(provide 'plug-which-key)
