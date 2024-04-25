;; 
;; plug-statusbar: GNU Emacs底下的那条bar状态栏，类似于vim-airline插件的这种效果
;; 

(require 'telephone-line)

;; 配置一个流动的滑带的separator
;; (setq telephone-line-primary-left-separator    'telephone-line-cubed-left
;;       telephone-line-secondary-left-separator  'telephone-line-cubed-hollow-left
;;       telephone-line-primary-right-separator   'telephone-line-cubed-right
;;       telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
;; (setq telephone-line-height 24
;;       telephone-line-evil-use-short-tag t)

;; 配置文字及颜色的布局结构
(setq telephone-line-primary-left-separator    'telephone-line-cubed-left
      telephone-line-primary-right-separator   'telephone-line-cubed-hollow-left
      telephone-line-secondary-left-separator  'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)

(defface s1 '((t (:foreground "white"     :background "red")))          "")
(defface s2 '((t (:foreground "white"     :background "orange red")))   "")
(defface s3 '((t (:foreground "dim grey"  :background "orange")))       "")
(defface s4 '((t (:foreground "dim grey"  :background "gold")))         "")
(defface s5 '((t (:foreground "dim grey"  :background "yellow")))       "")
(defface s6 '((t (:foreground "dim grey"  :background "chartreuse")))   "")
(defface s7 '((t (:foreground "dim grey"  :background "green")))        "")
(defface s8 '((t (:foreground "dim grey"  :background "spring green"))) "")
(defface s9 '((t (:foreground "dim grey"  :background "cyan")))         "")
(defface s10 '((t (:foreground "white"    :background "blue")))         "")
(defface s11 '((t (:foreground "white"    :background "dark magenta"))) "")

(setq telephone-line-faces
      ;; statusbar的11个区域
      '((red        . (s1                . s1))
        (ored       . (s2                . s2))
        (orange     . (s3                . s3))
        (gold       . (s4                . s4))
        (yellow     . (s5                . s5))
        (chartreuse . (s6                . s6))
        (green      . (s7                . s7))
        (sgreen     . (s8                . s8))
        (cyan       . (s9                . s9))
        (blue       . (s10               . s10))
        (dmagenta   . (s11               . s11))

        ;; statusbar的额外添加的区域(必须加上这3个区域，才可以显示那些软文字，比如LispInteraction区这样的文字)
        (evil       . telephone-line-evil-face)
        (accent     . (telephone-line-accent-active . telephone-line-accent-inactive))
        (nil        . (mode-line                    . mode-line-inactive))))

;; 配置statusbar的每个区域的文字
;; +--------------------------------------------------------+
;; | s1 | s2 | s3 | s4 | s5 | s6 | s7 | s8 | s9 | s10 | s11 |
;; +--------------------------------------------------------+
;; (telephone-line-defsegment s1 () "Oh,")
;; (telephone-line-defsegment s2 () "telephone")
;; (telephone-line-defsegment s3 () "line,")
;; (telephone-line-defsegment s4 () "Give")
;; (telephone-line-defsegment s5 () "me")
;; (telephone-line-defsegment s6 () "some")
;; (telephone-line-defsegment s7 () "time,")
;; (telephone-line-defsegment s8 () "I'm")
;; (telephone-line-defsegment s9 () "living")
;; (telephone-line-defsegment s10 () "in")
;; (telephone-line-defsegment s11 () "twilight")
;; 
;; 配置statusbar的每个区域的颜色
;; +--------------------------------------------------------------------------------------------+
;; | red | ored | orange | gold | yellow | chartreuse | green | sgreen | cyan | blue | dmagenta |
;; +--------------------------------------------------------------------------------------------+
;; (setq telephone-line-lhs
;;       '((red        . (s1))
;;         (ored       . (s2))
;;         (orange     . (s3))
;;         (gold       . (s4))
;;         (yellow     . (s5))
;;         (chartreuse . (s6))
;;         (green      . (s7))
;;         (sgreen     . (s8))
;;         (cyan       . (s9))
;;         (blue       . (s10))
;;         (dmagenta   . (s11))
;;         (nil        . (telephone-line-minor-mode-segment telephone-line-buffer-segment))))
;; 
;; (setq telephone-line-rhs
;;       '((nil        . (telephone-line-misc-info-segment))
;;         (accent     . (telephone-line-major-mode-segment))
;;         (evil       . (telephone-line-airline-position-segment))))

(telephone-line-mode 1)

(provide 'plug-statusbar)
