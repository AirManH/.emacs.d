;;; init-pyim.el --- use Chinese input method -*- lexical-binding: t -*-
;;; Commentary: This file is based on my personal input method. You might have to customize it.
;;; Code:


;; for more details, see https://github.com/tumashu/pyim
(global-set-key (kbd "C-\\") 'toggle-input-method)
(setq default-input-method "pyim")

(defvar air-pyim-fix-punctuation-width nil
  "Whether the punctuation width should be fixed.")

(use-package pyim
  :defer t
  :config
  (progn
    ;; @see https://github.com/tumashu/pyim/issues/372
    (when air-pyim-fix-punctuation-width
      (setq pyim-local-variable-list
            (remove 'pyim-punctuation-translate-p pyim-local-variable-list)))
    (use-package pyim-basedict
      :config
      (pyim-basedict-enable))
    ;; my personal choice: xiaohe-shuangpin
    (setq pyim-default-scheme 'xiaohe-shuangpin)
    ;; show the first 5 candidate words
    (setq pyim-page-length 5)
    ;; use posframe to get better popup
    (use-package posframe
      :config
      (setq pyim-page-tooltip 'popup)))
  )


(provide 'init-pyim)
;;; init-pyim.el ends here
