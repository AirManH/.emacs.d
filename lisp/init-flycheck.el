;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package flycheck
  ;; remeber to install syntax checker programs
  ;; https://www.flycheck.org/en/latest/user/quickstart.html
  :init
  (global-flycheck-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
