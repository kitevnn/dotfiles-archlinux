;; ========================================
;; org笔记及任务管理 note-orgmode.el
;; ========================================
(use-package org
  :ensure t
  :defer nil)
 

;; ========================================
;; org-babel(C-c ') 能加载 LaTeX
;; ========================================
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((latex . t)))


;; ========================================
;; valign 虚拟对齐
;; ========================================
(use-package valign
  :ensure t
  :defer nil)


;; ========================================
;; 使用 xelatex 渲染 latex-fragment
;; ========================================
(add-to-list 'org-preview-latex-process-alist
             '(xelatex-chinese
               :programs ("xelatex" "pdf2svg")
               :description "XeLaTeX with Chinese support (PDF > SVG)"
               :message "You need to install: xelatex and pdf2svg."
               ;; 方案: pdf 转 svg
               :image-input-type "pdf"
               :image-output-type "svg"
               :image-size-adjust (1.7 . 1.5)
               :latex-header "\\documentclass[11pt]{standalone}
                              \\usepackage{fontspec}
                              \\setmainfont{Source Han Sans CN}
                              \\setsansfont{Source Han Sans CN}
                              \\setmonofont{Source Han Sans CN}
                              \\usepackage[usenames]{color}
                              \\usepackage{amsmath}
                              \\usepackage{extpfeil}
                              \\pagestyle{empty}"
               :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
               ;; 依赖: pacman -S pdf2svg
               :image-converter ("pdf2svg %f %O")))
;; 永久设置org-preview-latex的默认进程为上面的xelatex-chinese
(setq org-preview-latex-default-process 'xelatex-chinese)


;; ========================================
;; 设置更多可用的org-todo
;; ========================================
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "WAIT" "DONE" "MY")))


;; ========================================
;; 设置latex-fragment的默认背景颜色
;; ========================================
(setq org-format-latex-options
      `(:foreground default
                    :background "#FFFFFF"                 
                    :html-foreground default
                    :html-background default
                    :matchers ("\\[")))


;; ========================================
;; 设置org-download
;; ========================================
;; 依赖xclip，同时截图工具如(spectacle)必须设置为复制截图到剪贴板或按下C-c来复制
(use-package org-download
             :ensure t
             :defer nil
             :after org)


;; ========================================
;; 设置org-preview-html
;; ========================================
(use-package org-preview-html
             :ensure t
             :defer t)


(provide 'note-orgmode)
