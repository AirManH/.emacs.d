(provide 'init-python)


(use-package anaconda-mode
  :defer t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :defer t
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
							     company-dabbrev))
	      )))
