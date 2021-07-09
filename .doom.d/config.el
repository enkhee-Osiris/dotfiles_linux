;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (defun my-create-tags-if-needed (SRC-DIR &optional FORCE)
;;   "return the full path of tags file"
;;   (let ((dir (file-name-as-directory (file-truename SRC-DIR))) file)
;;     (setq file (concat dir "TAGS"))
;;     (when (or FORCE (not (file-exists-p file)))
;;       (message "Creating TAGS in %s ..." dir)
;;       (shell-command
;;        (format "ctags -f %s -e -R %s" file dir))
;;       )
;;     file
;;     ))

;; (defvar my-tags-updated-time nil)

;; (defun my-update-tags ()
;;   (interactive)
;;   "check the tags in tags-table-list and re-create it"
;;   (dolist (tag tags-table-list)
;;     (my-create-tags-if-needed (file-name-directory tag) t)))

;; (defun my-auto-update-tags-when-save ()
;;   (interactive)
;;   (cond
;;    ((not my-tags-updated-time)
;;     (setq my-tags-updated-time (current-time)))
;;    ((> (- (float-time (current-time)) (float-time my-tags-updated-time)) 20)
;;     (setq my-tags-updated-time (current-time))
;;     (my-update-tags)
;;     (message "updated tags after %d seconds." (- (float-time (current-time))  (float-time my-tags-updated-time))))))


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
  ;; (set-company-backend! 'js2-mode 'company-tern 'company-flow)
  (add-hook 'js2-mode-local-vars-hook
            (lambda ()
              (when (flycheck-may-enable-checker 'javascript-eslint)
                (flycheck-select-checker 'javascript-eslint)))))

(after! rjsx-mode
  (setq-hook! 'rjsx-mode-hook +format-with-lsp nil))

(after! typescript-mode
  (setq lsp-clients-typescript-tls-path "/home/osiris/.node_modules/bin/typescript-language-server"))

;; (after! css-mode
;;   (add-hook 'scss-mode-local-vars-hook
;;             (lambda ()
;;               (when (flycheck-may-enable-checker 'scss-stylelint)
;;                 (flycheck-select-checker 'scss-stylelint)))))

;; (after! company
;;   (defadvice company-in-string-or-comment (around company-in-string-or-comment-hack activate)
;;     (if (memq major-mode '(php-mode html-mode web-mode))
;;         (setq ad-return-value nil)
;;       ad-do-it)))

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

;; (map! :localleader
;;       :map tide-mode-map
;;       "R"   #'tide-restart-server
;;       "f"   #'tide-format
;;       "rs"  #'tide-rename-symbol
;;       "roi" #'tide-organize-imports
;;       "e"   #'tide-project-errors)

;; (after! web-mode
;;   (set-company-backend! 'web-mode
;;     'company-css
;;     'company-web-html
;;     'company-etags
;;     'company-files))

;; (add-hook! 'lsp-mode-hook :append
;;   (when (eq major-mode 'web-mode)
;;     (setq-local company-backends (list company-backends))))


;; (jdecomp-mode 1)
;; (setq jdecomp-decompiler-paths '((cfr . "/home/osiris/Downloads/cfr-0_150.jar")))

;; (add-hook 'after-save-hook 'my-auto-update-tags-when-save)
