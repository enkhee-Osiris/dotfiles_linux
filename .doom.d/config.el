;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(after! org
  (setq org-directory "~/.org/"
        org-agenda-files (list org-directory)
        org-ellipsis " ▼ "

        ;; The standard unicode characters are usually misaligned depending on the
        ;; font. This bugs me. Markdown #-marks for headlines are more elegant.
        org-bullets-bullet-list '("#")))

(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))
(setq hledger-jfile "~/.hledger.journal")


;; (add-to-list 'ac-modes 'hledger-mode)
;; (add-hook 'hledger-mode-hook
;;     (lambda ()
;;         (setq-local ac-sources '(hledger-ac-source))))


;; (after! js2-mode
;;   (set-company-backend! 'js2-mode 'company-tern 'company-flow))

(after! js2-mode-hook tide-mode
  (add-hook 'rjsx-mode-hook #'setup-tide-mode)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(after! rustic
  (setq rustic-format-on-save t)
  (setq-hook! 'rustic-mode-hook +format-with 'rustfmt))

(setq doom-font (font-spec :family "Fira Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 21))

;; relative line numberss by default
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
