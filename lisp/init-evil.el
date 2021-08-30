;;; init-evil.el --- Evil mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defun air-disable-evil-auto-indent ()
  "Set `evil-auto-indent' to nil.
See also https://evil.readthedocs.io/en/latest/settings.html#indentation]"
  (setq evil-auto-indent nil))


(use-package evil
  :init
  (progn
    (setq evil-undo-system 'undo-tree)
    ;; `evil-collection' assumes `evil-want-keybinding' is set to
    ;; `nil' before loading `evil' and `evil-collection'
    ;; @see https://github.com/emacs-evil/evil-collection#installation
    (setq evil-want-keybinding nil)
    ;; Disable auto indent in org-mode
    (add-hook 'org-mode-hook #'air-disable-evil-auto-indent)
    )
  :config
  (progn
    (evil-mode 1))
  )


(use-package evil-collection
  :after magit
  :config
  (progn
    (evil-collection-init)
    ))


;; https://github.com/Somelauw/evil-org-mode#installation-by-use-package
(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :config
  (progn
    (with-eval-after-load 'evil
      (evil-define-key 'normal outline-mode-map (kbd "<tab>") #'org-cycle)
      (evil-define-key 'normal outline-mode-map (kbd "TAB") #'org-cycle))
    (add-hook 'evil-org-mode-hook
              (lambda ()
                (evil-org-set-key-theme)))
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))
  )


(provide 'init-evil)
;;; init-evil.el ends here
