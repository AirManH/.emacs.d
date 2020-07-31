;; DISable auto-save
(setq make-backup-files nil)


;; cl - Common Lisp Extension
(require 'cl)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-ui)
(require 'init-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lua-mode smex hungry-delete company smartparens monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
