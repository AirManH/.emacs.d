(provide 'init-httpd)


(use-package simple-httpd
  :commands (httpd-start)
  :config
  ;; random port in [6000, 7000)
  (setq httpd-port (+ (random 1000) 6000))
  (setq httpd-host "localhost"))
