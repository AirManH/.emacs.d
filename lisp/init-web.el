;;; init-web --- web development support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package web-mode
  :mode
  (("\\.html\\'" . web-mode)
   ("\\.css\\'" . web-mode)))


(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode)))


(provide 'init-web)
;;; init-web.el ends here
