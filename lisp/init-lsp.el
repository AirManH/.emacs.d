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
     :states 'normal
     :keymaps 'lsp-mode-map
     "" '(nil :wk "local leader key")
     ;; format
     "f" '(nil :wk "format")
     "f b" '(lsp-format-buffer :wk "buffer")
     "f r" '(lsp-format-region :wk "region")
     "f i" '(lsp-organize-imports :wk "imports")
     ;; goto
     "g" '(nil :wk "go to")
     "g d" '(lsp-find-definition :wk "definition")
     "g r" '(lsp-find-references :wk "references")
     "g i" '(lsp-find-implementation :wk "implementation")
     "g b" '(xref-pop-marker-stack :wk "go back")
     ;; peek
     "s" '(nil :wk "peek")
     "s d" '(lsp-ui-peek-find-definitions :wk "definition")
     "s i" '(lsp-ui-peek-find-implementation :wk "implementation")
     "s r" '(lsp-ui-peek-find-references :wk "references")
     "s c" '(lsp-ui-doc-glance :wk "doc")
     ;; rename
     "r" '(nil :wk "reformat")
     "r r" '(lsp-rename :wk "rename")
     ;; backend
     "b" '(nil :wk "control lsp backend")
     "b s" '(lsp-workspace-shutdown :wk "shutdown")
     "b r" '(lsp-workspace-restart :wk "restart")
     "b d" '(lsp-describe-session :wk "describe session")
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
