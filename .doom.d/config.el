;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(after! org
  (setq org-directory "~/.org/"
        org-agenda-files (list org-directory)
        org-ellipsis " ▼ "

        ;; The standard unicode characters are usually misaligned depending on the
        ;; font. This bugs me. Markdown #-marks for headlines are more elegant.
        org-bullets-bullet-list '("#"))
)
