(when (eq system-type 'windows-nt)
  (setq load-path (cons  "C:/Program Files/erl-23.2/lib/tools-3.4.2/emacs"
			 load-path))
  (setq erlang-root-dir "C:/Program Files/erl-23.2")
  (setq exec-path (cons "C:/Program Files/erl-23.2/bin" exec-path))
  (require 'erlang-start))

(when (eq system-type 'gnu/linux)
  (setq load-path (cons  "/usr/lib/erlang/lib/tools-3.4.2/emacs"
			 load-path))
  (setq erlang-root-dir "/usr/lib/erlang")
  (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
  (require 'erlang-start))

(provide 'rosi-erlang)
