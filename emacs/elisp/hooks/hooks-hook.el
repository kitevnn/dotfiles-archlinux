;; ========================================
;; 钩子配置 hooks-hook.el
;; ========================================


;; ========================================
;; 编程类钩子hook
;; ========================================
(add-hook 'prog-mode 'hs-minor-mode)                                         ; 折叠展开


;; ========================================
;; 完成初始化后的钩子hook
;; ========================================
(add-hook 'after-init-hook (lambda () 
                             (custom-close-scratch-and-message-buffer)
                             (dashboard-open)))                              ; 初始化钩子


;; ========================================
;; 笔记文本org/LaTeX-PS/text的钩子hook                                         
;; ========================================
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)                         ; 单行文本超出一定长度后自动虚拟换行显示(类似于set wrap)
(add-hook 'TeX-after-compilation-finished-functions                          ; AUCTeX(14.0.3.2024-03-17)
          #'TeX-revert-document-buffer)                                     
(add-hook 'org-mode-hook #'org-cdlatex-mode)                                 ; 在org-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'LaTeX-mode-hook #'cdlatex-mode)                                   ; 在LaTeX-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'org-mode-hook #'valign-mode)                                      ; 在org-mode使用valign对齐不等宽字体
(add-hook 'LaTeX-mode-hook #'tree-sitter-mode)                               ; 在LaTeX-mode使用ts
(add-hook 'org-mode-hook
          (lambda ()
            (custom-org-table-with-cdlatex)
            (add-hook 'post-command-hook 'custom-org-table-with-cdlatex)))   ; 仅在org-table上下文范围内使用cdlatex的TAB来补全来防止单元格内容不会因org-cycle而被新插入的字符org-self-insert-command而覆盖
(add-hook 'pdf-view-mode-hook 'custom-pdf-view-mode-hook-with-yas)           ; 在PDFView里禁用yasnippet


;; ========================================
;; 壳eshell的钩子hook
;; ========================================
(add-hook 'eshell-mode-hook
          (lambda ()
            (add-hook 'window-configuration-change-hook 'custom-eshell-mode-hook)
            (add-hook 'kill-buffer-hook
                      (lambda ()
                        (remove-hook 'window-configuration-change-hook 'custom-eshell-mode-hook)))))


;; ========================================
;; 关于telega
;; ========================================
(add-hook 'telega-load-hook
          (lambda ()
            (define-key global-map (kbd "C-c u") telega-prefix-map)))


(provide 'hooks-hook)
