;;; init-c-gtags.el --- gtags based C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package semantic
  :hook
  ((c-mode . semantic-mode)
   (c++-mode . semantic-mode)))

(use-package srefactor
  :commands srefactor-refactor-at-point
  :config
  (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point))

(use-package ggtags
  :hook
  ((c-mode . ggtags-mode)
   (c++-mode . ggtags-mode)))

(use-package company-c-headers
  :defer t)

(use-package cc-mode
  :config
  ;; deactivate flycheck
  (flycheck-mode 0)
  ;; set company backends
  (set (make-local-variable 'company-backends)
       '((company-gtags company-c-headers company-clang company-dabbrev-code)
         company-dabbrev))
  ;; set commpany sensitivity
  (set (make-local-variable 'company-idle-delay) 0.5)
  (set (make-local-variable 'company-minimum-prefix-length) 2)
  )


(provide 'init-c-gtags)
;;; init-c-gtags.el ends here
