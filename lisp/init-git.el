;;; init-git.el --- Git support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status))


(use-package transient
  :after magit)


(provide 'init-git)
;;; init-git.el ends here
