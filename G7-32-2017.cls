\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{G7-32-2017}[2023/01/26 Class for GOST Report]




% OPTIONS


\RequirePackage{etoolbox}
% Опция, если нужно скомпилировать в XeLaTeX или LuaLaTeX
\newbool{isXelatex}
\DeclareOption{xelatex}{\booltrue{isXelatex}}
% Команда в которой хранится название стилевого файла
\newcommand{\@packageName}{G7-32-2017}
% Опция для настройки для отчета большого объема
\DeclareOption{big}{\PassOptionsToPackage{big}{\@packageName}}
% Опция для нумерации внутри 
\DeclareOption{chapter-numbering}{\PassOptionsToPackage{chapter-numbering}{\@packageName}}
% Класс, используемый в качестве основы для отчета.
\newcommand{\@baseClass}{report}
% Передача необработанных опций базовому классу
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseClass}}

\ProcessOptions\relax
\LoadClass[a4paper,12pt]{\@baseClass}




% PACKAGES


% Загружает нужные пакеты и шрифты в зависимости от наличии опции xelatex
\ifbool{isXelatex}{
    \RequirePackage{fontspec} 
    \setromanfont{Times New Roman} 
}{
    \RequirePackage{cmap} 
    \RequirePackage[T2A, T1]{fontenc} 
    \RequirePackage[utf8]{inputenc} 
    \RequirePackage{tempora} 
}
\RequirePackage[english,russian]{babel}
\RequirePackage{amsmath}
\RequirePackage{array}
\RequirePackage{longtable}
% Объявление комманд для отделения структурных элементов от разделов отчета
\newcommand{\frontmatter}{}
\newcommand\mainmatter{}
\newcommand{\backmatter}{}
\RequirePackage{\@packageName}




% COMMANDS


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


% Элементы титульной страницы

% Наименование министерства (ведомства)
\newcommand{\MinistryName@Value}{}
\newcommand{\MinistryName}[1]{
    \renewcommand{\MinistryName@Value}{#1}
}
% Наименование 
\newcommand{\OrganizationName@Value}{}
\newcommand{\OrganizationName}[2]{
    \renewcommand{\OrganizationName@Value}{
        % Полное
        \MakeUppercase{#1}
        
        % Сокращенное
        (\MakeUppercase{#2})
    }
}
% Удк
\newcommand{\UdkIndex@Value}{}
\newcommand{\UdkIndex}[1]{
    \renewcommand{\UdkIndex@Value}{#1}
}
% Рег. № НИОКТР
\newcommand{\NioktrRegistrationNumber@Value}{}
\newcommand{\NioktrRegistrationNumber}[1]{
    \renewcommand{\NioktrRegistrationNumber@Value}{#1}
}
% Рег. № ИКРБС
\newcommand{\IkrbsRegistrationNumber@Value}{}
\newcommand{\IkrbsRegistrationNumber}[1]{
    \renewcommand{\IkrbsRegistrationNumber@Value}{#1}
}
% Согласовано
% условие отвечает за отображение блока
\newif{\if@agreed}{\@agreedfalse}
% условие переключает письменный и печатный вид расшифровки подписи
\newif{\if@agreedFullName}{\@agreedFullNamefalse}
% Должность, сокращ. наимен. орг.
\newcommand{\AgreedInformation@Value}{}
% Расшифровка подписи
\newcommand{\AgreedFullName@Value}{}
\newcommand{\AgreedInformation}[2][]{
    \@agreedtrue

    \notblank{#1}{
        \@agreedFullNametrue
        \renewcommand{\AgreedFullName@Value}{#1}
    }{}

    \renewcommand{\AgreedInformation@Value}{#2}
}
% Утверждаю
% условие переключает письменный и печатный вид расшифровки подписи
\newif{\if@approvedFullName}{\@approvedFullNamefalse}
% Должность, сокращ. наимен. орг.
\newcommand{\ApprovedInformation@Value}{}
% Расшифровка подписи
\newcommand{\ApprovedFullName@Value}{}
\newcommand{\ApprovedInformation}[2][]{
    \notblank{#1}{
        \@approvedFullNametrue
        \renewcommand{\ApprovedFullName@Value}{#1}
    }{}
    
    \renewcommand{\ApprovedInformation@Value}{#2}
}
% Наименование НИР
\newcommand{\NirReportName@Value}{}
\newcommand{\NirReportName}[2][]{
    \renewcommand{\NirReportName@Value}{
        \notblank{#1}{#1 \\ по теме:}{}
        
        \MakeUppercase{#2}
    }
}
% Вид отчета
\newcommand{\ReportType@Value}{}
\newcommand{\ReportType}[2][]{
    \renewcommand{\ReportType@Value}{#2\notblank{#1}{, № #1}{}}
}
% Наименование федеральной программы
\newcommand{\FederalProgramName@Value}{}
\newcommand{\FederalProgramName}[1]{
    \renewcommand{\FederalProgramName@Value}{#1}
}
% Номер книги
\newcommand{\BookNumber@Value}{}
\newcommand{\BookNumber}[1]{
    \renewcommand{\BookNumber@Value}{#1}
}
% Руководитель НИР
% должность
\newcommand{\HeadOfResearch@Position@Value}{}
% ФИО
\newcommand{\HeadOfResearch@FullName@Value}{}
% 
\newcommand{\HeadOfResearch}[2]{
    \renewcommand{\HeadOfResearch@Position@Value}{#1}
    \renewcommand{\HeadOfResearch@FullName@Value}{#2}
}
% Место Год
\newcommand{\PlaceAndYear@Value}{}
\newcommand{\PlaceAndYear}[2]{
    \renewcommand{\PlaceAndYear@Value}{#1~#2}
}


% Список исполнителей
% Команда для построения строки исполнителя в списке исполнителей
\newcommand{\row}[3][]{%
\small{#2}
\newline &
    \centering{\rule[-2mm]{0.29\textwidth}{0.2mm}}
    \centering{\footnotesize{подпись, дата}} &
    #3
    \newline
    \footnotesize{\notblank{#1}{(#1)}{}} 
    \\ & & \\
}
% Окружение списка исполнителей
\newenvironment{executors}[1][]{
    \Executors
    \setlength{\tabcolsep}{0pt}
    \begin{longtable}{
        b{0.35\textwidth} 
        b{0.3\textwidth} 
        b{0.35\textwidth}
    }
        
        Руководитель НИР, & & \\
        \row[#1]{\HeadOfResearch@Position@Value}{\HeadOfResearch@FullName@Value}
}{
    \end{longtable}
    \setlength{\tabcolsep}{6pt}
}




% SETTINGS


% Именование структурных элементов
% Список использованных источников
\addto\captionsrussian{\renewcommand{\bibname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}
% Приложение
\addto\captionsrussian{\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}}


% Добавление титульной страницы к началу документа
\AtBeginDocument{
    \begin{titlepage}
        
        \centering{
        
            \MinistryName@Value
            
            \OrganizationName@Value

        }
        
        \vspace{2em}
        
        \raggedright{
        
            УДК~\UdkIndex@Value
            
            Рег.~№~НИОКТР~\NioktrRegistrationNumber@Value
            
            Рег.~№~ИКРБС\notblank{\IkrbsRegistrationNumber@Value}{~\IkrbsRegistrationNumber@Value}{}
        
        }
        
        \vspace{2em}
        
        \setlength{\tabcolsep}{0pt}
        \begin{tabular}{
            p{0.45\textwidth}
            p{0.1\textwidth}
            p{0.45\textwidth}
        }
            \if@agreed СОГЛАСОВАНО \fi
            & &
            УТВЕРЖДАЮ
            \\
            \if@agreed \AgreedInformation@Value \fi
            & &
            \ApprovedInformation@Value
        \end{tabular}
        \begin{tabular}{
            p{0.2\textwidth}
            p{0.03\textwidth}
            p{0.22\textwidth}
            p{0.1\textwidth}
            p{0.2\textwidth}
            p{0.03\textwidth}
            p{0.22\textwidth}
        }
            \if@agreed
                \rule[-2mm]{0.2\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{подпись}}
            \fi
            & &
            \if@agreed
                \if@agreedFullName
                    \AgreedFullName@Value
                \else
                    \rule[-2mm]{0.22\textwidth}{0.2mm}
                    \newline
                    \centering{\footnotesize{расшифровка подписи}}
                \fi
            \fi
            & &
            \rule[-2mm]{0.2\textwidth}{0.2mm}
            \newline
            \centering{\footnotesize{подпись}}
            & &
            \if@approvedFullName
                \ApprovedFullName@Value
            \else
                \rule[-2mm]{0.22\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{расшифровка подписи}}
            \fi
        \end{tabular}
        \begin{tabular}{
            p{0.4\textwidth}
            p{0.2\textwidth}
            p{0.4\textwidth}
        }
            \if@agreed
                \rule[-2mm]{0.4\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{дата}}
            \fi
            & &
            \rule[-2mm]{0.4\textwidth}{0.2mm}
            \newline
            \centering{\footnotesize{дата}}
        \end{tabular}
        
        \vspace{2em}
        
        \centering{ \MakeUppercase{отчет \\ о научно-исследовательской работе} }
        
        \vspace{2em}
        
        \NirReportName@Value
        
        (\ReportType@Value)
        
        \vspace{2em}
        
        \notblank{\FederalProgramName@Value}{
            \FederalProgramName@Value
        }{}
        
        \notblank{\BookNumber@Value}{
            Книга~\BookNumber@Value
        }{}

        \vfill
        
        \begin{tabular}{
            b{0.2\textwidth} 
            b{0.25\textwidth} 
            b{0.1\textwidth} 
            b{0.2\textwidth}
            b{0.25\textwidth}
        }
            \empty
            &
            Руководитель НИР,
            \newline
            \HeadOfResearch@Position@Value
            \newline
            \empty
            & &
            \rule[-1mm]{0.2\textwidth}{0.2mm}
            \newline
            \centering\footnotesize{подпись, дата} & ~\HeadOfResearch@FullName@Value
            \newline
            \footnotesize{\empty}
        \end{tabular}
        
        \vfill
        
        \PlaceAndYear@Value
        
    \end{titlepage}
}
