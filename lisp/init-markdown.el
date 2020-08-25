(provide 'init-markdown)


(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc --from=markdown_strict"))

(use-package vmd-mode
  ;;   :bind ("M-m p" . 'vmd-mode)
  :commands vmd-mode)
