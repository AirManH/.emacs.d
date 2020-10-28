;;; init-org.el --- Org mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package org
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-src-fontify-natively t)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))


;; @see https://github.com/jwiegley/use-package/issues/379
;; @see https://github.com/jwiegley/use-package#package-installation
;; @see https://orgmode.org/manual/CDLaTeX-mode.html
(use-package tex
  :ensure auctex
  :defer t)

(use-package cdlatex
  :hook
  (org-mode . org-cdlatex-mode))


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
