;; don't GC during startup to save time
;; https://github.com/redguardtoo/emacs.d/blob/master/init.el
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)


(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)


(require 'init-ahk)
(require 'init-c)
(require 'init-company)
(require 'init-counsel)
(require 'init-docker)
(require 'init-editing-utils)
(require 'init-elisp)
(require 'init-esup)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-format-all)
(require 'init-git)
(require 'init-httpd)
(require 'init-impatient)
(require 'init-key)
(require 'init-linum)
(require 'init-lsp)
(require 'init-lua)
(require 'init-markdown)
(require 'init-org)
(require 'init-other)
(require 'init-powershell)
(require 'init-pyim)
(require 'init-python)
(require 'init-reader)
(require 'init-speedbar)
(require 'init-ui)
(require 'init-web)
(require 'init-which-key)
(require 'init-yaml)


;; https://github.com/redguardtoo/emacs.d/blob/master/init.el
(defun air-cleanup-gc ()
  "Clean up gc."
  (setq gc-cons-threshold  67108864) ; 64M
  (setq gc-cons-percentage 0.1) ; original value
  (garbage-collect))

(run-with-idle-timer 4 nil #'air-cleanup-gc)


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
