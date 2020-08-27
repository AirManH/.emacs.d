(provide 'init-python)


(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
	 (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :defer t
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
							     company-dabbrev)))))
