;;; init-python-conda.el --- anaconda-mode based Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :config
  (progn
    ;; keybinds
    (air-local-leader-def 'normal python-mode-map
      ;; g means go
      "g d" 'anaconda-mode-find-definitions
      "g a" 'anaconda-mode-find-assignments
      "g r" 'anaconda-mode-find-references
      ;; s means show
      "s d" 'anaconda-mode-find-definitions-other-window
      "s a" 'anaconda-mode-find-assignments-other-window
      "s r" 'anaconda-mode-find-references-other-window

      "s c" 'anaconda-mode-show-doc
      "g b" 'xref-pop-marker-stack
      )
    )
  )


(use-package company-anaconda
  :after (conda company)
  :config
  (progn
    (add-to-list 'company-backends 'company-anaconda)))


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


(provide 'init-python-conda)
;;; init-python-conda.el ends here
