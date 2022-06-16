\documentclass[publish,glossary]{thesis}
\usepackage[utf8]{inputenc}
%\usepackage{titlespages}
\usepackage[a4paper,width=150mm,top=25mm,bottom=25mm]{geometry}
\usepackage[titles]{tocloft}
\usepackage{graphicx}
%\usepackage{subfig}
\usepackage{hyperref}
\usepackage{minitoc}
\usepackage{listings}
\usepackage{fancyhdr}
\usepackage{multirow}
\usepackage{multicol}
\usepackage{balance}
%\usepackage{subcaption}
\usepackage{booktabs}
\usepackage{titlesec}
\usepackage{titling}
\usepackage{balance}
\usepackage{subcaption}
\usepackage{soul}
\usepackage{siunitx}
\usepackage[table,dvipsnames]{xcolor}
\usepackage{ifthen}
\usepackage{amsfonts}
\usepackage{minted}
\usepackage{threeparttable}
\usepackage[shortlabels]{enumitem}
\usepackage{color}
\usepackage{latexsym}
\usepackage{varwidth}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{titlesec}


\usepackage[ruled,vlined,lined,commentsnumbered]{algorithm2e}
% Note that the sign must be
%  µ
%  MICRO SIGN
%  Unicode: U+00B5, UTF-8: C2 B5
% and \emph{not}
%  μ
%  GREEK SMALL LETTER MU
%  Unicode: U+03BC, UTF-8: CE BC
\sisetup{math-micro=\text{µ},text-micro=µ}

\usepackage{tikz}
\usetikzlibrary{shapes,arrows,positioning,automata}
\usepackage[ruled,vlined,lined,commentsnumbered]{algorithm2e}

\usepackage[many]{tcolorbox}





\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{5}

\setcounter{minitocdepth}{2}
\setlength{\mtcindent}{24pt}
\renewcommand{\mtcfont}{\small\rm}
\renewcommand{\mtcSfont}{\small\bf}

%opening
\title{mytitle}
\author{}

\fancypagestyle{preambulestyle}{
    \fancyhead[LE,LO,RE,RO]{ }
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[LO,RE,CO,CE]{ }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}


\fancypagestyle{unilustyle}{
    
    \fancyhead[RO]{\emph{\slshape{\nouppercase{\rightmark}}}}
    \fancyhead[LE]{\emph{\slshape{\nouppercase{\leftmark}}}}
    \fancyhead[RE,LO]{ }
    \fancyhfoffset[LE]{0mm}
    \fancyhfoffset[RO]{0mm}
    \fancyhfoffset[RE]{-20mm}
    \fancyhfoffset[LO]{-20mm}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{}
    \fancyfoot[CE,CO]{ }
    \renewcommand{\headrulewidth}{0.1pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{preambulestyle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%begin_document
\begin{document}
\pagenumbering{gobble}
\input{cover}
\cleardoublepage

\input{abstract}
\pagenumbering{roman}

\cleardoublepage
\input{quote}

\input{acknowledgements}
 \cleardoublepage


\dominitoc
\dominilof
\dominilof
\tableofcontents
\newpage
\listoffigures
\newpage
\listoftables
\newpage
\cleardoublepage

\setcounter{tocdepth}{3}
%\setcounter{secttocdepth}{3}
\newpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mainmatter
\pagestyle{unilustyle}

\pagenumbering{arabic}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{introduction}

\input{background}

\input{fgner}
\input{chatbot}
\input{luxembert}
\input{anonymisation}
\newpage
\input{listpapers}

\bibliographystyle{ieeetr}
\bibliography{references}
\end{document}
