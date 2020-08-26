;;; init-linum.el --- linum-mode configure -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(global-linum-mode 1)

;;; <<< DISable linum-mode in some situation
(defcustom linum-disabled-modes-list
  '(compilation-mode
    dictionary-mode
    dired-mode
    eshell-mode
    fundamental-mode
    gnus-article-mode
    gnus-group-mode
    gnus-summary-mode
    gud-mode
    help-mode
    Info-mode
    ivy-occur-grep-mode;betterperformance
    ivy-occur-mode;betterperformance
    man-mode
    speedbar-mode)
  "List of modes disabled when global linum mode is on."
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum
  )

(defcustom linum-disable-starred-buffers 't
  "Disable buffers that have stars in them like *Gnu Emacs."
  :type 'boolean
  :group 'linum)

(defun linum-on ()
  "Overwritten (linum-on)."
  (unless (or (minibufferp)
              (member major-mode linum-disabled-modes-list)
	      ;; buffer name is *sth* but not *scratch*
              (and (string-match "*" (buffer-name)) (not (string= (buffer-name) "*scratch*")))
	      ;; buffer greater than 3MB
              (> (buffer-size) 3000000))
    (linum-mode 1)))
;;; <<< DISable linum-mode in some situation


(provide 'init-linum)
;;; init-linum.el ends here
