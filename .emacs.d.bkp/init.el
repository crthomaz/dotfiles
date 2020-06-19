;;; package --- Summary
;;; Commentary:

;; My Emacs config!

;;; Code:

;; Straight

(defvar straight-use-package-by-default t)

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; General packages

(use-package which-key
  :config
  (which-key-mode 1))

(use-package better-defaults)

(use-package ivy
  :config
  (ivy-mode 1))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package swiper)

(use-package amx)

(use-package ripgrep)

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/Code/"
                                         "~/Code/suckless/"
                                         "~/Code/oss/"))
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1))

(use-package counsel-projectile
  :after counsel projectile
  :config
  (counsel-projectile-mode 1))

(use-package company
  :config
  (global-company-mode))

(use-package flycheck)

(use-package magit)

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package treemacs)

;; Evil

(use-package evil
  :init
  (defvar evil-want-C-u-scroll t)
  (defvar evil-want-integration t)
  (defvar evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :after evil
  :config
  (evilnc-default-hotkeys))

(use-package evil-magit
  :after evil magit)

(use-package treemacs-evil
  :after treemacs evil)

(use-package treemacs-magit
  :after treemacs magit)

;; Lisp

(use-package parinfer
  :init
  (progn
    (defvar parinfer-extensions '(defaults evil))
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Clojure

(use-package clojure-mode)

(use-package cider)

(use-package clj-refactor)

(use-package flycheck-joker)

;; Rust

(use-package lsp-mode)

(use-package rustic)

;; UI

(use-package nord-theme
  :config
  (load-theme 'nord t))

;; Setting transparency
(set-frame-parameter (selected-frame) 'alpha '(85 75))
(add-to-list 'default-frame-alist '(alpha 85 75))

(set-face-attribute 'default nil :font "Fantasque Sans Mono" :height 120)

(global-linum-mode t)
(setq inhibit-splash-screen t)

(provide 'init)
;;; init.el ends here