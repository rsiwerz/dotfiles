;;; rosi-packages.el --- Managing packages etc.      -*- lexical-binding: t; -*-

;; Copyright (C) 2021  

;; Author:  <Robert@DESKTOP-6KJ2L4B>
;; Keywords: lisp, extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; Packages etc. I really don't want packages but hey.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq rosi/packages '(magit projectile counsel counsel-projectile))

(defun rosi/install-all-packages (packages)
  (unless package-archive-contents
    (package-refresh-contents))
  (mapcar (lambda (package)
	    (unless (package-installed-p package)
	      (package-install package)))
	  packages))

(rosi/install-all-packages rosi/packages)


(provide 'rosi-packages)
;;; rosi-packages.el ends here
