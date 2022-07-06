;;; init-tex.el --- Tex mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; @see https://github.com/jwiegley/use-package/issues/379
;; @see https://github.com/jwiegley/use-package#package-installation
;; @see https://orgmode.org/manual/CDLaTeX-mode.html
(use-package latex
  :ensure auctex
  :config
  (progn
    (setq
     ;; Automatically save style information when saving the buffer.
     TeX-auto-save t
     ;; Parse file after loading it if no style hook is found for it.
     TeX-parse-self t
     )
    ;; Make auctex aware of multi-file document structure.
    (setq-default TeX-master nil)

    ;; {{{ keybinds

    ;; https://github.com/syl20bnr/spacemacs/blob/b66e60cabb29c07f8d713d1646ccadbd46e4f03e/layers/%2Blang/latex/funcs.el#L105
    ;; Rebindings for TeX-font
    (defun latex/font-emphasis () (interactive) (TeX-font nil ?\C-e))

    (defun latex/font-sans-serif () (interactive) (TeX-font nil ?\C-f))
    (defun latex/font-roman () (interactive) (TeX-font nil ?\C-r))
    (defun latex/font-typewriter () (interactive) (TeX-font nil ?\C-t))

    (defun latex/font-medium () (interactive) (TeX-font nil ?\C-m))
    (defun latex/font-bold () (interactive) (TeX-font nil ?\C-b))

    (defun latex/font-italic () (interactive) (TeX-font nil ?\C-i))
    (defun latex/font-oblique () (interactive) (TeX-font nil ?\C-s))
    (defun latex/font-small-caps () (interactive) (TeX-font nil ?\C-c))
    (defun latex/font-swash () (interactive) (TeX-font nil ?\C-w))
    (defun latex/font-upper-lower () (interactive) (TeX-font nil ?\C-l))

    (defun latex/font-calligraphic () (interactive) (TeX-font nil ?\C-a))
    (defun latex/font-normal () (interactive) (TeX-font nil ?\C-n))

    (defun latex/font-clear () (interactive) (TeX-font nil ?\C-d))
    (defun latex/font-upright () (interactive) (TeX-font nil ?\C-u))

    (air-local-leader-def
      :states '(normal motion)
      :keymaps 'LaTeX-mode-map
      "" '(nil :wk "local leader key")
      ;; insert
      "i" '(nil :wk "insert")
      "i e" '(LaTeX-environment :wk "env")
      "i s" '(LaTeX-section :wk "section")
      "i m" '(TeX-insert-macro :wk "macro")
      ;; font setting
      "f" '(nil :wk "font")

      "f e" '(latex/font-emphasis :wk "emphasis")

      "f f" '(latex/font-sans-serif :wk "sans serif")
      "f r" '(latex/font-roman :wk "roman")
      "f t" '(latex/font-typewriter :wk "typewriter")

      "f m" '(latex/font-medium :wk "medium")
      "f b" '(latex/font-bold :wk "bold")

      "f i" '(latex/font-italic :wk "italic")
      "f o" '(latex/font-oblique :wk "oblique")
      "f s" '(latex/font-small-caps :wk "small caps")
      "f w" '(latex/font-swash :wk "swash")
      "f l" '(latex/font-upper-lower :wk "upper lower")

      "f a" '(latex/font-calligraphic :wk "calligraphic")
      "f n" '(latex/font-normal :wk "normal")

      "f d" '(latex/font-clear :wk "clear")
      "f u" '(latex/font-upright :wk "upright")
      )
    ;; }}}
    )
  )


(provide 'init-tex)
;;; init-tex.el ends here
