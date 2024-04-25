;; 
;; plug-focus: 将自己的注意力集中在特定的window区上，类似于 [narrow变窄] 与 [widen变宽] 那种意思。
;; 

(require 'dimmer)
(dimmer-configure-which-key)
(dimmer-configure-helm)
(dimmer-mode t)

(provide 'plug-focus)
