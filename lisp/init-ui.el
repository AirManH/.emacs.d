;;; init-ui.el --- configure ui -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defvar air-ui-load-delay 2
  "Time of loading delay for ui.")

;; hide the init screen
(setq inhibit-splash-screen 1)

;; highlight current line
(global-hl-line-mode 1)

;; bar cursur
(setq-default cursor-type 'bar)

(use-package highlight-parentheses
  :defer air-ui-load-delay
  :hook (prog-mode . highlight-parentheses-mode))

(use-package rainbow-delimiters
  :defer air-ui-load-delay
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(defvar air-ui-light-theme 'doom-acario-light
  "Light theme.")
(defvar air-ui-dark-theme 'doom-one
  "Dark theme.")

;; auto change theme by time
;; https://emacs-china.org/t/emacs-theme/7781/12
(defun air-ui-auto-change-theme-by-time ()
  "Auto change theme by time."
  (let ((current-hour
         (string-to-number (substring (current-time-string) 11 13)))
        (current-theme nil)
        (last-theme nil))

    (if (member current-hour (number-sequence 7 21))
        (progn
          (setq current-theme air-ui-light-theme)
          (setq last-theme air-ui-dark-theme)
          )
      (setq current-theme air-ui-dark-theme)
      (setq last-theme air-ui-light-theme)
      )

    (mapc 'disable-theme custom-enabled-themes)
    (load-theme current-theme t)
    )
  )

(air-ui-auto-change-theme-by-time)
(let* ((current-minutes
        (string-to-number (substring (current-time-string) 14 16)))
       (current-seconds
        (string-to-number (substring (current-time-string) 17 20)))
       (remain-seconds
        ;; remaining seconds = 3600 - 60 * min - sec
        (- 3600 (* 60 current-minutes) current-seconds))
       )
  (run-with-timer remain-seconds 3600 'air-ui-auto-change-theme-by-time))


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
  :defer air-ui-load-delay
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
                             lines-tail
                             ))))


;; awesome-tab
(use-package awesome-tab
  :load-path "ext-lisp/awesome-tab"
  :config
  (progn
    (awesome-tab-mode t)
    (setq awesome-tab-height 110)
    (setq awesome-tab-active-bar-height 25)
    ;; only display icons on GUI
    (setq awesome-tab-display-icon (display-graphic-p))
    )
  )


;; remember to run =M-x all-the-icons-install-fonts= at least once
(when (display-graphic-p)
  (use-package all-the-icons))


;; hide specific string in mode-line
(use-package delight)


;; highlight the thing under point
(use-package highlight-thing
  :defer air-ui-load-delay
  :hook
  (prog-mode . highlight-thing-mode)
  )


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (progn
    (setq doom-modeline-icon nil)
    (when (display-graphic-p)
      (setq doom-modeline-height 1)
      ;; change font face on modeline
      (set-face-attribute 'mode-line nil :family "Source Code Pro" :height 150)
      (set-face-attribute 'mode-line-inactive nil :family "Source Code Pro" :height 150))
    )
  )


(use-package dashboard
  :ensure t
  :config
  (progn
    (dashboard-setup-startup-hook)
    (setq dashboard-set-heading-icons (display-graphic-p))
    (setq dashboard-set-file-icons (display-graphic-p))
    (setq dashboard-center-content (display-graphic-p)))
  )


(use-package highlight-indent-guides
  :defer air-ui-load-defer
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (progn
    (setq highlight-indent-guides-method 'character)))


(provide 'init-ui)
;;; init-ui.el ends here
