;;; init-c.el --- C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package cmake-mode
  :mode (("\\.cmake\\'" . cmake-mode)
         ("CMakeLists\\.txt\\'". cmake-mode)))


(use-package cc-mode
  :commands c-mode
  ;; What does "\\." or "\\'" mean?
  ;; "\\." match a "."
  ;; "\\'" match end of word
  ;; https://www.reddit.com/r/emacs/comments/cf2kyr/regex_what_does_or_mean/
  :mode
  (("\\.c\\'" . c-mode)
   ("\\.cpp\\'" . c++-mode)
   ("\\.h\\'" . c-mode)
   ("\\.hpp\\'" . c++-mode))
  :config
  (progn
    (setq c-basic-offset 4)
    ;; stop re-indenting after typing specific characters (';', '}')
    (setq-default c-electric-flag nil)
    ))


(defvar air-c-scheme "none"
  "This variable decides which scheme to use in C/C++ project.
Candidate: [none, gtags, lsp]")

(when (string-equal "gtags" air-c-scheme)
  (require 'init-c-gtags))

(when (string-equal "lsp" air-c-scheme)
  (require 'init-c-lsp))


(provide 'init-c)
;;; init-c.el ends here
