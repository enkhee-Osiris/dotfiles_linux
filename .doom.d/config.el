;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(after! org
  (setq org-directory "~/.org/"
        org-agenda-files (list org-directory)
        org-ellipsis " ▼ "

        ;; The standard unicode characters are usually misaligned depending on the
        ;; font. This bugs me. Markdown #-marks for headlines are more elegant.
        org-bullets-bullet-list '("#")))

(after! js2-mode
  (set-company-backend! 'js2-mode 'company-tern 'company-flow))

(setq doom-font (font-spec :family "Fira Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 21))
