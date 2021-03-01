;;; rosi-platform.el --- Platform specific code      -*- lexical-binding: t; -*-

;; Copyright (C) 2021  

;; Author:  <Robert@DESKTOP-6KJ2L4B>
;; Keywords: 

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

(defvar user-name nil)
(if (eq system-type 'windows-nt)
    (progn
      (setq user-name (getenv "username"))
      (toggle-frame-fullscreen)
      (set-register ?e '(file . "w:/projects/misc/init.el"))
      (set-default 'grep-find-command '("findstr -i -s -n \"\"" . 19)))
  (progn
    (setq user-name (getenv "USER"))
    (set-register ?e '(file . "~/.config/dotfiles/emacs/init.el"))
    (set-default 'grep-find-command '("grep -i -s -n \"\"" . 16))))


(provide 'rosi-platform)
;;; rosi-platform.el ends here
