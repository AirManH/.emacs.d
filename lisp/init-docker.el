;;; init-docker.el --- Docker mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode)
  :init
  (setq format-all-debug t))


(provide 'init-docker)
;;; init-docker.el ends here
