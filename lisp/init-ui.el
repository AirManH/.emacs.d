(provide 'init-ui)


;; hide the init screen
(setq inhibit-splash-screen 1)

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


(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

;; see https://github.com/nashamri/spacemacs-theme/issues/42#issuecomment-236437989
;; for more info
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

;; === GUI ===

(menu-bar-mode -1)

;; for better detecting of GUI,
;; see https://stackoverflow.com/a/5801740
(if (display-graphic-p)
    (tool-bar-mode -1)
    (scroll-bar-mode -1))
