;;; init-reader.el --- support reader of PDF -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; PDf reader
;; https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-reader.el
(when (display-graphic-p)
  (use-package pdf-tools
    :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
    :config
    ;; Build pdfinfo if needed, locking until it's complete
    (with-no-warnings
      (defun my-pdf-tools-install ()
	(unless (file-executable-p pdf-info-epdfinfo-program)
          (let ((wconf (current-window-configuration)))
            (pdf-tools-install t)
            (message "Building epdfinfo. Please wait for a moment...")
            (while compilation-in-progress
              ;; Block until `pdf-tools-install' is done
              (sleep-for 1))
            (when (file-executable-p pdf-info-epdfinfo-program)
              (set-window-configuration wconf)))))
      (advice-add #'pdf-view-decrypt-document :before #'my-pdf-tools-install))
    )
  )


(provide 'init-reader)
;;; init-reader.el ends here
