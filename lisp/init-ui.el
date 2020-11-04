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
(when (display-graphic-p)
    (use-package cnfonts
      :commands
      (cnfonts-increase-fontsize
       cnfonts-decrease-fontsize
       cnfonts-edit-profile
       cnfonts-ui)
      :init
      ;; https://github.com/tumashu/cnfonts#%E4%BD%BF%E7%94%A8-cnfonts-use-system-type
      (setq cnfonts-use-system-type t)
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
      )
  ;; {{{ if using gnu/linux
  (when (eq system-type 'gnu/linux)
    ;; Auto generated by cnfonts
    ;; <https://github.com/tumashu/cnfonts>
    (set-face-attribute
     'default nil
     :font (font-spec :name "-ADBO-Source Code Pro-ultrabold-italic-normal-*-*-*-*-*-m-0-iso10646-1"
                      :weight 'normal
                      :slant 'normal
                      :size 14.0))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :name "-WQYF-WenQuanYi Micro Hei Mono-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 16.5))))
   ;; }}} if using gnu/linux
 )



;; show white space
(use-package whitespace
  :hook
  ((prog-mode org-mode) . whitespace-mode)
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


;; awesome-tab
(use-package awesome-tab
  :load-path "ext-lisp/awesome-tab"
  :config
  (progn
    (awesome-tab-mode t)
    (setq awesome-tab-height 110)
    (setq awesome-tab-active-bar-height 25)
    )
  )


;; remember to run =M-x all-the-icons-install-fonts= at least once
(use-package all-the-icons
  :defer 1)


;; hide specific string in mode-line
(use-package delight)


;; highlight the thing under point
(use-package highlight-thing
  :defer 1
  :hook
  (prog-mode . highlight-thing-mode)
  )


(provide 'init-ui)
;;; init-ui.el ends here
