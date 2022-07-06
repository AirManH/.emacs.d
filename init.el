;; don't GC during startup to save time
;; https://github.com/redguardtoo/emacs.d/blob/master/init.el
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)


(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)


;; base
(require 'init-evil)
(require 'init-which-key)
(require 'init-key)
(require 'init-company)
(require 'init-counsel)
(require 'init-editing-utils)
(require 'init-format-all)
(require 'init-git)
(require 'init-move)
(require 'init-other)
(require 'init-pyim)
(require 'init-lsp)
(require 'init-speedbar)
(require 'init-httpd)
(require 'init-impatient)
;; ui
(require 'init-linum)
(require 'init-ui)
;; language
(require 'init-ahk)
(require 'init-c)
(require 'init-docker)
(require 'init-elisp)
(require 'init-esup)
(require 'init-flycheck)
(require 'init-lua)
(require 'init-markdown)
(require 'init-org)
(require 'init-powershell)
(require 'init-python)
(require 'init-reader)
(require 'init-web)
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
