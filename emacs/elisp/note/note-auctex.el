;; 
;; note-auctex.el: AUCTeX、类LaTeX编辑环境
;;
(use-package auctex
  :ensure t
  :defer t
  
  :init
  ;; AUCTeX相关
  (setq-default TeX-engine 'xetex)                                      ; 更改AUCTeX的渲染引擎从pdflatex到xelatex
  (setq-default TeX-command-default "LatexMk")                          ; 使用 latexmk
  (setq latexmk-command "latexmk -pdf -xelatex")                        ; 指定 latexmk 使用 XeLaTeX
  (setq-default TeX-PDF-mode t)                                         ; PDF输出
  (setq TeX-clean-intermediate t)                                       ; 清理中间文件
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t))                           ; pdf-tools(20240429.407)作为pdf-viewer


(provide 'note-auctex)
