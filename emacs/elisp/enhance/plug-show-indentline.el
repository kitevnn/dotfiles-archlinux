;; 
;; plug-show-indentline.el 展示缩进线的插件
;; 
;;    > 缩进模式，已经通过GNU Emacs内建的(built-in)开启的 M-x electric-indent-mode 来开启

(use-package highlight-indent-guides
             :ensure t
             :defer t
             :init
             (setq highlight-indent-guides-method 'column)  ;; 'fill | 'column | 'bitmap

             :hook
             (prog-mode     .    highlight-indent-guides-mode))

(provide 'plug-show-indentline)

