;;; init-docker.el --- Docker mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode)
  :init
  (setq format-all-debug t))


(use-package docker-tramp
  :config
  (progn
    ;; Recognize the $PATH on remote
    ;; See also https://www.gnu.org/software/emacs/manual/html_node/tramp/Remote-programs.html
    (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
    )
  )


(provide 'init-docker)
;;; init-docker.el ends here
