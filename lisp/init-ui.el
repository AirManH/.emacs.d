(provide 'init-ui)


;; hide the init screen
(setq inhibit-splash-screen 1)

;; Separator after line number
;; Example:
;;    9 │ (globa
(setq linum-format "%4d \u2502 ")

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

;; {{{ set FONT
;; https://www.emacswiki.org/emacs/SetFonts

(defun font-candidate (&rest fonts)
  (loop for font in fonts
	when (find-font (font-spec :name font))
	return font))

(set-face-attribute
 'default nil
 :family (font-candidate
	  "JetBrainsMono Nerd Font Mono"
	  "JetBrains Mono"
	  "RobotoMono Nerd Font Mono"
	  "Roboto Mono"
	  "Source Code Pro"
	  "Monospace")
 :height 125
 :width 'normal
 :weight 'normal
 :slant 'normal)

;; }}} set FONT
