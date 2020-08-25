;; === PROVIDE ===
(provide 'init-packages)

;; === DEFAULT PACKAGES ===

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; set default packages, they will be installed automatically
(defvar my/packages '(
		      use-package
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


;; === PLUGIN CONFIG ===

;; auto install all package after "use-package"
;; see ":ensure"
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; auto update installed package
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


(use-package anaconda-mode
  :defer t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company
  :config
  (global-company-mode 1))

(use-package company-anaconda
  :defer t
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
							     company-dabbrev))
	      )))

;; counsel contains ivy and swiper
;; Online Manual: https://oremacs.com/swiper/
(use-package counsel
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind (
	 ;; Ivy-based interface to standard commands
	 ("C-s" . 'swiper-isearch)
	 ("M-x" . 'counsel-M-x)
	 ("C-x C-f" . 'counsel-find-file)
	 ("M-y" . 'counsel-yank-pop)
	 ("<f1> f" . 'counsel-describe-function)
	 ("<f1> v" . 'counsel-describe-variable)
	 ("<f1> l" . 'counsel-find-library)
	 ("<f2> i" . 'counsel-info-lookup-symbol)
	 ("<f2> u" . 'counsel-unicode-char)
	 ("<f2> j" . 'counsel-set-variable)
	 ("C-x b" . 'ivy-switch-buffer)
	 ("C-c v" . 'ivy-push-view)
	 ("C-c V" . 'ivy-pop-view)
	 ;; Ivy-based interface to shell and system tools
         ("C-c c" . 'counsel-compile)
	 ("C-c g" . 'counsel-git)
	 ("C-c j" . 'counsel-git-grep)
	 ("C-c L" . 'counsel-git-log)
	 ("C-c k" . 'counsel-rg)
	 ("C-c m" . 'counsel-linux-app)
	 ("C-c n" . 'counsel-fzf)
	 ("C-x l" . 'counsel-locate)
	 ("C-c J" . 'counsel-file-jump)
	 ("C-S-o" . 'counsel-rhythmbox)
	 ("C-c w" . 'counsel-wmctrl)
	 ;; Ivy-resume and other commands
	 ("C-c C-r" . 'ivy-resume)
	 ("C-c b" . 'counsel-bookmark)
	 ("C-c d" . 'counsel-descbinds)
	 ("C-c g" . 'counsel-git)
	 ("C-c o" . 'counsel-outline)
	 ("C-c t" . 'counsel-load-theme)
	 ("C-c F" . 'counsel-org-file)
	 )
  )

(use-package impatient-mode
  :commands (impatient-mode))

;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(use-package lua-mode
  :mode ("\\.lua$" . lua-mode)
  :interpreter ("lua" . lua-mode))

(use-package format-all
  :bind ("C-M-l" . 'format-all-buffer))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc --from=markdown_strict"))

(use-package org
  :config
  (setq org-src-fontify-natively t))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package simple-httpd
  :commands (httpd-start)
  :config
  ;; random port in [6000, 7000)
  (setq httpd-port (+ (random 1000) 6000))
  (setq httpd-host "localhost"))

(use-package smartparens)

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

;; see https://github.com/nashamri/spacemacs-theme/issues/42#issuecomment-236437989
;; for more info
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

(use-package vmd-mode
  ;;   :bind ("M-m p" . 'vmd-mode)
  :commands vmd-mode)

;; c++
(use-package cc-mode
  :commands c-mode
  :mode (("\\.c\\'" . c-mode)
	 ("\\.cpp\\'" . c-mode)
	 ("\\.h\\'" . c-mode)
	 ("\\.hpp\\'" . c-mode))
  :config
  (setq c-basic-offset 4)
  (setq-default c-electric-flag nil))

(defun air-org-imp-filter (buffer)
  ;; org mode themes
  (let ((theme_bigblow "#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-bigblow.setup")
	(theme_readtheorg "#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-readtheorg.setup"))
    ;;
    (princ
     (with-current-buffer buffer
       (org-export-string-as (format "%s\n\n%s" theme_bigblow (buffer-string)) 'html))
     (current-buffer)))
  )

(defun air-org-preview ()
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'air-org-imp-filter)
  (imp-visit-buffer))
