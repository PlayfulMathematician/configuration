;;;* elpaca 
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode))
;;;* package installation
(use-package catppuccin-theme :ensure t :demand t)
(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda))
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))
(elpaca-wait)

;;;* require
(with-eval-after-load 'org
  (require 'org-agenda))
(require 'org-crypt)
(require 'ox-md)

;;;* custom functions
(defun my/open-index-org ()
  (interactive)
  (find-file (expand-file-name "~/stuff_bin/documents/org/index.org")))
(defun my/open-init-el ()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))
(defun my/init-el-p ()
  (and buffer-file-name
       (string-equal (file-truename buffer-file-name)
                     (file-truename (expand-file-name "init.el" user-emacs-directory)))))

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
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq word-wrap t)
(setq-default truncate-lines nil)
(set-face-attribute 'default nil :height 240)

;;;* org hooks
(add-hook 'org-mode-hook #'org-indent-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (org-overview)
))

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
                (when (re-search-forward "^;;;\\*+ elpaca" nil t)
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
