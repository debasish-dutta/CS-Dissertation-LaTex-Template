
% A LaTeX2e class for thesis and seminar progress submissions to
% Dept of Computer Science, Gauhati University
%
% Debasish Dutta (ddmasterdon@gmail.com)
%
% last revision: Sept 2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dd_dissertation}[2023/9/30 GU CS Dissertation submission class]

%-------------------------------------------------------------------------------
%	PACKAGES AND CONFIGURATION
%-------------------------------------------------------------------------------

\newif\if@final\@finaltrue
\DeclareOption{report}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax


\RequirePackage{textcase}
\RequirePackage{xkeyval} % Handling keyword options.

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

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE THESIS
%-------------------------------------------------------------------------------

\if@final
	\LoadClass[12pt, oneside]{book} % 12 pt font, one-sided book style
	
	\RequirePackage[a4paper, includehead, headheight=0.2cm, inner=2cm ,outer=2cm, top=2cm, bottom=2cm]{geometry}
	
	\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

	\newcommand{\thesisspacing}{\singlespacing}

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

	% \newcommand{\includeCertificate}{\input{Preamble/certificate}}
	% \newcommand{\includeSupplementaryCertificate}{\input{Preamble/certificate_sup}}
	% \newcommand{\includeExternalCertificate}{\input{Preamble/certificate_ext}}
	% \newcommand{\includeDeclaration}{\input{Preamble/declaration}}
	% \newcommand{\includeAcknowledgement}{\input{Preamble/acknowledgement}}
	% \newcommand{\includeAbstract}{\input{Preamble/abstract}}
	% \newcommand{\includeAbbreviations}{\input{Preamble/abbreviations}}
	% \newcommand{\includeGlossary}{\input{Preamble/glossary}}

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
\else
	\LoadClass[12pt, oneside]{article} % 12 pt font, article
	
	\RequirePackage[a4paper, includehead, headheight=0.6 cm, inner=3 cm, outer=2 cm, top=2 cm, bottom=2 cm]{geometry}
	
	\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

	\newcommand{\thesisspacing}{\singlespacing}

	% \newcommand{\numberedchapter}{ % Preparation for numbered chapters
	% 	\cleardoublepage % To make sure the previous headers are passed
	% 	\lhead{\bfseries \leftmark} % Header
	% }
	
	% \newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
	% 	\cleardoublepage % To make sure the previous headers are passed
	% 	\phantomsection % To help hyperref link to the right page
	% 	\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
	% 	\lhead{\bfseries #1} % Header
	% 	\titlespacing*{\chapter}{0pt}{*4}{0}
	% }
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

	\newcommand{\startpreamble}{
		% \pagestyle{fancy} % Change the header style
		% \fancyhf{}% Clear header and footer
		% \renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
		\renewcommand{\sectionmark}[1]{\markright{##1}} % Getting the section name right
        % \rhead{\thepage} % Page number at the right of the header
		% \frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
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

\define@key[GUCS]{title}{title}{\def\thesistitle{#1}}
\define@key[GUCS]{title}{degree}{\def\degree{#1}}
\define@key[GUCS]{title}{name}{\def\name{#1}}
\define@key[GUCS]{title}{authordesignation}{\def\authordesignation{#1}}
\define@key[GUCS]{title}{supervisor}{\def\supervisor{#1}}
\define@key[GUCS]{title}{supervisordesignation}{\def\supervisordesignation{#1}}
\define@key[GUCS]{title}{submissiondate}{\def\submissiondate{#1}}
\define@key[GUCS]{title}{submissionmonth}{\def\submissionmonth{#1}}

% \newcommand{\degree}{COMPUTER SCIENCE} % Degree name
% \newcommand{\submissiondate}{30 May, 2023} %  Submission data
% \newcommand{\submissionmonth}{May, 2023} % Submission Month



\providecommand{\puttitle}{}
\renewcommand{\puttitle}[1]{
	\@puttitle{}{#1}
}

\providecommand{\@puttitle}{}

\renewcommand{\@puttitle}[2]{%
	\if@final
		\setkeys[GUCS]{title}{#2}

	\begin{titlepage}
        \begin{center}
            
     
            \vspace*{0.3cm}
     
           { \huge \bfseries \thesistitle \par \ }
         \vspace{1.5cm}
     
            \textit{A project report submitted in partial fulfilment of the requirements for the degree of}
                 
            \vspace{0.2cm}
     
             {\large \textbf{MASTER OF SCIENCE}}
     
            \vspace{0.2cm}
     
             {\large \textbf{IN}}
     
               \vspace{0.2cm}
              
             %Choose your domain here
             {\large \textbf{\degree}}
    
            \vspace{2cm}
          
           \includegraphics[width=0.25\textwidth]{Assets\Logo.jpg}
            
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
            
            
     
           \vspace{2cm}
           \textbf{\large DEPARTMENT OF COMPUTER SCIENCE}\\
            \textbf{\large GAUHATI UNIVERSITY, ASSAM}\\
           \textbf{\large \submissionmonth}
    
        \end{center}
    \end{titlepage}

	\else
	\setkeys[GUCS]{title}{#2}
	\begin{titlepage}
		
		\begin{center}
			{\large \scshape Department Of Computer Science}\\
			{\large \scshape Gauhati University}\\[1.4cm]
			\includegraphics[width=3cm]{Assets\Logo.jpg}\\[1.5cm]
{\Large Seminar Report}\\[0.5cm]
\rule{\textwidth}{1.5pt}\\[0cm]
{\huge \bfseries \thesistitle \par \ }\\[-0.5cm]
\rule{\textwidth}{1.5pt}\\[2.5cm]
\hfill  by\\[1cm]
\hfill  {\large \bfseries\name}\\[0.5cm]
\hfill  {\large \bfseries\authordesignation}
\vfill
{\hfill \large Supervisor: \textbf{\supervisor}} \\
\vspace{0.2cm}
{\hfill \large {\supervisordesignation} } \\
\vspace{1cm}
\hfill  \submissiondate
\end{center}
\end{titlepage}
\fi
}

%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
%	BUILDING THE CERTIFICATES PAGE
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------

\newcommand{\includeCertificate}{%
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

This is to certify that the dissertation entitled \textbf{\thesistitle} submitted by \textbf{\name}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\degree}, Gauhati University is a work carried out by him under my supervision and guidance of \textbf{\supervisor}.

 \vspace{3cm}

\begin{tabular}{p{8cm} c}
Date:	 \submissiondate & Anjana Kakoti Mahanta \\
Place: Gauhati University	& Head of the Department \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}

\newcommand{\includeSupplementaryCertificate}{
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

This is to certify that the project report entitled \textbf{\thesistitle} submitted by \textbf{\name}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\degree}, Gauhati University is a work carried out by him under my supervision and guidance.

To the best of my knowledge, the work has not been submitted to any other institute for the award of any other degree or diploma.

 \vspace{3cm}

\begin{tabular}{p{8cm} c}
Date:	 \submissiondate & \supervisor \\
Place: Gauhati University	& Supervisor \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}


\newcommand{\includeExternalCertificate}{%
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

The project report entitled \textbf{\thesistitle} submitted by \textbf{\name}, for partial fulfilment for the requirement of award of the degree of Master of Science in \textbf{\degree}, Gauhati University has been examined.


 \vspace{5cm}

\begin{tabular}{p{8cm} c}
Date:	 \submissiondate & \supervisor \\
Place: Gauhati University	& Supervisor \\
	&	Department of Computer Science \\
	% &	\supervisordesignation\\
	&	\\
\end{tabular}
}
%-------------------------------------------------------------------------------
%	BUILDING THE DECLARATION PAGE
%-------------------------------------------------------------------------------
\newcommand{\includeDeclaration}{%
\unnumberedchapter{Declaration}
\cleardoublepage
\thispagestyle{empty}

\vspace*{2cm}

\begin{center}


  \textbf{\large DECLARATION}

  \vspace{5cm}

\end{center}

I hereby declare that the seminar report entitled \textbf{\thesistitle} has been 
completed by me and submitted in partial fulfilment for the requirement of award 
of the degree of \textbf{Master of Science in \degree}, Gauhati University. 
I also declare that any or all contents incorporated in the report has not been submitted in any form for the award of any other degree of any other institute or university.

\vspace{4cm}

\begin{tabular}{p{42ex} l}
  Date: \submissiondate  &	\name \\
  Place: Gauhati University	 &	Roll No.: \authordesignation\\
&	Programme: Masters in \ToggleCase{Computer Science}\\
&	Semester: Fourth Semester\\

\end{tabular}
}
%-------------------------------------------------------------------------------
%	BUILDING THE ACKNOLODGEMENT PAGE
%-------------------------------------------------------------------------------
\newcommand{\includeAcknowledgement}{%
\unnumberedchapter{Acknoledgement}
\cleardoublepage
\thispagestyle{empty}

\vspace*{2cm}

\begin{center}


  \textbf{\large ACKNOWLEDGEMENT}

  \vspace{5cm}

\end{center}

\noindent
I acknowledge and express my gratitude to my project guide, \textbf{Dr Irani Hazarika}, Assistant
Professor, Department of Computer Science, Gauhati University, for her unwavering support, encouragement
and valuable advice throughout this project. Her expertise and guidance helped shape the
direction of my work. \\
I also extend my sincere thanks to \textbf{Prof. Anjana Kakoti Mahanta}, Department
of Computer Science, Gauhati University, for her support in this project. Her insights and inputs
have been invaluable in enhancing the quality of my work. \\
I would like to express my gratitude to all the faculty members of the Computer Science Department, Gauhati University, for their support and
encouragement throughout this project. 

 \vspace{5cm}

\begin{tabular}{p{12cm} p{15cm} l}
  Date: \submissiondate  &	\name \\
  % Place: Gauhati University	 &	Roll No.: \authordesignation\\
	% &	Programme: Computer Science\\
	% &	Semester: Fourth Semester\\

\end{tabular}
}



\newcommand{\includeAbstract}{\input{Preamble/abstract}}
%-------------------------------------------------------------------------------
%	BUILDING THE ABBREVIATIONS PAGE
%-------------------------------------------------------------------------------
\newcommand{\includeAbbreviations}{
	\unnumberedchapter{Abbreviations} 
\chapter*{Abbreviations} 

Contains all abbr. used in the dissertation.

Here is an example.

\begin{longtable}{rl}
PPT & positive partial transpose\\
SRPT & Schr\"odinger-Robertson partial transpose
\end{longtable}
}
%-------------------------------------------------------------------------------
%	BUILDING THE GLOSSARY PAGE
%-------------------------------------------------------------------------------
\newcommand{\includeGlossary}{
	\unnumberedchapter{Glossary} 
\chapter*{Glossary} 


Here is an example:

% Break up this table into several ones if it takes up more than one page
\begin{center}
\begin{longtable}{r p{0.58 \textwidth}}
Dipole Blockade & Phenomenon in which the simultaneous excitation of two atoms is inhibited by their dipolar interaction. \\
Cavity Induced Transparency & Phenomenon in which a cavity containing two atoms excited with light at a frequency halfway between the atomic frequencies contains the number of photons an empty cavity would contain.  \\ 
\end{longtable}
\end{center}

}
