(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(adwaita))
 '(package-selected-packages '(fill-column-indicator auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Column mode
(setq column-number-mode t)

;; Spaces > tabs
(setq-default indent-tabs-mode nil)

;; Indentation Style
(setq c-default-style "bsd"
      c-basic-offset 4
      tab-width 4
      indent-tabs-mode nil)

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable bell
(setq ring-bell-function 'ignore)

;; auto-fill-mode Break when line becomes too wide
(setq-default fill-column 120)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Fill Column Indicator (fill-column-indicator from MELPA)
(require 'fill-column-indicator)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-width 1)
(setq fci-rule-color "red")
