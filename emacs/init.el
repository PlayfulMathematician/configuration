;;;* straight-el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;;;* package installation
(use-package catppuccin-theme :ensure t :demand t  :straight t)
(use-package elcord :ensure t :demand t :straight t)
;; (use-package evil
;;  :ensure t
;;  :init
;;  (setq evil-want-integration t)
;;  (setq evil-want-keybinding nil)
;;  (setq evil-undo-system 'undo-redo)
;;  :config
;;   (evil-mode 1)  :straight t)
(use-package org-bullets :straight t)
;;;* require
(with-eval-after-load 'org
  (require 'org-agenda))
(require 'org-crypt)
(require 'ox-md)
(require 'elcord)

;;;* elcord
(elcord-mode)

;;;* custom functions
(defun my/open-index-org ()
  (interactive)
  (find-file (expand-file-name "~/stuff_bin/documents/org/index.org")))
(defun my/open-init-el ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))
(defun my/init-el-p ()
  (and buffer-file-name
       (string-equal (file-truename buffer-file-name)
                     (file-truename (expand-file-name "init.el" user-emacs-directory)))))
(defun my/org-hook ()
  (org-indent-mode)
  (org-overview)
  (org-bullets-mode 1)
 )
;;;* catppuccin theme
(load-theme 'catppuccin :no-confirm)

;;;* keybinds 
(global-set-key (kbd "C-c j") #'my/open-index-org)
(global-set-key (kbd "C-c g") #'my/open-init-el)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;;* ui stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;* line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(setq display-line-numbers-type 'relative)

;;;* word wrap and fonts
(setq word-wrap t)
(setq-default truncate-lines nil)
(set-face-attribute 'default nil :height 240)

;;;* org hooks
(add-hook 'org-mode-hook #'my/org-hook)

;;;* hooks to hide elpaca (i hate elpaca)  
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (when (my/init-el-p)
              (setq-local outline-regexp ";;;\\*+ ")
              (outline-minor-mode 1))))

(add-hook 'outline-minor-mode-hook
          (lambda ()
            (when (my/init-el-p)
              (save-excursion
                (goto-char (point-min))
                (when (re-search-forward "^;;;\\*+ straight-el" nil t)
                  (outline-hide-subtree))))))

;;;* mode line
(setq mode-line-position
      '((line-number-mode ("%l" (column-number-mode ":%c")))
        (:eval (format " W:%d"
                       (count-words (point-min) (point-max))))))

;;;* backup/autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;;;* initial buffer
(setq initial-buffer-choice
      (expand-file-name "~/stuff_bin/documents/org/index.org"))

;;;* org file
(setq org-agenda-files
      '("~/stuff_bin/documents/org/index.org"))
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))
(org-crypt-use-before-save-magic)
(setq org-crypt-key nil)
(setq org-tags-exclude-from-inheritance '("crypt"))
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
(setq org-startup-with-inline-images t) 
;;;* misc
(setq-default cursor-type 'bar)
