;; =======================================
;; PDF工具 enhance-pdftools.el
;; =======================================
(use-package pdf-tools
  :ensure t
  :defer nil
  :init
  (pdf-loader-install))  ; 按下M-x pdf-tools-install 来编译安装


(provide 'enhance-pdftools)
