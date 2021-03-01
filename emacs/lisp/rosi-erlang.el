(when (eq system-type 'windows-nt)
  (setq load-path (cons  "C:/Program Files/erl-23.2/lib/tools-3.4.2/emacs"
			 load-path))
  (setq erlang-root-dir "C:/Program Files/erl-23.2")
  (setq exec-path (cons "C:/Program Files/erl-23.2/bin" exec-path))
  (require 'erlang-start))

(when (eq system-type 'gnu/linux)
  (setq load-path (cons  "/usr/lib/erlang/lib/tools-3.4.3/emacs"
			 load-path))
  (setq erlang-root-dir "/usr/lib/erlang")
  (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
  (require 'erlang-start))


(defun rosi/get-erlang-module ()
  "Gets the module name of the current buffer."
  (file-name-sans-extension (file-name-nondirectory (buffer-file-name (current-buffer)))))

(defun rosi/rebar-ct-case ()
  "A function to use rebar3 ct --suite=<current_file> --case=TEST.
Takes in TEST."
  (interactive)
  (let ((default-directory (projectile-project-root))
        (test-at-point (thing-at-point 'symbol t))
        (erlang-module (rosi/get-erlang-module)))
    (beginning-of-defun)
    (compile (format "rebar3 ct --suite=%s --case=%s" (rosi/get-erlang-module) (thing-at-point 'symbol t)))))

(defun rosi/rebar-ct ()
  "Run the rebar3 suite test."
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (compile (format "rebar3 ct --suite=%s" (rosi/get-erlang-module)))))

(defun rosi/rebar-enuit ()
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (compile (format "rebar3 eunit"))))

(defconst rosi/compile-commands
  '(rosi/rebar-ct-case rosi/rebar-ct rosi/rebar-eunit))


(provide 'rosi-erlang)
;;; rosi-erlang.el ends here
;;
