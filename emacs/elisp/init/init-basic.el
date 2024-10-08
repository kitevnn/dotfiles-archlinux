;; 
;; 基本设置 init.basic.el
;; 

;; 关闭显示
(setq inhibit-startup-screen t) ; 关闭默认欢迎界面显示
(tool-bar-mode -1)              ; 关闭工具栏显示
(menu-bar-mode -1)              ; 关闭菜单栏显示
(scroll-bar-mode -1)            ; 关闭滑动条显示

;; 设置字体大小
(set-face-attribute 'default nil                                            
                    :height 90
                    :font "SauceCodeProNerdFontCompleteMono Nerd Font")

;; 设置内置补全
(fido-mode t)

;; 记得好像是为了禁止message与scratch
(setq-default message-log-max nil)

;; 设置编码
(prefer-coding-system 'utf-8)

;; 自定义恢复文件配置(Auto saving.....done)
(setq backup-directory-alist `(("." . "~/.config/emacs/saves/")))     ; 统一设置恢复文件的保存目录，而不污染当前同级目录
(setq backup-by-copying t)                                            ; 设置保存形式
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)                                                  ; 设置保存版本控制

;; 设置1行共有80个字符
(setq-default fill-column 80)

;; 透明背景
; (setq default-frame-alist '((width . 90)
;                             (height . 50)
;                              (alpha-background . 81)))


(provide 'init-basic)
