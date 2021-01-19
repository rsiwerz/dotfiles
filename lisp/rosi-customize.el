;;; rosi-customize.el --- Themes, colors etc.        -*- lexical-binding: t; -*-

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

; NOTE(robert); Is this my theme now??
(set-frame-font "Hack 12" nil t)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#303030")

(set-foreground-color "#F5E2C3")
(set-background-color "#202020")
(set-cursor-color "#aaaaaa")

(set-face-attribute 'font-lock-builtin-face nil :foreground "#F5E2C3")
(set-face-attribute 'font-lock-constant-face nil :foreground "#EC6F6C")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#EC6F6C" :weight 'bold)
(set-face-attribute 'font-lock-comment-face nil :foreground "#aaaaaa")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#89B0BE")
(set-face-attribute 'font-lock-string-face nil :foreground "#B7D2B1")
(set-face-attribute 'font-lock-type-face nil :foreground "#F5C264")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#F5E2C3")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#F5C264")
(set-face-attribute 'minibuffer-prompt nil :foreground "#F5C264")
(set-face-attribute 'link nil :foreground "#F5C264")
(set-face-attribute 'next-error nil :background "#303030" :foreground "#F5E2C3")
(set-face-attribute 'mouse-drag-and-drop-region nil :background "#303030" :foreground "#F5E2C3")
(set-face-attribute 'highlight nil :background "#303030" :foreground nil)
(set-face-attribute 'region nil :background "#303030" :foreground "#F5E2C3")
(set-face-attribute 'mode-line nil :background "#303030" :foreground "#F5E2C3")
(set-face-attribute 'which-func nil :foreground "#EC6F6C")
(set-face-attribute 'vertical-border nil :background "#F5C264")
(set-face-attribute 'internal-border nil :background "#F5C264")
(set-face-attribute 'fringe nil :foreground "#F5C264")
(set-fringe-style 1)
(set-frame-parameter (selected-frame) 'internal-border-width 2)

(set-face-background 'fringe "#F5C264")
(setq header-line-format nil)


(provide 'rosi-customize)
;;; rosi-customize.el ends here
