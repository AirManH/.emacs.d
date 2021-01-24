;;; init-editing-utils.el --- edit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package smartparens
  :delight
  :hook (prog-mode . smartparens-mode)
  :config
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil))

;; if you select some characters,
;; and then press any character,
;; the selected characters will be replaced
;; by new charcater.
(delete-selection-mode 1)


;; evil-undo-system requires it
(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)))


(use-package editorconfig
  :config
  (editorconfig-mode 1))


(provide 'init-editing-utils)
;;; init-editing-utils ends here
