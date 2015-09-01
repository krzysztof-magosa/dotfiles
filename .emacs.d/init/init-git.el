(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

;(use-package git-rebase-mode
;  :ensure t
;  :defer t
;  :config
;  (progn
;    (define-key git-rebase-mode-map (kbd "<ESC> <up>") 'git-rebase-move-line-up)
;    (define-key git-rebase-mode-map (kbd "<ESC> <down>") 'git-rebase-move-line-down)))

(use-package magit
  :ensure t
  :defer t)

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

(provide 'init-git)
