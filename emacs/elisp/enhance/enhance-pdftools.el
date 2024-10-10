;; ===============================================
;; PDF工具 enhance-pdftools
;; ===============================================
(use-package pdf-tools
  :ensure t
  :defer nil
  :init
  (pdf-loader-install))  ; 按下M-x pdf-tools-setup 来编译安装


(provide 'enhance-pdftools)
