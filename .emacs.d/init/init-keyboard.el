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

(provide 'init-keyboard)
