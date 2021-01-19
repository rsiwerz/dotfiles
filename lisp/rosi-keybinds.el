;;; rosi-keybinds.el --- Keybindings etc.            -*- lexical-binding: t; -*-

;; Copyright (C) 2021  

;; Author:  <Robert@DESKTOP-6KJ2L4B>
;; Keywords: lisp

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

;;; Keybinds
(global-set-key [f1] 'grep-find)
(global-set-key [f2] 'rosi/load-all-src-files-in-directory)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'rosi/recompile)
(global-set-key (kbd "C-x h") 'rosi/swap-between-cpp-h)

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-j") 'join-line)

(global-set-key [f7] 'rosi/restore-buffer-layout-after-compile)

(global-set-key [tab] 'dabbrev-expand)
(global-set-key [C-tab] 'indent-for-tab-command)
(define-key minibuffer-local-map (kbd "<tab>") 'minibuffer-complete)

(provide 'rosi-keybinds)
;;; rosi-keybinds.el ends here
