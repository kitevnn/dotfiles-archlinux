;; ========================================
;; 第三方加载 sitelisp-eaf.el
;; ========================================
(add-to-list 'load-path "~/.config/emacs/site-lisp/emacs-application-framework/")

;; ========================================
;; eaf核心加载
;; ========================================
(require 'eaf)

;; ========================================
;; eaf-browser浏览器加载
;; ========================================
(require 'eaf-browser)


(provide 'sitelisp-eaf)
