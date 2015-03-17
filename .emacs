(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; install use-package if needed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

; molokai theme
(use-package molokai-theme
  :ensure t)

; auto complete related stuff
(use-package company
  :ensure t
  :defer t
  :config
  (progn
    (setq company-idle-delay 0.2)
    (add-to-list 'company-backends 'company-jedi)
    (add-to-list 'company-backends 'company-c-headers)
    (add-to-list 'company-backends 'company-irony))
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

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
  :mode "\\.php$"
  :config
  (progn
    (add-hook 'php-mode-hook 'php-enable-psr2-coding-style)))

(use-package apache-mode
  :ensure t
  :defer t)

(use-package markdown-mode
  :ensure t
  :defer t
  :commands markdown-mode
  :mode "\\.md$")

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
  :commands web-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html$" . web-mode)))
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

(use-package yaml-mode
  :defer t
  :ensure t
  :mode "\\.yaml$")

(use-package elpy
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'python-mode-hook 'elpy-mode)))

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

; go to specified line
(define-key global-map (kbd "C-c j") 'goto-line)

; cmd+left/right arrow
(define-key global-map (kbd "M-[ H") 'beginning-of-line)
(define-key global-map (kbd "M-[ F") 'end-of-line)

; jumping between windows
(define-key global-map (kbd "C-<up>") 'windmove-up)
(define-key global-map (kbd "C-<down>") 'windmove-down)
(define-key global-map (kbd "C-<left>") 'windmove-left)
(define-key global-map (kbd "C-<right>") 'windmove-right)

; always use spaces and not tabs to indent code
(setq-default indent-tabs-mode nil)

; don't show menu bar
(menu-bar-mode -1)

; be more interactive ;)
(ido-mode 1)

; show line number
(global-linum-mode 1)
(setq linum-format "%4d ")

; display column number in status bar
(setq column-number-mode t)

; show matching pairs of parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

; when splitting screen try to put new window on bottom
(setq split-height-threshold 0)
(setq split-width-threshold 0)
