;;; init-python.el --- Python mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defvar air-python-scheme "none"
  "This variable decides which scheme to use in python project.
Candidate: [none, conda, lsp]")

(when (string-equal "conda" air-python-scheme)
  (require 'init-python-conda))

(when (string-equal "lsp" air-python-scheme)
  (require 'init-python-lsp))

(provide 'init-python)
;;; init-python.el ends here
