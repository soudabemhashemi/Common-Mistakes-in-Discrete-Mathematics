\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{homework}[2014/12/16 Class file for homework assignments]

% ----- Options ---------------------------------------------------------------
\newcommand\@opanon{0}
\DeclareOption{anonymous}{\renewcommand\@opanon{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\newcommand\@oplargemargins{0}
\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}
\ProcessOptions

% ----- Packages --------------------------------------------------------------
% Better fonts with accents
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage[a4paper, total={6in, 9.5in}]{geometry}
\RequirePackage{tikz}

% Required for starred commands
\RequirePackage{suffix}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage{hyperref}
\RequirePackage{nameref}

\RequirePackage{pgfkeys}

\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[Path={template/fonts/}]{IRZar.ttf}
\setdigitfont[Path={template/fonts/}]{IRZar.ttf}

\definecolor{capri}{rgb}{0.0, 0.75, 1.0}
\definecolor{byzantine}{rgb}{0.74, 0.2, 0.64}
\definecolor{burgundy}{rgb}{0.5, 0.0, 0.13}
\definecolor{burntsienna}{rgb}{0.91, 0.45, 0.32}
\definecolor{coolblack}{rgb}{0.0, 0.18, 0.39}






% ----- chapters -------------------------------------------------------------
\newcounter{chapterCounter}

% Prefix for chapters
\newcommand{\chaptertype}[0]{فصل }

% Named question, takes one argument
\WithSuffix\providecommand\chapter*{}
\WithSuffix\renewcommand\chapter*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break enywhere in between

  \newpage
  {
  \color{coolblack}
  \begin{minipage}{\linewidth}%
    \addtocounter{chapterCounter}{1}%
    \setcounter{questionCounter}{0}%
    \begin{center}
      \vspace{2cm}
      \scalebox{3}{\bf \chaptertype \arabic{chapterCounter} : #1}%
      \vspace{2cm}
    \end{center}
  \end{minipage}
  \color{black}
  }
}

% Named chapter, takes one argument

% Override normal section defintions
\renewcommand{\section}[0]{\chapter}
\WithSuffix\newcommand\section*[1]{\chapter*{#1}}







\WithSuffix\providecommand\freechapter*{}
\WithSuffix\renewcommand\freechapter*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break enywhere in between

  \newpage
  {
  \color{coolblack}
  \begin{minipage}{\linewidth}%
    \setcounter{questionCounter}{0}%
    \begin{center}
      \vspace{2cm}
      \scalebox{3}{\bf #1}%
      \vspace{2cm}
    \end{center}
  \end{minipage}
  \color{black}
  }
}




























% ----- Questions -------------------------------------------------------------
\newcounter{questionCounter}[chapterCounter]
\newcounter{partCounter}[questionCounter]

% Prefix for questions
\newcommand{\questiontype}[0]{سؤال}

% Use this if your "written" questions are all under one section
% For example, if the homework handout has Section 5: Written Questions
% and all questions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-question.
\newcommand{\writtensection}[0]{0}

% Numbered question
\providecommand{\question}{}
\renewcommand{\question}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  {
  \color{blue}
  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
    \stepcounter{questionCounter}%
      \vspace{.2in}%
      \ifx\writtensection\undefined{}
        \noindent{\bf \questiontype\ \arabic{chapterCounter}.\arabic{questionCounter}.}%
        \else
          \if\writtensection0
          \noindent{\bf \questiontype\ \arabic{chapterCounter}.\arabic{questionCounter}.}%
          \else
          \noindent{\bf \questiontype\ \writtensection.\arabic{chapterCounter}.\arabic{questionCounter}}%
        \fi
      \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  }
  
}

% Named question, takes one argument
\WithSuffix\providecommand\question*{}
\WithSuffix\renewcommand\question*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break enywhere in between
  
  {
  \color{blue}
  \begin{minipage}{\linewidth}%
    \addtocounter{questionCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
    \noindent{\bf \arabic{chapterCounter}.\arabic{questionCounter}. #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  }

}













% ----- Solution -------------------------------------------------------------
% Prefix for solutions
\newcommand{\solutiontype}[0]{پاسخ}

% Use this if your "written" solutions are all under one section
% For example, if the homework handout has Section 5: Written Solutions
% and all solutions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-solution.

% Numbered solution
\providecommand{\solution}{}
\renewcommand{\solution}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  {
  \color{red}
  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
      \vspace{.2in}%
      \ifx\writtensection\undefined{}
        \noindent{\bf \solutiontype\ .}%
        \else
          \if\writtensection0
          \noindent{\bf \solutiontype\ .}%
          \else
          \noindent{\bf \solutiontype\ \writtensection.}%
        \fi
  \end{minipage}
  \color{black}
  }

}



% Named solution, takes one argument
\WithSuffix\providecommand\solution*{}
\WithSuffix\renewcommand\solution*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break enywhere in between
  
  {
  \color{red}
  \begin{minipage}{\linewidth}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
    \noindent{\bf #1 .}%
    % \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  }
}

% Override normal section defintions
% \renewcommand{\section}[0]{\solution}




























% ----- notes -------------------------------------------------------------
\newcounter{noteCounter}

% Prefix for Tnotes

% Numbered Tnote
\newcommand{\note}[2]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}
  \pgfkeyssetvalue{#2}{#1}
  \refstepcounter{noteCounter}\label{#2}
  \paragraph{\textcolor{byzantine}{#1.\Roman{noteCounter}}}:
}

\newcommand{\Tnote}[1]{\note{T}{#1}}
\newcommand{\Enote}[1]{\note{E}{#1}}
\newcommand{\Nnote}[1]{\note{N}{#1}}

\renewcommand{\thenoteCounter}[0]{\textcolor{byzantine}{\Roman{noteCounter}}}
\newcommand{\refnote}[1]{\textcolor{byzantine}{\ref{#1}\pgfkeysvalueof{#1}.}}



\newcommand{\notestype}[0]{نکات}
\providecommand{\notes}{}
\renewcommand{\notes}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  \vspace{.05in}%
  \textcolor{burntsienna}{\bf \notestype: }%
  \vspace{.05in}%
}













% ----- Question Parts --------------------------------------------------------

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph*)}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{chapterCounter}.\arabic{questionCounter}.\arabic*})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\item}

% ----- Answer Box ------------------------------------------------------------

\newcommand{\answerbox}[1]{%
\begin{framed}
\vspace{#1}
\end{framed}}

% ----- Answer ExternalLink ------------------------------------------------------------

\newcommand{\ExternalLink}{%
    \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{% 
        \begin{scope}[x=1ex, y=1ex]
            \clip (-0.1,-0.1) 
                --++ (-0, 1.2) 
                --++ (0.6, 0) 
                --++ (0, -0.6) 
                --++ (0.6, 0) 
                --++ (0, -1);
            \path[draw, 
                line width = 0.5, 
                rounded corners=0.5] 
                (0,0) rectangle (1,1);
        \end{scope}
        \path[draw, line width = 0.5] (0.5, 0.5) 
            -- (1, 1);
        \path[draw, line width = 0.5] (0.6, 1) 
            -- (1, 1) -- (1, 0.6);
        }
    }

% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
% \setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{fancy}

%\if\@opanon%
\ifthenelse{\equal{\@opanon}{0}}{%
  \renewcommand{\maketitle}[0]{%
    % Setup header
    \setlength{\headheight}{15.2pt}
    \setlength{\headsep}{0.2in}
    \lhead{\eventclass{}}%
    \rhead{\eventtype{}}%

    % Setup hrule in header
    \renewcommand{\headrulewidth}{0pt}
    \headrule{}

    % Don't put header on first page
    \thispagestyle{plain}

    \includegraphics[width = 2cm]{pictures/QLogo.jpg}\\[2ex]
    
    \begin{center}
      {\Large \eventtype{}}
      
      {\eventclass{}}

      \eventcntrbs{}

    \end{center}
    \renewcommand{\headrulewidth}{0.4pt}
  }

}%
{%
  \renewcommand{\maketitle}[0]{%
    % Make all pages plain
    \pagestyle{plain}

    % Put header on it's own page
    \begin{center}
      {\Large \eventclass{} \eventtype{}}

      \eventcntrbs{}

    \end{center}
    \renewcommand{\headrulewidth}{0.4pt}
    \newpage
  }
}

% ----- For usage with pandoc converted documents -----------------------------

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
