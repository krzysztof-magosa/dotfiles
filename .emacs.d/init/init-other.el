(use-package irony
  :ensure t
  :defer t
  :commands irony-mode
  :init
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)))

; snippets
(use-package yasnippet
  :ensure t
  :defer t
  :commands yas-global-mode
  :init
  (progn
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (add-hook 'c-mode-hook 'yas-global-mode)
    (add-hook 'c++-mode-hook 'yas-global-mode)
    (add-hook 'sh-mode-hook 'yas-global-mode)
    (add-hook 'ruby-mode-hook 'yas-global-mode)
    (add-hook 'php-mode-hook 'yas-global-mode))) ; just for php

(use-package flycheck
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'flycheck-mode))
  :config
  (progn
    (setq flycheck-phpcs-standard "PSR2")
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))

; edit symbol in multiple places in the same time
(use-package iedit
  :ensure t
  :defer t
  :bind("C-c ;" . iedit-mode))

(use-package semantic
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'c-mode-common-hook 'semantic-mode))
  :config
  (progn
    ; reparse opened buffers
    (global-semantic-idle-scheduler-mode 1)
    (global-semanticdb-minor-mode 1)))

(use-package password-generator
  :ensure t
  :defer t)

(use-package pyvenv
  :ensure t
  :defer t
  :config
  (progn
    (when (file-accessible-directory-p "~/.python-env/py3.4")
      (pyvenv-activate "~/.python-env/py3.4")))
  :init
  (progn
    (add-hook 'python-mode-hook 'pyvenv-mode)))

(use-package ggtags
  :ensure t
  :defer t)

(provide 'init-other)
