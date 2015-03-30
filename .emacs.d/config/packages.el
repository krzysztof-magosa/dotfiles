; molokai theme
(use-package molokai-theme
  :ensure t)

(use-package highlight-current-line
  :ensure t
  :defer t
  :config
  (progn
    (set-face-background 'highlight-current-line-face "#333333"))
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
    (add-to-list 'company-backends 'company-c-headers)
    (add-to-list 'company-backends 'company-irony))
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
    (add-to-list 'company-c-headers-path-system '"/usr/include")))

(use-package company-irony
  :ensure t
  :defer t)

(use-package company-quickhelp
  :ensure t
  :defer t
  :commands company-quickhelp-mode
  :disabled t
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

; snippets
(use-package yasnippet
  :ensure t
  :defer t
  :commands yas-global-mode
  :init
  (progn
    (setq yas-snippet-dirs "~/.emacs.d/snippets")
    (add-hook 'php-mode-hook 'yas-global-mode))) ; just for php

; php
(use-package php-mode
  :ensure t
  :defer t
  :commands php-mode
  :mode "\\.php\\'"
  :config
  (progn
    (add-hook 'php-mode-hook 'php-enable-psr2-coding-style)))

(use-package apache-mode
  :ensure t
  :defer t)

(use-package markdown-mode
  :ensure t
  :defer t
  :commands markdown-mode)

; check php coding style
(use-package flymake-phpcs
  :ensure t
  :defer t
  :commands flymake-phpcs-load
  :config
  (progn
    (setq flymake-phpcs-standard "PSR2")
    (setq flymake-phpcs-show-rule t))
  :init
  (progn
    (add-hook 'php-mode-hook 'flymake-phpcs-load)))

; check php syntax
(use-package flymake-php
  :ensure t
  :defer t
  :commands flymake-php-load
  :init
  (progn
    (add-hook 'php-mode-hook 'flymake-php-load)))

(use-package flymake-python-pyflakes
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)))

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
  :mode "\\.\\(phtml\\|html\\)\\'"
  :config
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)))

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package git-rebase-mode
  :ensure t
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
  :ensure t)

; it must be here on the bottom, because of bug with cl lib
(use-package fiplr
  :ensure t
  :bind("C-c o" . fiplr-find-file)
  :config
  (progn
    (setq fiplr-ignored-globs '(
      (directories (".git" ".svn" ".sass-cache" "node_modules"))
      (files ("*.jpg" "*.png" "*.zip" "*.svg" "*.eot" "*.woff" "*.ttf" "*~"))))
    (setq fiplr-root-markers '(".project-root"))))
