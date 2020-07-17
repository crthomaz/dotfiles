;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       ivy

       :checkers
       syntax

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +all +defaults)
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       multiple-cursors
       parinfer
       rotate-text
       snippets

       :emacs
       dired
       electric
       ibuffer
       vc

       :app
       rss

       :tools
       direnv
       (eval +overlay)
       (lookup +docsets)
       magit
       lsp

       :lang
       (cc +lsp)
       clojure
       (rust +lsp)
       haskell
       emacs-lisp
       sh
       data
       markdown
       org

       :config
       (default +bindings +smartparens))