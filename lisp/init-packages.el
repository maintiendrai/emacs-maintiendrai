(require 'cl)

(when (>= emacs-major-version 24)
    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )

  ;;add whatever packages you want here
  (defvar zilongshanren/packages '(
				   company
				   monokai-theme
				   hungry-delete
				   swiper
				   counsel
				   smartparens
				   js2-mode
				   nodejs-repl
				   exec-path-from-shell
				   popwin
				   reveal-in-osx-finder
				   web-mode
				   js2-refactor

                )  "Default packages")

(setq package-selected-packages zilongshanren/packages)


  (defun zilongshanren/packages-installed-p ()
    (loop for pkg in zilongshanren/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

  (unless (zilongshanren/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg zilongshanren/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))


;; let emacs could find the excutble 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)



;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-company-mode t)


;; config for web mode
 (defun my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
    (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
    )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

 (defun my-toggle-web-indent ()
    (interactive)
    ;; web development
    (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
        (progn
          (setq js-indent-level (if (= js-indent-level 2) 4 2))
          (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

    (if (eq major-mode 'web-mode)
        (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
               (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
               (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
    (if (eq major-mode 'css-mode)
        (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

    (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(load-theme 'monokai t) 

(require 'popwin)
   ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

(provide 'init-packages)
