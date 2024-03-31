;;-*-coding: emacs-mule;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'Custom-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'c++-mode-abbrev-table
  '(
    ("catch" "catch" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'calendar-mode-abbrev-table '())

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'doctex-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    ("apt" "apartment" nil 13)
    ("bball" "basketball" nil 2)
    ("bldg" "building" nil 1)
    ("calc" "calculating" nil 1)
    ("chp" "Christopher" nil 1)
    ("chr" "Christianity" nil 5)
    ("cht" "Christian" nil 1)
    ("convo" "conversation" nil 16)
    ("dbl" "double" nil 1)
;;    ("def" "definition" nil 1)
    ("dept" "department" nil 1)
    ("fav" "favorite" nil 1)
;;    ("med" "meditate" nil 0)
    ("mgr" "manager" nil 3)
;;    ("mt" "mindfulness training" nil 6)
    ("mtgs" "meetings" nil 1)
    ("pref" "preference" nil 1)
    ("reqt" "requirement " nil 1)
    ("rtn" "return" nil 1)
   ))

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'inferior-python-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table
  '(
    ("catch" "catch" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("finally" "finally" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'jython-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'm4-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'outline-mode-abbrev-table '())

(define-abbrev-table 'pike-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'py-mode-abbrev-table '())

(define-abbrev-table 'python-mode-abbrev-table '())

(define-abbrev-table 'python2-mode-abbrev-table '())

(define-abbrev-table 'python3-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table
  '(
    ("len" "" rjp-latex-enumerate 1)
    ("lfg" "" rjp-latex-figure 0)
    ("lfr" "" rjp-latex-frac 0)
    ("lga" "" rjp-latex-gather 0)
    ("lbf" "\\textbf{}" backward-char 9)
    ("lbe" "\\textbf{\\emph{}}" move-back-two-chars 0)
    ("lbib" "\\bibitem{}" backward-char 0)
    ("lbinom" "" rjp-latex-binomial 0)
    ("lbo" "\\boxed{}" backward-char 0)
    ("lce" "" rjp-latex-center 0)
    ("lci" "\\cite{}" backward-char 0)
    ("lco" "" rjp-latex-comment 0)
    ("lee" "\\emph{}" backward-char 13)
    ("lhr" "\\href{}{}" move-back-three-chars 0)
    ("lit" "" rjp-latex-itemize 1)
    ("lla" "\\label{}" backward-char 0)
    ("llra" "\\leftrightarrow" nil 0)
    ("lal" "" rjp-latex-align 0)
    ("lls" "" rjp-latex-list 0)
    ("lni" "\\noindent" nil 0)
    ("lre" "" rjp-latex-ref 0)
    ("lsb" "\\subsection{}" backward-char 8)
    ("lss" "\\section{}" backward-char 1)
    ("lssb" "\\subsubsection{}" backward-char 29)
    ("lsu" "" rjp-latex-sum 0)
    ("lte" "\\text{}" backward-char 0)
    ("olmode" ";; -*- mode: outline; -*-" nil 3)
    ("abb" "abbreviation" nil 0)
    ("abouut" "about" nil 0)
    ("aft" "afternoon" nil 11)
    ("appt" "appointment" nil 4)
    ("apr" "April" nil 8)
    ("aprt" "appartment" nil 0)
    ("aug" "August" nil 8)
;;    ("b4" "before" nil 45)
    ("bc" "because" nil 261)
    ("bday" "birthday" nil 7)
    ("beau" "beautiful" nil 1)
    ("bf" "boyfriend" nil 7)
    ("bfast" "breakfast" nil 4)
    ("buut" "but" nil 1)
    ("cl" "Claudine" nil 609)
    ("cmb" "Cambridge" nil 0)
    ("comms" "communications" nil 54)
    ("cont" "continuously" nil 0)
    ("contr" "contradiction" nil 0)
    ("coop" "cooperate" nil 0)
    ("bc" "because" nil 1)
    ("dec" "December" nil 3)
    ("def" "definitely" nil 25)
    ("diff" "different" nil 9)
    ("disc" "discovered" nil 0)
;;    ("dl" "Delia" nil 272)
    ("ele" "electronic" nil 0)
    ("em" "email" nil 0)
    ("esp" "especially" nil 0)
    ("eve" "evening" nil 7)
    ("exp" "experiencing" nil 0)
    ("ext" "extension" nil 0)
    ("fant" "fantastic" nil 0)
    ("feb" "February" nil 12)
    ("fri" "Friday" nil 37)
    ("frust" "frustration" nil 0)
    ("fwd" "forward" nil 5)
    ("gf" "girlfriend" nil 3)
    ("goiing" "going" nil 1)
    ("hhe" "he" nil 0)
    ("hopk" "Hopkinton" nil 0)
    ("htat" "that" nil 2)
    ("hte" "the" nil 4)
    ("imp" "important" nil 0)
    ("inap" "inappropriate" nil 0)
    ("intr" "interested" nil 0)
    ("jan" "January" nil 13)
    ("lt" "left" nil 0)
    ("mar" "March" nil 4)
    ("min" "minimum" nil 1)
    ("mond" "Monday" nil 35)
    ("morn" "morning" nil 3)
    ("mtg" "meeting" nil 13)
    ("neib" "neighborhood" nil 0)
    ("nite" "night" nil 2)
    ("nov" "November" nil 2)
    ("oct" "October" nil 1)
    ("opp" "opporunity" nil 11)
    ("ppl" "people" nil 34)
    ("predj" "prejudiced" nil 0)
    ("rt" "right" nil 0)
    ("satu" "Saturday" nil 63)
    ("sep" "September" nil 1)
    ("sobo" "Southoro" nil 0)
    ("sud" "suddenly" nil 0)
    ("sund" "Sunday" nil 52)
    ("surp" "surprisingly" nil 0)
    ("teh" "the" nil 6)
    ("thhat" "that" nil 1)
    ("tho" "though" nil 0)
    ("thot" "thought" nil 0)
    ("thru" "through" nil 0)
    ("thu" "Thursday" nil 26)
    ("tn" "tennis" nil 0)
    ("tomm" "tomorrow" nil 14)
    ("tryying" "trying" nil 0)
    ("tthat" "that" nil 0)
    ("tthis" "this" nil 0)
    ("tue" "Tuesday" nil 41)
    ("unfo" "unfortunately" nil 0)
    ("vaca" "vacation" nil 0)
    ("w/e" "weekend" nil 18)
    ("w/o" "without" nil 29)
    ("webo" "Westboro" nil 10)
    ("wed" "Wednesday" nil 31)
    ("wk" "week" nil 0)
    ("wp" "whitepaper" nil 0)
    ("wrt" "with respect to" nil 5)
    ("wt" "wanted" nil 0)
    ("yest" "yesterday" nil 17)
   ))

(define-abbrev-table 'vc-hg-log-view-mode-abbrev-table '())

