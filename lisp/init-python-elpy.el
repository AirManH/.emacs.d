;;; init-python-elpy.el --- Elpy based Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; code:


(use-package elpy
  :defer t
  :init
  (progn
    (advice-add 'python-mode :before 'elpy-enable)
    (air-local-leader-def 'normal python-mode-map
      "g d" 'elpy-goto-definition
      "g b" 'xref-pop-marker-stack
      )
    )
  )


(provide 'init-python-elpy)
;;; init-python-elpy.el ends here
