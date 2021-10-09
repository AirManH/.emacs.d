;;; init-powershell.el --- Powershell support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package powershell
  :mode
  (
   ("\\.ps1\\'" . powershell-mode)
   ("\\.psm1\\'" . powershell-mode)
   ("\\.psd1\\'" . powershell-mode)
   )
  )


(provide 'init-powershell)
;;; init-powershell.el ends here
