;;; init-which-key.el --- Shows candidate key bindings in a popup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package which-key
  :delight
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right-bottom)))


(provide 'init-which-key)
;;; init-which-key.el ends here
