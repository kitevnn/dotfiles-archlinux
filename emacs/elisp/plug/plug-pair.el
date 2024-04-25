;; 
;; plug-pair: smartparens-config, 括号匹配
;;

(require 'smartparens-config)

;; 括号匹配应用给特定PL上
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'C-mode-hook  #'smartparens-mode)

(provide 'plug-pair)
