(provide 'init-other)


;; DISable auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)
;; if a file is modified outside, auto-reload it.
(global-auto-revert-mode 1)

;; turn OFF the ring bell
(setq ring-bell-function 'ignore)

;; [yes | no] -> [y | n]
(fset 'yes-or-no-p 'y-or-n-p)

;; hide the init screen
(setq inhibit-splash-screen 1)

;; if you select some characters,
;; and then press any character,
;; the selected characters will be replaced
;; by new charcater.
(delete-selection-mode 1)

;; Highlight Matching Parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; {{{ Dired Mode
;; By default, Dired-mode use every different buffer for different directory.
;; we set below to share one buffer along multiple directories.
(put 'dired-find-alternate-file 'disabled nil)
;; delay loading
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; }}} Dired Mode

;; === GUI ===
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control))))
