;; ===============================================
;; 关于add-hook钩子设置
;; ===============================================
(add-hook 'prog-mode 'hs-minor-mode)                        ; 折叠展开
(add-hook 'after-init-hook (lambda () 
    (when (get-buffer "*scratch*")
      (kill-buffer "*scratch*") 
    (when (get-buffer "*Messages*") 
      (kill-buffer "*Messages*")))))                        ; 禁用Messages与scratch
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)        ; 单行文本超出一定长度后自动虚拟换行显示(类似于set wrap)
(add-hook 'TeX-after-compilation-finished-functions         ; AUCTeX(14.0.3.2024-03-17)
          #'TeX-revert-document-buffer)
(add-hook 'org-mode-hook #'org-cdlatex-mode)                ; 在org-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'LaTeX-mode-hook #'cdlatex-mode)                  ; 在LaTeX-mode使用OCDL(这是OCDL而不是CDL)
(add-hook 'org-mode-hook #'valign-mode)                     ; 在org-mode使用valign对齐不等宽字体


(provide 'custom-hooks)