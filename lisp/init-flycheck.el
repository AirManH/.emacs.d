;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package flycheck
  :defer 1
  ;; remeber to install syntax checker programs
  ;; https://www.flycheck.org/en/latest/user/quickstart.html
  :config
  (global-flycheck-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
