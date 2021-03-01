;; Author: Robert Siwerz
;; Description: Contains custom code for working with lisp files.

(add-to-list 'load-path "~/.config/dotfiles/emacs/lisp/sly")
(require 'sly-autoloads)
(setq inferior-lisp-program "/usr/bin/sbcl")


(provide 'rosi-lisp)
