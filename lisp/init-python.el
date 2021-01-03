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

(use-package conda
  :after (anaconda-mode)
  :config
  (progn
    ;; The location of your anaconda home will be guessed from a list of common
    ;; possibilities, starting with `conda-anaconda-home''s default value (which
    ;; will consult a ANACONDA_HOME envvar, if it exists).
    ;;
    ;; If none of these work for you, `conda-anaconda-home' must be set
    ;; explicitly. Afterwards, run M-x `conda-env-activate' to switch between
    ;; environments
    (or (cl-loop for dir in (list conda-anaconda-home
                                  "~/.anaconda"
                                  "~/.miniconda"
                                  "~/.miniconda3"
                                  "~/anaconda3"
                                  "~/miniconda3"
                                  "~/opt/miniconda3"
                                  "/usr/bin/anaconda3"
                                  "/usr/local/anaconda3"
                                  "/usr/local/miniconda3"
                                  "/usr/local/Caskroom/miniconda/base")
                 if (file-directory-p dir)
                 return (setq conda-anaconda-home (expand-file-name dir)
                              conda-env-home-directory (expand-file-name dir)))
        (message "Cannot find Anaconda installation"))))


(provide 'init-python)
;;; init-python.el ends here
