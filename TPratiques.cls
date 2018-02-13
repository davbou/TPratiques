% !TeX encoding = UTF-8

%--------------------------------------------------------------------------------------
%----------------------------------- identification -----------------------------------
%--------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TPratiques}%
              [2017/09/23 v1.0 Classe pour Travaux pratiques]
              
%--------------------------------------------------------------------------------------
%------------------------------------ initial code ------------------------------------
%--------------------------------------------------------------------------------------

% Flags logiques permettant l'insertion des listes des figures et des tableaux
\RequirePackage{ifthen}
\newboolean{InsererLogoTitre}



%--------------------------------------------------------------------------------------
%------------------------------- declaration of options -------------------------------
%--------------------------------------------------------------------------------------
\DeclareOption{LogoTitre}{\setboolean{InsererLogoTitre}{true}}
%\DeclareOption{lot}{\setboolean{InsererListeDesTableaux}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%--------------------------------------------------------------------------------------
%-------------------------------- execution of options --------------------------------
%--------------------------------------------------------------------------------------
\ProcessOptions \relax

%--------------------------------------------------------------------------------------
%----------------------------------- package loading ----------------------------------
%--------------------------------------------------------------------------------------
\LoadClass{article}

%Une grande partir de ces packages ne sont pas /absolument/
%Necessaires au bon fonctionement de la classe ils sont ici
%juste parce que je ne veux pas les loader a chaque fois


\RequirePackage[letterpaper]{geometry}			% Pour le format de la page marges/etc


\RequirePackage{lmodern}			      %                  %
\RequirePackage[utf8]{inputenc}			  %  Meilleur fonts  %	Nécessaires	
\RequirePackage[T1]{fontenc}			  %	                 %

\RequirePackage[USenglish,french]{babel}  %  Malhereusement nécessaier	

\RequirePackage{caption}    % Nécessaire pour les caption des figures
\RequirePackage{siunitx}	% Nécessaire pour symboles custom
\RequirePackage{array}     
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{graphicx}   % pour \includegraphics	
\RequirePackage{rotating}		
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
%\RequirePackage{fancyhdr}

\RequirePackage{mathtools}			% pour les jolis trucs mathematiques

%--------------------------------------------------------------------------------------
%-------------------------------------- main code -------------------------------------
%--------------------------------------------------------------------------------------

% Definitions des parametres du package hyperref
\hypersetup{plainpages=false,%
            breaklinks=false,%
            colorlinks=true,
        	allcolors=red}

% Definitions des dimensions de la page (package geometry)
\geometry{letterpaper,%
          centering,%
          hmargin={1.5cm,1.5cm},%
          vmargin={1.5cm,1.5cm},%
          heightrounded,%
}

% Mise en format des separateur de legende
\DeclareCaptionLabelSeparator{as-Babel-french}{\space\textendash\space}
\captionsetup{margin=0.1\textwidth,labelsep=as-Babel-french}
\captionsetup[table]{position=top}



% En-tete et bas de page par defaut

\pagestyle{myheadings}


%
\graphicspath{{./fig/}}

% Definitions de la page titre en fonction de LogoTitre
\ifthenelse{\boolean{InsererLogoTitre}}{ % Si LogoTitre est passe en parametre on affiche un Logo a cote du titre
	\renewcommand{\maketitle}{%
		\thispagestyle{empty}%
		\pagenumbering{arabic}%
		
		%Pour que le logo soit a cote de l'en-tete
		
		\begin{minipage}[tl]{0.2\textwidth}
			\includegraphics[width=\textwidth]{U_logo}  % logo de l'universite mettre dans fig/
		\end{minipage}
		\hfill % espace entre logo et titre
		{
			\begin{minipage}[tr]{0.75\textwidth}
				\centering
				{	\Large\bfseries \theTypeNum\ \theTitre } \\
				pr\'{e}sent\'{e} \`{a}     \theDestinataire  \ dans le cadre du cours \theSigle :\ \theCours          \\
				par \theNom\ \\ le \theDateRemise \\        
		\end{minipage}}
		
		\let\maketitle\relax%
	}
}
{ % Sinon on n'affiche que le titre
	\renewcommand{\maketitle}{%
		\thispagestyle{empty}%
		\pagenumbering{arabic}%
		\centering
		{	\Large\bfseries \theTypeNum\ \theTitre } \\
		pr\'{e}sent\'{e} \`{a}     \theDestinataire  \ dans le cadre du cours \theSigle :\ \theCours          \\
		par \theNom\ \\ le \theDateRemise \\        
		
		\let\maketitle\relax% ne pas avoir 2 titres si on met \maketitle dans le document
	}
}



% Fonctions pour modifier l'en-tete et la page titre

\def\TypeNum#1{\def\theTypeNum{#1}}          		  % Type et Numero ex: Rapport 1, TP7, etc...
\def\Titre#1{\def\theTitre{#1}}       				  % Titre du TP		
\def\Destinataire#1{\def\theDestinataire{#1}}         % Professeur qui reçoit le TP
\def\Sigle#1{\def\theSigle{#1}}         			  % Sigle du cours ex : GIF-6666
\def\Cours#1{\def\theCours{#1}}						  % Nom du cours ex : Informatique de l'enfer
\def\Nom#1{\def\theNom{#1}}              			  % Mon nom lol
\def\DateRemise#1{\def\theDateRemise{#1}}             % date de remise par defaut la date de compilation

 

% parametres par defaut 
\def\theTypeNum{TP1}                 		 % Type de travail et numéro ex : TP1, Raport1
\def\theTitre{Devoir qui fait chier}                  % Titre du devoir
\def\theDestinataire{Professeur X.}                    % Nom(s) du destinataire
\def\theSigle{GIF 6666}                              % Sigle du cours 
\def\theCours{Enfers informatique}					%Nom du cours
\def\theNom{David Boucher (111 128 156)}                % Nom de l'equipe
\def\theDateRemise{\today}                    % Date de remise       

% signes utilises relativement frequemment
\def\ohm{\si{\ohm}}

% commencer le numero juste le debut de section(Et non apres un saut de ligne)
\renewcommand\section{\@startsection {section}{1}{\z@}%
	{2.5ex \@plus 0.5ex \@minus .1ex}%
	{-0.1em}%
	{\normalfont\Large\bfseries}}

\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
	{2.5ex \@plus 0.5ex \@minus .1ex}%
	{- 0.1em}%
	{\normalfont\large\bfseries}}

\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\z@}%
	{2.5ex \@plus 0.5ex \@minus .1ex}%
	{-0.1em}%
	{\normalfont\Large\bfseries}}
%Numerotation des equations par rapport aux numeros
	\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
	

% Definition du niveau hierarchique maximum couvert par la table des matieres
\setcounter{tocdepth}{3}            % default = 2

% Definition du niveau hierarchique maximum ayant une numerotation
\setcounter{secnumdepth}{3}         % default = 2

% 
\AtBeginDocument{%
   \hypersetup{pdftitle={\theTitre},%
               pdfsubject={\theCours},%
               pdfauthor={\theNom}}%
}

% Selection de la langue "babel" par defaut
\AtBeginDocument{%
   \selectlanguage{french}%
}

% Changement des identificateur par defaut
\AtBeginDocument{%
   \renewcommand{\figurename}{\textsc{Figure}}%
   \renewcommand{\tablename}{\textsc{Tableau}}%
   
   \renewcommand{\thesection}{No \arabic{section}}			%No1, No2, ...
   \renewcommand{\thesubsection}{\alph{subsection})}		%a),b),...
   \renewcommand{\thesubsubsection}{\roman{subsubsection})} %i),ii),iii),iv),...
}

% Generation de la page titre et de l'en-tete
\AtBeginDocument{%
	\markright{\theSigle\ \theTypeNum\ \theNom}
	\maketitle
}


