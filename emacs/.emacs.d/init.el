(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t))
;; Higher values are searched first.
(setq package-archive-priorities
      '(("org"          . 200)
        ("melpa-stable" . 150)
        ("melpa"        . 100)
        ("marmalade" . 75)))
(package-initialize)

(defvar my-packages
  '(auto-complete deft dracula-theme evil ido ivy org-trello smex undo-tree)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'org-modules 'org-habit)

(ido-mode 1)
(evil-mode 1)
(ivy-mode 1)

(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(load-theme 'dracula t t)
(enable-theme 'dracula)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(setq org-startup-truncated 'nil)
