;;; init-ahk.el --- lsp based C/C++ support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package ahk-mode
  :mode
  (("\\.ahk\\'" . ahk-mode)
   ("\\.AHK\\'" . ahk-mode)))


(provide 'init-ahk)
;;; init-ahk.el ends here
