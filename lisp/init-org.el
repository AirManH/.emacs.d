(provide 'init-org)


(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))

;; Live preview
(defun air-org-imp-filter (buffer)
  ;; org mode themes
  (let ((theme_bigblow "#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-bigblow.setup")
        (theme_readtheorg "#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-readtheorg.setup")
	)
    ;;
    (princ
     (with-current-buffer buffer
       ;; (org-export-string-as (format "%s\n\n%s" theme_bigblow (buffer-string)) 'html)
       (org-export-string-as (buffer-string) 'html)
       )
     (current-buffer)))
  )

(defun air-org-preview ()
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'air-org-imp-filter)
  (imp-visit-buffer))
