;;; init-python.el --- Python mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defvar air-python-scheme "elpy"
  "This variable decides which scheme to use in python project.
Candidate: [none, conda, elpy, lsp]")

(when (string-equal "conda" air-python-scheme)
  (require 'init-python-conda))

(when (string-equal "elpy" air-python-scheme)
  (require 'init-python-elpy))

(when (string-equal "lsp" air-python-scheme)
  (require 'init-python-lsp))

(provide 'init-python)
;;; init-python.el ends here
