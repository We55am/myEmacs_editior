(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; For installing use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))					;

;; Using use-package
;; Which-key show you the completeion of commands
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))



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
    (auto-complete-c-headers yasnippet auto-complete zerodark-theme which-key use-package switch-window swiper spacemacs-theme smex rainbow-mode org-bullets ido-vertical-mode company beacon avy))))
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

