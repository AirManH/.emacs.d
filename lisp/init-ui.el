;;; init-ui.el --- configure ui -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; hide the init screen
(setq inhibit-splash-screen 1)

;; highlight current line
(global-hl-line-mode 1)

;; bar cursur
(setq-default cursor-type 'bar)

;; always show matched parentheses
(show-paren-mode 1)
;; when is in surround of a pair, highlight the pair
;; TODO when cursor is here ->|(something here), the left paren is colored
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

;; see https://github.com/nashamri/spacemacs-theme/issues/42#issuecomment-236437989
;; for more info
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

;; === GUI ===

;; for better detecting of GUI,
;; see https://stackoverflow.com/a/5801740
(if (display-graphic-p)
    ;; then
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1))
  ;; else
  (progn
    (xterm-mouse-mode 1)))

;; use cnfonts to control font
;; https://github.com/tumashu/cnfonts
(if (display-graphic-p)
    (use-package cnfonts
      :init
      ;; https://github.com/tumashu/cnfonts#%E4%BD%BF%E7%94%A8-cnfonts-use-system-type
      (setq cnfonts-use-system-type t)
      :config
      (progn
        (setq cnfonts-personal-fontnames
              '(
                ;; english
                ("JetBrainsMono Nerd Font Mono"
                 "JetBrains Mono"
                 "RobotoMono Nerd Font Mono"
                 "Roboto Mono"
                 "Source Code Pro"
                 "DejaVu Sans Mono"
                 "Monospace")
                ;; chinese
                ("文泉驿等宽微米黑")
                ;; ExtB
                ("HanaMinB" "SimSun-ExtB" "MingLiU-ExtB")))
        (cnfonts-enable))))

;; show white space
(use-package whitespace
  :defer t
  :init
  (add-hook 'prog-mode-hook (lambda () (whitespace-mode 1)))
  :config
  (progn
    ;; not visulize newline mark
    ;; maybe better practice
    (setq whitespace-style '(face
                             ;; tabs
                             tabs
                             tab-mark
                             ;; space
                             ;; space-mark
                             ;; spaces
                             trailing
                             indentation))))


(provide 'init-ui)
;;; init-ui.el ends here
