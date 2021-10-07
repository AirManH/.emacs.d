;;; init-python-elpy.el --- Elpy based Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; code:


(use-package elpy
  :defer t
  :init
  (progn
    (advice-add 'python-mode :before 'elpy-enable)
    )
  )


(provide 'init-python-elpy)
;;; init-python-elpy.el ends here
