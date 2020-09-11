;;; init-evil.el --- Evil mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package evil
  :config
  (evil-mode 1)
  ;; https://github.com/Malabarba/smart-mode-line/issues/195#issuecomment-338447042
  ;; Color the evil tag - colors taken from spaceline
  (setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
        evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
        evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
        evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
        evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
        evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
        evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))
  )


(provide 'init-evil)
;;; init-evil.el ends here
