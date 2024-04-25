;; 
;; plug-indent: 缩进线插件，类似于 neovim 的 ibl 插件
;; 

(require 'highlight-indentation)
(require 'aggressive-indent)

;; aggressive-indent:      自动缩进
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)  ;; 目前仅给 Emacs Lisp 该FP，进行自动缩进
(add-hook 'C-lisp-mode-hook     #'aggressive-indent-mode)  ;; 目前仅给      C     该FP，进行自动缩进

;; highlight-indentation:  缩进块颜色 ((global-set-key (kbd "C-c i")         'highlight-indentation-mode)     ;; 设置缩进块颜色)
(set-face-background 'highlight-indentation-face "#d2ebe3")                 ;; f7e0c3 | e3e3d3 | d2ebe3
(set-face-background 'highlight-indentation-current-column-face "#d2ebe3")  ;; c3b3b3 | d2ebe3

(provide 'plug-indent)
