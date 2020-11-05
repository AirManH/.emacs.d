;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package flycheck
  :defer 1
  :hook
  ((
    prog-mode
    ) . flycheck-mode)
  )


(provide 'init-flycheck)
;;; init-flycheck.el ends here
