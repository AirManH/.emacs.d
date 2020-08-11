;; === LINE NUMBER ===

;; show line numbers
(global-linum-mode 1)
;; Separator after line number
;; Example:
;;    9 │ (globa
(setq linum-format "%4d \u2502 ")

;; highlight current line
(global-hl-line-mode 1)

;; bar cursur
(setq-default cursor-type 'bar)

;; === GUI ===

;; Disable the Toolbar
(tool-bar-mode -1)

(provide 'init-ui)
