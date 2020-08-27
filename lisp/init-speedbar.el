;;; init-company.el --- speedbar -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package sr-speedbar
  :defer t
  :commands (sr-speedbar-open sr-speedbar-toggle)
  :config
  (progn
    (setq sr-speedbar-skip-other-window-p t
	  sr-speedbar-width 10
	  sr-speedbar-max-width 20
	  sr-speedbar-right-side nil
	  speedbar-use-images t
	  speedbar-show-unknown-files t)
    ;; change font size
    (make-face 'speedbar-face)
    (set-face-font 'speedbar-face "monospace-11")
    (setq speedbar-mode-hook
	  '(lambda () (buffer-face-set 'speedbar-face)))))

(provide 'init-speedbar)
;;; init-speedbar.el ends here
