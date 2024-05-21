;; 
;; init-basic.el 基本配置
;; 

;; 禁止欢迎界面
(setq inhibit-startup-screen t)

;; 禁用工具栏的那些东西
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; 快速恢复window
;; (winner-mode 0)   ;; 设置为0，防止与切换buffer的快捷键冲突

;; 设置字体，字体大小 = 140 / 10 = 15pt
(set-face-attribute 'default nil 
                    :height 90
                    :font "SauceCodeProNerdFontCompleteMono Nerd Font")

;; 内置的emacs做到vim的C-d的补全
(fido-mode t)

;; 折叠展开
(add-hook 'prog-mode 'hs-minor-mode)

;; 展示行号
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; 禁用Messages与scratch的Buffer
(setq-default message-log-max nil)
(add-hook 'after-init-hook 
          (lambda () 
            (when (get-buffer "*scratch*") 
              (kill-buffer "*scratch*") 
            (when (get-buffer "*Messages*") 
              (kill-buffer "*Messages*")))))

;; 设置 *scratch* 的初始化展示的字符串
;; (setq initial-scratch-message "")

;; 关闭默认Buffer
;; (when (get-buffer "*scratch*") 
;;   (kill-buffer "*scratch*"))

;; 根据文件后缀自动设置mode(比如c-mode、比如c++-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'"   . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'"   . c-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'"  . rust-mode)) ;; rust-mode需要从elpa源里安装
(add-to-list 'auto-mode-alist '("\\.go\\'"  . go-mode))
(add-to-list 'auto-mode-alist '("\\.hs\\'"  . hs-mode))
(add-to-list 'auto-mode-alist '("\\.el\\'"  . emacs-lisp-mode))

;; 单行文本超出一定长度后自动虚拟换行显示(类似于set wrap)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; 编码设置
;; set coding config, last is highest priority.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Recognize-Coding.html#Recognize-Coding
;; (prefer-coding-system 'cp950)
;; (prefer-coding-system 'gb2312)
;; (prefer-coding-system 'cp936)
;; (prefer-coding-system 'gb18030)
;; (prefer-coding-system 'utf-16)
;; (prefer-coding-system 'utf-8-dos)
;; (prefer-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)

;; 显示行号模式
;; (global-display-line-numbers-mode 1)
;; 设置相对行号
;; (setq display-line-numbers-type 'relative)

;; 软空格
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq tab-stop-list (tab-stops-generate))

;; 透明背景
;; (setq default-frame-alist '((width . 90)
;;                             (height . 50)
;;                             (alpha-background . 81)))

;; 自定义恢复文件配置(Auto saving.....done)
(setq backup-directory-alist `(("." . "~/.config/emacs/saves/")))     ;; 统一设置恢复文件的保存目录，而不污染当前同级目录
(setq backup-by-copying t)                                            ;; 设置保存形式
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)                                                  ;; 设置保存版本控制

;; AUCTeX相关
(setq-default TeX-engine 'xetex)                                      ;; 更改AUCTeX的渲染引擎从pdflatex到xelatex
(setq-default TeX-PDF-mode t)                                         ;; PDF输出
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))          ;; pdf-tools(20240429.407)作为pdf-viewer
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions                   ;; AUCTeX(14.0.3.2024-03-17)
          #'TeX-revert-document-buffer)

;; 1行80个字符
(setq-default fill-column 80)

(provide 'init-basic)
