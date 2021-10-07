;;; init-packages.el --- package manager -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(provide 'init-packages)


;; {{{ Select a mirror
(defvar air-mirror-scheme "default"
  "Mirror scheme of package archives.
Candidate: [default, emacs-china, sjtug, tencent, tuna, ustc]")

(defvar air-mirror nil
  "Mirror of package archives.")

(when (string-equal "default" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "https://elpa.gnu.org/packages/")
          ("melpa" . "https://melpa.org/packages/"))))

(when (string-equal "emacs-china" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "https://elpa.emacs-china.org/gnu/")
          ("melpa" . "https://elpa.emacs-china.org/melpa/"))))

(when (string-equal "sjtug" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
          ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/"))))

(when (string-equal "tencent" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
          ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/"))))

(when (string-equal "tuna" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(when (string-equal "ustc" air-mirror-scheme)
  (setq air-mirror
	'(("gnu"   . "http://mirrors.ustc.edu.cn/elpa/gnu/")
          ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/"))))
;; }}}

;; Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  ;; see https://www.gnu.org/software/emacs/news/NEWS.27.1
  ;; see https://github.com/jschaf/esup/issues/84
  (when (or (version< emacs-version "27.0")
            (featurep 'esup-child))
    (package-initialize))
  (setq package-archives air-mirror)
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
