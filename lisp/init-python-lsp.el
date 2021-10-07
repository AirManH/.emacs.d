;;; init-python-lsp.el --- lsp based Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package lsp-mode
  :hook
  (python-mode . lsp-mode))


(provide 'init-python-lsp)
;;; init-python-lsp.el ends here
