(provide 'init-c)


(use-package cc-mode
  :commands c-mode
  :mode (("\\.c\\'" . c-mode)
	 ("\\.cpp\\'" . c-mode)
	 ("\\.h\\'" . c-mode)
	 ("\\.hpp\\'" . c-mode))
  :config
  (setq c-basic-offset 4)
  (setq-default c-electric-flag nil))
