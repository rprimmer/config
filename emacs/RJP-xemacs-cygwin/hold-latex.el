;; rjp-latex.el: Custom settings and lisp functions for Latex mode

; these slow down load of latex, but are worth it
(setq TeX-auto-save t) 
(setq TeX-parse-self t)
(setq TeX-auto-untabify t)    ; convert tabs to spaces on save
; make AUCTeX aware of multi-file doc structure "\include"
(setq-default TeX-master nil)

;; key bindings
; bind the 'smart-space' function to 'space' key
(local-set-key [(space)] 'smart-space)
; define abbrevs on the fly with Alt-a
(local-set-key [(meta a)] 'define-mode-abbrev) 
 ; expand dynamic abbreviations with Alt-space
(local-set-key [(meta space)] 'dabbrev-expand)

; custum functions

(defun smart-space () ; make the space key behave in a smarter way
  (interactive)             ; all emacs lisp functions must have this line
  (if (not (expand-abbrev)) ; test if the current word is an abbrev. If yes, expand it.
      (insert " ")          ; If not, insert a plain space
    )                       
  )

(defun move-back-two-chars ()  
  (interactive)
  (backward-char 2)            
  )

(defun move-back-three-chars ()
  (interactive)
  (backward-char 3)
  )

; for each of them there is a corresponding line in ~/.xemacs/rjp-abbreviations.el  
; calling that function

(defun rjp-latex-frac ()  ; insert \frac{}{} and move the cursor back 3 chars
  (interactive)         
  (insert "\\frac{}{}")  
  (backward-char 3)      ; move back 3 chars, that is, inside the first pair of braces
  )

(defun rjp-latex-logfrac ()  ; log fractions
  (interactive)         
  (insert "\\log \\left( \\frac{}{} \\right)")
  (backward-char 11)   
  )

(defun rjp-latex-logbaset ()  ; log(b^t)
  (interactive)         
  (insert "\\log \\left( b^t \\right)")
  (backward-char 11)   
  )

(defun rjp-latex-equation ()      ; a function to insert the equation environment
  (interactive)                 
  (insert "\\begin{equation*}\\label{}\n") ; \n is the newline character
  (insert "  \n")                         ; an empty line (with two spaces on it)
  (insert "\\end{equation*}")
  (previous-line 3)                       ; move back to the line containing \begin...
  (forward-char 25)                       ; move inside the curly brackets
  )

(defun rjp-latex-gather ()      ; a function to insert the gather environment
  (interactive)                 
  (insert "\\begin{gather*}\\label{}\n")   ; \n is the newline character
  (insert "  \n")                         ; an empty line (with two spaces on it)
  (insert "\\end{gather*}")
  (previous-line 3)   
  (forward-char 25)   
  )

(defun rjp-latex-align ()      ; a function to insert the align environment
  (interactive)                 
  (insert "\\begin{align*}\\label{}\n")   ; \n is the newline character
  (insert "  \n")                         ; an empty line (with two spaces on it)
  (insert "\\end{align*}")
  (previous-line 3)   
  (forward-char 23)   
  )

(defun rjp-latex-list ()
  (interactive)
  (insert "\\begin{list}{}\n")
  (insert "\\item \n")
  (insert "\\end{list}\n")
  (previous-line 2)
  (forward-char 6)
  )

(defun rjp-latex-comment ()
  (interactive)
  (insert "\\begin{comment}\n")
  (insert "  \n")
  (insert "\\end{comment}\n")
  (previous-line 2)
  (forward-char 2)
  )

(defun rjp-latex-enumerate ()
  (interactive)
  (insert "\\begin{enumerate}\n")
  (insert "\\item \n")
  (insert "\\end{enumerate}\n")
  (previous-line 2)
  (forward-char 6)
  )

(defun rjp-latex-itemize ()
  (interactive)
  (insert "\\begin{itemize}\n")
  (insert "\\item \n")
  (insert "\\end{itemize}\n")
  (previous-line 2)
  (forward-char 6)
  )

(defun rjp-latex-center ()
  (interactive)
  (insert "\\begin{center}\n")
  (insert "  \n")
  (insert "\\end{center}")
  (previous-line 1)
  )

(defun rjp-latex-figure ()
  (interactive)
  (insert "\\begin{figure}[htbp]\n")
  (insert "  \\centering\n")
  (insert "  \\includegraphics[width=3in]{.eps}\n")
  (insert "  \\caption{}\n")
  (insert "  \\label{fig:}\n")
  (insert "\\end{figure}")
  (previous-line 4)
  (forward-char 31)
  )

(defun rjp-latex-ref ()
  (interactive)
  (insert "(\\ref{})")
  (backward-char 2)
  )

(defun rjp-latex-int-lim ()
  (interactive)
  (insert "\\int\\limits_{}^{}\\!\\,d")
  (backward-char 9)  
  )

(defun rjp-latex-int ()
  (interactive)
  (insert "\\int_{}^{}\\!\\,d")
  (backward-char 10)
  )

(defun rjp-latex-sum-lim ()
  (interactive )
  (insert "\\sum\\limits_{}^{}")
  (backward-char 4)
  )

(defun rjp-latex-sum ()
  (interactive )
  (insert "\\sum_{}^{}")
  (backward-char 4)
  )

(defun rjp-latex-theorem ()
  (interactive)
  (insert "\\begin{theorem}\\label{}\n\n\\end{theorem}")
  (previous-line 2)
  (end-of-line)
  (backward-char 1)
  )


(defun rjp-latex-corollary ()
  (interactive)
  (insert "\\begin{corollary}\\label{}\n\n\\end{corollary}")
  (previous-line 2)
  (end-of-line)
  (backward-char 1)
  )

(defun rjp-latex-lemma ()
  (interactive)
  (insert "\\begin{lemma}\\label{}\n\n\\end{lemma}")
  (previous-line 2)
  (end-of-line)
  (backward-char 1)
  )

(defun rjp-latex-proof ()
  (interactive)
  (insert "\\begin{proof}\n\n\\end{proof}")
  (previous-line 1)
  )

