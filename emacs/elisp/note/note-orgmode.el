;; 
;; note-orgmode.el Emacs最著名的一款笔记管理插件
;; 
(use-package org
  :ensure t
  :defer t)



;; org-mode inline latex的utf-8字符相关
;; 按理来说，应该是可以的，但折腾了一下午仍然不能在inline latex的equtation环境下输入utf-8字符
; (add-to-list 'org-preview-latex-process-alist
;              '(xelatex-chinese
;                :programs ("xelatex" "convert")
;                :description "XeLaTeX with Chinese support dvi > png"
;                :message "You need to install the programs: xelatex and ImageMagick."
;                :image-input-type "pdf"
;                :image-output-type "png"
;                :image-size-adjust (1.7 . 1.6)
;                :latex-header "\\documentclass[preview]{standalone}\n\\usepackage{ctex}\n\\usepackage{amsmath}\n\\usepackage{graphicx}\n\\pagestyle{empty}" ;; 使用 ctex 包支持中文
;                :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
;                :image-converter ("convert -density 150 %f -quality 90 %O")))

;; 设置默认的预览过程
; (setq org-preview-latex-default-process 'xelatex-chinese)



(provide 'note-orgmode)

