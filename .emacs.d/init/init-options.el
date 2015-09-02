; always use spaces and not tabs to indent code
(setq-default indent-tabs-mode nil)

; don't show menu bar
(menu-bar-mode -1)

; be more interactive ;)
;(ido-mode 1)

; show line number
(global-linum-mode 1)
(setq linum-format "%4d ")

; display column number in status bar
(setq column-number-mode t)

; show matching pairs of parentheses
(show-paren-mode 1)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

; when splitting screen try to put new window on bottom
(setq split-height-threshold 0)
(setq split-width-threshold 0)

; highlight trailing whitespace
(setq-default show-trailing-whitespace t)

(when (eq system-type 'darwin)
  (when (file-exists-p "/opt/local/bin/gls")
    (setq insert-directory-program "/opt/local/bin/gls")
    (setq dired-listing-switches "-aBhl --group-directories-first")))

(provide 'init-options)
