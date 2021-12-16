;;; init-python-elpy.el --- Elpy based Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; code:


(use-package elpy
  :defer t
  :init
  (progn
    (advice-add 'python-mode :before 'elpy-enable)

    (general-define-key
     :prefix air-local-leader
     :states 'normal
     :keymaps 'python-mode-map
     "" '(nil :wk "local leader key")
     ;; format
     "f" '(nil :wk "format")
     ;; goto
     "g" '(nil :wk "go to")
     "g d" '(elpy-goto-definition :wk "definition")
     "g b" '(xref-pop-marker-stack :wk "go back")
     "g a" '(elpy-goto-assignment :wk "assignment")
     ;; show
     "s" '(nil :wk "show")
     "s d" '(elpy-goto-definition-other-window :wk "definition")
     "s c" '(elpy-occur-definitions :wk "any definitions")
     "s r" '(xref-find-references :wk "reference")
     "s c" '(elpy-doc :wk "doc")
     ;; refactor
     "r" '(nil :wk "refactor")
     "r r" '(elpy-refactor-rename :wk "rename")
     "r v" '(elpy-refactor-extract-variable :wk "move to new variable")
     "r f" '(elpy-refactor-extract-function :wk "move to new function")
     "r i" '(elpy-refactor-inline :wk "inline this variable")
     ;; interpreter
     "i" '(nil :wk "interpreter")
     "i e" '(elpy-shell-send-region-or-buffer :wk "evaluate")
     "i o" '(elpy-shell-switch-to-shell :wk "switch to shell")
     )
    (general-define-key
     :prefix air-local-leader
     :states 'normal
     :keymaps 'inferior-python-mode-map
     "" '(nil :wk "local leader key")
     "i" '(nil :wk "interpreter")
     "i o" '(elpy-shell-switch-to-buffer :wk "switch to buffer")
     )
    )
  )


(provide 'init-python-elpy)
;;; init-python-elpy.el ends here
