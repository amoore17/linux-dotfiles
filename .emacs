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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(package-selected-packages (quote (smartparens lsp-java org-superstar))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Set cursor color to white
(set-cursor-color "#ffffff")

;; Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Column mode
(setq column-number-mode t)

;; Org mode
;;(require 'org)
;;(setq org-src-fontify-natively t)

;; Org mode (Java code blocks)
;;(require 'ob-java)
(org-babel-do-load-languages
 'org-babel-load-languages
             '((java . t)
               (C . t)))

;; Org mode native tabs
(setq org-src-tab-acts-natively t)

;; Org mode template
(add-to-list 'org-structure-template-alist
             '("s" "#+NAME: ?\n#+BEGIN_SRC \n\n#+END_SRC"))

;; Spaces > tabs
(setq-default indent-tabs-mode nil)

;; C/C++ Indentation Style
(setq-default indent-tabs-mode nil)
(setq c-default-style "k&r"
      c-basic-offset 4
      tab-width 4)

;; LSP Java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
