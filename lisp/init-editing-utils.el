(provide 'init-editing-utils)


(use-package smartparens
  :defer t
  :init (add-hook 'prog-mode-hook #'smartparens-mode))


;; if you select some characters,
;; and then press any character,
;; the selected characters will be replaced
;; by new charcater.
(delete-selection-mode 1)
