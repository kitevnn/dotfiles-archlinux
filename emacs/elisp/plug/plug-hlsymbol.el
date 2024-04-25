;; 
;; plug-hlsymbol: highlight-thing, 自动高亮相同的词，达到vim的hlsearch的效果
;; 

(require 'highlight-thing)
(global-highlight-thing-mode)

(add-hook 'prog-mode-hook 'highlight-thing-mode)

(provide 'plug-hlsymbol)
