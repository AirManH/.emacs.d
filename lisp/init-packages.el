(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; set default packages, they will be installed automatically
(defvar my/packages '(
		      company
		      format-all
		      hungry-delete
		      lua-mode
		      markdown-mode
		      monokai-theme
		      rainbow-delimiters
		      smartparens
		      smex
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

(use-package company
  :config
  (global-company-mode 1))

;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(use-package lua-mode
  :mode ("\\.lua$" . lua-mode)
  :interpreter ("lua" . lua-mode)
  :bind ("C-M-l" . 'format-all-buffer))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package monokai-theme
  :config
  (load-theme 'monokai 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens)

(use-package smex
  :config
  (smex-initialize)
  :bind
  (("M-x" . 'smex)
   ("M-x" . 'smex-major-mode-commands)
   ("C-c C-c M-x" . 'execute-extended-command)))


;; === PROVIDE ===
(provide 'init-packages)
