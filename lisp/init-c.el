;;; init-c.el --- C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


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
  :config
  (progn
    (setq c-basic-offset 4)
    ;; stop reindenting after typing some characters (';', '}')
    (setq-default c-electric-flag nil)))

(use-package cmake-mode
  :mode (("\\.cmake\\'" . cmake-mode)
         ("CMakeLists\\.txt\\'". cmake-mode)))

(provide 'init-c)
;;; init-c.el ends here
