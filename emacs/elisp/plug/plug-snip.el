;; 
;; plug-snip: yasnippet, 代码片段本体引擎(不包含代码片段库，所以要自己安装代码片段库)
;; 

(require 'yasnippet)
(yas-global-mode 1)                          ;; 为全局模式设置了yas-global-mode的代码片段

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)  ;; 为编程模式设置了yas-minor-mode的代码片段

;; 代码片段库
;; - yasnippet-snippets
;; - yasmate
;; - textmate-to-yas.el
(require 'yasnippet-snippets)

(provide 'plug-snip)
