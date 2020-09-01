;;; init-c.el --- C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package company-c-headers
  :defer t)

(use-package cc-mode
  :commands c-mode
  ;; What does "\\." or "\\'" mean?
  ;; "\\." match a "."
  ;; "\\'" match end of word
  ;; https://www.reddit.com/r/emacs/comments/cf2kyr/regex_what_does_or_mean/
  :mode (("\\.c\\'" . c-mode)
	 ("\\.cpp\\'" . c++-mode)
	 ("\\.h\\'" . c-mode)
	 ("\\.hpp\\'" . c++-mode))
  :init
  (progn
    ;; set company-backends
    ;; https://book.emacs-china.org/#orgheadline71
    (add-hook 'c-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-mode)
		     '((company-clang company-semantic company-c-headers company-cmake company-dabbrev-code)
		       company-abbrev)))))
  :config
  (progn
    (setq c-basic-offset 4)
    (setq-default c-electric-flag nil)))

(use-package semantic
  :hook ((c-mode . semantic-mode)
	 (c++-mode . semantic-mode)))

(use-package srefactor
  :defer t
  :commands srefactor-refactor-at-point
  :config
  (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point))

;; <<< cmake-ide
;; https://github.com/atilaneves/cmake-ide
(use-package rtags
  :defer t)

(use-package irony
  :defer t)

(use-package cmake-ide
  :defer t
  :init (cmake-ide-setup)
  :config
  (progn
    (setq cmake-ide-build-pool-use-persistent-naming t)))
;; >>> cmake-ide

(use-package cmake-mode
  :mode (("\\.cmake\\'" . cmake-mode)
	 ("CMakeLists\\.txt\\'". cmake-mode)))

(provide 'init-c)
;;; init-c.el ends here
