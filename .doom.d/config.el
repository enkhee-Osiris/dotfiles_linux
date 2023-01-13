;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(after! evil
  (defun my-send-str-to-terminal (str)
    (unless (display-graphic-p) (send-string-to-terminal str)))

  (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-str-to-terminal "\033[6 q")))
  (add-hook 'evil-insert-state-exit-hook (lambda () (my-send-str-to-terminal "\033[2 q"))))

(after! org
  (setq org-directory "~/.org/"
        org-agenda-files (list org-directory)
        org-ellipsis " ▼ "
        org-bullets-bullet-list '("#")))

(after! ledger-mode
  (setq ledger-binary-path "sledger"))

(after! js2-mode
  (add-hook 'js2-mode-local-vars-hook
            (lambda ()
              (when (flycheck-may-enable-checker 'javascript-eslint)
                (flycheck-select-checker 'javascript-eslint)))))

(defun lsp-ignore-node-files ()
  (seq-do #'(lambda (drct) (add-to-list 'lsp-file-watch-ignored-directories drct)) '("[/\\\\]\\out\\'" "[/\\\\]\\_next\\'" "[/\\\\]\\.next\\'" "[/\\\\]\\.husky\\'" "[/\\\\]\\.log\\'")))

(after! rjsx-mode
  (after! lsp-mode (lsp-ignore-node-files))
  (setq-hook! 'rjsx-mode-hook +format-with-lsp nil))

(after! typescript-mode
  (setq-hook! 'typescript-mode-hook +format-with-lsp nil)
  (setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
  (setq lsp-clients-typescript-tls-path "/home/osiris/.node_modules/bin/typescript-language-server")
  (after! lsp-mode (lsp-ignore-node-files)))

(after! rustic
  (setq rustic-format-on-save t)
  (setq-hook! 'rustic-mode-hook +format-with 'rustfmt))

(setq doom-font (font-spec :family "Fira Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 21)
      ;; theme
      doom-theme 'doom-vibrant
      projectile-project-search-path '("~/Work/")
      ;; relative line numbers by default
      display-line-numbers-type 'relative
      user-full-name "Enkh-Erdene Bolormaa"
      user-mail-address "enkhee.ag@gmail.com")

(map! :map +rust-keymap
      "TAB" #'company-indent-or-complete-common
      [tab] #'company-indent-or-complete-common)

(map! :localleader
      :map +rust-keymap
      (:prefix ("r" . "racer")
       "d" #'racer-find-definition
       "f" #'racer-find-definition-other-frame
       "w" #'racer-find-definition-other-window))

;; (setq lsp-tailwindcss-add-on-mode t)
;; (use-package! lsp-tailwindcss)
