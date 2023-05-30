
% A LaTeX2e class for thesis submissions to
% Dept of Computer Science, Gauhati University
%
% Debasish Dutta (ddmasterdon@gmail.com)
%
% last revision: March 2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dd_dissertation}[2023/5/30 GU CS Dissertation submission class]

\newif\if@final\@finaltrue
\DeclareOption{report}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE THESIS
%-------------------------------------------------------------------------------

\if@final
	\LoadClass[12pt, twoside]{book} % 12 pt font, two-sided book style
	
	\RequirePackage[a4paper, includehead, headheight=0.6cm, inner=3cm ,outer=2.5cm, top=2.5 cm, bottom=2.5cm]{geometry}  % Changing size of document
	
	\RequirePackage[bf]{caption} % caption: FIG in bold
	\RequirePackage{emptypage} % Remove headers of empty pages

	\newcommand{\thesisspacing}{\singlespacing}
	
	\newcommand{\numberedchapter}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\fancyhead[RE]{{\bfseries \leftmark}}% Headers for left pages
		\fancyhead[LO]{{\bfseries \rightmark}}
	}% Headers for right pages
	
	\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
		\fancyhead[RE]{{\bfseries #1}} % Headers for left pages
		\fancyhead[LO]{}
	}%Headers for right pages

	\newcommand{\startpreamble}{
		\pagestyle{fancy} % Changes the headers
		\fancyhf{}% Clears header and footer
		\renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
		\renewcommand{\sectionmark}[1]{\markright{\thesection\; ##1}} % Getting the section name right
		\fancyhead[RO,LE]{\thepage} % page number on the outside of headers
		\setcounter{page}{2} % Include the title page in page counting
		\thesisspacing % Double spacing
	}

	\newcommand{\includepublications}{}
\else
	\LoadClass[12pt, oneside]{book} % 12 pt font, one-sided book style
	
	\RequirePackage[a4paper, includehead, headheight=0.2cm, inner=2cm ,outer=2cm, top=2 cm, bottom=2cm]{geometry}
	
	\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

	\newcommand{\thesisspacing}{\doublespacing}

	\newcommand{\numberedchapter}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\lhead{\bfseries \leftmark} % Header
	}
	
	\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
		\lhead{\bfseries #1} % Header
	}

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

	\newcommand{\includepublications}{
		\input{./MainText/publications}
	}
\fi

%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE
%-------------------------------------------------------------------------------

\RequirePackage{xkeyval} % Handling keyword options.

\define@key[GUCS]{title}{title}{\def\thesistitle{#1}}
\define@key[GUCS]{title}{name}{\def\name{#1}}
\define@key[GUCS]{title}{authordesignation}{\def\authordesignation{#1}}
\define@key[GUCS]{title}{supervisor}{\def\supervisor{#1}}
\define@key[GUCS]{title}{supervisordesignation}{\def\supervisordesignation{#1}}
\define@key[GUCS]{title}{submissiondate}{\def\submissiondate{#1}}
\define@key[GUCS]{title}{submissionmonth}{\def\submissionmonth{#1}}

\newcommand{\degree}{COMPUTER SCIENCE} % Degree name
\newcommand{\submissiondate}{30 May, 2023} % Degree name
\newcommand{\submissionmonth}{May, 2023} % Degree name



\providecommand{\puttitle}{}
\renewcommand{\puttitle}[1]{
	\@puttitle{}{#1}
}

\providecommand{\@puttitle}{}
\renewcommand{\@puttitle}[2]{%
	\setkeys[GUCS]{title}{#2}

	\begin{titlepage}
        \begin{center}
            
     
            \vspace*{0.3cm}
     
           { \huge \bfseries \thesistitle \par \ }
         \vspace{1.5cm}
     
            \textit{A seminar report submitted in partial fulfilment of the requirements for the degree of}
                 
            \vspace{0.2cm}
     
             {\large \textbf{MASTER OF SCIENCE}}
     
            \vspace{0.2cm}
     
             {\large \textbf{IN}}
     
               \vspace{0.2cm}
              
             %Choose your domain here
             {\large \textbf{\degree}}
    
            \vspace{2cm}
          
           \includegraphics[width=0.25\textwidth]{Logo}
            
            \vspace{2cm}
     
            \textit{Submitted by}
     
            \vspace{0.2cm}
            \textbf{\name\ $($\authordesignation$)$}
    
          \vspace{2cm}
     
            \textit{Supervised by}
     
            \vspace{0.2cm}
            \textbf{\supervisor}\\
            \textbf{\supervisordesignation}
    
            % \vspace{2cm}
            % \ifx\cosupervisor\undefined\else{\textit{Co-Supervised by} \\ \vspace{0.2cm} \textbf{\cosupervisor} \\ \textbf{\cosupervisordesignantion}} \\ \fi
            
            
     
           \vspace{3cm}
           \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}\\
            \textbf{\large GAUHATI UNIVERSITY, ASSAM}\\
           \textbf{\large \submissionmonth}
    
        \end{center}
    \end{titlepage}
}