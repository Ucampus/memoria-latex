%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%
%%%%%%%%	Clase U-Memoria
%%%%%%%%	Primer Autor: Nikolas Tapia M.
%%%%%%%%  Contacto: ntapia@dim.uchile.cl
%%%%%%%%	Version: 1.5
%%%%%%%%	Fecha: 10-07-2017
%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{umemoria}[2017/07/10 v1.5 Clase LaTeX para estandarizacion de Memorias U. de Chile]

%% Definicion de Condicionales
\newif\if@swapnum
\newif\if@contnum
\newif\if@spanish
\@swapnumfalse
\@contnumtrue
\@spanishtrue

%% Declaracion de Opciones
\DeclareOption{leftnum}{\@swapnumtrue}
\DeclareOption{rightnum}{\@swapnumfalse}
\DeclareOption{contnum}{\@contnumtrue}
\DeclareOption{nocontnum}{\@contnumfalse}
\DeclareOption{nospanish}{\@spanishfalse}
\DeclareOption{uprightd}{\AtEndOfPackage{\DeclareMathSymbol{d}{\mathalpha}{operators}{`d}}}
\DeclareOption{uprighte}{\AtEndOfPackage{\DeclareMathSymbol{e}{\mathalpha}{operators}{`e}}}
\DeclareOption{uprighti}{\AtEndOfPackage{\DeclareMathSymbol{i}{\mathalpha}{operators}{`i}}}
\DeclareOption{upright}{\ExecuteOptions{uprightd,uprighte,uprighti}}

%% Pasar Opciones a clase Book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt, openany]{book}

%% Packages necesarios
\RequirePackage[top=2cm, left=3cm, bottom=2cm, right=2cm, paper=letterpaper]{geometry} % Margenes
\RequirePackage{amsmath, amssymb, amsthm, graphicx} % Varios
\RequirePackage[pdfpagelabels]{hyperref} % Links y numeracion del PDF
\RequirePackage{listings} % Codigo Fuente
\RequirePackage{pgffor} % foreach

%% Lenguaje
\if@spanish
\RequirePackage[spanish, es-nolists, es-lcroman]{babel}
\addto\captionsspanish{\renewcommand\tablename{Tabla}}
\addto\captionsspanish{\renewcommand\contentsname{Tabla de Contenido}}
\addto\captionsspanish{\renewcommand\listtablename{\'Indice de Tablas}}
\addto\captionsspanish{\renewcommand\listfigurename{\'Indice de Ilustraciones}}
%% Agregar la bibliografía al índice
\addcontentsline{toc}{chapter}{Bibliograf\'ia}
\fi

%% Interlineado
\setlength{\parskip}{2ex} %interlineado doble

%% Renovar enumerate e itemize
\let\oldenum\enumerate
\let\oldendenum\endenumerate
\renewenvironment{enumerate}{\oldenum\setlength{\parskip}{\smallskipamount}}{\oldendenum}
\let\olditem\itemize
\let\oldenditem\enditemize
\renewenvironment{itemize}{\olditem\setlength{\parskip}{\smallskipamount}}{\oldenditem}

%% Entornos nuevos
%% TODO: Podría ser mejor usar minipage en vez de tabular
\newenvironment{abstract}{%
\cleardoublepage
\begin{flushright}
\small
\begin{tabular}{l}
RESUMEN DE LA MEMORIA PARA OPTAR \\
AL T\'ITULO DE \MakeUppercase\@carrera \\
POR: \MakeUppercase\@author \\
FECHA: \MakeUppercase\@date\\
PROF. GU\'IA: \foreach \x in \@guia { \MakeUppercase\x }
\end{tabular}
\end{flushright}
\begin{center}
\MakeUppercase\@title
\end{center}
}{\vfill\null}

\newenvironment{dedicatoria}{\cleardoublepage\null\vspace{\stretch{1}}\begin{flushright}\itshape}{\end{flushright}\vspace{\stretch{2}}\null}
\let\thanks\undefined
\newenvironment{thanks}{\cleardoublepage\chapter*{Agradecimientos}}{\vfill\null}
\newenvironment{intro}{\addcontentsline{toc}{chapter}{\protect\numberline{}Introducci\'on}\chapter*{Introducci\'on}}{\vfill\null}
\newenvironment{conclusion}{\addcontentsline{toc}{chapter}{\protect\numberline{}Conclusi\'on}\chapter*{Conclusi\'on}}{\vfill\null}

%% Teoremas, proofs, etc
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}\normalfont\topsep6\p@\@plus6\p@\relax\trivlist\item[\hskip\labelsep\scshape\footnotesize#1\@addpunct{.}]\ignorespaces}{\popQED\endtrivlist\@endpefalse}

\newtheoremstyle{miestilo}{\baselineskip}{3pt}{\itshape}{}{\bfseries}{}{.5em}{}
\newtheoremstyle{miobs}{\baselineskip}{3pt}{}{}{\bfseries}{}{.5em}{}
\if@swapnum
	\swapnumbers
\fi
\theoremstyle{miestilo}
\newtheorem{defn}{Definici\'on}[chapter]
\if@contnum
\newtheorem{teo}[defn]{Teorema}
\newtheorem{cor}[defn]{Corolario}
\newtheorem{lema}[defn]{Lema}
\newtheorem{prop}[defn]{Proposici\'on}
\else
\newtheorem{teo}{Teorema}[chapter]
\newtheorem{cor}{Corolario}[chapter]
\newtheorem{lema}{Lema}[chapter]
\newtheorem{prop}{Proposici\'on}[chapter]
\fi
\theoremstyle{miobs}
\newtheorem*{ej}{Ejemplo}
\newtheorem*{obs}{Observaci\'on}

%% TODO: Manejar todos los casos que aparecen en la
%%       pauta para la normalización de tesis.
%% Comandos para la portada
\global\let\@carrera\@empty
\newcommand{\setcarrera}[1]{\def\@carrera{#1}}
\let\carrera\setcarrera
\let\setcarrera\relax

\global\let\@memoria\@empty
\newcommand{\setmemoria}[1]{\def\@memoria{#1}}
\let\memoria\setmemoria
\let\setmemoria\relax

\global\let\@guia\@empty
\newcommand{\setguia}[1]{\def\@guia{#1}}
\let\guia\setguia
\let\setguia\relax

\global\let\@depto\@empty
\newcommand{\setdepto}[1]{\def\@depto{#1}}
\let\depto\setdepto
\let\setdepto\relax

\global\let\@comision\@empty
\newcommand{\setcomision}[1]{\def\@comision{#1}}
\let\comision\setcomision
\let\setcomision\relax

\global\let\@auspicio\@empty
\newcommand{\setauspicio}[1]{\def\@auspicio{#1}}
\let\auspicio\setauspicio
\let\setauspicio\relax

%%Portada
\renewcommand{\maketitle}{
	\begin{titlepage}
		\begin{minipage}{1.6cm}
			\includegraphics[scale=.12]{imagenes/escudoU2014.pdf}
		\end{minipage}
		\begin{minipage}[t]{12cm}
			UNIVERSIDAD DE CHILE\\FACULTAD DE CIENCIAS F\'ISICAS Y MATEM\'ATICAS\\\MakeUppercase\@depto
		\end{minipage}

		\vspace{2cm}
		\centering
			\MakeUppercase\@title

		\vspace{1cm}
			\MakeUppercase\@memoria

		\vspace{1cm}
			\MakeUppercase\@author

		\vspace{3cm}
			\foreach \x [count=\xi] in \@guia {
				PROFESOR GU\'IA\ifnum\xi>1 \ \xi \fi:\\ \MakeUppercase\x\\
			}

		\vspace{1cm}
			MIEMBROS DE LA COMISI\'ON:\\
			\foreach \x in \@comision { \MakeUppercase\x\\ }

		\if\@auspicio\@empty\else
		\vfill
			\normalfont
			Este trabajo ha sido parcialmente financiado por \@auspicio
		\fi

		\vfill
			SANTIAGO DE CHILE\\ \MakeUppercase\@date
	\end{titlepage}
}

%%Estilo del frontmatter
\newcommand{\ps@front}{
	\renewcommand{\thepage}{\roman{page}}
	\renewcommand{\@oddhead}{}
	\renewcommand{\@evenhead}{}
	\renewcommand{\@oddfoot}{\hfill\thepage\hfill}
	\renewcommand{\@evenfoot}{\hfill\thepage\hfill}
}

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
	\pagestyle{front}
	\oldfrontmatter
}
\let\oldfrontmatter\relax
