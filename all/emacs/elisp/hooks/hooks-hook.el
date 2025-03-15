;; ========================================
;; 钩子配置 hooks-hook.el
;; ========================================


;; ========================================
;; 编程类钩子hook
;; ========================================
(add-hook 'prog-mode 'hs-minor-mode)                                                             ; 折叠展开


;; ========================================                                                      
;; 完成初始化后的钩子hook                                                                        
;; ========================================                                                      
(add-hook 'after-init-hook (lambda ()                                                            
                             (kivnn/close-scratch-and-messages-buffer)                           
                             (dashboard-open)
                             (kivnn/update-modeline-with-all-scripts)))                          ; 初始化钩子



;; ========================================                                                      
;; 笔记文本org/LaTeX-PS/text的钩子hook                                                           
;; ========================================                                                      
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)                                             ; 单行文本超出一定长度后自动虚拟换行显示(类似于set wrap)
(add-hook 'TeX-after-compilation-finished-functions     #'TeX-revert-document-buffer)            ; AUCTeX(14.0.3.2024-03-17)
(add-hook 'org-mode-hook                                #'org-cdlatex-mode)                      ; 在org-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'LaTeX-mode-hook                              #'cdlatex-mode)                          ; 在LaTeX-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'org-mode-hook                                #'valign-mode)                           ; 在org-mode使用valign对齐不等宽字体
(add-hook 'LaTeX-mode-hook                              #'tree-sitter-mode)                      ; 在LaTeX-mode使用ts
(add-hook 'org-mode-hook
          (lambda ()
            (kivnn/org-table-with-cdlatex)
            (add-hook 'post-command-hook 'kivnn/org-table-with-cdlatex)))                        ; 仅在org-table上下文范围内使用cdlatex的TAB来补全来防止单元格内容不会因org-cycle而被新插入的字符org-self-insert-command而覆盖
(add-hook 'pdf-view-mode-hook                           'kivnn/pdf-view-mode-hook-with-yas)      ; 在PDFView里禁用yasnippet


;; ========================================
;; GNU Emacs相关
;; ========================================
(add-hook 'kill-emacs-hook                              'kivnn/save-emacs-uptime)                ; 在退出Emacs时保存当前uptime


;; ========================================
;; telega相关
;; ========================================
(add-hook 'telega-root-mode-hook                        'kivnn/telega-buffer-face-height)        ; 调整telega的主界面字体大小为1.3倍
(add-hook 'telega-chat-mode-hook                        'kivnn/telega-buffer-face-height)        ; 调整telega的聊天界面字体大小为1.3倍


;; ========================================
;; theme相关
;; ========================================
(add-hook 'after-init-hook                              'kivnn/load-theme-light)                 ; 保证最开始打开时一定是亮色主题


(provide 'hooks-hook)
