;; orgmode行间公式查看中文
;; from https://emacs-china.org/t/emacs-org-mode-inline-latex/27450

(add-to-list 'org-preview-latex-process-alist
             '(
             (dvipng
               :programs ("latex" "dvipng")
               :description "dvi > png"
               :message "you need to install the programs: latex and dvipng."
               :image-input-type "dvi"
               :image-output-type "png"
               :image-size-adjust (1.0 . 1.0)
               :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
               :image-converter ("dvipng -D %D -T tight -o %O %f")
               :transparent-image-converter ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
             (dvisvgm
               :programs ("latex" "dvisvgm")
               :description "dvi > svg"
               :message "you need to install the programs: latex and dvisvgm."
               :image-input-type "dvi"
               :image-output-type "svg"
               :image-size-adjust (1.7 . 1.5)
               :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
               :image-converter ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
             (imagemagick
               :programs ("latex" "convert")
               :description "pdf > png"
               :message "you need to install the programs: latex and imagemagick."
               :image-input-type "pdf"
               :image-output-type "png"
               :image-size-adjust (1.0 . 1.0)
               :latex-compiler ("pdflatex -interaction nonstopmode -output-directory %o %f")
               :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O"))               
               (xelatex-chinese               
               :programs ("xelatex" "convert")               
               :description "XeLaTeX with Chinese support dvi > png"               
               :message "you need to install the programs: xelatex and divpng."               
               :image-input-type "pdf"               
               :image-output-type "png"               
               :image-size-adjust (1.7 . 1.6)               
               :latex-header "\\documentclass[10pt]{standalone}\n\\usepackage{fontspec}\n\\setmainfont{Noto Serif CJK TC}\\setsansfont{Noto Sans CJK TC}\n\\usepackage[usenames]{color}\n\\usepackage{amsmath}\n\\pagestyle{empty}" ; pagestyle{empty} 是必须的               
               :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")               
               :image-converter ("convert -density 100 %f %O")))  ; Press [C-x C-e] to activate previewing utf-8 in org-mode.
             )

;; GPT AI提供的
(defun custom-org-preview-latex ()
  "尝试使用多个 LaTeX 处理器进行预览。"
  (let ((processes '(xelatex-chinese imagemagick dvipng dvisvgm))
        (success nil))
    (dolist (process processes)
      (setq org-preview-latex-default-process process)
      (when (org-preview-latex-buffer)
        (setq success t)
        (cl-return)))
    (unless success
      (error "所有处理器均失败"))))

(define-key org-mode-hook (kbd "C-c C-x C-0") 'custom-org-preview-latex) 

(setq org-preview-latex-default-process '(dvipng dvisvgm imagemagick xelatex-chinese))  ; Press [C-x C-e] to activate previewing utf-8 in org-mode. ; 设置默认的预览过程
(setq org-preview-latex-default-process 'xelatex)                                       ; Press [C-x C-e] to activate previewing utf-8 in org-mode. ; 设置默认的预览过程


(add-hook 'LaTeX-mode-hook (lambda ()
                             (company-mode -1)))          ; 在LaTeX-mode关闭company转而使用cdlatex
(add-hook 'LaTeX-mode-hook (lambda ()
                             (confu-mode -1)))            ; 在LaTeX-mode关闭corfu转而使用cdlatex(好像并不用，好像是兼容可以一起开的？)

; (use-package company
;   :config
;   (setq company-dabbrev-code-everywhere t
;         company-dabbrev-code-modes t
;         company-dabbrev-code-other-buffers 'all
;         company-dabbrev-downcase nil
;         company-dabbrev-ignore-case t
;         company-dabbrev-other-buffers 'all
;         company-require-match nil
;         company-minimum-prefix-length 2
;         company-show-numbers t
;         company-tooltip-limit 20
;         company-idle-delay 0
;         company-echo-delay 0
;         company-tooltip-offset-display 'scrollbar
;         company-begin-commands '(self-insert-command))  
;   (push '(company-semantic :with company-yasnippet) company-backends)
; 
;   :hook ((after-init . global-company-mode)))



; (use-package corfu
;   :init
;   (progn
;     (setq corfu-auto t)
;     (setq corfu-cycle t)
;     (setq corfu-quit-at-boundary t)
;     (setq corfu-quit-no-match t)
;     (setq corfu-preview-current nil)
;     (setq corfu-min-width 80)
;     (setq corfu-max-width 100)
;     (setq corfu-auto-delay 0.2)
;     (setq corfu-auto-prefix 1)
;     (setq corfu-on-exact-match nil)
;     (global-corfu-mode)))
