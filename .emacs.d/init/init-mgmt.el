(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'projectile-global-mode)
    (add-hook 'dired-mode-hook 'projectile-global-mode))
  :config
  (progn
    (setq projectile-project-root-files '(".project-root"))
    (setq projectile-project-root-files-top-down-recurring '(".project-root"))
    (setq projectile-project-root-files-bottom-up '(".project-root"))
    (setq projectile-git-command "git ls-files -zco")
    (setq projectile-completion-system 'helm)
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

(provide 'init-mgmt)
