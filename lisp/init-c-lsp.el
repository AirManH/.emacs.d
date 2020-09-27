;;; init-c-lsp.el --- lsp based C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package lsp-mode
  :hook
  ((c-mode c++-mode) . lsp-mode))


(provide 'init-c-lsp)
;;; init-c-lsp.el ends here
