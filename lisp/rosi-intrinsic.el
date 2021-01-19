;;; rosi-intrinsic.el --- Customizations about emacs intrinsics  -*- lexical-binding: t; -*-

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

(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message +1)
(blink-cursor-mode -1)

(setq truncate-lines t)



(split-window-horizontally)

(setq make-backup-files nil)


(require 'ido)
(ido-mode +1)

(set-face-attribute 'ido-only-match nil :foreground "#EC6F6C")
;; Turn off sound
(setq visible-bell 1)

(which-func-mode +1)

(setq auto-insert-query nil)
(add-hook 'find-file-hook 'auto-insert)




(provide 'rosi-intrinsic)
;;; rosi-intrinsic.el ends here
