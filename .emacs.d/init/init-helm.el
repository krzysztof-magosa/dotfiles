(use-package helm-git-grep
  :ensure t
  :defer t
  :bind("C-c g" . helm-git-grep))

(use-package helm-projectile
  :ensure t
  :defer t)

(provide 'init-helm)
