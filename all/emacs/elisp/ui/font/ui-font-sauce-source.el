;; ========================================
;; 字体设置 ui-font-sauce-source.el
;; ========================================


;; ========================================
;; 全局字体设置
;; ========================================
(set-face-attribute 'default nil
                    :height variable-ui-fonts-size
                    :font variable-ui-fonts-sauce)
(set-face-attribute 'mode-line nil
                    :height (- variable-ui-fonts-size 30)
                    :family variable-ui-fonts-sauce)
(set-face-attribute 'mode-line-inactive nil
                    :height (- variable-ui-fonts-size 30)
                    :family variable-ui-fonts-sauce)


;; ========================================
;; centaur-tabs字体设置
;; ========================================
(centaur-tabs-change-fonts variable-ui-fonts-sauce variable-ui-fonts-size)


;; ========================================
;; 特定mode字体设置
;; ========================================
; 设置 variable-pitch 字体 (用于 org-mode 等可变宽场景)
; 设置 fixed-pitch (等宽，用于代码块)
(defun kivnn/set-org-emms-mode-font ()
  "在特定的mode设置字体"
  (setq-local face-remapping-alist
              `((default            :family ,variable-ui-fonts-sauce   :height ,variable-ui-fonts-size)
                (variable-pitch nil :family ,variable-ui-fonts-source  :height ,variable-ui-fonts-size)
                (fixed-pitch nil    :family ,variable-ui-fonts-sauce   :height ,variable-ui-fonts-size))))

(defun kivnn/set-telega-mode-font ()
  "在特定的telega-mode设置字体"
  (setq-local face-remapping-alist
              `((default            :family ,variable-ui-fonts-sauce  :height ,(+ variable-ui-fonts-size 20))
                (variable-pitch nil :family ,variable-ui-fonts-source :height ,(+ variable-ui-fonts-size 20))
                (fixed-pitch nil    :family ,variable-ui-fonts-sauce  :height ,(+ variable-ui-fonts-size 20)))))

(defun kivnn/set-minibuffer-mode-font ()
  "在默认的mode设置字体"
  (setq-local face-remapping-alist
              `((default            :family ,variable-ui-fonts-source :height ,variable-ui-fonts-size))))


;; ========================================
;; 特定mode字体钩子
;; ========================================
(add-hook 'org-mode-hook         #'kivnn/set-org-emms-mode-font)         ; org-mode
(add-hook 'emms-mode-hook        #'kivnn/set-org-emms-mode-font)         ; emms-mode
(add-hook 'telega-root-mode-hook #'kivnn/set-telega-mode-font)           ; telega-root-mode
(add-hook 'telega-chat-mode-hook #'kivnn/set-telega-mode-font)           ; telega-chat-mode
(add-hook 'minibuffer-mode-hook  #'kivnn/set-minibuffer-mode-font)       ; minibuffer-mode


(provide 'ui-font-sauce-source)
