\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2019/03/22 v0.0 PhD Thesis]
\LoadClass[12pt, twoside]{book}

%%%% Package dependencies %%%%%
\RequirePackage[english]{babel}
\RequirePackage{diagbox}
\RequirePackage[table]{xcolor}
\RequirePackage{xifthen}
%\RequirePackage[maxcitenames=2, autolang=other, backref=true, style=trad-alpha, bibencoding=utf8]{biblatex}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{indentfirst}
\RequirePackage{doi}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage[T1]{fontenc}
\RequirePackage[final]{microtype}
\RequirePackage{lmodern}
\RequirePackage{pdfpages}
\RequirePackage{textcomp}
\RequirePackage{gensymb}
\RequirePackage{dsfont}
\RequirePackage{pifont}
\RequirePackage{listings}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}
\RequirePackage{amsmath}
\RequirePackage[capitalise, noabbrev, english]{cleveref}
\RequirePackage[many]{tcolorbox}
\RequirePackage{amssymb}
\RequirePackage{tocloft}
%%% Class options %%%%%
%
% review, publish
%		these options are opposite: only one can be used at the same time. If both are used, publish option will be used.
%     publish option is set by default. It add a line number every 5 lines. Counting is restart for every pages
%    	review option add line numbers to every lines and increase the height of each lines.
%
% debug
%		show the different frames of the page (header, footer, main, notes)
%%%%%%%%%%%%%%%%

\newif\ifIFreview
\newif\ifIFpublish
\newif\ifIFdebug
\newif\ifIFglossary
\newif\ifIFwriting

\IFreviewfalse
\IFpublishtrue
\IFdebugfalse
\IFglossaryfalse

\DeclareOption{review}{
	\IFreviewtrue
	\IFpublishfalse
}
\DeclareOption{publish}{
	\IFreviewfalse
	\IFpublishtrue
}

\DeclareOption{debug}{
	\IFdebugtrue
}

\DeclareOption{glossary}{	
	\IFglossarytrue
}

\DeclareOption{writing}{
	\IFwritingtrue
}

\ProcessOptions\relax

\ifIFreview
	\RequirePackage[pagewise]{lineno}
		
	\RequirePackage{setspace}
	\onehalfspacing

\fi

\ifIFpublish
	\RequirePackage[pagewise, modulo]{lineno}
\fi

\ifIFdebug
	\RequirePackage{showframe}
\fi

\ifIFglossary
	\RequirePackage[toc, style=treenoname, subentrycounter, acronym]{glossaries}
	\makeglossaries
\fi

\ifIFwriting
	\RequirePackage{warning}
	\RequirePackage{refcheck}
	\RequirePackage{todonotes}
	\overfullrule=2cm
	
	\refcheckize{\cref}
	\refcheckize{\Cref}
\fi

%%% Package dependencies 2 %%%%%
\RequirePackage{csquotes}

%%% Definition of the page layout %%%%%
%\RequirePackage[headheight=15pt, a4paper]{geometry} %with page borders size
\RequirePackage{fancyhdr} 
\pagestyle{fancy}
\fancyhf{} %remove all rules
\renewcommand{\headrulewidth}{0pt} % remove decorative line

\fancyfoot[C]{}
\fancyfoot[RO, LE]{\thepage} %page number on Right for Odd pages and Left for Even pages

\fancypagestyle{plain}{ %redefine rules for 1st chapter pages
	\fancyhf{} %remove all rules
	\fancyfoot[RO, LE]{\thepage}
}

%%% Definition of chapter header %%%%%
\RequirePackage[compact]{titlesec}
\RequirePackage{anyfontsize}
\RequirePackage[nohints]{minitoc}

\titleformat{\chapter}[display]
	{\bfseries\Large}
	{\vspace{-3cm}\filleft\fontsize{90}{0}\fontfamily{phv}\selectfont\textcolor{gray}{\thechapter}}
	{4ex}
	{\titlerule
	  \vspace{2ex}%
	  \filright}
	  [\vspace{2ex}%
	  \titlerule]



	  
%%% Remove spaces for item list %%%%%
\setlist[itemize]{noitemsep, nolistsep}


%%% Customized commands %%%%%
% backmatter
%		extends the backmatter of the book class with the following feature: add a clear double page, set page numbering to roman and print the glossary if any.
%
% highlight  (alternate version available, check below)
%		put text in a box to highlight information
%		param: text to insert into the box 
%
% ie
%		alias to write 'i.e.,' with italic font
%
% paragraphit
%		simulate the \paragraph command but with an italic header
%
% setGloassary
% 	initialize the glossary by setting the file that contains the entries and calling the "makeglossary" command
%
% chapterPage
%		setup the first page of a chapter with an abstract and a mini table of contents
%
%chapterPageForPaper
%		setup the first page of a chapter with an abstract, a text saying what research paper the chapter was based on and a mini table of contents
%%%%%%%%%%%%%%%%

\renewcommand{\backmatter}[0]
{
	\part*{}
	\pagenumbering{roman}
	
	\ifIFglossary
		%\printglossary[type=main, nonumberlist]
		\printglossary[type=\acronymtype, title={Abbreviations}, nonumberlist]
		
	\fi
	
	\renewcommand{\listfigurename}{List of figures}
	\phantomsection
	\addcontentsline{toc}{chapter}{List of publications and tools}
	\input{publications}
	
	\phantomsection
	\addcontentsline{toc}{chapter}{List of figures}
    \listoffigures
    
    \renewcommand{\listtablename}{List of tables}
    \phantomsection
    \addcontentsline{toc}{chapter}{List of tables}
    \listoftables

	\printbibliography[heading=bibintoc]
}

\renewcommand{\contentsname}{Table of Contents}


\newcommand{\chapterPageForPaper}[2]{
	\setcounter{minitocdepth}{4}
	\noindent\textit{#1}\\
	
    \vspace{1cm}
    #2
	\vspace*{\fill}
	\begin{samepage}
	\minitoc
	\end{samepage}
	\newpage
}

\newcommand{\chapterPage}[1]{
	\setcounter{minitocdepth}{4}
	\noindent\textit{#1}
	\vspace*{\fill}
	\begin{samepage}
	\minitoc
	\end{samepage}
	\newpage
}



%%%%  Highlight box version 1 %%%%
\newcommand{\highlight}[1]{
\begin{tcolorbox}[leftrule=1mm,rightrule=1mm,toprule=0mm,bottomrule=0mm,left=2pt,right=2pt,top=2pt,bottom=2pt]
%\begin{finding}
#1
%\end{finding}
\end{tcolorbox}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%  Highlight box version 2 %%%%
% \newcommand{\highlight}[1]{
% \begin{tcolorbox}[tile,size=fbox,boxsep=2mm,boxrule=0pt,top=0pt,bottom=0pt,
% borderline west={1mm}{0pt}{gray!60!white},colback=gray!15!white]
% \em #1
% \end{tcolorbox}
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ie}[0]{\textit{i.e. }}
\newcommand{\eg}[0]{\textit{e.g. }}
\newcommand{\code}[1]{\small{\texttt{#1}}}

\newcommand{\paragraphit}[1]{\noindent\textit{#1}~~}

\let\OLDtableofcontents\tableofcontents
\renewcommand{\tableofcontents}[0]
{
	\dominitoc
	\OLDtableofcontents
}



%%%% Custom comments version 1 %%%%
\newboolean{showcomments}
\setboolean{showcomments}{true}
%\setboolean{showcomments}{false}
\ifthenelse{\boolean{showcomments}}
 { \newcommand{\note}[2]{
      \fbox{\bfseries\sffamily\scriptsize#1}
        {\small$\blacktriangleright$\textsf{\emph{#2}}$\blacktriangleleft$}}}
        { \newcommand{\note}[2]{}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%% Custom comments version 2 %%%%
% %(with predefined author list and colour coding) %
% \newboolean{showcomments}
% \setboolean{showcomments}{true}
% %\setboolean{showcomments}{false}
% \ifthenelse{\boolean{showcomments}}
%  { \newcommand{\mynote}[2]{
%       \fbox{\bfseries\sffamily\scriptsize#1}
%         {\small$\blacktriangleright$\textsf{\emph{#2}}$\blacktriangleleft$}}}
%         { \newcommand{\mynote}[2]{}}

% \newcommand{\autha}[1]{\mynote{author1}{\textcolor{blue}{#1}}}   
% \newcommand{\authb}[1]{\mynote{author2}{\textcolor{brown}{#1}}} 
% \newcommand{\authc}[1]{\mynote{author3}{\textcolor{orange}{#1}}}
% \newcommand{\authd}[1]{\mynote{author4}{\textcolor{green}{#1}}}
% \newcommand{\authe}[1]{\mynote{author5}{\textcolor{purple}{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\renewcommand*{\backref}[1]{}
%\renewcommand*{\backrefalt}[4]{{\footnotesize [%
%    \ifcase #1 Not cited.%
%    \or Cited on page~#2%
%    \else Cited on pages #2%
%    \fi%
%]}}

%%% https://tex.stackexchange.com/questions/1959/allowing-line-break-at-in-inline-math-mode
%\makeatletter
%\def\old@comma{,}
%\catcode`\,=13
%\def,{%
%  \ifmmode%
%    \old@comma\discretionary{}{}{}%
%  \else%
%    \old@comma%
%  \fi%
%}
%

%% Now refcheck is aware of \cref and \Cref
\newcommand{\refcheckize}[1]{%
  \expandafter\let\csname @@\string#1\endcsname#1%
  \expandafter\DeclareRobustCommand\csname relax\string#1\endcsname[1]{%
    \csname @@\string#1\endcsname{##1}\wrtusdrf{##1}}%
  \expandafter\let\expandafter#1\csname relax\string#1\endcsname
}
\makeatother

%% Glossary links in black and italic
%\renewcommand*{\glstextformat}[1]{\textcolor{black}{#1$^*$}}
\renewcommand*{\glstextformat}[1]{\textcolor{black}{#1}}

%\renewcommand{\cftsecfont}{\bfseries}