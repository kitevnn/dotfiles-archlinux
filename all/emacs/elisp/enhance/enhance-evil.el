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
  (define-key evil-normal-state-map (kbd "C-w h")           #'windmove-left)
  (define-key evil-normal-state-map (kbd "C-w j")           #'windmove-down)
  (define-key evil-normal-state-map (kbd "C-w k")           #'windmove-up)
  (define-key evil-normal-state-map (kbd "C-w l")           #'windmove-right)
  (define-key evil-normal-state-map (kbd "<up>")            #'kivnn/resize-top-five-unit)
  (define-key evil-normal-state-map (kbd "<down>")          #'kivnn/resize-bottom-five-unit)
  (define-key evil-normal-state-map (kbd "<left>")          #'kivnn/resize-left-five-unit)
  (define-key evil-normal-state-map (kbd "<right>")         #'kivnn/resize-right-five-unit)
  (define-key evil-normal-state-map (kbd "/")               #'kivnn/isearch-forward)
  (define-key evil-normal-state-map (kbd "SPC /")           #'kivnn/isearch-backward)
  (define-key evil-normal-state-map (kbd "SPC g")           #'magit)
  (define-key evil-normal-state-map (kbd "SPC e")           #'telega)
  (define-key evil-normal-state-map (kbd "SPC t")           #'eat)
  (define-key evil-normal-state-map (kbd "SPC b")           #'ibuffer)
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
    ;;; org-mode  
  (with-eval-after-load 'org
    (evil-make-overriding-map org-mode-map 'normal)
    (evil-define-key 'normal org-mode-map
                     ;; about te<x>t
                     (kbd "SPC x v") #'kivnn/toggle-inline-images-with-valign
                     (kbd "SPC x c") #'org-latex-preview
                     (kbd "SPC x z") #'kivnn/org-latex-preview
                     (kbd "SPC x b") #'kivnn/jump-the-beginning-of-the-latex-fragment
                     (kbd "SPC x f") #'kivnn/jump-the-ending-of-the-latex-fragment
                     (kbd "SPC x n") #'kivnn/jump-the-next-latex-fragment
                     (kbd "SPC x p") #'kivnn/jump-the-previous-latex-fragment
                     (kbd "SPC x ,") #'org-previous-item
                     (kbd "SPC x .") #'org-next-item
                     (kbd "SPC x 0") #'valign-mode
                     ;; about <a>genda
                     (kbd "SPC a t") #'kivnn/org-agenda-change-headline-to-todo
                     (kbd "SPC a d") #'kivnn/org-agenda-change-headline-to-done
                     (kbd "SPC a i") #'kivnn/org-agenda-change-headline-to-doing
                     (kbd "SPC a w") #'kivnn/org-agenda-change-headline-to-wait
                     (kbd "SPC a j") #'org-todo
                     (kbd "SPC a -") #'org-timestamp-inactive
                     (kbd "SPC a 0") #'org-archive-subtree
                     (kbd "SPC a =") #'org-timestamp
                     (kbd "SPC a [") #'org-schedule
                     (kbd "SPC a ]") #'org-deadline
                     ;; about de<n>ote
                     (kbd "SPC n a") #'denote
                     (kbd "SPC n c") #'denote-backlinks
                     (kbd "SPC n l") #'denote-link-or-create
                     (kbd "SPC n r") #'denote-rename-file
                     (kbd "SPC n ,") #'denote-find-backlink
                     (kbd "SPC n .") #'denote-find-link)
    (evil-define-key 'insert org-mode-map
                     (kbd "$") #'kivnn/insert-inline-OCDL))
  ;;; ibuffer-mode
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))  
  (with-eval-after-load 'ibuffer
    (evil-make-overriding-map org-mode-map 'normal)    
    (evil-define-key 'normal ibuffer-mode-map
                     ;; vim-motion
                     (kbd "h") #'evil-backward-char
                     (kbd "j") #'evil-next-line
                     (kbd "k") #'evil-previous-line
                     (kbd "l") #'evil-forward-char                     
                     (kbd "v") #'evil-visual-char
                     ;; emacs-style
                     (kbd "C-f") #'evil-forward-char
                     (kbd "C-b") #'evil-backward-char
                     (kbd "C-n") #'evil-next-line
                     (kbd "C-p") #'evil-previous-line)))
  ;;; minibuffer-mode
  


(provide 'enhance-evil)
