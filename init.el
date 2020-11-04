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
(require 'init-pyim)
(require 'init-python)
(require 'init-speedbar)
(require 'init-ui)
(require 'init-web)
(require 'init-which-key)


;; https://github.com/redguardtoo/emacs.d/blob/master/init.el
(defun air-cleanup-gc ()
  "Clean up gc."
  (setq gc-cons-threshold  67108864) ; 64M
  (setq gc-cons-percentage 0.1) ; original value
  (garbage-collect))

(run-with-idle-timer 4 nil #'air-cleanup-gc)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(package-selected-packages
   '(delight company-posframe texmathp posframe pyim cmake-mode cnfonts srefactor company-c-headers sr-speedbar magit flycheck smex simple-httpd company-anaconda anaconda-mode spacemacs-theme vmd-mode counsel rainbow-delimiters use-package format-all lua-mode hungry-delete company smartparens monokai-theme))
 '(safe-local-variable-values
   '((air-pyim-fix-punctuation-width . t)
     (pyim-punctuation-translate-p quote
				   (no yes auto)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
