;; REQUIRED PACKAGES
;; irony
;; company (also install clang and libclang-dev)
;; use-package
;; rust-mode
;; flycheck
;; company-irony-c-headers
;; flycheck-rust

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita)))
 '(irony-additional-clang-options (quote ("-std=c++17")))
 '(package-selected-packages
   (quote
    (company-irony flycheck-rust company-irony-c-headers flycheck rust-mode use-package company irony))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Column
(setq column-number-mode t)

;; Highlight Current Line
(global-hl-line-mode 1)
(set-face-background 'highlight "color-252")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)

;; C/C++ Indentation Style
(setq-default indent-tabs-mode nil)
(setq c-default-style "bsd"
      c-basic-offset 4
      tab-width 4)

;; JavaScript Indentation Style
(setq js-indent-level 2)

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
