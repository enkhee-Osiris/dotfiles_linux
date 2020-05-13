;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(after! org
  (setq org-directory "~/.org/"
        org-agenda-files (list org-directory)
        org-ellipsis " ▼ "
        org-bullets-bullet-list '("#")))

(after! ledger-mode
  (setq ledger-binary-path "sledger"))

(after! js2-mode
  (set-company-backend! 'js2-mode 'company-tern 'company-flow))

(after! company
  (defadvice company-in-string-or-comment (around company-in-string-or-comment-hack activate)
    (if (memq major-mode '(php-mode html-mode web-mode))
        (setq ad-return-value nil)
      ad-do-it)))

(after! rustic
  ;; (setq lsp-rust-server 'rust-analyzer)
  (setq rustic-format-on-save t)
  (setq-hook! 'rustic-mode-hook +format-with 'rustfmt))

(setq doom-font (font-spec :family "Fira Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 21))

;; relative line numbers by default
(setq display-line-numbers-type 'relative)

(map! :map +rust-keymap
      "TAB" #'company-indent-or-complete-common
      [tab] #'company-indent-or-complete-common)

(map! :localleader
      :map +rust-keymap
      (:prefix ("r" . "racer")
       "d" #'racer-find-definition
       "f" #'racer-find-definition-other-frame
       "w" #'racer-find-definition-other-window))

(map! :localleader
      :map tide-mode-map
      "R"   #'tide-restart-server
      "f"   #'tide-format
      "rs"  #'tide-rename-symbol
      "roi" #'tide-organize-imports
      "e"   #'tide-project-errors)
