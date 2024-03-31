(define-abbrev-table 'awk-mode-abbrev-table '(
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'pike-mode-abbrev-table '(
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'idl-mode-abbrev-table '(
    ))

(define-abbrev-table 'java-mode-abbrev-table '(
    ("finally" "finally" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("catch" "catch" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'objc-mode-abbrev-table '(
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'c++-mode-abbrev-table '(
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("catch" "catch" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'c-mode-abbrev-table '(
    ("while" "while" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ))

(define-abbrev-table 'text-mode-abbrev-table '(
  ; abbreviations to fix typos (i.e, to correct things like 'teh' into 'the')
    ("teh"  "the "  nil 0)
    ("hte"  "the "  nil 0)
    ("htat" "that " nil 0)

   ; abbreviations to long words
    ("abb"      "abbreviation "    nil 0)
    ("approx"   "approximation "   nil 0)
    ("contr"    "contradiction "   nil 0)
    ("cont"     "continuously "    nil 0)
    ("neib"     "neighborhood "    nil 0)
    ("\\ni"     "\\noindent "      nil 0)
    ("\\lra"    "\\leftrightarrow" nil 0)
;    ("yi"       "\$y\$-intercept " nil 0)
;    ("xi"       "\$x\$-intercept " nil 0)
;    ("xyi"      "\$x\$- and \$y\$-intercepts " nil 0)
;    ("xa"       "\$x\$-axis "      nil 0)
;    ("ya"       "\$y\$-axis "      nil 0)
;    ("vi"       "vertical-intercept " nil 0)
;    ("ex"       "exponential "     nil 0)
;    ("ef"       "exponential function" nil 0)
;    ("para"     "parabola"         nil 0)
;    ("hyp"      "hyperbola"        nil 0)
;    ("ell"      "ellipse"          nil 0)

  ; abbrevs common to current job
    ("cl" "CLARiiON" nil 0)
    ("cel" "Celerra" nil 0)
    ("ct" "Centera" nil 0)
    ("cst" "CentraStar" nil 0)
    ("RF" "Rainfinity" nil 0)

  ; abbreviations involving going back one character
    ("\\ss" "\\section{}" backward-char 0)
    ("\\sb" "\\subsection{}" backward-char 0)
    ("\\ssb" "\\subsubsection{}" backward-char 0)
    ("\\bf" "\\textbf{}" backward-char 0)
    ("\\ee" "\\emph{}" backward-char 0)
    ("\\bi" "\\textbf{\\emph{}}" move-back-two-chars 0)
    ("\\hr" "\\href{}{}" move-back-three-chars 0)
    ("\\sq" "\\sqrt{}" backward-char 0)
    ("\\sqn" "\\sqrt[]{}" move-back-three-chars 0)
    ("\\ll" "\\label{}" backward-char 0)
    ("\\mb" "\\mathbf{}" backward-char 0)
    ("\\mr" "\\mathrm{}" backward-char 0)
    ("\\te" "\\text{}" backward-char 0)
    ("\\bo" "\\boxed{}" backward-char 0)
    ("\\ci" "\\cite{}" backward-char 0)
    ("\\bib" "\\bibitem{}" backward-char 0)
;    ("\\lm" "\\lim\\limits_{}" backward-char 0)
;    ("\\lp" "\\left\( " backward char 0)
;    ("\\rp" "\\right) " backward char 0)

; not really abbreviations -- just stuff i can't remember
    ("\\rjpapprox" "\$\\sim\$" nil 0)

   ; abbreviations calling functions (which are defined in rjp-latex.el)
    ("\\eq" "" rjp-latex-equation 0)
    ("\\ga" "" rjp-latex-gather 0)
    ("\\al" "" rjp-latex-align 0)
    ("\\ce" "" rjp-latex-center 0)
    ("\\it" "" rjp-latex-itemize 0)
    ("\\en" "" rjp-latex-enumerate 0)
    ("\\ls" "" rjp-latex-list 0)
;    ("\\co" "" rjp-latex-comment 0)
    ("\\fr" "" rjp-latex-frac 0)
    ("\\re" "" rjp-latex-ref 0)
    ("\\su" "" rjp-latex-sum 0)
    ("\\fg" "" rjp-latex-figure 0)
    ("\\lf" "" rjp-latex-logfrac 0)
    ("\\lbt" "" rjp-latex-logbaset 0)

;    ("\\in"  "" rjp-latex-int 0)
;    ("\\il" "" rjp-latex-int-lim 0)
;    ("\\sl" "" rjp-latex-sum-lim 0)

;    ("\\cl" "" rjp-latex-corollary 0)
;    ("\\lm" "" rjp-latex-lemma 0)
;    ("\\pr" "" rjp-latex-proof 0)
;    ("\\th" "" rjp-latex-theorem 0)

   ; abbreviations to mathbb R, etc
;    ("\\c" "\\mathbb C" nil 0)
;    ("\\q" "\\mathbb Q" nil 0)
;    ("\\r" "\\mathbb R" nil 0)
;    ("\\z" "\\mathbb Z" nil 0)
    ))

(define-abbrev-table 'lisp-mode-abbrev-table '(
    ))

(define-abbrev-table 'help-mode-abbrev-table '(
    ))

(define-abbrev-table 'completion-list-mode-abbrev-table '(
    ))

(define-abbrev-table 'fundamental-mode-abbrev-table '(
    ))

(define-abbrev-table 'global-abbrev-table '(
    ))

