;; ========================================
;; note-orgroam.el 双链笔记(卡片盒笔记法)
;; ========================================
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "/home/une/桌面/back/archlinux/orgroam")
  (org-roam-dailies-directory "daily/")
  (org-roam-db-gc-threshold most-positive-fixnum)
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :ensure t
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t))


(provide 'note-orgroam)
