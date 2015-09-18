(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; install use-package if needed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-options)
(require 'bind-key)
(require 'init-company)
(require 'init-git)
(require 'init-helm)
(require 'init-osx)
(require 'init-modes)
(require 'init-ruby)
(require 'init-mgmt)
(require 'init-other)
(require 'init-keyboard)
(require 'init-appearance)
