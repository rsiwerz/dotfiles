;;; Author: Rober Siwerz
;;; File: rosi-project.el
;;; Description: Create projects in emacs and jump between them.


(defvar rosi/cpp-file-extensions '("h" "cpp" "hpp" "c"))

(defconst rosi/project-file "C:/Users/Robert/Code/projects/misc/lisp/projects/projects.proj")

(defun rosi/add-to-project-list (directory)
  "Adds the directory of the project to the list"
  (if (member ".proj" (directory-files directory))
      (let ((projects (split-string
		       (with-temp-buffer
			 (insert-file-contents rosi/project-file)
			 (buffer-string))
		       "\n")))
	(if (not (member directory projects))
	    (write-region (concat directory "\n") nil rosi/project-file 'append)
	  (error "Project already exists")))
    (error "Could not find the project file .proj")))

(defun rosi/create-project-in-current-directory ()
  "Creates a project in the current directory"
  (interactive)
  (let ((current-directory (directory-file-name default-directory)))
    (rosi/add-to-project-list current-directory)))

(provide 'rosi-project)
