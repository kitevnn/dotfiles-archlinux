;; 
;; init-elpa 软件包源配置
;; 

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")))   覆盖式加入
;; (add-to-list 'package-archives
;;           '("melpa-stable" . "https://stable.melpa.org/packages/"))    添加式加入
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(require 'package)

(setq package-enable-at-startup nil)
(package-initialize)

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

;; (unless (bound-and-true-p package--initialized)
;;   (package-initialize))
;;
;; (package-initialize)
;;
;; (unless package-archive-contents)
;;   (package-refresh-contents)
;;
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

(require 'use-package)

(provide 'init-elpa)
