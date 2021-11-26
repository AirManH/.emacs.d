;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; https://emacs-lsp.github.io/lsp-mode/page/installation/#use-package
(use-package lsp-mode
  ;; :hook
  ;; (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix nil)
  :config
  (progn
    (setq lsp-idle-delay 0.1 ;; clangd is fast
          lsp-headerline-breadcrumb-enable t)
    ;; {{{ keybindings
    (general-define-key
     :prefix air-local-leader
     :states 'motion
     :keymaps 'lsp-mode-map
     "" '(nil :wk "local leader key")
     ;; format
     "f" '(nil :wk "format")
     "f b" 'lsp-format-buffer
     "f r" 'lsp-format-region
     "f i" 'lsp-organize-imports
     ;; goto
     "g" '(nil :wk "go to")
     "g d" 'lsp-find-definition
     "g r" 'lsp-find-references
     "g i" 'lsp-find-implementation
     ;; peek
     "s" '(nil :wk "peek")
     "s d" 'lsp-ui-peek-find-definitions
     "s i" 'lsp-ui-peek-find-implementation
     "s r" 'lsp-ui-peek-find-references
     "s c" 'lsp-ui-doc-glance
     ;; rename
     "r" '(nil :wk "reformat")
     "r r" 'lsp-rename
     ;; backend
     "b" '(nil :wk "control lsp backend")
     "b s" '(lsp-workspace-shutdown)
     "b r" 'lsp-workspace-restart
     "b d" 'lsp-describe-session
     )
    ;; }}}
    )
  )

(use-package lsp-ui
  :commands
  lsp-ui-mode)

(use-package lsp-ivy
  :commands
  lsp-ivy-workspace-symbol)


(provide 'init-lsp)
;;; init-lsp.el ends here
