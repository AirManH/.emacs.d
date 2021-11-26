;;; init-move.el --- Move between windows, buffers and so on -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(air-leader-def
  :states 'normal
  "w" '(nil :wk "window")
  )


(use-package ace-window
  :config
  (progn
    (air-leader-def
      :states 'normal
      "w o" '(ace-window :wk "move to another")
      )
    )
  )


(provide 'init-move)
;;; init-move.el ends here
