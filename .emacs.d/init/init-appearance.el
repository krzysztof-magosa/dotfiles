; flatland-theme
; ujelly-theme
; molokai-theme
; twilight-bright-theme
; material-theme
; flatland-theme
(use-package material-theme
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

(use-package highlight-indentation
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'highlight-indentation-mode)))

(provide 'init-appearance)
