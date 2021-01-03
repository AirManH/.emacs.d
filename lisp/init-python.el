;;; init-python.el --- Python mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(defun air-python-set-company-backends-anaconda ()
  "Set `company-backends' with `company-anaconda'."
  (set (make-local-variable 'company-backends)
       '((company-anaconda company-dabbrev-code)
         company-dabbrev)))

(use-package company-anaconda
  :hook (python-mode . air-python-set-company-backends-anaconda))

(provide 'init-python)
;;; init-python.el ends here
