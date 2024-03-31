;; Default init.el entry from base distribution

(setq require-final-newline t)  ; always end a file with a newline
(setq next-line-add-newlines nil)  ; don't let `next-line' add new lines in buffer
;;(setq text-mode-hook  '(lambda () (auto-fill-mode 1))) ; turn on auto-fill in Text mode
;;(setq text-mode-hook  '(lambda () (auto-fill-mode 0))) ; turn off auto-fill in Text mode
(setq line-number-mode t) ; turn on line number display in mode line
(setq column-number-mode t) ; turn on column number display in mode line

;; enable wheelmouse support by default
(when window-system
  (mwheel-install))

;; RJP Changes
;; (setq load-path (append (list (concat (getenv "HOME") "/.xemacs")) 
;;      load-path))
;;(setq ispell-program-name "/sw/bin/aspell")  ; OSX path
;;(setq ispell-program-name "/usr/bin/aspell")  ; cygwin path
(setq-default major-mode 'text-mode)   ; default to text mode
;;(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode -1)
;; Aquamacs *refuses* to disable auto-fill, so here's a hack
(setq-default fill-column 99999) 
(setq fill-column 99999)
(setq word-wrap t)                     ; turn on soft word wrap
(setq zmacs-regions -1)      ; turn off highlighting when mark is set

; associate the files with the .tex extension with the LaTeX mode
(setq auto-mode-alist (append '(("\\.tex$"  . LaTeX-mode)) auto-mode-alist))
(require 'tex-site)           ; load AUCTeX
(add-hook 'LaTeX-mode-hook
  '(lambda()
     (load-file "~/.xemacs/rjp-latex.el")  ; load my LaTeX prefs
     ))

(setq-default abbrev-mode t)  ; enable abbreviations
(setq save-abbrevs t)         ; save abbreviations upon exiting xemacs
(setq abbrev-file-name "~/.xemacs/rjp-abbrevs.el") ; the file storing the abbreviations
(if (file-readable-p abbrev-file-name)            ; read the abbreviations every
  (read-abbrev-file abbrev-file-name)             ; time xemacs is started
   )

;; save frequently used files in registers
(set-register ?a '(file . "~/.xemacs/rjp-abbrevs.el"))
(set-register ?b '(file . "~/Library/Preferences/Aquamacs Emacs/customizations.el"))
(set-register ?e '(file . "~/.xemacs/rjp-emacs-favs"))
(set-register ?i '(file . "~/.xemacs/init.el"))
(set-register ?r '(file . "~/Dropbox/research/2010/refs"))


(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)   ; enables math minor mode for latex
(add-hook 'emacs-list-mode-hook' 'turn-on-font-lock);  syntax highlighting
(add-hook 'dired-mode-hook' 'turn-on-font-lock);  syntax highlighting
;; (global-font-lock-mode t)  ;  turn on syntax highlighting for all modes

;; enter C++ mode when editing .h files
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist)) 
(setq auto-save-interval 300)           ; auto-save after n chars typed
(setq auto-save-visited-file-name nil)  ; auto-save in same file
(setq delete-auto-save-files t)         ; delete auto-save file when real save
(setq auto-save-default nil)           ; don't auto-save new files
(setq make-backup-files nil)           ; don't make backup files
(setq default-major-mode 'text-mode)   ; default mode
;;(setq auto-fill-mode nil)              ; don't use hard word wrap
(setq word-wrap t)                     ; turn on soft word wrap
;;  (setq-default fill-column 79)          ; 79 chars for auto fil
(delete-selection-mode 1)              ; inserting deletes selcted text

(require 'man)    ; man page setup
(setq Manual-directory-list '("/usr/local/man" "/sw/share/man" "/usr/share/man"
"/usr/man" "/usr/X11R6/man"))
;; (setq Manual-match-topic-exactly t)
(setq Manual-query-multiple-pages t)
(setq Manual-use-full-section-ids nil)
 
;; OSX Key Mappings
;(setq mac-command-key-is-meta nil)
;(define-key global-map '(meta insert) 'x-insert-selection)
;(define-key map [(alt c)] 'kill-ring-save)
;(define-key map [(alt v)] 'yank)
;(define-key map [(alt x)] 'kill-region
;(define-key map [(alt a)] 'mark-whole-buffer)
;(define-key map [(alt z)] 'undo)
;(define-key map [(alt meta z)] 'redo) ; requires redo
;(define-key map [(alt f)] 'isearch-forward)
;(define-key map [(alt meta f)] 'occur)
;(define-key map [(alt g)] 'isearch-repeat-forward)
;(define-key map [(alt o)] 'mac-key-open-file)
;(define-key map [(alt s)] 'save-buffer)
;(define-key map [(alt w)] 'kill-this-buffer)
;(define-key map [(alt m)] 'iconify-frame)
;(define-key map [(alt q)] 'save-buffers-kill-emacs)
;(define-key map [(alt \`)] 'other-frame)
;(define-key map [(alt p)] 'ps-print-buffer-with-faces)
;(define-key map [(alt i)] 'mac-key-show-in-finder)
;(define-key map [(alt t)] 'mac-key-open-terminal)
;(define-key map [(alt .)] 'keyboard-quit)
;(define-key map [(alt up)] 'beginning-of-buffer)
;(define-key map [(alt down)] 'end-of-buffer)
;(define-key map [(alt left)] 'beginning-of-line)
;(define-key map [(alt right)] 'end-of-line)
;(define-key map [A-mouse-1] 'browse-url-at-mouse) ; command + click
