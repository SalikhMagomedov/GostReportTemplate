% Требуется выполнить компиляцию в XeLaTeX или LuaLaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{G7-32-2017}[2023/01/26 Class for GOST Report]

% COMMANDS
\newcommand{\@baseClass}{report} % Класс, используемый в качестве основы для отчета.

% OPTIONS
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseClass}} % Передача необработанных опций базовому классу
\ProcessOptions\relax

% CLASS
\LoadClass[a4paper,12pt]{\@baseClass}

% PACKAGES
% \RequirePackage{cmap} % Для возможности копирования теста из PDF-файла
% \RequirePackage[T2A, T1]{fontenc}
% \RequirePackage[utf8]{inputenc}
% \RequirePackage{tempora}
\RequirePackage[english,russian]{babel}
\RequirePackage{fontspec}
\RequirePackage[left=30mm,right=15mm,top=20mm,bottom=20mm,headsep=0pt]{geometry}
\RequirePackage{indentfirst}

% SETTINGS
% fontspec
\setromanfont{Times New Roman}
% 
\setlength\parindent{1.25cm}
