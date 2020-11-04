;;; init-evil.el --- Evil mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :config
  (evil-mode 1)
  )


;; https://github.com/emacs-evil/evil-magit
(use-package evil-magit
  :after magit)


;; https://github.com/Somelauw/evil-org-mode#installation-by-use-package
(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


(provide 'init-evil)
;;; init-evil.el ends here
