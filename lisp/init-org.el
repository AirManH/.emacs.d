;;; init-org.el --- Org mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package org
  :mode ("\\.org\\'" . org-mode)
  :config
  (progn
    (setq org-src-fontify-natively t
          org-format-latex-options (plist-put
                                    org-format-latex-options :scale 2.0)
          org-latex-pdf-process (list
                                 "latexmk -xelatex %f"))
    (org-babel-do-load-languages
     'org-babel-load-languages '(
                                 (C . t)
                                 ))
    )
  )


;; @see https://github.com/jwiegley/use-package/issues/379
;; @see https://github.com/jwiegley/use-package#package-installation
;; @see https://orgmode.org/manual/CDLaTeX-mode.html
(use-package tex
  :ensure auctex
  :defer t)

(use-package cdlatex
  :hook
  (org-mode . org-cdlatex-mode))


(use-package org-ref
  :after (org)
  :config
  (progn
    (require 'org-ref-ivy)
    (require 'org-ref-isbn)
    )
  )

(defun air-org-imp-filter (buffer)
  "A filter transfer current BUFFER to html."
  (princ
   (with-current-buffer buffer
     ;; (org-export-string-as (format "%s\n\n%s" theme_bigblow (buffer-string)) 'html)
     (org-export-string-as (buffer-string) 'html)
     )
   (current-buffer)))


(defun air-org-preview ()
  "Live preview current opened org file in default browser."
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'air-org-imp-filter)
  (imp-visit-buffer))


(provide 'init-org)
;;; init-org.el ends here
