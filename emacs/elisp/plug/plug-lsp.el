;;
;; eglot: LSP客户端(LSP Client)
;; 
(require 'eglot)

;; Emacs LSP Booster: 给lsp-mode或eglot提高LS速度的Booster(wrapper executable)
(use-package eglot-booster
	:after eglot
	:config	(eglot-booster-mode))

(provide 'plug-lsp)
