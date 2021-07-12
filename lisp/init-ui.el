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
;; https://emacs-china.org/t/emacs-theme/7781/
(defun air-ui-auto-change-theme-by-time ()
  "Auto change theme by time."
  (let ((current-hour
         (string-to-number (substring (current-time-string) 11 13)))
        (target-theme nil))

    (if (and (<= 7 current-hour) (<= current-hour 18))
        (setq target-theme air-ui-light-theme)
      ;; else
      (setq target-theme air-ui-dark-theme))

    (mapc 'disable-theme custom-enabled-themes)
    (load-theme target-theme t)
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

(when (display-graphic-p)

  (defun air-ui-font-candidate (&rest fonts)
    "Return the first avalible font in FONTS."
    (cl-loop for font in fonts
             when (find-font (font-spec :family font))
             return font))

  (defvar air-ui-default-font-family nil
    "Default font's family.")
  (setq air-ui-default-font-family (air-ui-font-candidate
                                    "Sarasa Mono SC"
                                    "Source Code Pro"
                                    "Consolas"))

  (set-face-attribute
   'default nil
   :font (font-spec :family air-ui-default-font-family
                    :weight 'normal
                    :size 16.0))
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
                             ;; lines-tail
                             ))))


;; Fill column
;; see also https://github.com/hlissner/doom-emacs/tree/729e8d8f393d2610cd4007c8dde8fd2521742bc9/modules/ui/fill-column
;; see also https://www.emacswiki.org/emacs/FillColumnIndicator
(if (fboundp 'display-fill-column-indicator-mode)
    (progn
      (add-hook 'text-mode-hook 'display-fill-column-indicator-mode)
      (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))
  ;; else
  (progn
    (use-package hl-fill-column-mode
      :hook ((prog-mode text-mode) . hl-fill-column-mode))))


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
      (set-face-attribute
       'mode-line nil
       :font (font-spec :family air-ui-default-font-family
                        :weight 'normal
                        :size 14.0))
      (set-face-attribute
       'mode-line-inactive nil
       :font (font-spec :family air-ui-default-font-family
                        :weight 'normal
                        :size 14.0))
      )
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
