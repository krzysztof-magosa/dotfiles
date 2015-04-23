; flatland-theme
; ujelly-theme
; molokai-theme
; twilight-bright-theme
; material-theme
(use-package flatland-theme
  :ensure t)

(use-package highlight-current-line
  :ensure t
  :defer t
  :config
  (progn
    (set-face-background 'highlight-current-line-face "#353535"))
  :init
  (progn
    (add-hook 'prog-mode-hook 'highlight-current-line-minor-mode)))

; auto complete related stuff
(use-package company
  :ensure t
  :defer t
  :config
  (progn
    (setq company-idle-delay 0.2)
    (add-to-list 'company-backends 'company-go)
    (add-to-list 'company-backends 'company-jedi)
    (add-to-list 'company-backends 'company-irony)
    (add-to-list 'company-backends 'company-c-headers))
  :init
  (progn
    (add-hook 'prog-mode-hook 'company-mode)))

(use-package company-go
  :ensure t
  :defer t)

(use-package company-jedi
  :ensure t
  :defer t)

(use-package company-c-headers
  :ensure t
  :defer t
  :config
  (progn
    (add-to-list 'company-c-headers-path-system '"/usr/include")
    (add-to-list 'company-c-headers-path-system '"/usr/include/c++/4.2.1")))

(use-package company-irony
  :ensure t
  :defer t)

(use-package company-quickhelp
  :ensure t
  :defer t
  :disabled t
  :commands company-quickhelp-mode
  :init
  (progn
    (setq company-quickhelp-idle-delay 0.2)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))

(use-package company-statistics
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'after-init-hook 'company-statistics-mode)))

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
    (setq yas-snippet-dirs "~/.emacs.d/snippets")
    (add-hook 'c-mode-hook 'yas-global-mode)
    (add-hook 'c++-mode-hook 'yas-global-mode)
    (add-hook 'php-mode-hook 'yas-global-mode))) ; just for php

; php
(use-package php-mode
  :ensure t
  :defer t
  :commands php-mode
  :mode "\\.php\\'"
  :config
  (progn
    (add-hook 'php-mode-hook 'php-enable-symfony2-coding-style)))

(use-package apache-mode
  :ensure t
  :defer t)

(use-package nginx-mode
  :ensure t
  :defer t)

(use-package markdown-mode
  :ensure t
  :defer t
  :commands markdown-mode)

(use-package flycheck
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'flycheck-mode))
  :config
  (progn
    (setq flycheck-phpcs-standard "PSR2")))

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

(use-package helm-git-grep
  :ensure t
  :defer t
  :bind("C-c g" . helm-git-grep))

(use-package web-mode
  :ensure t
  :defer t
  :mode "\\.blade\\.php\\'"
  :mode "\\.phtml\\'"
  :mode "\\.html\\'"
  :config
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)))

(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package git-rebase-mode
  :ensure t
  :defer t
  :config
  (progn
    (define-key git-rebase-mode-map (kbd "<ESC> <up>") 'git-rebase-move-line-up)
    (define-key git-rebase-mode-map (kbd "<ESC> <down>") 'git-rebase-move-line-down)))

(use-package scss-mode
  :defer t
  :ensure t
  :mode "\\.sass\\'"
  :config
  (progn
    (setq css-indent-offset 2)))

(use-package yaml-mode
  :defer t
  :ensure t
  :mode "\\.yaml\\'")

(use-package json-mode
  :defer t
  :ensure t
  :mode "\\.json\\'")

(use-package js2-mode
  :defer t
  :ensure t
  :mode "\\.js\\'"
  :init
  (progn
    (setq-default js2-basic-offset 2)))

(use-package cmake-mode
  :defer t
  :ensure t
  :mode "CMakeLists.txt\\'\\|\\.cmake\\'")

(use-package go-mode
  :defer t
  :ensure t
  :mode "\\.go\\'")

(use-package git-gutter
  :ensure t
  :defer t
  :commands git-gutter-mode
  :init
  (progn
    (add-hook 'prog-mode-hook 'git-gutter-mode))
  :config
  (progn
    (git-gutter:linum-setup)
    (setq git-gutter:update-interval 2)))

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

(use-package elpy
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'python-mode-hook 'elpy-mode)))

(use-package polymode
  :ensure t
  :defer t
  :commands poly-markdown-mode
  :mode ("\\.md\\'" . poly-markdown-mode))

(use-package osx-clipboard
  :ensure t
  :init
  (progn
    (osx-clipboard-mode)))

(use-package ggtags
  :ensure t
  :defer t)

(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'projectile-mode)
    (add-hook 'dired-mode-hook 'projectile-mode))
  :config
  (progn
    (setq projectile-project-root-files '(".project-root"))
    (setq projectile-project-root-files-top-down-recurring '(".project-root"))
    (setq projectile-project-root-files-bottom-up '(".project-root"))
    (setq projectile-enable-idle-timer t)))

; it must be here on the bottom, because of bug with cl lib
(use-package fiplr
  :ensure t
  :defer t
  :bind("C-c o" . fiplr-find-file)
  :config
  (progn
    (setq fiplr-ignored-globs '(
      (directories (".git" ".svn" ".sass-cache" "node_modules"))
      (files ("*.jpg" "*.png" "*.zip" "*.svg" "*.eot" "*.woff" "*.ttf" "*~"))))
    (setq fiplr-root-markers '(".project-root"))))
