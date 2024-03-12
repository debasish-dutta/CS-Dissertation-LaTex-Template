\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csreport}[2023 latex class file for report in CS deptt]

%-------------------------------------------------------------------------------
%	INITIAL CONFIGURATION
%-------------------------------------------------------------------------------

\def\myclasstype{article}% make sure a default is defined

\DeclareOption{progress}{%
    \gdef\myclasstype{article}}
\DeclareOption{final}{%
    \gdef\myclasstype{book}}

\ProcessOptions*
%:load \myclasstype
%-------------------------------------------------------------------------------
%	PACKAGES
%-------------------------------------------------------------------------------
\LoadClass[12pt, oneside]{\myclasstype}% add options if desired


\usepackage{ifthen}
\RequirePackage[a4paper, includehead, headheight=0.2cm, inner=2cm ,outer=2cm, top=2cm, bottom=2cm]{geometry}
\RequirePackage{background}
\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

\backgroundsetup{contents={\includegraphics[scale=.1]{Logo.jpg}},opacity=0.025,angle=0}


\RequirePackage[english]{babel} % The document is in English
\RequirePackage[utf8]{inputenc} % UTF8 encoding
\RequirePackage[T1]{fontenc} % Font encoding
\RequirePackage{lmodern}
\RequirePackage{graphicx} % For including images

\RequirePackage{longtable} % tables that can span several pages
\RequirePackage{fancyhdr} % For the headers
\RequirePackage{setspace} % For double spacing
\RequirePackage{tabularx} 

\RequirePackage{listings} % For writing code

\RequirePackage{array, booktabs}
\RequirePackage{titlesec}

% \RequirePackage[x11names,table]{xcolor} % For timeline
\RequirePackage{caption} % For captions
\RequirePackage{xstring}
\RequirePackage{float}

\RequirePackage{emptypage} % No headers on an empty page

\RequirePackage{hyperref} % Adds clickable links at references

\RequirePackage{bookmark}
\RequirePackage[square, numbers, sort&compress]{natbib}
\bibliographystyle{abbrvnat}


\RequirePackage{amsthm,amsmath,amssymb,amsfonts,bbm}% Math symbols
\RequirePackage{multirow}
\RequirePackage{tabularx}
%-------------------------------------------------------------------------------
%	CUSTOM COMMANDS AND MACROS
%-------------------------------------------------------------------------------

\newcommand{\ToggleCase}[1]{%
  \NoCaseChange{%
    \ifthenelse{\equal{\MakeTextUppercase{#1}}{#1}}{% Check if input is uppercase
      \MakeTextLowercase{#1}% If uppercase, convert to sentence case
    }{%
      \MakeTextUppercase{#1}% If not uppercase, convert to uppercase
    }%
  }%
}

% \newdateformat(\monthyear){\monthname[\THEMONTH] \THEYEAR}
%-------------------------------------------------------------------------------
%	VARIABLES
%-------------------------------------------------------------------------------



%\newcommand{\reporttitle}[1]{\gdef\@rtitle{#1}}
%\newcommand{\reportauthor}[1]{\gdef\@rauthor{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\authordesignation}[1]{\gdef\@authordesignation{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\supervisordesignation}[1]{\gdef\@supervisordesignation{#1}}
% \newcommand{\guisde}[1]{\gdef\@guide{#1}}

%-------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%-------------------------------------------------------------------------------

\newcommand{\thesisspacing}{\singlespacing}

%------------TITLE PAGE---------------------------------------------------------

\renewcommand{\maketitle}{%
\NoBgThispage
\thispagestyle{empty}
\ifthenelse{\equal{\myclasstype}{article}}{%
    \begin{center}
        \vspace{-1cm}
			{\large \scshape Department Of Computer Science}\\
			{\large \scshape Gauhati University}\\[0.75cm]
			\includegraphics[width=2.5cm]{Logo.jpg}\\[0.75cm]
{\Large Seminar Report}\\[0.5cm]
\rule{\textwidth}{1.5pt}\\[0cm]
{\huge \bfseries \@title \par \ }\\[-0.5cm]
\rule{\textwidth}{1.5pt}\\[2.5cm]
% \hfill  by\\[1cm]
{\large \bfseries\@author}\\[0.5cm]
{\large \bfseries\@authordesignation}
\vfill
% {\hfill \large Supervisor: \textbf{\@supervisor}} \\
% \vspace{0.2cm}
% {\hfill \large {\@supervisordesignation} } \\
% \vspace{1cm}
% \hfill  \@date
\end{center}

\vfill
}
{
    {\color{red} \textbf{\large Maketitle command cannot be used with Final}}\par
}
}

%------------Preamble---------------------------------------------------------




\ifthenelse{\equal{\myclasstype}{article}}{%
\newcommand{\startpreamble}{
\renewcommand{\sectionmark}[1]{\markright{##1}} % Getting the section name right
% \frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
\setcounter{page}{1} % Include the title page in page counting
\thesisspacing % Double or single spacing
}
\newcommand\subsubsubsection{\@startsection{subsubsection}{4}{\z@}%
                {-3.25ex\@plus -1ex \@minus -.2ex}%
                {1.5ex \@plus .2ex}%
                {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                {-3.25ex\@plus -1ex \@minus -.2ex}%
                {1.5ex \@plus .2ex}%
                {\normalfont\normalsize\bfseries}}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\newcommand{\declarationByGuide}{
\vfill
\noindent\rule{\textwidth}{1pt} 
\begin{center} \textbf{Declaration by Supervisor}\end{center}

\noindent Progress of \textbf{\@author} in the project titled \textbf{\@title} is satisfactory/ unsatisfactory.

\vspace{10mm}
\noindent\makebox[\textwidth][r]{(\@supervisor)}\\
\makebox[\textwidth][r]{Supervisor}\\
\makebox[\textwidth][r]{\@supervisordesignation}\\
\rule{\textwidth}{1pt} 
}
\newcommand{\declarationByStudent}{
\noindent\rule{\textwidth}{1pt} 
\begin{center} \textbf{Declaration by Student}\end{center}

\noindent I, \textbf{\@author} hereby declare that the project titled \textbf{\@title} is my own work and it has not been copied from anywhere.

\vspace{10mm}
\hfill(\@author)\\
\rule{\textwidth}{1pt}  
}
% \newcommand{\declarationByExternal}{
% \noindent\rule{\textwidth}{1pt} 
% \begin{center} \textbf{Declaration by External}\end{center}

% \noindent The project report entitled \textbf{\@author} submitted by \textbf{\@title} has been examined.

% \vspace{10mm}
% \hfill(Examiner)\\
% \rule{\textwidth}{1pt}  
% }
}{
\newcommand{\startpreamble}{
% \pagestyle{fancy} % Change the header style
\fancyhf{}% Clear header and footer
\renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
\renewcommand{\sectionmark}[1]{\markright{##1}} % Getting the section name right
\rhead{\thepage} % Page number at the right of the header
\frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
\setcounter{page}{2} % Include the title page in page counting
\thesisspacing % Double or single spacing
}
\newcommand{\numberedchapter}{ % Preparation for numbered chapters
	\cleardoublepage % To make sure the previous headers are passed
	\lhead{\bfseries \leftmark} % Header
}
\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
	\cleardoublepage % To make sure the previous headers are passed
	\phantomsection % To help hyperref link to the right page
	\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
	\lhead{\bfseries #1} % Header
	\titlespacing*{\chapter}{0pt}{*4}{0}
}
\newcommand\subsubsubsection{\@startsection{subsubsection}{4}{\z@}%
            {-3.25ex\@plus -1ex \@minus -.2ex}%
            {1.5ex \@plus .2ex}%
            {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
            {-3.25ex\@plus -1ex \@minus -.2ex}%
            {1.5ex \@plus .2ex}%
            {\normalfont\normalsize\bfseries}}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\newcommand{\titlePage}{
    \begin{titlepage}
        \begin{center}
            % \NoBgThispage
            
     
            \vspace*{0.3cm}
     
           { \huge \bfseries \@title \par \ }
         \vspace{1.5cm}
     
            \textit{A project report submitted in partial fulfilment of the requirements for the degree of}
                 
            \vspace{0.2cm}
     
             {\large \textbf{MASTER OF SCIENCE}}
     
            \vspace{0.2cm}
     
             {\large \textbf{IN}}
     
               \vspace{0.2cm}
              
             %Choose your domain here
             {\large \textbf{\@degree}}
    
            \vspace{2.5cm}
          
           \includegraphics[width=0.25\textwidth]{Logo}
            
            \vspace{1.5cm}
     
            \textit{Submitted by}
     
            \vspace{0.2cm}
            \textbf{\@author\ $($\@authordesignation$)$}
    
          \vspace{2cm}
     
            \textit{Supervised by}
     
            \vspace{0.2cm}
            \textbf{\@supervisor}\\
            \textbf{\@supervisordesignation}
    
            % \vspace{2cm}
            % \ifx\cosupervisor\undefined\else{\textit{Co-Supervised by} \\ \vspace{0.2cm} \textbf{\cosupervisor} \\ \textbf{\cosupervisordesignantion}} \\ \fi
            
            
     
           \vspace{2cm}
           \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}\\
            \textbf{\large GAUHATI UNIVERSITY, ASSAM}\\
           \textbf{\large \@date}
    
        \end{center}
    \end{titlepage}
}
\newcommand{\declaration}{
\unnumberedchapter{Certificate} 
\cleardoublepage
\thispagestyle{empty}

\begin{center}
 \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}

  \vspace{0.2cm}
 \textbf{\LARGE GAUHATI UNIVERSITY}\\
 {\large GUWAHATI - 781014}\\
 {\large ASSAM}

 \vspace{1cm}

 \includegraphics[width=0.15\textwidth]{logo}

 \vspace{2cm}

 \textbf{\large CERTIFICATE}

 \vspace{2cm}

\end{center}

This is to certify that the dissertation entitled \textbf{\@title} submitted by \textbf{\@author}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\@degree}, Gauhati University is a work carried out by him under my supervision and guidance of \textbf{\@supervisor}.

 \vspace{3cm}

\begin{tabular}{p{8cm} c}
Date:	 \@date & Anjana Kakoti Mahanta \\
Place: Gauhati University	& Head of the Department \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}
\newcommand{\declarationByGuide}{
\unnumberedchapter{Certificate} 
\cleardoublepage
\thispagestyle{empty}

\begin{center}
 \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}

  \vspace{0.2cm}
 \textbf{\LARGE GAUHATI UNIVERSITY}\\
 {\large GUWAHATI - 781014}\\
 {\large ASSAM}

 \vspace{1cm}

 \includegraphics[width=0.15\textwidth]{logo}

 \vspace{2cm}

 \textbf{\large CERTIFICATE}

 \vspace{2cm}

\end{center}

This is to certify that the project report entitled \textbf{\@title} submitted by \textbf{\@author}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\@degree}, Gauhati University is a work carried out by him under my supervision and guidance.

To the best of my knowledge, the work has not been submitted to any other institute for the award of any other degree or diploma.

 \vspace{3cm}

\begin{tabular}{p{8cm} c}
Date:	 \@date & \@supervisor \\
Place: Gauhati University	& Supervisor \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}
\newcommand{\declarationByExternal}{
\unnumberedchapter{Certificate} 
\cleardoublepage
\thispagestyle{empty}

\begin{center}
 \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}

  \vspace{0.2cm}
 \textbf{\LARGE GAUHATI UNIVERSITY}\\
 {\large GUWAHATI - 781014}\\
 {\large ASSAM}

 \vspace{1cm}

 \includegraphics[width=0.15\textwidth]{logo}

 \vspace{2cm}

 \textbf{\large CERTIFICATE}

 \vspace{2cm}

\end{center}

The project report entitled \textbf{\@title} submitted by \textbf{\@author}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\@degree}, Gauhati University has been examined.


 \vspace{5cm}

\begin{tabular}{p{8cm} c}
Date:	 \@date & \@supervisor \\
Place: Gauhati University	& Supervisor \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}
\newcommand{\declarationByStudent}{
\unnumberedchapter{Declaration}
\cleardoublepage
\thispagestyle{empty}

\vspace*{2cm}

\begin{center}


  \textbf{\large DECLARATION}

  \vspace{5cm}

\end{center}

I hereby declare that the seminar report entitled \textbf{\@title} has been 
completed by me and submitted in partial fulfilment for the requirement of award 
of the degree of \textbf{Master of Science in \@degree}, Gauhati University. 
I also declare that any or all contents incorporated in the report has not been submitted in any form for the award of any other degree of any other institute or university.

\vspace{4cm}

\begin{tabular}{p{42ex} l}
  Date: \@date  &	\@author \\
  Place: Gauhati University	 &	Roll No.: \@authordesignation\\
&	Programme: Masters in \@degree\\
&	Semester: Fourth Semester\\

\end{tabular}
}
\newcommand{\Acknowledgement}{%
\unnumberedchapter{Acknoledgement}
\cleardoublepage
\thispagestyle{empty}

\vspace*{2cm}

\begin{center}


  \textbf{\large ACKNOWLEDGEMENT}

  \vspace{5cm}

\end{center}

\noindent
I acknowledge and express my gratitude to my project guide, \textbf{\@supervisor}, \@supervisordesignation, Department of Computer Science, Gauhati University, for her unwavering support, encouragement
and valuable advice throughout this project. Her expertise and guidance helped shape the
direction of my work. \\
I also extend my sincere thanks to \textbf{Prof. Anjana Kakoti Mahanta}, Department
of Computer Science, Gauhati University, for her support in this project. Her insights and inputs
have been invaluable in enhancing the quality of my work. \\
I would like to express my gratitude to all the faculty members of the Computer Science Department, Gauhati University, for their support and
encouragement throughout this project. 

 \vspace{5cm}

\begin{tabular}{p{12cm} p{15cm} l}
  Date: \@date  &	\@author \\
  % Place: Gauhati University	 &	Roll No.: \authordesignation\\
	% &	Programme: Computer Science\\
	% &	Semester: Fourth Semester\\

\end{tabular}
}
}




