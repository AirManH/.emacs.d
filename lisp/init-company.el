;;; init-company.el --- company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package company
  :config
  (progn
    (global-company-mode 1)
    (setq company-idle-delay 0.0
          company-minimum-prefix-length 1)))


(provide 'init-company)
;;; init-company ends here
