;; ========================================
;; 模拟vim layer的按键风格，的前提准备
;; ========================================
(defun kivnn/evil-split-window-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun kivnn/evil-split-window-below ()
  (interactive)
  (split-window-below)
  (windmove-down))


;; ========================================
;; 模拟vim layer的按键风格 enhance-evil.el
;; ========================================
(use-package evil
  :ensure t
  :defer t
  :config
  ;;; global-mode
  (define-key evil-normal-state-map (kbd "S")               #'save-buffer)
  (define-key evil-normal-state-map (kbd "s")               nil)
  (define-key evil-normal-state-map (kbd "J")               #'kivnn/move-next-five-lines)
  (define-key evil-normal-state-map (kbd "K")               #'kivnn/move-prev-five-lines)
  (define-key evil-normal-state-map (kbd "M")               #'dirvish-side)
  (define-key evil-normal-state-map (kbd "Q")               #'evil-delete-buffer)
  (define-key evil-normal-state-map (kbd "sq")              #'delete-window)
  (define-key evil-normal-state-map (kbd "sh")              #'split-window-right)
  (define-key evil-normal-state-map (kbd "sj")              #'kivnn/evil-split-window-below)
  (define-key evil-normal-state-map (kbd "sk")              #'split-window-below)
  (define-key evil-normal-state-map (kbd "sl")              #'kivnn/evil-split-window-right)
  (define-key evil-normal-state-map (kbd "sb")              #'ibuffer)
  (define-key evil-normal-state-map (kbd "C-w h")           #'windmove-left)
  (define-key evil-normal-state-map (kbd "C-w j")           #'windmove-down)
  (define-key evil-normal-state-map (kbd "C-w k")           #'windmove-up)
  (define-key evil-normal-state-map (kbd "C-w l")           #'windmove-right)
  (define-key evil-normal-state-map (kbd "<up>")            #'kivnn/resize-top-five-unit)
  (define-key evil-normal-state-map (kbd "<down>")          #'kivnn/resize-bottom-five-unit)
  (define-key evil-normal-state-map (kbd "<left>")          #'kivnn/resize-left-five-unit)
  (define-key evil-normal-state-map (kbd "<right>")         #'kivnn/resize-right-five-unit)
  (define-key evil-normal-state-map (kbd "/")               #'kivnn/isearch-forward)
  (define-key evil-normal-state-map (kbd "\\ /")            #'kivnn/isearch-backward)
  (define-key evil-normal-state-map (kbd "\\ g")            #'magit)  
  (define-key evil-normal-state-map (kbd "\\ e")            #'telega)
  (define-key evil-normal-state-map (kbd "\\ t")            #'eat)
  ;;; dired-map
  (with-eval-after-load 'dired
    (evil-define-key 'normal dired-mode-map
      (kbd "a") #'dired-create-empty-file
      (kbd "r") #'dired-do-rename
      (kbd "m") #'dired-mark
      (kbd "M") #'dirvish-side
      (kbd "u") #'dired-unmark
      (kbd "d") #'dired-do-delete
      (kbd "h") #'dired-up-directory
      (kbd "j") #'dired-next-line
      (kbd "k") #'dired-previous-line
      (kbd "l") #'dired-find-file))
  (with-eval-after-load 'org
    ;;;; 这句是关键！
    ;; [evil环境]: 在使用evil时，如果要重新绑定org-mode的快捷键，就必须要这样设置(真的是巨坑，不知道这句之前，足足折磨了我2小时还在原地踏步)
    (evil-make-overriding-map org-mode-map 'normal)
    (evil-define-key 'normal org-mode-map
      (kbd "\\ c l") #'org-latex-preview
      (kbd "\\ z l") #'kivnn/org-latex-preview)
    (evil-define-key 'insert org-mode-map
      (kbd "$") #'kivnn/insert-inline-OCDL)))


(provide 'enhance-evil)
