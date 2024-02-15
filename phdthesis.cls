% Copyright 2024 Jurek Leonhardt

% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at

%     http://www.apache.org/licenses/LICENSE-2.0

% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[
  2024/02/13 Computer Science PhD thesis (Leibniz University Hannover)
]
\RequirePackage{setspace}
\RequirePackage[german]{datetime2}
\RequirePackage{amsthm}
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}

% --- class options ---
\newboolean{accepted}
\DeclareOption{accepted}{\setboolean{accepted}{true}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{scrbook}
}
\ProcessOptions\relax
\LoadClass[
  chapterprefix,
]{scrbook}

% --- layout ---
\let\raggedchapter\raggedleft
\renewcommand*{\chapterformat}{
  \scalebox{5}{\normalfont\textcolor{gray}{\thechapter}}
}

% --- environments ---
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

% --- defaults ---
\newcommand{\@titlewidth}{\textwidth}
\newcommand{\@formofaddress}{Frau/Herrn}
\newcommand{\@placeofbirth}{Ort, Land}
\newcommand{\@degree}{M\@. Sc\@.}
\newcommand{\@phdtype}{Doktor rerum naturalium}
\newcommand{\@phdtypeshort}{Dr\@. rer\@. nat\@.}
\DTMsavedate{dateofbirth}{1970-01-01}
\newcommand{\@coverpageyear}{\the\year{}}

% --- setters ---
\newcommand{\titlewidth}[1]{\renewcommand{\@titlewidth}{#1}}
\newcommand{\formofaddress}[1]{\renewcommand{\@formofaddress}{#1}}
\newcommand{\placeofbirth}[1]{\renewcommand{\@placeofbirth}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\phdtype}[2]{\renewcommand{\@phdtype}{#1}\renewcommand{\@phdtypeshort}{#2}}
\newcommand{\dateofpromotion}[1]{\DTMsavedate{dateofpromotion}{#1}}
\newcommand{\coverpageyear}[1]{\renewcommand{\@coverpageyear}{#1}}
\newcommand{\dateofbirth}[1]{\DTMsavedate{dateofbirth}{#1}}

% --- examiner list ---
\newcommand*\@examiners{}
\newcommand*\examiner[3][Referent]
{
  \ifx\@examiners\empty
    \def\@examiners{\textbf{#1}: #2\\\textit{#3}}
  \else
    \g@addto@macro\@examiners{\smallskip\\\textbf{#1}: #2\\\textit{#3}}
  \fi
}

% --- cover page ---
\newcommand{\makecover}{
  \thispagestyle{empty}
  \newgeometry{
    top=5cm,
    bottom=3cm,
  }
  \begin{center}
    \parbox{\@titlewidth}{
      \centering
      \Huge
      \fontseries{b}
      \selectfont
      \@title
    }
    \vfill
    \onehalfspacing
    \ifthenelse{\boolean{accepted}}{Von der}{Der} Fakult\"at f\"ur Elektrotechnik und Informatik\\
    der Gottfried Wilhelm Leibniz Universit\"at Hannover\\
    zur Erlangung des akademischen Grades\bigskip\\
    \textbf{\@phdtype}\\
    (abgek\"urzt: \@phdtypeshort)\bigskip\\
    \ifthenelse{\boolean{accepted}}{genehmigte}{vorgelegte} Dissertation
    \vfill
    von \@formofaddress\bigskip\\
    \textbf{\@degree \ \@author}\bigskip\\
    geboren am \DTMusedate{dateofbirth}\\
    in \@placeofbirth
    \vfill
    \@coverpageyear
  \end{center}
  \cleardoublepage
  \restoregeometry
}

% --- title page ---
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \vspace*{\fill}
  \noindent\textbf{\@title}\\
  \textit{Dissertation}\\
  \@author\bigskip\\
  \@examiners\bigskip\\
  \DTMifsaveddate{dateofpromotion}{
    Tag der Promotion: \DTMusedate{dateofpromotion}
  }{}
}
