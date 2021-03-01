;;; Author: Robert Siwerz
;;; File: init.el
;;; Description: Currently, this works as the bootstrap files including all the relevant
;;;              packages needed. However, I don't want any external dependencies and the goal
;;;              is to provide the proper functions by myself not including any 3rd party libraries.

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; Platform-specific before loading....
(if (eq system-type 'windows-nt)
    (add-to-list 'load-path "w:/projects/misc/lisp/")
  (add-to-list 'load-path "~/.config/dotfiles/emacs/lisp/"))

(require 'rosi-platform)
(require 'rosi-intrinsic)
(require 'rosi-packages)
(require 'rosi-customize)
(require 'rosi-cpp)
(require 'rosi-lisp)
;; (require 'rosi-projectile)
(require 'rosi-erlang)
(require 'rosi-elixir)
(require 'rosi-go)
;, (require 'rosi-flycheck)
(require 'rosi-imenu)
;; (require 'rosi-ivy)
(require 'rosi-keybinds)
(require 'rosi-project)


(setq initial-scratch-message (concat ";; Happy coding, " user-name "!\n"))

(message "Emacs loaded....")
;;; init.el ends here
