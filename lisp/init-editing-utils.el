(provide 'init-editing-utils)


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
