(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; For installing use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))					;

;; Using use-package
;; Which-key show you the commands
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; Using ansi-term terminal
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; Killing terminal with pressing "y" instead of typing "yes"
(defalias 'yes-or-no-p 'y-or-n-p)

;; launching the terminal with the super key + Enter
(global-set-key (kbd "<s-return>") 'ansi-term)

;; Scroling speed
(setq scroll-conservatively 100)

;; Beacon mode "highlight curser when switching buffers"
(use-package beacon
  :ensure t
  :init
  (beacon-mode t))

;; ido-mode show buffers at switching C-x b
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode t)

;; SMEX show commands for M-x
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; expert mode for faster deletion of buffers
(setq ibuffer-expert t)

;; AVY
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

;; switch windows
(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

;; spaceline
(use-package spaceline
  :ensure
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

;; diminish
(use-package diminish
  :ensure t
  :init
  (diminish 'hungry-delete-mode))

;; adding number lines
(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (diminish spaceline avr SMEX Beacon auto-complete-c-headers yasnippet auto-complete zerodark-theme which-key use-package switch-window swiper spacemacs-theme smex rainbow-mode org-bullets ido-vertical-mode company beacon avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/local/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Tool, scroll, menu bar's
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

