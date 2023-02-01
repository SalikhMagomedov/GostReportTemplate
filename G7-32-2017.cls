\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{G7-32-2017}[2023/01/26 Class for GOST Report]


% Опция, если нужно скомпилировать в XeLaTeX или LuaLaTeX
\newif\if@loadxelatex\@loadxelatexfalse
\DeclareOption{xelatex}{\@loadxelatextrue}


% Команда в которой хранится название стилевого файла
\newcommand{\@packageName}{G7-32-2017}
% Опция для настройки для отчета большого объема
\DeclareOption{big}{\PassOptionsToPackage{big}{\@packageName}}


% Класс, используемый в качестве основы для отчета.
\newcommand{\@baseClass}{report}
% Передача необработанных опций базовому классу
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseClass}}


\ProcessOptions\relax


\LoadClass[a4paper,12pt]{\@baseClass}


% Загружает нужные пакеты и шрифты в зависимости от наличии опции xelatex
\if@loadxelatex 
    \RequirePackage{fontspec} 
    \setromanfont{Times New Roman} 
\else 
    \RequirePackage{cmap} 
    \RequirePackage[T2A, T1]{fontenc} 
    \RequirePackage[utf8]{inputenc} 
    \RequirePackage{tempora} 
\fi


\RequirePackage[english,russian]{babel}
\RequirePackage{amsmath}
\RequirePackage{array}
\RequirePackage{\@packageName}


% Именование структурных элементов
% Список исполнителей
\newcommand\Executors{\chapter*{СПИСОК ИСПОЛНИТЕЛЕЙ}}
% Реферат
\newcommand\Referat{\chapter*{РЕФЕРАТ}}
% Содержание
\addto\captionsrussian{\renewcommand{\contentsname}{СОДЕРЖАНИЕ}}
% Термины и определения
\newcommand\Defines{\chapter*{ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ}}
% Перечень сокращений и обозначений
\newcommand\Abbreviations{\chapter*{ПЕРЕЧЕНЬ СОКРАЩЕНИЙ И ОБОЗНАЧЕНИЙ}}
% Введение
\newcommand\Introduction{\chapter{ВВЕДЕНИЕ}}
% Заключение
\newcommand\Conclusion{\chapter{ЗАКЛЮЧЕНИЕ}}
% Список использованных источников
\addto\captionsrussian{\renewcommand{\bibname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}
% Приложение
\addto\captionsrussian{\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}}
