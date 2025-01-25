;; =======================================
;; 文件路径 basic-file.el
;; =======================================


;; =======================================
;; 关于directory文件夹
;; =======================================
(defvar directory-default-directory       "~/桌面/back/archlinux/org/")               ; GNU Emacs的起始目录
(defvar directory-backup-directory-alist  "~/.config/emacs/saves/")                  ; 恢复文件的保存目录
(defvar directory-modeline-path-suffix    "elisp/site-lisp/sh/")                     ; emacs配置文件路径的modeline部分
(defvar directory-site-lisp               "elisp/site-lisp/sh/")                     ; emacs配置文件路径的modeline部分
(defvar directory-org-roam-directory      "~/桌面/back/archlinux/org/GTD/roam/")      ; org-roam的保存目录
(defvar directory-emacs-archive           "archive/")                                 ; emacs-archive的保存目录


;; =======================================
;; 关于file文件
;; =======================================
(defvar file-org-agenda-files "~/桌面/back/archlinux/org/GTD/agenda/2025.org")        ; org-agenda的GTD文件


(provide 'basic-file)
