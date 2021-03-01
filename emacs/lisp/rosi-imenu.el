;;; Author: Robert Siwerz
;;; File: rosi-imenu.el
;;; Description: Contains custom code for the imenu package.

(defun rosi/imenu-goto-definition-at-point ()
  (interactive)
  (imenu (word-at-point)))


(defun rosi/imenu-find-definition-multiple-buffers ()
  "Searches for definition at point in current directory. 

TODO(robert): Only valid for h/cpp files atm"
  (interactive)
  (ring-insert xref--marker-ring (point-marker))
  (add-to-list 'load-path default-directory)
  (let ((files (directory-files default-directory nil ".*\\.\\(cpp\\|h\\)" nil))
	(current-file (buffer-name))
	(definition-to-find (current-word)))
    (dolist (file files)
      (with-current-buffer (find-file-noselect file)
	(let ((index-list (imenu--make-index-alist t)))
	  (dolist (list-item index-list)
	    (when (string-equal (car list-item) definition-to-find)
	      (progn
		(find-file file)
		(goto-char (marker-position (cdr list-item)))))))))))


(global-set-key (kbd "M-i") 'rosi/imenu-find-definition-multiple-buffers)

(provide 'rosi-imenu)
