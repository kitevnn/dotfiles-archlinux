;; 
;; init-keybindings: 设置全局快捷键(Warning: 现在个人快捷键习惯还没有成形，未来可能有Breaking Change!!)
;; 

;;                                Global Keys CheetSheet
;; +------------------------------------------------------------------------------------------+
;; |     快捷键         |       功能             |  执行的elisp函数                           |
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   M-m              |  列出源的包            |  list-packages                             |
;; |   M-o              |  加载特定文件          |  load-file                                 |
;; |   M-l              |  重启GNU Emacs         |  restart-emacs                             |
;; |   M-S-<up>         |  当前行往上移动        |  move-text-up                              |     M-<up>   在OrgMode上有自己的快捷键
;; |   M-S-<down>       |  当前行往下移动        |  move-text-down                            |     M-<down> 在OrgMode上有自己的快捷键
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   C-c C-w u        |  恢复window布局        |  winner-undo                               |     我用 C-w 是想提示自己 Control-w(indow)，即C-w
;; |   C-c C-w r        |  重现window布局        |  winner-redo                               |
;; |   C-c C-w <left>   |  切换到左边window      |  windmove-left                             |
;; |   C-c C-w <down>   |  切换到下边window      |  windmove-down                             |
;; |   C-c C-w <up>     |  切换到上边window      |  windmove-up                               |
;; |   C-c C-w <right>  |  切换到右边window      |  windmove-right                            |
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   C-c C-s [        |  切换到上一个buffer    |  centaur-tabs-backward                     |     我用 C-c 当作 first prefix-key，然后用 C-s 当作 second prefix-key (C-c C-b 是 native byte compile，冲突了)
;; |   C-c C-s ]        |  切换到下一个buffer    |  centaur-tabs-forward                      |
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   C-c C-s f        |  模拟vim的f寻找        |  avy-goto-char-in-line                     |     我用 C-c 当作 first prefix-key，然后用 C-s 当作 second prefix-key
;; |   C-c C-s i        |  设置缩进块颜色        |  highlight-indentation-mode                |
;; |   C-c C-s m        |  打开dirvish           |  dirvish                                   |
;; |   C-c C-s q        |  关闭dirvish           |  dirvish-quit                              |
;; |   C-c C-s s        |  打开自动括号匹配      |  smartparens-mode                          |
;; |   C-c C-s l        |  list打开king-ring     |  browse-kill-ring                          |
;; |   C-c C-s v        |  打开vundo             |  vundo                                     |
;; |   C-c C-s c        |  变换驼峰写法          |  string-inflection-emacs-lisp-style-cycle  |
;; |   C-c C-s r        |  格式化代码            |  format-all-region-or-buffer               |
;; |   C-c C-s p        |  客户端                |  eglot                                     |
;; |   C-c C-s d        |  抓文本(类似telescope) |  deadgrep                                  |     我用 C-c 当作 first prefix-key，然后用 C-s 当作 second prefix-key (C-c C-d 是 OrgMode 的默认快捷键，冲突了)
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   C-c C-y g        |  打开yasnippet(global) |  yas-global-mode                           |     我用 C-y 是想提示自己 Control-y(asnippet)，即C-y
;; |   C-c C-y m        |  打开yasnippet(minor)  |  yas-minor-mode                            |
;; | ------------------ + ---------------------- + ------------------------------------------ |
;; |   C-c C-m i        |  项目管理本体          |  projectile-mode                           |     我用 C-m 是想提示自己 Control-project m(anagement)，即C-m
;; |   C-c C-m o        |  nerdtree展示项目      |  project-explorer-open                     |
;; +------------------------------------------------------------------------------------------+


;;                                           OrgMode CheetSheet
;; +-----------------------------------------------------------------------------------------------------+
;; |                       对 [标题] 操作，[当前光标] 放在 [标题处]                                      |
;; +------------------------------------------------------------------------------------------------------
;; |  C-c C-n           |  光标跳转到下一个标题(是标题就跳转)                                            |
;; |  C-c C-p           |  光标跳转到上一个标题(是标题就跳转)                                            |
;; |  C-c C-f           |  光标跳转到下一个标题(必须是同级标题才跳转)                                    |
;; |  C-c C-b           |  光标跳转到上一个标题(必须是同级标题才跳转)                                    |
;; |  C-c C-u           |  光标跳转到父级目录(2级→1级，3级→2级)                                          |
;; |  M-RET             |  创建 [同级标题]                                                               |
;; |  M-S-RET           |  创建 [同级TODO]                                                               |
;; |  Tab               |  循环更改标题级别                                                              |
;; |  M-<left>          |  提升级别(4级 > M-<left> > 3级)                                                |
;; |  M-<right>         |  降低级别(5级 > M-<right> > 6级)                                               |
;; |  M-<up>            |  对于 [同级标题]，当前标题，与上一个标题，交换                                 |
;; |  M-<down>          |  对于 [同级标题]，当前标题，与下一个标题，交换                                 |
;; |  C-c C-w           |  将光标指向的条目，放在特定标题下                                              |
;; |  C-x n s           |  将光标指向的子项，变窄                                                        |   变窄: 可以理解为在Global区只能看到特定Buffer区，可以提升自己对特定Buffer区的专注力(非特定Buffer区的只是隐藏起来了)
;; |  C-x n w           |  将光标指向的子项，变宽                                                        |   变宽: 可以理解为在Global区看到Global区，        可以总览全文
;; |  C-c / + 单个字符  |  使用SparseTree(稀疏树, 数据结构)来将 [标题] 当作是一个SparseTree节点          |
;; |  C-c / + 单个字符  |  并且配合 [单个字符] 代表的 [regexp正则表达式] 来 [快速勾选多个标题节点]       |
;; |                    |                                                                                |
;; +-----------------------------------------------------------------------------------------------------+
;; |                       对 [清单列表] 操作，[当前光标] 放在 [清单列表]                                |   清单列表: ul无序列表 | ol有序列表 | 多复选框
;; +-----------------------------------------------------------------------------------------------------+
;; |  Tab               |  用 [3种不同模式] 来 [循环展示清单列表]                                        |
;; |  M-RET             |  新建 [同级子项]                                                               |
;; |  M-S-RET           |  新建 [同级复选框]                                                             |
;; |  M-S-<up>          |  当前子项上移                                                                  |
;; |  M-S-<down>        |  当前子项下移                                                                  |
;; |  M-<left>          |  当前子项去掉1个缩进(升1级)                                                    |
;; |  M-<right>         |  当前子项加上1个缩进(降1级)                                                    |
;; |  C-c C-c           |  勾选/取消勾选 [复选框] (做TODO时应该会很有用)                                 |
;; |  C-c -             |  循环更改子项的编号项 ( "-", "+", "*", "1", "1)" )                             |
;; +-----------------------------------------------------------------------------------------------------+
;; |                       对 [表格] 操作，[当前光标] 放在 [表格]                                        |
;; +-----------------------------------------------------------------------------------------------------+             OrgMode表格的 [扩展] 与 [收缩] 的逻辑
;; |  C-c C-c           |  重新对齐整个表格                                                              |   ------------------------        -------------------------
;; |  Tab               |  对齐当前表格项，并且光标移动到下一个表格项                                    |   |  扩展时              |        |   收缩时              |
;; |  S-Tab             |  对齐当前表格项，并且光标移动到上一个表格项                                    |   |  - M-S-<right>       |        |   - M-S-<left>        |
;; |  RET               |  对齐当前表格项所在的row，并且光标移动到下一行                                 |   |  - M-S-<down>        |        |   - M-S-<up>          |
;; |  S-<up>            |  [当前光标的表格项]，与 [上边的表格项]，交换                                   |   |                      |        |                       |
;; |  S-<down>          |  [当前光标的表格项]，与 [下边的表格项]，交换                                   |   |        →             |        |        ←              |
;; |  S-<left>          |  [当前光标的表格项]，与 [左边的表格项]，交换                                   |   |         \            |        |         \             |
;; |  S-<right>         |  [当前光标的表格项]，与 [右边的表格项]，交换                                   |   |          \           |        |          \            |
;; |  M-<left>          |  [当前光标的column]，与 [左边的column]，交换                                   |   |           \          |        |           \           |
;; |  M-<right>         |  [当前光标的column]，与 [右边的column]，交换                                   |   |            \         |        |            \          |
;; |  M-S-<left>        |  删除当前column                                                                |   |             \        |        |             \         |
;; |  M-S-<right>       |  新增空白column                                                                |   |              →       |        |              ←        |
;; |  M-S-<up>          |  删除当前row                                                                   |   |                      |        |                       |
;; |  M-S-<down>        |  新增空白row                                                                   |   ------------------------        -------------------------
;; |  C-c -             |  光标的下一行，添加 --+---+-- 的线条，光标不移动                               |
;; |  C-c RET           |  光标的下一行，添加 --+---+-- 的线条，光标移动到 --+---+-- 的下一行去          |
;; |  C-c ^ (C-c S-6)   |  对表格子项，进行排序                                                          |
;; |  C-j               |  光标停留在 --+---+-- 处，然后C-j了，就会新增一行空白                          |
;; +-----------------------------------------------------------------------------------------------------+
;; |                       对 [超链接] 操作，[当前光标] 放在 [超链接]                                    |
;; +-----------------------------------------------------------------------------------------------------+
;; |                    |                                                                                |
;; |  C-c l             |  被org-store-link此elisp函数进行Storaged的超链接                               |
;; |  C-c a             |  org-agenda此elisp函数，不明觉厉，但是 [美味的樱桃菌] 就是这么设置的           |
;; |  C-c c             |  org-capture此elisp函数，不明觉厉，但是 [美味的樱桃菌] 就是这么设置的          |
;; |                    |                                                                                |
;; |  C-c C-l           |  当光标放在空白处时                                                            |
;; |                    |       > C-c C-l                                                                |
;; |                    |       > 通过在list里选择插入那些被org-store-link此elisp函数进行Storaged的超链接|
;; |                    |       > 插入成功                                                               |
;; |                    |                                                                                |
;; |  C-c C-l           |  当光标放在超链接上时，编辑超链接                                              |
;; |  C-c C-o           |  打开超链接，进行跳转                                                          |
;; |                    |                                                                                |
;; +-----------------------------------------------------------------------------------------------------+


;; 修改默认键位(在尊重emacs原生键位习惯，与打造个人Keybindings键位风格之间，进行平衡)
(global-set-key (kbd "C-c r")    'set-mark-command)                 ;; 设定region选区
(global-set-key (kbd "C-c b")    'move-to-window-line-top-bottom)   ;; 快速移动region选区到line/top/bottom



;; use-package
(global-set-key (kbd "M-m")    'list-packages)


;; 重载emacs配置
(global-set-key (kbd "M-o")    'load-file)


;; 重启emacs
(global-set-key (kbd "M-l")    'restart-emacs)


;; 恢复window   (需要(winner-mode 1)，我在init-startup.el设置好了)
(global-set-key (kbd "C-c C-w u")    'winner-undo)   ;; 回到上一次的分屏布局
(global-set-key (kbd "C-c C-w r")    'winner-redo)   ;; 回到下一次的分屏布局


;; 切换window
(global-set-key (kbd "C-c C-w <left>")    'windmove-left)
(global-set-key (kbd "C-c C-w <down>")    'windmove-down)
(global-set-key (kbd "C-c C-w <up>")      'windmove-up)
(global-set-key (kbd "C-c C-w <right>")   'windmove-right)


;; 切换buffer
(global-set-key (kbd "C-c C-s [")         'centaur-tabs-backward)
(global-set-key (kbd "C-c C-s ]")         'centaur-tabs-forward)


;; 创建buffer
(global-set-key (kbd "C-c C-b n")         'centaur-tabs--create-new-tab)
;;          使用centaur-tabs后，它会这样
;; ----------------------------------------------
;; | *scratch* | BufferList(由centaur-tabs创建) |
;; |           | -  centaur-tab-1               |
;; |           | -  centaur-tab-2               |
;; |           | -  centaur-tab-3               |
;; |           | -  centaur-tab-114514          |
;; ----------------------------------------------


;; 光标跳转
;; 
;; 查看Avy软件包提供的57个elisp函数:  M-x > 输入 avy > 按 TAB 来自动补全 > 确定avy-*的elisp函数 > 执行elisp函数看看情况再绑定到global-set-key全局快捷键上
;; - avy-goto-char          ;; 全文寻找1个char
;; - avy-goto-char-2        ;; 全文寻找2个char(需连着)
;; - avy-goto-char-timer    ;; 全文寻找1个char(timer版)
;; - avy-goto-char-in-line  ;; 当前行寻找1个char
;; - avy-goto-word-1        ;; 全文寻找1个word
;; - avy-goto-word-0        ;; Input zero chars, jump to a word start with a tree.
;; - avy-resume             ;; 不明觉厉
(global-set-key (kbd "C-c C-s f")         'avy-goto-char-in-line)     ;; 模拟vim的f寻找(但是带光标跳转)


;; 便捷功能
;; 
;; Ivy
;; (ivy-mode)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;; 查看Ivy软件包提供的81个elisp函数:  M-x > 输入 ivy > 按 TAB 来自动补全 > 确定ivy-*的elisp函数 > 执行elisp函数看看情况再绑定到global-set-key全局快捷键上
;; - swiper                           ;;
;; - ivy-resume                       ;; 
;; - ivy-resume                       ;; 
;; - counsel-M-x                      ;; 
;; - counsel-find-file                ;; 
;; - counsel-describe-function        ;; 
;; - counsel-describe-variable        ;; 
;; - counsel-describe-symbol          ;; 
;; - counsel-find-library             ;; 
;; - counsel-info-lookup-symbol       ;; 
;; - counsel-unicode-char             ;; 
;; - counsel-git                      ;; 
;; - counsel-git-grep                 ;; 
;; - counsel-ag                       ;;
;; - counsel-locate                   ;;
;; - counsel-rhythmbox                ;;
;; - counsel-minibuffer-history       ;;
;; (global-set-key (kbd "C-c x")         'counsel-M-x)                 ;; C-c x来进入counsel-M-x(便捷很多的M-x)
;; (global-set-key (kbd "C-c d")         'dired-jump-other-window)     ;; C-c x来进入counsel-M-x(便捷很多的M-x)


;; 编辑体验增强
;; 
;; crux
;; 查看crux软件包提供的44个elisp函数:  M-x > 输入 crux > 按 TAB 来自动补全 > 确定crux-*的elisp函数 > 执行elisp函数看看情况再绑定到global-set-key全局快捷键上
;; - crux-open-with                                               ;; 
;; - crux-smart-kill-line                                         ;; 
;; - crux-smart-open-line-above                                   ;; 
;; - crux-smart-open-line                                         ;; 
;; - crux-cleanup-buffer-or-region                                ;; 
;; - crux-recentf-find-file                                       ;; 
;; - crux-recentf-find-directory                                  ;; 
;; - crux-view-url                                                ;; 
;; - crux-eval-and-replace                                        ;; 
;; - crux-transpose-windows                                       ;; 
;; - crux-delete-file-and-buffer                                  ;; 
;; - crux-copy-file-preserve-attributes                           ;; 
;; - crux-duplicate-current-line-or-region                        ;; 
;; - crux-duplicate-and-comment-current-line-or-region            ;; 
;; - crux-rename-file-and-buffer                                  ;; 
;; - crux-visit-term-buffer                                       ;; 
;; - crux-kill-other-buffers                                      ;; 
;; - crux-indent-defun                                            ;; 
;; - crux-indent-rigidly-and-copy-to-clipboard                    ;; 
;; - crux-find-user-init-file                                     ;;  
;; - crux-find-user-custom-file                                   ;;  
;; - crux-find-shell-init-file                                    ;;  
;; - crux-top-join-line                                           ;;  
;; - crux-kill-whole-line                                         ;;  
;; - crux-kill-line-backwards                                     ;;  
;; - crux-kill-and-join-forward                                   ;;  
;; - crux-kill-buffer-truename                                    ;;  
;; - crux-ispell-word-then-abbrev                                 ;;  
;; - crux-upcase-region                                           ;;  
;; - crux-downcase-region                                         ;;  
;; - crux-capitalize-region                                       ;;  
;; - crux-other-window-or-switch-buffer                           ;;  


;; 开启缩进块颜色
;; 
;; highlight-indentation
(global-set-key (kbd "C-c C-s i")         'highlight-indentation-mode)     ;; 设置缩进块颜色


;; 逆天file-tree插件
;; 
;; dirvish
(global-set-key (kbd "C-c C-s m")         'dirvish)                      ;; 打开dirvish  (press ? for help)
(global-set-key (kbd "C-c C-s q")         'dirvish-quit)                 ;; 关闭dirvish
;; dirvish操作: 
;; - Press ?    打开help          (help是相当于which-key的快捷键用法的)
;; - C-g        返回上一级的help  (help是相当于which-key的快捷键用法的)
;; - Enter      进入文件夹
;; - ^          退出文件夹
;; (global-set-key (kbd "C-c t m")      'dirvish-override-dired-mode)  ;; 开启dirvish覆盖dired模式 (C-c t m: 指代 toggle Menu)   ;; 后面用 https://github.com/rainstormstudio/nerd-icons.el?tab=readme-ov-file#use-nerd-icons-with-dirvish 提供的 use-package 来缝了别人的 :init dirvish-override-dired-mode，这样就会自动开启dirvish-override-dired-mode(dirvish覆盖dired的模式)了(


;; 自动括号匹配
;; 
;; smartparens-mode 
(global-set-key (kbd "C-c C-s s")           'smartparens-mode)             ;; 打开自动括号匹配


;; 用list查看king-ring，更直观
;; 
;; browse-kill-ring
(global-set-key (kbd "C-c C-s l")           'browse-kill-ring)             ;; list打开king-ring


;; 光标当前行上下移
;; 
;; move-text
(global-set-key (kbd "M-S-<up>")            'move-text-up)                 ;; 光标当前行上移
(global-set-key (kbd "M-S-<down>")          'move-text-down)               ;; 光标当前行下移


;; 增强GNU Emacs的原生undo & redo的功能
;; 
;; vundo
(global-set-key (kbd "C-c C-s v")           'vundo)                        ;; 打开vundo
;;                      vundo用法
;; 在M-x vundo后，会出现一个 o--o--x--o--o--o 的tree
;; o: 代表之前做出的节点，x: 代表当前的节点
;; 随着按下f(orward)/b(ackward)，x的位置也会实时地随之改变，很人性化的。
;; 
;; 按 f(orward)  往后移动节点(呈现较新的内容)   ;; 可以说这样才是良好的redo
;; 按 b(ackward) 往前移动节点(呈现较旧的内容)   ;; 可以说这样才是良好的undo
;; 按 n          切换分支(必须要当前节点x处于1棵多叉树的根节点时才能用)
;; 按 p          去父节点
;; 按 l          去上一个存储的节点
;; 按 r          去下一个存储的节点
;; 按 a          去到当前分支的最前节点(内容是当前分支的最旧内容)
;; 按 e          去到当前分支的最后节点(内容是当前分支的最新内容)
;; 按 m          去标记节点，准备来diff，表示 [待diff的节点]
;; 按 u          去取消标记
;; 按 d          去用 [待diff的节点1] 与 [待diff的节点2]，进行 [diff]
;; 按 q          退出vundo
;; 按 C-g        退出vundo
;; 按 C-c C-s    去save-buffer at the current undo state(或者只 M-x save-buffer来调用save-buffer该elisp函数也行)


;; 代码片段
;;
;; Yasnippet
(global-set-key (kbd "C-c C-y g")           'yas-global-mode)                        ;; 打开Yasnippet的yas-global-mode
(global-set-key (kbd "C-c C-y m")           'yas-minor-mode)                         ;; 打开Yasnippet的yas-minor-mode


;; 为word词语，变换各种各样的驼峰写法
;;
;; string-inflection: underscore -> UPCASE -> CamelCase
;; default            (不编码时的情况)
(global-set-key (kbd "C-c C-s c") 'string-inflection-all-cycle)

;; for emacs lisp     (写elisp代码时的情况)         ;; 目前只给了emacs lisp来underscore -> UPCASE -> CamelCase
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-s c") 'string-inflection-emacs-lisp-style-cycle)))

;; for C              (写C代码时的情况)             ;; 目前只给了     C    来underscore -> UPCASE -> CamelCase
(add-hook 'C-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-s c") 'string-inflection-C-style-cycle)))


;; 格式化代码(需要外部安装格式化服务器，没有安装格式化服务器的话，应该会提示Error信息)
;; 
;; format-all
;;          format-all用法
;;  按 C-c r 进入 format-all 界面
;;  然后选择 [格式化服务器]，然后RET
;;  就会根据 [当前项目的格式化服务器的配置]，进行格式化了
(global-set-key (kbd "C-c C-s r")             'format-all-region-or-buffer)


;; LSP Client客户端
;; 
;; eglot
(global-set-key (kbd "C-c C-s p")             'eglot)


;; 项目管理1
;; 
;; projectile
;;          projectile用法
;;      需要自己加文件夹进workspace里，然后才能开始管理
(global-set-key (kbd "C-c C-m i")         'projectile-mode)


;; 项目管理2
;; 
;; project-explorer
;;          project-explorer用法
;;      需要有内容的workspace，才能project-explorer-open
;; "s"        Change directory
;; "j"        Next line
;; "k"        Previous line
;; "g"        Refresh
;; "+"        Create file or directory (if the name ends with a slash)
;; "-" & "d"  Delete file or directory
;; "c"        Copy file or directory
;; "r"        Rename file or directory
;; "q"        Hide sidebar
;; "u"        Go to parent directory
;; "["        Previous sibling
;; "]"        Next sibling
;; "TAB"      Toggle folding. Unfold descendants with C-U
;; "S-TAB"    Fold all. Unfold with C-U
;; "RET"      Toggle folding of visit file. Specify window with C-U
;; "f"        Visit file or directory. Specify window with C-U
;; "w"        Show the path of file at point, and copy it to clipboard
;; "M-k"      Launch ack-and-a-half, from the closest directory
;; "M-l"      Filter using a regular expression. Call with C-u to disable
;; "M-o"      Toggle omission of hidden and temporary files
(global-set-key (kbd "C-c C-m o")         'project-explorer-open)


;; 抓文本插件(类似于telescope.nvim)这种插件的存在
;; 
;; deadgrep
(global-set-key (kbd "C-c C-d o")         'deadgrep)



;; 笔记管理(强大之处无需多言，看完介绍后，我tm直呼牛逼!，我觉得逆天之处1在于OrgMode语法 = LaTeX + typst, 逆天之处2 = Emacs的逆天组合快捷键)
;; 
;; OrgMode
(global-set-key (kbd "C-c l")         'org-store-link)   ;; 将超链接元素，存储在ring中
(global-set-key (kbd "C-c a")         'org-agenda)       ;; 议程管理?
(global-set-key (kbd "C-c c")         'org-capture)      ;; 打开超链接，在GNU Emacs里进行沉浸阅读超链接的内容


;; 用 Control + Space 来切换由狗哥开发的Emacs-rime的激活输入法按键
;;
;; rime
(global-set-key (kbd "C-SPC")         'toggle-input-method)

(provide 'init-keybindings)
