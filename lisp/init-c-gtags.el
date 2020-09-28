;;; init-c-gtags.el --- gtags based C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package semantic
  :hook
  ((c-mode . semantic-mode)
   (c++-mode . semantic-mode)))

(defun air-c-gtags-set-srefactor-keymap ()
  "Define keymap for srefactor."
  (local-set-key (kbd "M-RET") 'srefactor-refactor-at-point))

(use-package srefactor
  :commands srefactor-refactor-at-point)

(add-hook 'c-mode-hook 'air-c-gtags-set-srefactor-keymap)
(add-hook 'c++-mode-hook 'air-c-gtags-set-srefactor-keymap)

(use-package ggtags
  :hook
  ((c-mode . ggtags-mode)
   (c++-mode . ggtags-mode)))

(use-package company-c-headers
  :defer t)

(defun air-c-gtags-disable-flycheck ()
  "To disable flycheck mode in C/C++ mode."
  (interactive)
  (flycheck-mode 0))

(use-package flycheck
  :init
  (add-hook 'c-mode-hook 'air-c-gtags-disable-flycheck)
  (add-hook 'c++-mode-hook 'air-c-gtags-disable-flycheck))

(defun air-c-gtags-set-company ()
  "Set backends and sensitivity of company."
  (interactive)
  ;; set company backends
  (set (make-local-variable 'company-backends)
       '((company-gtags company-c-headers company-clang company-dabbrev-code)
         company-dabbrev))
  ;; set commpany sensitivity
  (set (make-local-variable 'company-idle-delay) 0.5)
  (set (make-local-variable 'company-minimum-prefix-length) 2)
  )

(use-package company
  :init
  (add-hook 'c-mode-hook 'air-c-gtags-set-company)
  (add-hook 'c++-mode-hook 'air-c-gtags-set-company))


(provide 'init-c-gtags)
;;; init-c-gtags.el ends here
