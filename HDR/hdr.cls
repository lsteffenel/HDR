%%
%% Classe << HDR >> 
%%

\NeedsTeXFormat{LaTeX2e}[95/01/31]
\ProvidesClass{hdr}[1995/12/19 : HDR v1.0] 

\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@openright
\newif\if@openbib
\newif\if@bigbib
\newif\if@draft
\newif\if@draftindex
\newif\if@draftbib
\newif\if@nodate
\newif\if@frenchdp
\newif\if@frenchgu
\newif\if@preliminary
\@openbibfalse
\@bigbibfalse
\@draftfalse
\@preliminaryfalse
\@draftindexfalse
\@draftbibfalse
\@nodatefalse
\@frenchdptrue
\@frenchgutrue

%% Options pour la taille de base de la police
\DeclareOption{10pt}
	{\renewcommand{\@ptsize}{0}%
	 \setlength\headsep     {14pt}%
	 \setlength\headheight  {18pt}}
\DeclareOption{11pt}
	{\renewcommand{\@ptsize}{1}%
	 \setlength\headsep     {15pt}%
	 \setlength\headheight  {20pt}}
\DeclareOption{12pt}% option par defaut
	{\renewcommand{\@ptsize}{2}%
	 \setlength\headsep     {16pt}%
	 \setlength\headheight  {22pt}}

%% Options pour l'impression recto ou recto/verso
\DeclareOption{oneside}% option par defaut
	{\@twosidefalse%
	 \@mparswitchfalse}
\DeclareOption{twoside}
	{\@twosidetrue%
	 \@mparswitchtrue}
\DeclareOption{openright}% option par defaut
	{\@openrighttrue}
\DeclareOption{openany}
	{\@openrightfalse}

%% Options pour le nombre des colonnes
\DeclareOption{onecolumn}% option par defaut
	{\@twocolumnfalse}
\DeclareOption{twocolumn}
	{\@twocolumntrue}

%% Options pour les versions
\DeclareOption{draft}
	{\setlength\overfullrule{5pt} \@drafttrue}
\DeclareOption{draftindex}
	{\@draftindextrue}
\DeclareOption{draftbib}
	{\@draftbibtrue}
\DeclareOption{final}
	{\setlength\overfullrule{0pt} \@draftfalse
	 \@draftindexfalse \@draftbibfalse}
\DeclareOption{nodate}
	{\@nodatetrue}
\DeclareOption{preliminary}
	{\@preliminarytrue}

%% Options diverses
\DeclareOption{leqno}
	{\input{leqno.clo}}
\DeclareOption{fleqn}
	{\input{fleqn.clo}}
\DeclareOption{openbib}
	{\@openbibtrue}
\DeclareOption{bigbib}
	{\@bigbibtrue}
\DeclareOption{englishdp}
	{\@frenchdpfalse}
\DeclareOption{nofrenchgu}
	{\@frenchgufalse}

\ExecuteOptions{a4paper,12pt,oneside,onecolumn,final,openright}
\ProcessOptions

\input{size1\@ptsize.clo}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand{\topfraction}{.7}
\setcounter{bottomnumber}{1}
\renewcommand{\bottomfraction}{.3}
\setcounter{totalnumber}{3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\setcounter{dbltopnumber}{2}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

%%
%% definition des styles de pages
%%

%% definition des entetes et pieds de pages vides
\def\ps@empty{%
  \if@draft
    \def\@oddfoot{\hfill{\tiny \textsf{\'epreuve du \today}}}
    \def\@evenfoot{\hfill{\tiny \textsf{\'epreuve du \today}}}
  \else
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  \fi
%    \def\@oddfoot{}
%    \def\@evenfoot{}
    \def\@oddhead{}
    \def\@evenhead{}}

%% definition des entetes et pieds de pages standards
\if@twoside
\def\ps@headings{%
  \if@draft
    \def\@oddfoot{\hfill{\tiny \textsf{\'epreuve du \today}}}
    \def\@evenfoot{\hfill{\tiny \textsf{\'epreuve du \today}}}
  \else
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  \fi
  \def\@evenhead{%
  $\stackrel{\makebox[\textwidth]%
        {\scriptsize\sffamily\thepage\hfil\hfill\leftmark}}{\hrulefill}$}
  \def\@oddhead{%
  $\stackrel{\makebox[\textwidth]%
        {\scriptsize\sffamily\rightmark\hfil\hfill\thepage}}{\hrulefill}$}
  \let\@mkboth\markboth
  \def\chaptermark##1{% marque des chapitres numerotes
    \markboth {{\ifnum \c@secnumdepth >\m@ne
                   Chapitre\ \thechapter\ -- \ \fi##1}}{}}%
  \def\Chaptermark##1{% marque des chapitres sans numero
    \markboth {{##1}}{}}%
  \def\sectionmark##1{% marque des sections
    \markright {%
        \ifnum \c@secnumdepth >\z@
        \thesection. \ %
        \fi
        ##1}}}
\else
\def\ps@headings{%
  \if@draft
    \def\@oddfoot{\hfill{\tiny \textsf{\'epreuve du \today}}}
  \else
    \let\@oddfoot\@empty
  \fi
  \def\@oddhead{%
  $\stackrel{\makebox[\textwidth]%
        {\scriptsize\sffamily\rightmark\hfil\hfill\thepage}}{\hrulefill}$}
  \let\@mkboth\markboth
  \def\chaptermark##1{% marque les chapitres numerotes
      \markright{{\ifnum \c@secnumdepth >\m@ne
                    Chapitre\ \thechapter\ -- \ \fi##1}}}
  \def\Chaptermark##1{% marque les chapitres sans numero
    \markright{{##1}}}}
\fi

%% Entetes et pieds de pages personnalises
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
  }

%%
%% definition de la page de couverture
%%

%% definition du jury par un environnement << tabular >>
\newcommand{\jury}[1]{%
    \def\internaljury{\hskip-1.7cm\begin{tabular}{lll}#1\end{tabular}}}
\renewcommand{\title}[1]{%
    \def\internaltitle{#1}}
\renewcommand{\author}[1]{%
    \def\internalauthor{#1}}

%% espace entre le haut de page et le mot << THESE >>
\newlength{\SautHaut}
\setlength{\SautHaut}{-30pt}

%% espace entre le jury et << LRIM >>
\newlength{\SautBas}
\setlength{\SautBas}{70pt}

\newcommand{\maketitle}{%
  \thispagestyle{empty}
  \begingroup
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}
  \endgroup
  \let\maketitle\relax
  \let\@maketitle\relax
  \gdef\@author{}\gdef\@title{}}
\def\@maketitle{%
  \begin{minipage}{0.96\textwidth}
    \begin{center}%
      \vskip \SautHaut%
      {\huge\thesename\par}%
      \vskip 15pt%
      \includegraphics[width=6cm]{urca_logo.pdf}\par%
      \vskip 5pt%
      {\presentename\par}%
      {\Large\univname \par}%
      \vskip 15pt%
      {\large\gradename \par}%
      \vskip 15pt%
      {\large\bfseries\domainname\par}%
    \end{center}
  \end{minipage}
      \vfill%
  \begin{minipage}{0.96\textwidth}
    \begin{center}%
      \vskip \SautHaut%
      {\Large\sffamily\internalauthor \par}%
    \end{center}
  \end{minipage}
      \vfill%
  \begin{minipage}{0.96\textwidth}
    \begin{center}%
      \vskip \SautHaut%
      {\huge\sffamily\bfseries\internaltitle \par}%
    \end{center}
  \end{minipage}
      \vfill%
  \begin{minipage}{0.96\textwidth}
    \begin{center}%
      \vskip \SautHaut%
      \if@nodate
        \vskip 80pt
      \else
        {\small \soutname \@date \par}%
        \vskip 30pt%
	\if@preliminary
	  \vskip 30pt%
	\else
        \begin{flushleft}
              {\bfseries\compositionname}
        \end{flushleft}
          {\hskip-7pt\internaljury \par}%
	\fi
      \fi
      \vskip \SautBas
      \noindent\rule{\textwidth}{.1mm}\par
      \vskip -5pt
      {\small \laboname}%
    \end{center}%
  \end{minipage}
  \clearpage
  \thispagestyle{empty}
  \vfil \clearpage}

%% 
%% definition du sectionnement de la these
%%

%% definition des compteurs
\newcommand*{\chaptermark}[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand{\thepart}         {\Roman{part}}
\renewcommand{\thechapter}      {\arabic{chapter}}
\renewcommand{\thesection}      {\arabic{section}}
\renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection .\arabic{subsubsection}}
\renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}
\newcommand{\@chapapp}{\chaptername}

%% definition des parties
\newcommand{\part}{\cleardoublepage
                 \thispagestyle{empty}%
                 \if@twocolumn
                     \onecolumn
                     \@tempswatrue
                   \else
                     \@tempswafalse
                 \fi
                 \hbox{}\vfil
                 \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}
    \begin{flushright}
     \interlinepenalty \@M
     \reset@font
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries\sffamily \thepartspell~\partname
       \par
    \noindent\rule{.75\textwidth}{2mm}\par
       \vskip 20\p@
     \fi
     \Huge\bfseries\sffamily #2\par\end{flushright}%
    \@endpart}
\def\@spart#1{%
    \begin{flushright}
     \interlinepenalty \@M
     \reset@font
    \noindent\rule{.75\textwidth}{2mm}\par
       \vskip 20\p@
     \Huge\bfseries\sffamily #1\par\end{flushright}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}

%% definition des sur-chapitres numerotes
\newcommand{\bigchapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \secdef\@bigchapter\@schapter}
\def\@bigchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{part}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{part}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

%% definition des sur-chapitres sans numero
\newcommand{\Bigchapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \secdef\@Bigchapter\@schapter}
\def\@Bigchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \typeout{Grand \@chapapp\space sans numero.}%
                         \addcontentsline{toc}{part}{#1}%
                    \else
                      \addcontentsline{toc}{part}{#1}%
                    \fi
                    \Chaptermark{#1}
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makeChapterhead{#2}]%
                    \else
                      \@makeChapterhead{#2}%
                      \@afterheading
                    \fi}

%% definition des chapitres numerotes
\newcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{Chapitre\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \@chapterspace%
  {\parindent \z@ \raggedright \reset@font
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries\sffamily Chapitre{} \thechapter
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@chapterspace{%
%  \hfill\rule{40pt}{10pt}\par%
%  \vspace{-8pt}%
%  \hfill\rule{40pt}{1pt}\par%
%  \vspace{40\p@}}
  \vspace*{50\p@}}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \@chapterspace%
  {\parindent \z@ \raggedright
    \reset@font
    \interlinepenalty\@M
    \Huge\bfseries\sffamily #1\par\nobreak
    \vskip 40\p@
  }}

%% definition des chapitres sans numero
\newcommand{\Chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \secdef\@Chapter\@sChapter}
\def\@Chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \typeout{\@chapapp\space sans numero.}%
                         \addcontentsline{toc}{chapter}{#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \Chaptermark{#1}
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makeChapterhead{#2}]%
                    \else
                      \@makeChapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makeChapterhead#1{%
  \@chapterspace%
  {\parindent \z@ \raggedright \reset@font
    \interlinepenalty\@M
    \Huge\bfseries\sffamily #1\par\nobreak
    \vskip 40\p@
  }}
\def\@sChapter#1{\if@twocolumn
                   \@topnewpage[\@makesChapterhead{#1}]%
                 \else
                   \@makesChapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makesChapterhead#1{%
  \@chapterspace%
  {\parindent \z@ \raggedright \reset@font
    \interlinepenalty\@M
    \Huge\bfseries\sffamily  #1\par\nobreak
    \vskip 40\p@
  }}

%% sections, sous-sections...
\newcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {3.5ex \@plus 1ex \@minus .2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\reset@font\Large\sffamily\bfseries}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                   {3.25ex\@plus 1ex \@minus .2ex}%
                                   {1.5ex \@plus .2ex}%
                                   {\reset@font\large\sffamily\bfseries}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                   {3.25ex\@plus 1ex \@minus .2ex}%
                                   {1.5ex \@plus .2ex}%
                                   {\reset@font\normalsize\sffamily\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
                                   {3.25ex \@plus1ex \@minus.2ex}%
                                   {-1em}%
                                   {\reset@font\normalsize\sffamily\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
                                   {3.25ex \@plus1ex \@minus .2ex}%
                                   {-1em}%
                                   {\reset@font\normalsize\sffamily\bfseries}}

%% dedicace
\newenvironment{dedication}{%
    \cleardoublepage
    \thispagestyle{empty}
    \vspace*{5cm}
    \begin{flushright}
    \sffamily\slshape
    }{%
    \rmfamily\upshape
    \end{flushright}
    \cleardoublepage}

%% remerciements
\newcommand{\thanksfootflag}{\ddag}
\renewenvironment{thanks}[1]{%
    \chapter*{\thanksname}
    #1\list{}{\labelwidth\z@ \itemindent-\leftmargin
      \divide \itemindent by 2
      \let\makelabel\thankslabel}} {\endlist}
\newenvironment{thanks*}[1]{%
    \chapter*{\thanksname$^\thanksfootflag$}
    #1\list{}{\labelwidth\z@ \itemindent-\leftmargin
      \divide \itemindent by 2
      \let\makelabel\thankslabel}} {\endlist}
\newcommand{\thankslabel}[1]{}
\newenvironment{thanksfoot}{%
    \vfill\footnoterule\footnotesize$^\thanksfootflag$}{\normalsize}

\newcommand{\frontmatter}{\cleardoublepage\pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage\setcounter{page}{0}%
	\pagenumbering{arabic}}
\newcommand{\backmatter}{\cleardoublepage\setcounter{page}{0}%
	\pagenumbering{roman}}

%% appendices
\newcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \part*{\appendicesname}%
  \addcontentsline{toc}{part}{\protect\appendicesname}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\thechapter}{\Alph{chapter}}}

%% definition des enumerations (idem report.cls)
\if@twocolumn 
  \setlength\leftmargini {2em} 
\else
  \setlength\leftmargini {2.5em} 
\fi 
\setlength\leftmarginii {2.2em}
\setlength\leftmarginiii {1.87em} 
\setlength\leftmarginiv {1.7em}
\if@twocolumn 
  \setlength\leftmarginv {.5em}
  \setlength\leftmarginvi {.5em} 
\else 
  \setlength\leftmarginv {1em} 
  \setlength\leftmarginvi {1em} 
\fi 
\setlength\leftmargin {\leftmargini} 
\setlength \labelsep {.5em} 
\setlength \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep} 
\@beginparpenalty -\@lowpenalty
\@endparpenalty -\@lowpenalty 
\@itempenalty -\@lowpenalty
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\Alph{enumiv}}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\newcommand{\labelitemi}{\normalfont\bfseries --}
\newcommand{\labelitemii}{\normalfont\bfseries --}
\newcommand{\labelitemiii}{$\m@th\ast$}
\newcommand{\labelitemiv}{$\m@th\cdot$} 
\newenvironment{description}%
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
      \divide \itemindent by 2
      \let\makelabel\descriptionlabel}} {\endlist}
\newcommand{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%% definition des environnements abstract et keywords
\newenvironment{abstract}{%
   \newpage
   \list{}{\rightmargin 2em%
           \itemsep\z@
           \parsep\z@
           \advance\leftmargin -4.5em}
   \item[]
   \thispagestyle{empty}
   \mbox{ }\vfill
   \begin{center}
   {\LARGE\sffamily\bfseries\internaltitle\par}
   \rule{.1\textwidth}{.2pt}\par
   {\sffamily\bfseries\internalauthor\par}
   \end{center}
   \vskip 15pt
   \noindent\rule{\textwidth}{.2mm}\par}
  {\par\noindent\rule{\textwidth}{.2mm}\par\vfill\null\endlist}

\newenvironment{keywords}{%
  \vskip 15pt
  {\sffamily\bfseries\keywordsname\,:~}}
  {}

%% environnement divers (idem report.cls)
\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}

%%
%% environnements flottants
%%

%% figure
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{\thechapter.\@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{{\small\sffamily\bfseries \figurename~\thefigure\,: }}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}


%% table
\newcounter{table}[chapter]
\renewcommand{\thetable}{\thechapter.\@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{{\small\sffamily\bfseries \tablename~\thetable\,: }}
\newenvironment{table}
               {\@float{table}%
                \setlength\belowcaptionskip{0\p@}}
               {\end@float%
                \setlength\belowcaptionskip{0\p@}}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%% legendes
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{0\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\footnotesize #1#2}%
  \ifdim \wd\@tempboxa >\hsize
    \footnotesize #1#2\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%
%% tables et bibliographie
%%

%% table de matieres
\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg} {2.55em}
\newcommand{\@dotsep}{4.5}
\setcounter{tocdepth}{3}
\newcommand{\tableofcontents}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \Large \bfseries #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
    \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*{\l@section}      {\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{10em}{5em}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{12em}{6em}}

%% liste des figures
\newcommand{\listoffigures}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\uppercase{\listfigurename}}%
              {\uppercase{\listfigurename}}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{3em}}

%% liste des tables
\newcommand{\listoftables}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{\uppercase{\listtablename}}{\uppercase{\listtablename}}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure

%% citations bibliographiques
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
      \edef\@citeb{\expandafter\@iden\@citeb}%
      \if@filesw\immediate\write\@auxout{%
        \string\citation{\@citeb}}%
      \if@draftbib\protected@write\@indexfile{}%
      {\string\indexentry{bibliographie!\@citeb}{\thepage}}\fi\fi
      \@ifundefined{b@\@citeb}{{\reset@font\bfseries ?}%
        \if@draftbib\marginpar{\footnotesize\it{\@citeb}}\fi%
        \G@refundefinedtrue\@latex@warning%
        {Citation `\@citeb' page \thepage \space indefinie}}%
      {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

%% bibliographie
\newdimen\bibindent
\bibindent=1.5em
\newenvironment{thebibliography}[1]
     {\if@bigbib 
	 \Bigchapter{\bibname}
      \else
	 \Chapter{\bibname}
      \fi
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \if@openbib
              \advance\leftmargin\bibindent
              \itemindent -\bibindent
              \listparindent \itemindent
              \parsep \z@
            \fi
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand{\theenumiv}{\arabic{enumiv}}}%
      \if@openbib
        \providecommand{\newblock}{\par}
      \else
        \providecommand{\newblock}{\hskip .11em \@plus.33em \@minus.07em}%
      \fi
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Environnement `thebibliography' vide}}%
      \endlist}

%% 
%% noms francices
%%
\newcommand{\contentsname}{Table des mati\`eres}
\newcommand{\listfigurename}{Liste des figures}
\newcommand{\listtablename}{Liste des tables}
\newcommand{\listexemplename}{Liste des exemples}
\newcommand{\bibname}{Bibliographie}
\newcommand{\indexname}{Index}
\newcommand{\glossaryname}{Glossaire}
\newcommand{\seename}{voir}
\newcommand{\seealsoname}{voir aussi}
\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}
\newcommand{\partname}{partie}
\newcommand{\thepartspell}%
  {\ifcase\value{part}\or
    Premi\`ere\or Deuxi\`eme\or %
    Troisi\`eme\or Quatri\`eme\or Cinqui\`eme\or Sixi\`eme\or %
    Septi\`eme\or Huiti\`eme\or Neuvi\`eme\or Dixi\`eme\or %
    Onzi\`eme\or Douzi\`eme\or Treizi\`eme\or Quatorzi\`eme\or %
    Quinzi\`eme\or Seizi\`eme\or Dix-septi\`eme\or Dix-huiti\`eme\or %
    Dix-neuvi\`eme\or Vingti\`eme\fi}
\newcommand{\chaptername}{Chapitre}
\newcommand{\thanksname}{Remerciements}
\newcommand{\appendixname}{Annexe}
\newcommand{\appendicesname}{Annexes}
\newcommand{\keywordsname}{Mots cl\'es}
\if@preliminary
  \newcommand{\thesename}{Mémoire en vue de l'obtention de\\ \sc
    l'Habilitation \\ à Diriger des Recherches}
\else
  \newcommand{\thesename}{\sc Habilitation \\ à Diriger des
    Recherches}
\fi
\newcommand{\presentename}{pr\'esent\'ee \`a}
\newcommand{\univname}{l'{\sc Universit\'e de Reims Champagne-Ardenne}}
\newcommand{\gradename}{}
\newcommand{\domainname}{\'Ecole doctorale Sciences, Technologies, Santé}
\newcommand{\soutname}{Soutenue \`a Reims, le }
\newcommand{\compositionname}{\hskip-1.7cm Composition du jury :}
\newcommand{\laboname}{Laboratoire CReSTIC (EA 3804) -- Équipe CASH}

\newcommand{\today}{\number\day\space \ifcase\month\or
  janvier\or f\'evrier\or mars\or avril\or mai\or juin\or
  juillet\or ao\^ut\or septembre\or octobre\or novembre\or d\'ecembre\fi
  \space \number\year}

%%
%% diverses definitions
%%%

%% sur les notes en bas de page
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\long\def\@makefntext#1{%
    \parindent 1em%
    \noindent
    \hbox to 1.8em{\hss\@makefnmark}#1}

%% sur les tableaux
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}

%% sur le style de page
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

%% declaration des fonts
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}

%\input frhyphex

%% definition de l'index
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}{\indexname}%
                \thispagestyle{empty}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\newcommand*\see[2]{\emph{\seename} #1}
\newcommand*\nosee[2]{}
\newcommand*\subsee[2]{\emph{\seealsoname} \/ {#1}}
\def\seealso#1#2{\index{#1!zzzzz@\string\subsee{#2}|nosee}}
\if@bigbib 
    \newcommand\printindex{\clearpage\addcontentsline{toc}{part}%
                           {\protect\indexname}%
                           \@input@{\jobname.ind}}
\else
    \newcommand\printindex{\clearpage\addcontentsline{toc}{chapter}%
                           {\protect\indexname}%
                           \@input@{\jobname.ind}}
\fi

%% definition du glossaire
\newenvironment{theglossary}
               {\@makeschapterhead{\glossaryname}%
                \@mkboth{\glossaryname}{\glossaryname}%
                \thispagestyle{empty}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\clearpage}
\newcommand\glossaryspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\if@bigbib 
    \newcommand\printglossary{\clearpage\addcontentsline{toc}{part}%
                           {\protect\glossaryname}%
                           \@input@{\jobname.gls}}
\else
    \newcommand\printglossary{\clearpage\addcontentsline{toc}{chapter}%
                           {\protect\glossaryname}%
                           \@input@{\jobname.gls}}
\fi

\newcommand{\Glossary}[2]{\glossary{#1@{\sffamily\bfseries #1} : #2}}


%% redefinition de cleardoublepage pour eviter les entetes sur pages vides
\renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside
       \ifodd\c@page
       \else
          \thispagestyle{empty}\hbox{}\newpage
          \if@twocolumn\thispagestyle{empty}\hbox{}\newpage\fi
       \fi
    \fi
    }

\if@frenchdp
   \PassOptionsToPackage{frenchdp}{frpunct}
\else
   \PassOptionsToPackage{englishdp}{frpunct}
\fi
\if@frenchgu
   \PassOptionsToPackage{frenchgu}{frpunct}
\else
   \PassOptionsToPackage{nofrenchgu}{frpunct}
\fi
\PassOptionsToPackage{final}{graphicx}
\PassOptionsToPackage{chapter}{mathenv}
\PassOptionsToPackage{sserif}{mathenv}
\PassOptionsToPackage{chapter}{algolrim}
%\PassOptionsToPackage{latin1}{inputenc}
%\PassOptionsToPackage{T1}{fontenc}

\RequirePackage{cmddvr}% commandes diverses
\RequirePackage{graphicx}% inclusion de fichiers postscript encapsules
%\RequirePackage{inputenc}% codage des accents
%\RequirePackage{fontenc}% codage des accents
\if@draft
   \PassOptionsToPackage{notcite}{affref}
   \RequirePackage{affref}% affichage des references
\fi

%% Options pour les tailles de papier
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}
\setlength\textheight  {240mm}
\setlength\textwidth   {160mm}
\setlength\topmargin   {-7mm}
\setlength\oddsidemargin  {3.5mm}
\setlength\evensidemargin {-3.5mm}

\endinput
%%

