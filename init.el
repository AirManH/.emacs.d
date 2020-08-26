;; cl - Common Lisp Extension
(require 'cl)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)

(require 'init-c)
(require 'init-company)
(require 'init-counsel)
(require 'init-editing-utils)
(require 'init-format-all)
(require 'init-httpd)
(require 'init-impatient)
(require 'init-key)
(require 'init-lua)
(require 'init-markdown)
(require 'init-org)
(require 'init-other)
(require 'init-python)
(require 'init-ui)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(package-selected-packages
   '(smex simple-httpd company-anaconda anaconda-mode spacemacs-theme vmd-mode counsel rainbow-delimiters use-package format-all lua-mode hungry-delete company smartparens monokai-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
