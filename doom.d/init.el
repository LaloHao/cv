;;; init.el --- Doom init -*- lexical-binding: t; -*-
;;; Commentary:

;;;

(doom!
 :editor (evil +everywhere)
 :term eshell vterm
 :tools magit pdf direnv
 :lang emacs-lisp latex sh org
 :config default)
