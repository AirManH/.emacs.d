;; DISable auto-save
(setq make-backup-files nil)
;; show line numbers
(global-linum-mode 1)
;; highlight current line
(global-hl-line-mode 1)
;; bar cursur
(setq cursor-type 'bar)
;; font-size
(set-face-attribute 'default nil :height 160)

;; ==BEG== MELPA ==BEG==
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
     (exec-path-from-shell-initialize))
;; ==END== MELPA ==END==


;; ==BEG== PLUGIN ==BEG==

;; monokai
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)

;; Company
(global-company-mode 1)

;; ==END== PLUGIN ==END==
