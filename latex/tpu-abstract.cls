\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tpu-abstract}[2026/05/29 v1.0 Tokyo Polytechnic University Master Thesis Abstract]

%--- Class option handling ------------------------------------------------------
% Page layout equivalent to: top=20mm, bottom=20mm, left/right=18mm (A4).
% line_length = 210 - 18*2 = 174mm.
% Margins are adjustable via \jlreqsetup{head_space=..., foot_space=..., gutter=...}
% in the document preamble if needed.
\PassOptionsToClass{%
  paper=a4paper,%
  fontsize=10pt,%
  head_space=20mm,%
  foot_space=20mm,%
  gutter=18mm,%
  line_length=174mm,%
  oneside,%
}{jlreq}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jlreq}}
\ProcessOptions\relax
\LoadClass{jlreq}

%--- Japanese font setup --------------------------------------------------------
% Title uses Gothic (\gtfamily); body uses Mincho (\mcfamily, the default).
% Falls back to HaranoAji (bundled in TeX Live 2020+) when MS fonts are absent
% (e.g. Linux devcontainers).
\RequirePackage{luatexja-fontspec}
\IfFontExistsTF{MS Mincho}{%
  \setmainjfont[BoldFont=MS Gothic]{MS Mincho}%
  \setsansjfont[BoldFont=MS Gothic]{MS Gothic}%
}{%
  \setmainjfont[BoldFont=HaranoAjiGothic-Regular]{HaranoAjiMincho-Regular}%
  \setsansjfont[BoldFont=HaranoAjiGothic-Regular]{HaranoAjiGothic-Regular}%
}

%--- Shared packages, metadata, bibliography, and PDF metadata ------------------
\RequirePackage{tpu-common}
\RequirePackage[compatibility=false]{caption}

%--- Page / column settings -----------------------------------------------------
\pagestyle{empty}
\setlength{\columnsep}{8mm}
\captionsetup{font=small, labelfont=bf}

%--- Section heading styles -----------------------------------------------------
% Labels: "1." / "1.1" / "1.1.1" — body-size bold, compact spacing.
% label_format controls the displayed number; \thesection is not modified
% so cross-references (\ref{}) stay clean (e.g. "1" not "1.").
\ModifyHeading{section}{
  font             = {\normalsize\bfseries},
  label_format     = {\arabic{section}.},
  after_label_space = 0.5\zw,
  lines            = 1,
  before_lines     = 1,
  after_lines      = 0,
  indent           = 0\zw,
}
\ModifyHeading{subsection}{
  font             = {\normalsize\bfseries},
  label_format     = {\arabic{section}.\arabic{subsection}},
  after_label_space = 0.5\zw,
  lines            = 1,
  before_lines     = 0.8,
  after_lines      = 0,
  indent           = 0\zw,
}
\ModifyHeading{subsubsection}{
  font             = {\normalsize\bfseries},
  label_format     = {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
  after_label_space = 0.5\zw,
  lines            = 1,
  before_lines     = 0.6,
  after_lines      = 0,
  indent           = 0\zw,
}

%--- Title block ----------------------------------------------------------------
% \maketitle starts two-column mode via \twocolumn[...].
% The bracketed argument spans both columns and shows:
%   - thesis title (centred, large bold)
%   - student ID / department + author / supervisor (right-aligned)
% \supervisor{name}{role}: role is stored in \tpu@supervisorrole (arg 2).
% \department{...} should already include "専攻" (e.g. "工学専攻").
\renewcommand{\maketitle}{%
  \twocolumn[{%
    \thispagestyle{empty}%
    \begin{center}%
      {\large\gtfamily\bfseries\tpu@thesistitle\par}%
    \end{center}%
    \vspace{0.6\baselineskip}%
    \begin{flushright}%
      学籍番号\ \tpu@studentid\par
      \tpu@department\ \tpu@authorname\par
      指導教員\ \tpu@supervisorrole\ \tpu@supervisorname\par
    \end{flushright}%
    \vspace{0.8\baselineskip}%
  }]%
}
