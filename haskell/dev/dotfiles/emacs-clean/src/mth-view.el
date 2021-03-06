(setq inhibit-startup-message t)

(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

(setq diff-switches "-u")

;(setq require-final-newline 'query)

(setq line-number-mode t)
(setq column-number-mode t)

(setq-default indent-tabs-mode nil)

(setq display-time-24hr-format t)
(display-time)

(fset 'yes-or-no-p 'y-or-n-p)

(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

(setq-default ispell-program-name "aspell")

;;(set-default-font "DejaVu Sans Mono-13")
;;(set-default-font "DejaVu Sans Mono-12")
(set-default-font "DejaVu Sans Mono-14")
;;(set-default-font "DejaVu Sans Mono-16")
;;(set-default-font "DejaVu Sans Mono-20")
;;(set-default-font "DejaVu Sans Mono-24")
;;(set-default-font "DejaVu Sans Mono-20")

;;(set-face-attribute 'default nil :height 115)

;; gui cruft

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;; if not running with -nw
(when window-system
 (set-background-color "#121212")
 (set-face-background 'default "#121212")
 (set-face-background 'region "#16CC55")
; (set-face-foreground 'default "#34E249") was:
 (set-face-foreground 'default "#16CC55")
 (set-face-foreground 'region "#121212")
 (set-foreground-color "#16CC55")
 (set-cursor-color "#16CC55")
 (set-face-foreground 'vertical-border "grey30")
 )


;; use M-x list-faces-display. to see what can be set

(set-face-foreground 'font-lock-comment-face "grey60")
(set-face-foreground 'font-lock-comment-delimiter-face "grey60")

(set-face-foreground 'font-lock-doc-face "grey52")
(set-face-foreground 'font-lock-keyword-face "#86ABD9")
;;(set-face-foreground 'font-lock-keyword-face "#16CC55")
(set-face-foreground 'font-lock-string-face "#F5F5F5")
(set-face-foreground 'font-lock-constant-face  "#16CC55")
(set-face-foreground 'font-lock-type-face "#16CC55")
(set-face-foreground 'minibuffer-prompt "#F5F5F5") ;;"#86ABD9")
(set-face-foreground 'ido-subdir "#16CC55")
(set-face-foreground 'ido-only-match "#16CC55")

(set-face-foreground 'font-lock-function-name-face "#16CC55")
(set-face-foreground 'font-lock-variable-name-face "#16CC55")
(set-face-foreground 'font-lock-builtin-face "#16CC55")
(set-face-foreground 'font-lock-preprocessor-face "#16CC55")
(set-face-foreground 'font-lock-negation-char-face "#16CC55")

(set-face-foreground 'font-lock-warning-face "#16CC55")
(set-face-background 'mode-line-inactive "#363636")
(set-face-foreground 'mode-line-inactive "grey75")
(set-face-background 'mode-line "grey30")
(set-face-foreground 'mode-line "grey80")




(set-face-bold-p 'minibuffer-prompt t)
(set-face-bold-p 'ido-subdir t)
(set-face-bold-p 'ido-first-match t)
(set-face-bold-p 'ido-only-match t)
(set-face-bold-p 'ido-indicator t)
(set-face-bold-p 'ido-incomplete-regexp t)
(set-face-bold-p 'font-lock-comment-face t)
(set-face-bold-p 'font-lock-comment-delimiter-face t)
(set-face-bold-p 'font-lock-keyword-face t)
(set-face-bold-p 'font-lock-string-face nil)
(set-face-bold-p 'font-lock-constant-face  nil)
(set-face-bold-p 'font-lock-type-face t)
(set-face-bold-p 'font-lock-function-name-face nil)
(set-face-bold-p 'font-lock-variable-name-face nil)
(set-face-bold-p 'font-lock-builtin-face nil)
(set-face-bold-p 'font-lock-preprocessor-face nil)
(set-face-bold-p 'font-lock-negation-char-face nil)
(set-face-bold-p 'font-lock-warning-face nil)



(set-face-italic-p 'font-lock-comment-face nil)
(set-face-italic-p 'font-lock-comment-delimiter-face nil)
(set-face-italic-p 'font-lock-keyword-face nil)
(set-face-italic-p 'font-lock-string-face nil)
(set-face-italic-p 'font-lock-constant-face  nil)
(set-face-italic-p 'font-lock-type-face nil)
(set-face-italic-p 'font-lock-function-name-face nil)
(set-face-italic-p 'font-lock-variable-name-face nil)
(set-face-italic-p 'font-lock-builtin-face nil)
(set-face-italic-p 'font-lock-preprocessor-face nil)
(set-face-italic-p 'font-lock-negation-char-face nil)
(set-face-italic-p 'font-lock-warning-face nil)

(windmove-default-keybindings)

(blink-cursor-mode 0) ;; no blink


;; column highlighter

;;(require 'column-marker) ;; to use: C-u 81 column-marker-1


(menu-bar-mode 0)


(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(setq require-final-newline t)                ; Always newline at end of file
(setq next-line-add-newlines nil)                ; Add newline when at buffer end
(add-hook 'before-save-hook 'delete-trailing-whitespace)




(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-frame (before other-frame-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-frame (before other-frame-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-do-window-select (before windmove-do-window-select activate)
  (when buffer-file-name (save-buffer)))

(ad-activate 'switch-to-buffer)
