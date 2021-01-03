;;; init-python.el --- Python mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :after (anaconda-mode company)
  :config
  (add-hook 'python-mode-hook (lambda ()
                                (set (make-local-variable 'company-backends)
                                     '((company-anaconda company-dabbrev-code)
                                       company-dabbrev)))))


(provide 'init-python)
;;; init-python.el ends here
