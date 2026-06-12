\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tpu-thesis}[2026/05/29 v1.0 Tokyo Polytechnic University Master Thesis]

%--- Class option handling ------------------------------------------------------
% Set defaults for jlreq before processing user options so they can override
\PassOptionsToClass{paper=a4paper,fontsize=12pt,report,open=any,oneside}{jlreq}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jlreq}}
\ProcessOptions\relax
\LoadClass{jlreq}

%--- Shared packages, metadata, bibliography, and PDF metadata ------------------
\RequirePackage{tpu-common}

%--- Cover page -----------------------------------------------------------------
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \centering
    \vspace*{2.5cm}
    {\large \tpu@fiscalyear 年度\quad 修士論文\par}%
    \vspace{1.5cm}
    {\LARGE \tpu@thesistitle\par}%
    \vfill
    {\large
      \tpu@submityear 年~\tpu@submitmonth 月\par
      \bigskip
      東京工芸大学\quad 大学院\quad 工学研究科\par
      \medskip
      \tpu@department\quad \tpu@laboratory\par
      \medskip
      学籍番号：\tpu@studentid\quad \tpu@authorname\par
      \medskip
      指導教員\quad \tpu@supervisorname\quad \tpu@supervisorrole\par
    }%
    \vspace{2cm}
  \end{titlepage}%
}

%--- Heading styles (sffamily bold, matching TPU sample) ------------------------
\ModifyHeading{chapter}{
  font = {\Large\sffamily\bfseries},
  label_format = {\thechapter},
  after_label_space = 0.5\zw,
  lines = 2,
  before_lines = 1,
  after_lines = 0,
  indent = 0\zw,
}
\ModifyHeading{section}{
  font = {\large\sffamily\bfseries},
  after_label_space = 0.5\zw,
  lines = 1,
  before_lines = 1,
  after_lines = 1,
}
\ModifyHeading{subsection}{
  font = {\normalsize\sffamily\bfseries},
  after_label_space = 0.5\zw,
  lines = 1,
  before_lines = 1,
  after_lines = 0.5,
}

%--- Front/main matter commands (report mode does not define these) -------------
% \frontmatter : roman page numbering for TOC etc.
% \mainmatter  : arabic page numbering, reset to 1, for body chapters
% \backmatter  : unnumbered closing sections (acknowledgements, bibliography)
\newcommand{\frontmatter}{%
  \clearpage
  \pagenumbering{roman}%
}
\newcommand{\mainmatter}{%
  \clearpage
  \pagenumbering{arabic}%
}
\newcommand{\backmatter}{\clearpage}

%--- Abstract environments ------------------------------------------------------
\renewenvironment{abstract}{%
  \clearpage
  \begin{center}%
    {\large\bfseries\tpu@thesistitleeng\par}%
    \medskip
    {\normalsize\bfseries\tpu@authornameeng\par}%
  \end{center}%
  \vspace{2\baselineskip}%
  \noindent{\Large Abstract}\par%
  \vspace{\baselineskip}%
  \noindent\ignorespaces
}{}

\newenvironment{jabstract}{%
  \clearpage
  \begin{center}%
    {\large\bfseries\tpu@thesistitle\par}%
    \medskip
    {\normalsize\bfseries\tpu@authorname\par}%
  \end{center}%
  \vspace{2\baselineskip}%
  \noindent{\Large 概要}\par%
  \vspace{\baselineskip}%
  \noindent\ignorespaces
}{}

%--- Acknowledgements environment -----------------------------------------------
\newenvironment{acknowledgements}{%
  \chapter*{謝辞}%
}{}

%--- TOC number column widths ---------------------------------------------------
% jlreq auto-calculates label width as max("9","26") rounded up + 2zw,
% which gives ~3zw for single-digit chapter numbers.
% Override with compact widths that still accommodate typical thesis numbering.
\AtBeginDocument{%
  \renewcommand{\l@chapter}   {\@dottedtocline{0}{0pt}{1.5\zw}}%
  \renewcommand{\l@section}   {\@dottedtocline{1}{0pt}{2\zw}}%
  \renewcommand{\l@subsection}{\@dottedtocline{2}{0pt}{2.5\zw}}%
}
