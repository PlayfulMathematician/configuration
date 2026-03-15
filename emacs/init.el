;;;;* emacs/init.el
;;;* straight-el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
			 (or
			  (bound-and-true-p straight-base-dir)
			  user-emacs-directory)))
      (bootstrap-version 7))
     (unless (file-exists-p bootstrap-file)
       (with-current-buffer
	   (url-retrieve-synchronously
	     "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	     'silent
	     'inhibit-cookies)
           (goto-char (point-max))
           (eval-print-last-sexp)))
     (load bootstrap-file nil 'nomessage))

;;;* package installation

(use-package catppuccin-theme
             :ensure t
             :demand t
             :straight t)

(use-package org-bullets
             :straight t)

(use-package eglot
             :straight t
             :hook
	     ((c-ts-mode . eglot-ensure)
              (c++-ts-mode . eglot-ensure)
              (python-ts-mode . eglot-ensure)
              (rust-ts-mode . eglot-ensure)))


(use-package corfu
             :init
             (global-corfu-mode)
             :custom
             (corfu-auto t)             
             (corfu-auto-prefix 1)      
             (corfu-auto-delay 0.01)      
             (corfu-cycle t)
             (corfu-preselect 'prompt)
	     :straight t)

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  :straight t)
;;;* treesitter

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (python-mode . python-ts-mode)
        (rust-mode . rust-ts-mode)))

(setq treesit-language-source-alist
      '((c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        ))
(unless (file-exists-p (expand-file-name  "tree-sitter/libtree-sitter-c.so" user-emacs-directory) ) (treesit-install-language-grammar 'c)
	)
(unless (file-exists-p  (expand-file-name  "tree-sitter/libtree-sitter-cpp.so" user-emacs-directory)) (treesit-install-language-grammar 'cpp)
)
;;;* ido-mode
(ido-mode 1)
(ido-everywhere 1)
;;;* require
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t)
     (C . t)
)))

(require 'org-agenda)
(require 'ox-latex)
(require 'ox-beamer)
(require 'org-crypt)
(require 'ox-md)
(require 'ox-man)

;;;* custom functions

(defun my/open-index-org ()
(interactive)
(find-file (expand-file-name "~/stuff_bin/documents/org/index.org")))
(defun my/open-init-el ()
(interactive)
(find-file (expand-file-name "init.el" user-emacs-directory)))
(defun my/init-el-p ()
(and buffer-file-name (string-equal (file-truename buffer-file-name)
(file-truename (expand-file-name "init.el" user-emacs-directory)))))
(defun my/org-hook ()
(org-indent-mode)
(org-overview)
(org-bullets-mode 1))

(defun my/init-el-hook ()
  (setq-local outline-regexp ";;;\\*+ ")
  (outline-minor-mode 1)
  (save-excursion (goto-char (point-min))
  (when (re-search-forward "^;;;\\*+ straight-el" nil t)
(outline-hide-subtree))))
(defun my/elisp-hook ()
(when (my/init-el-p)
(my/init-el-hook)))

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
(setq-default display-line-numbers-width 4)
;;;* word wrap and fonts
(setq word-wrap t)
(setq-default truncate-lines nil)

(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 240)

(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font" :height 240)
;;;* org hooks
(add-hook 'org-mode-hook #'my/org-hook)

;;;* hooks to hide straight-el
(add-hook 'emacs-lisp-mode-hook #'my/elisp-hook)





;;;* mode line
(setq mode-line-position '((line-number-mode ("%l" (column-number-mode ":%c")))
(:eval (format " W:%d" (count-words (point-min)
(point-max))))))

;;;* backup/autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;;;* initial buffer
(setq initial-buffer-choice (expand-file-name "~/stuff_bin/documents/org/index.org"))

;;;* org file
(setq org-agenda-files '("~/stuff_bin/documents/org/index.org"))
(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))
(org-crypt-use-before-save-magic)
(setq org-crypt-key nil)
(setq org-tags-exclude-from-inheritance '("crypt"))
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
(setq org-startup-with-inline-images t)
;;;* misc
(setq-default cursor-type 'bar)
