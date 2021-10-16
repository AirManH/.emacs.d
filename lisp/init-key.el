;;; init-key.el --- Key binds -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package general
  :config
  (progn
    (defvar air-leader "SPC"
      "My leader key.")
    (defvar air-local-leader "SPC m"
      "My local leader key.")
    (general-create-definer air-leader-def
      :prefix air-leader)
    (general-create-definer air-local-leader-def
      :prefix air-local-leader)
    )
  )


(provide 'init-key)
;;; init-key.el ends here
