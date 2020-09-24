;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; https://emacs-lsp.github.io/lsp-mode/page/installation/#use-package
(use-package lsp-mode
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-idle-delay 0.1 ;; clangd is fast
        lsp-headerline-breadcrumb-enable t))

(use-package lsp-ui
  :commands
  lsp-ui-mode)

(use-package lsp-ivy
  :commands
  lsp-ivy-workspace-symbol)

(use-package which-key
  :config
  (which-key-mode))


(provide 'init-lsp)
;;; init-lsp.el ends here
