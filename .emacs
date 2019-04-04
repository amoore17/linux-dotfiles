;; REQUIRED PACKAGES
;; irony
;; company (also install clang)
;; engine-mode
;; use-package
;; rust-mode
;; toml
;; flycheck
;; company-irony-c-headers
;; flycheck-rust
;; markdown-mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita)))
 '(delete-selection-mode nil)
 '(global-hl-line-mode t)
 '(package-selected-packages
   (quote
    (markdown-mode flycheck-rust flycheck toml-mode rust-mode engine-mode company-irony-c-headers company-irony use-package company))))

;; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Line Numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; Indentation Style
;;(setq-default indent-tabs-mode nil)
;;(setq c-default-style "bsd"
;;      c-basic-offset 4
;;      tab-width 4)
(setq-default tab-width 8)
(setq c-default-style "linux"
      c-basic-offset 8)

;; Highlight Current Line
(global-hl-line-mode 1)
(set-face-background 'highlight "color-252")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)

;; Column
(setq column-number-mode t)

;; Company C/C++ Auto Completion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(require 'company-irony-c-headers)
   ;; Load with `irony-mode` as a grouped backend
   (eval-after-load 'company
     '(add-to-list
       'company-backends '(company-irony-c-headers company-irony)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") 0)
  (define-key company-active-map (kbd "M-p") 0)
  (define-key company-active-map (kbd "<down>") #'company-select-next)
  (define-key company-active-map (kbd "<up>") #'company-select-previous))

(use-package company-irony
  :ensure t
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony))

(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++17")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'c-mode-common-hook 'irony-mode)))

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

;; Engine Mode
;; Engine Mode binding is "C-x / g" for Google
(require 'engine-mode)
(engine-mode t)
(setq engine/browser-function 'browse-url-firefox)

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

;; Org Mode Babel
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (C . t)
       (java . t)
       (emacs-lisp . t)
       (python . t)
       ))

;; Rust
(add-to-list 'load-path "/path/to/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
