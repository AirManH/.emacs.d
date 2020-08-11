;; cl - Common Lisp Extension
(require 'cl)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-ui)
(require 'init-packages)
(require 'init-other)
(require 'init-key)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters use-package format-all lua-mode smex hungry-delete company smartparens monokai-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font Mono" :foundry "JB  " :slant normal :weight normal :height 128 :width normal)))))
