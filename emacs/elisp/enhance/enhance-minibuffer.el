;; ===============================================
;; 搜索工具 enhance-minibuffer.el(like helm)
;; ===============================================
(use-package vertico
  :ensure t
  :defer nil
  :init
  (vertico-mode t))  ; 自动弹出minibuffer
(with-eval-after-load 'vertico
  (set-face-attribute 'vertico-current nil :background "#b5ffd1"))


;; ===============================================
;; 失序查找lisp原子
;; ===============================================
(use-package orderless
  :ensure t
  :defer nil
  :custom
  ;; orderless关于mini-buffer的基本设置
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))  

  ;; orderless关于corfu的基本设置
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))


;; ===============================================
;; 给lisp原子添加描述信息desc
;; ===============================================
(use-package marginalia
  :ensure t
  :defer nil
  :init
  (marginalia-mode t))


;; ===============================================
;; 增强原始工作流的工具
;; ===============================================
(use-package embark
  :ensure t
  :defer nil)
(use-package embark-consult
  :ensure t
  :defer nil)
(use-package consult
  :ensure t
  :defer nil)


(provide 'enhance-minibuffer)
