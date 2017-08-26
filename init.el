;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add more personal func
;; new init-func.el
;;(require 'init-func.el)

;;(require 'init-packages)
;;(require 'init-ui)
;;(require 'init-better-defaults)
;;(require 'init-keybindings)
;;(require 'init-org)


;;(load "init-packages")
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")



(load-file "~/.emacs.d/lisp/init-packages.el")
(load-file "~/.emacs.d/lisp/init-ui.el")
(load-file "~/.emacs.d/lisp/init-better-defaults.el")
;;(load-file "~/.emacs.d/lisp/init-keybindings.elc")
(load-file "~/.emacs.d/lisp/init-keybindings.el")
(load-file "~/.emacs.d/lisp/init-org.el")
(autoload 'tqqest-autoload "init-better-defaults")
(test-autoload)

(update-file-autoloads "~/.emacs.d/lisp/init-better-defaults.el" t "~/.emacs.d/lisp/init-better-defaults-autoload.el")
(load "init-better-defaults-autoload")

;; load-file and load

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

