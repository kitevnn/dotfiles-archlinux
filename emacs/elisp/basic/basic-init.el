;; =======================================
;; 基本配置 basic-init.el
;; =======================================

;; =======================================
;; 关闭默认欢迎界面
;; =======================================
(setq inhibit-startup-screen t)


;; =======================================
;; 关闭默认工具栏显示
;; =======================================
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


;; =======================================
;; 关闭scratch与Messages的Buffer
;; =======================================
(setq-default message-log-max nil)


;; =======================================
;; 编码设置
;; =======================================
(prefer-coding-system 'utf-8)


;; =======================================
;; ibuffer格式设置
;; =======================================
(setq ibuffer-formats
      '((mark modified read-only locked " " (name 30 18 :left :elide) " "
              (size 9 -1 :right) " " (mode 16 16 :left :elide) " " filename-and-process)
        (mark " " (name 16 -1) " " filename)))


;; =======================================
;; 起始目录
;; =======================================
(setq default-directory "~/桌面/back/archlinux/check")             ; GNU Emacs的起始目录


;; =======================================
;; 关于eshell
;; =======================================
(setq eshell-prompt-function
      (lambda ()
        (let* ((user (getenv "USER"))
               (host (system-name))
               (dir (abbreviate-file-name (eshell/pwd))))
          (concat "[" user "@" host " " dir "]$ "))))                 ; eshell-prompt设置
(setq eshell-banner-message " ")                                      ; eshell-welcome设置


;; =======================================
;; 自定义恢复文件配置(Auto saving...done)
;; =======================================
(setq backup-directory-alist `(("." . "~/.config/emacs/saves/")))     ; 统一设置恢复文件的保存目录，而不污染当前同级目录
(setq backup-by-copying t)                                            ; 设置保存形式
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)                                                  ; 设置保存版本控制


;; =======================================
;; 1行80个字符
;; =======================================
(setq-default fill-column 80)


(provide 'basic-init)
