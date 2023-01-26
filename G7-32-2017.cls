\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{G7-32-2017}[2023/01/26 Class for GOST Report]

% COMMANDS
\newcommand{\@baseClass}{report} % Класс, используемый в качестве основы для отчета.

% PACKAGES
\RequirePackage{cmap} % Для возможности копирования теста из PDF-файла
\RequirePackage[T2A, T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,russian]{babel}

% OPTIONS
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseClass}} % Передача необработанных опций базовому классу
\ProcessOptions\relax

% CLASS
\LoadClass[a4paper,12pt]{\@baseClass}