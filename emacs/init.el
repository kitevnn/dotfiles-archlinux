;; 加载路径: ~/.config/emcas/elisp/

;; load-path ~/.config/emacs/elisp/icon/
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "elisp/icon")))
;; load-path ~/.config/emacs/elisp/init/
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "elisp/init")))
;; load-path ~/.config/emacs/elisp/plug/
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "elisp/plug")))
;; load-path ~/.config/emacs/elisp/theme/
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "elisp/theme")))
;; load-path ~/.config/emacs/elisp/note/
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "elisp/note")))



;; -- /note/笔记加载 --
(require 'note-orgmode)       ;; 加载OrgMode

;; -- /icon/图标加载 --
(require 'icon-nerdfont)      ;; 加载nf图标

;; -- /init/初始化加载 --
(require 'init-elpa)          ;; 源设置
(require 'init-startup)       ;; 启动时的必要设置
(require 'init-keyutils)      ;; 快捷键utils
(require 'init-keybindings)   ;; 快捷键global-set-key的设置

;; -- /theme/主题加载 --
(require 'theme-flatwhite)
;; (require 'theme-bright)    ;; bright(leuven-theme)主题像极了VisualStudio
;; (require 'theme-ample)     ;; ample主题太黑了

;; -- /plug/插件加载 -- 
(require 'plug-restart)       ;; 重启emacs的包
(require 'plug-cmp)           ;; 补全框架
(require 'plug-tab)           ;; buffer管理
(require 'plug-statusbar)     ;; 底下的statusbar的美化
(require 'plug-focus)         ;; dimmer.el让自己的专注力专注于特定的window
(require 'plug-avy)           ;; avy光标导航插件(类似hop.nvim)
(require 'plug-crux)          ;; crux增强原生emacs编辑体验
(require 'plug-indent)        ;; aggressive-indent自动缩进 + highlight-indentation缩进颜色块
(require 'plug-hlsymbol)      ;; 高亮同款词语，达到vim的hlsearch功能
(require 'plug-dirvish)       ;; 逆天插件，同款竞品有joshuto/yazi/ranger
(require 'plug-whichkey)      ;; whichkey插件，该插件的开山之祖在Emacs上
(require 'plug-pair)          ;; 自动括号匹配
(require 'plug-clipboard)     ;; 用list更方便地查看king-ring
(require 'plug-moveline)      ;; 上下移动光标当前行
(require 'plug-undo)          ;; 增强GNU Emacs的原生undo & redo的功能
(require 'plug-snip)          ;; Yasnippet代码片段
(require 'plug-textconversion);; underscore → UPCASE → CamelCase变换各种驼峰写法
(require 'plug-format)        ;; 格式化特定语言的源代码(类似conform.nvim)
(require 'plug-lsp)           ;; 老色批客户端(我自己这里用的eglot)
(require 'plug-deadgrep)      ;; 抓文本插件(类似于telescope.nvim)这种插件的存在
(require 'plug-dashboard)     ;; GNU Emacs的欢迎界面
;; (require 'plug-rime)       ;; live in emacs的输入法(前端: emacs-rime, 后端: rime)
;; (require 'plug-ivy)        ;; ivy增强原生emacs操作功能(ivy依赖swiper，swiper依赖counsel)
;; (require 'plug-spell)      ;; 拼写检查，我自己嫌太noice了所以clean掉了(感觉目前来说不太需要

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rime yasnippet-snippets which-key vundo telephone-line string-inflection smartparens restart-emacs projectile project-explorer org nerd-icons-dired nerd-icons-completion move-text highlight-thing highlight-indentation format-all eglot-booster eglot dumb-jump doom-themes dirvish dimmer deadgrep dashboard crux company centaur-tabs browse-kill-ring avy aggressive-indent))
 '(package-vc-selected-packages
   '((eglot-booster :vc-backend Git :url "https://github.com/jdtsmith/eglot-booster"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
