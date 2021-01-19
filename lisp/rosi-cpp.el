(defun rosi/swap-between-cpp-h ()
  (interactive)
  (let ((file-name (file-name-base (buffer-name)))
	(file-extension (file-name-extension (buffer-name))))
    (cond ((string-equal file-extension "h")
	   (find-file-other-window (concat file-name ".cpp")))
	  ((string-equal file-extension "cpp")
	   (find-file-other-window (concat file-name ".h"))))))

(defun rosi/recompile ()
  (interactive)
  (save-some-buffers t)
  (if (not (commandp 'recompile))
      (compile compile-command)
    (recompile)))

(defun rosi/restore-buffer-layout-after-compile ()
  (interactive)
  (other-window 1)
  (if (string-equal (buffer-name) "*compilation*")
      (quit-window)
    (other-window 1)))


(defun get-string-from-file (file-path)
  "Return file-path's file content."
  (with-temp-buffer
    (insert-file-contents file-path)
    (buffer-string)))

(defun rosi/start-or-run-remedy ()
  (interactive)
  (if (not (shell-command "tasklist /fi \"imagename eq remedybg.exe\""))
      (async-shell-command "start /B remedy start-debugging > NUL" nil nil)
    (shell-command "remedy start-debugging")))

(defvar rosi-c-style
  '((c-tab-always-indent . t)
    (c-hanging-colons-alist . ((inher-intro)
                               (case-label)
                               (label)
                               (access-label)
                               (access-key)
                               (member-init-intro)))
    (c-hanging-braces-alist . ((class-open)
                               (class-close)
                               (defun-open before after)
                               (defun-close)
                               (inline-open)
                               (inline-close)
                               (brace-list-open)
                               (brace-list-close)
                               (brace-list-intro)
                               (brace-list-entry)
                               (block-open)
                               (block-close)
                               (substatement-open)
                               (statement-case-open)
                               (class-open)))
    (c-offsets-alist . ((statement-case-intro . 4)
			(case-label . 4)
			(brace-list-intro . 4)
			(substatement-open . 0)))))

(c-add-style "PERSONAL" rosi-c-style)

;; (defun rsiwerz/imenu-multiple-buffers ()
;;   (interactive)
;;   (let ((identifier (thing-at-point 'word 'no-properties)))
;;     (dired-mark-files-regexp "[A-z0-9]+\\(.cpp\\|.h\\)")
;;     (dired-)))

(defun rosi/load-all-src-files-in-directory ()
  (interactive)
  (add-to-list 'load-path default-directory)
  (let ((files (directory-files default-directory nil ".*\\.\\(cpp\\|h\\)" nil))
	(current-file (buffer-name)))
    (dolist (file files)
      (find-file file))
    (find-file current-file)))

(defun rosi/build-command ()
  (set (make-local-variable 'compile-command)
       (if (eq system-type 'windows-nt)
	   "build"
	 "./build.sh")))

(defun rosi-c-mode-hook ()
  (add-to-list 'imenu-generic-expression
	       '(nil "^\\(template[ 	]*<[^>]+>[ 	]*\\)?\\(class\\|struct\\)[ 	]+\\([[:alnum:]_]+\\(<[^>]+>\\)?\\)\\([ 	
]\\|\\\\
\\)*[:{]"
		     3))
  (c-set-style "PERSONAL")
  (setq tab-width 4
	indent-tabs-mode nil)
  (electric-pair-mode +1)
  (c-toggle-auto-newline -1)
  (local-set-key [f8] '(lambda ()
			 (interactive)
			 (shell-command "remedy start-debugging")))
  (rosi/build-command))

(add-hook 'c-mode-common-hook 'rosi-c-mode-hook)

(make-face 'font-lock-note-face)
(make-face 'font-lock-todo-face)
(make-face 'font-lock-function-call-face)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-call-face t)
				      ("\\<\\(while\\|if\\|case\\|for\\|switch\\|\\|\\)\\>" 1 ' font-lock-keyword-face t)
				      ("\\<\\(TODO\\)" 1 'font-lock-todo-face t)
				      ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)))))
	    
(set-face-attribute 'font-lock-note-face nil :foreground "#20A39E" :weight 'normal)
(set-face-attribute 'font-lock-todo-face nil :foreground "#EF5B5B" :weight 'normal)
(set-face-attribute 'font-lock-function-call-face nil :foreground "#EC6F6C" :weight 'normal)

(add-hook 'c++-mode-common-hook 'rosi-c-mode-hook)
(add-hook 'bat-mode-hook '(lambda ()
			    (rosi/build-command)))



(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; (define-key c++-mode-map [f8] (shell-command "remedy start-debugging"))
(provide 'rosi-cpp)
