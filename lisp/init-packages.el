;;; init-packages.el --- package manager -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(provide 'init-packages)

;; Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  ;; see https://www.gnu.org/software/emacs/news/NEWS.27.1
  ;; see https://github.com/jschaf/esup/issues/84
  (when (or (version< emacs-version "27.0")
            (featurep 'esup-child))
    (package-initialize))
  (setq package-archives '(("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
                           ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))
  )

;; set default packages, they will be installed automatically
(defvar my/packages '(
                      use-package
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (cl-loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (cl-return nil)
           finally (cl-return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; auto install all packages after "use-package"
;; see ":ensure"
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; auto update installed packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-interval 4))

(provide 'init-packages)
;;; init-packages.el ends here
