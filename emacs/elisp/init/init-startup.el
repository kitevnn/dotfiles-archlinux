;; 
;; init-startup: 基本配置
;; 

;; 禁止欢迎界面
(setq inhibit-startup-screen t)

;; 禁用工具栏的那些东西
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; 快速恢复window
(winner-mode 1)

;; 设置字体，字体大小 = 150 / 10 = 15pt
(set-face-attribute 'default nil 
                    :height 150
                    :font "SauceCodeProNerdFontCompleteMono Nerd Font")

;; 内置的emacs做到vim的C-d的补全
(fido-mode t)

;; 折叠展开（仅prog-mode编程模式可用，很喜欢这么做的话，就global-set-key（确信）（
;; M-x hs-hide-all                   折叠所有codeblock
;; M-x hs-show-all                   展开所有codeblock
;; M-x hs-hide-block                 折叠当前codeblock
;; M-x hs-show-block                 展开当前codeblock
;; M-x hs-hide-initial-comment-block 折叠开始的commentblock
;; M-x hs-show-initial-comment-block 展开开始的commentblock
(add-hook 'prog-mode 'hs-minor-mode)

;; 展示行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; 默认关闭，在startup启动的 *scratch* 与 *Messages* 与 *Async-native-compile-log* 的默认Buffer
;; - Async-native-compile-log: 一个异步编译的日志Buffer
;; - Messages: 展示按了什么键的Buffer(即vim的左下角提供的信息处)
;; (add-hook 'emacs-startup-hook (lambda ()
;;                                 (when (get-buffer "*Async-native-compile-log*")
;;                                   (kill-buffer "*Async-native-compile-log*"))))
;; (add-hook 'emacs-startup-hook (lambda ()
;;                                 (when (get-buffer "*Messages*")
;;                                   (kill-buffer "*Messages*"))))
(when (get-buffer "*scratch*") 
  (kill-buffer "*scratch*"))
;; (when (get-buffer "*Messages*") 
;;   (kill-buffer "*Messages*"))
;; (when (get-buffer "*Async-native-compile-log*") 
;;   (kill-buffer "*Async-native-compile-log*"))


(provide 'init-startup)

