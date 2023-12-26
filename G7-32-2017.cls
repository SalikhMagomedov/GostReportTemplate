\NeedsTeXFormat{LaTeX2e}
\newcommand{\@className}{G7-32-2017}
\ProvidesClass{\@className}[2023/01/26 Class for GOST Report]




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
    \RequirePackage{polyglossia}
    \setdefaultlanguage{russian}
    \setotherlanguage{english}
}{
    \RequirePackage{cmap} 
    \RequirePackage[T2A, T1]{fontenc} 
    \RequirePackage[utf8]{inputenc} 
    \RequirePackage{tempora} 
    \RequirePackage[english,russian]{babel}
}
\RequirePackage{amsmath}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{totcount}
\RequirePackage{xassoccnt}
% Пакет для настройти enumerate и itemize
\RequirePackage{enumitem}
% Объявление комманд для отделения структурных элементов от разделов отчета
\newcommand{\frontmatter}{}
\newcommand{\mainmatter}{}
\newcommand{\backmatter}{}
\RequirePackage{\@packageName}




% COMMANDS


% Cтруктурные элементы

% Титульный лист
\newcommand{\TitlePage}[1]{
    \input{#1}
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
            \ifbool{isAgreed}{СОГЛАСОВАНО}{}
            & &
            УТВЕРЖДАЮ
            \\
            \ifbool{isAgreed}{\AgreedInformation@Value}{}
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
            \ifbool{isAgreed}{
                \rule[-2mm]{0.2\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{подпись}}
            }{}
            & &
            \ifbool{isAgreed}{
                \ifbool{isAgreedFullName}{
                    \AgreedFullName@Value
                }{
                    \rule[-2mm]{0.22\textwidth}{0.2mm}
                    \newline
                    \centering{\footnotesize{расшифровка подписи}}
                }
            }{}
            & &
            \rule[-2mm]{0.2\textwidth}{0.2mm}
            \newline
            \centering{\footnotesize{подпись}}
            & &
            \ifbool{isApprovedFullName}{
                \ApprovedFullName@Value
            }{
                \rule[-2mm]{0.22\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{расшифровка подписи}}
            }
        \end{tabular}
        \begin{tabular}{
            p{0.4\textwidth}
            p{0.2\textwidth}
            p{0.4\textwidth}
        }
            \ifbool{isAgreed}{
                \rule[-2mm]{0.4\textwidth}{0.2mm}
                \newline
                \centering{\footnotesize{дата}}
            }{}
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
\newcommand{\Executors}[1]{
    \begin{singlespacing}
        \chapter*{СПИСОК ИСПОЛНИТЕЛЕЙ}
        \setlength{\tabcolsep}{0pt}
        \begin{longtable}{
        b{0.35\textwidth} 
        b{0.3\textwidth} 
        b{0.35\textwidth}
        }
            Руководитель НИР, & & \\
            \row[\HeadOfResearch@Chapters@Value]{\HeadOfResearch@Position@Value}{\HeadOfResearch@FullName@Value}

            \input{#1}

        \end{longtable}
        \setlength{\tabcolsep}{6pt}
    \end{singlespacing}
}

% Реферат
\newcommand{\Referat}[1]{
    \chapter*{РЕФЕРАТ}

    \input{#1}
    }

    % Термины и определения
    \newcommand{\Defines}[1]{
    \chapter*{ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ}

    В настоящем отчете о НИР применяют следующие термины с соответствующими определениями.
    \begin{itemize}[label=\empty,labelindent=0pt,itemindent=0pt]
        \input{#1}
    \end{itemize}
}

% Перечень сокращений и обозначений
\newcommand{\Abbreviations}[1]{
    \chapter*{ПЕРЕЧЕНЬ СОКРАЩЕНИЙ И ОБОЗНАЧЕНИЙ}

    В настоящем отчете о НИР применяют следующие сокращения и обозначения.
    \begin{itemize}[label=\empty,labelindent=0pt,itemindent=0pt]
        \input{#1}
    \end{itemize}
}

% Введение
\newcommand{\Introduction}[1]{
    \chapter{ВВЕДЕНИЕ}

    \input{#1}
}

% Заключение
\newcommand{\Conclusion}[1]{
    \chapter{ЗАКЛЮЧЕНИЕ}

    \input{#1}
}


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
\newbool{isAgreed}
% условие переключает письменный и печатный вид расшифровки подписи
\newbool{isAgreedFullName}
% Должность, сокращ. наимен. орг.
\newcommand{\AgreedInformation@Value}{}
% Расшифровка подписи
\newcommand{\AgreedFullName@Value}{}
\newcommand{\AgreedInformation}[2][]{
    \booltrue{isAgreed}

    \notblank{#1}{
        \booltrue{isAgreedFullName}
        \renewcommand{\AgreedFullName@Value}{#1}
    }{}

    \renewcommand{\AgreedInformation@Value}{#2}
}
% Утверждаю
% условие переключает письменный и печатный вид расшифровки подписи
\newbool{isApprovedFullName}
% Должность, сокращ. наимен. орг.
\newcommand{\ApprovedInformation@Value}{}
% Расшифровка подписи
\newcommand{\ApprovedFullName@Value}{}
\newcommand{\ApprovedInformation}[2][]{
    \notblank{#1}{
        \booltrue{isApprovedFullName}
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
% № раздела
\newcommand{\HeadOfResearch@Chapters@Value}{}
% 
\newcommand{\HeadOfResearch}[3][]{
    \renewcommand{\HeadOfResearch@Chapters@Value}{#1}
    \renewcommand{\HeadOfResearch@Position@Value}{#2}
    \renewcommand{\HeadOfResearch@FullName@Value}{#3}
}
% Место Год
\newcommand{\PlaceAndYear@Value}{}
\newcommand{\PlaceAndYear}[2]{
    \renewcommand{\PlaceAndYear@Value}{#1~#2}
}


% Реферат
% Количество книг
\newcommand{\TotalBooks@Value}{-1}
\newcommand{\TotalBooks}[1]{
    \renewcommand{\TotalBooks@Value}{#1}
}
% Количество рисунков
\newcommand{\TotalFigures@Value}{\TotalValue{totalfigures}}
\newcommand{\TotalFigures}[1]{
    \renewcommand{\TotalFigures@Value}{#1}
}
% Количество таблиц
\newcommand{\TotalTables@Value}{\TotalValue{totaltables}}
\newcommand{\TotalTables}[1]{
    \renewcommand{\TotalTables@Value}{#1}
}
% Количество использованных источников
\newcommand{\TotalBibItems@Value}{-1}
\newcommand{\TotalBibItems}[1]{
    \renewcommand{\TotalBibItems@Value}{#1}
}
% Количество приложений
\newcommand{\TotalAppendixes@Value}{\TotalValue{appendixchapters}}
\newcommand{\TotalAppendixes}[1]{
    \renewcommand{\TotalAppendixes@Value}{#1}
}
% Ключевые слова
\newcommand{\KeyWords@Value}{}
\newcommand{\KeyWords}[1]{
    \renewcommand{\KeyWords@Value}{#1}
}
% Окружение реферата
\apptocmd{\KeyWords}{
    % Добавление счетчика к табличам
    \AddAssociatedCounters{table}{totaltables}

    Отчет 
    \total{page}~c.%
    \ifnumcomp{\TotalBooks@Value}{>}{0}{, \TotalBooks@Value~кн.}{}%
    \ifnumcomp{\TotalFigures@Value}{>}{0}{, \TotalFigures@Value~рис.}{}%
    \ifnumcomp{\TotalTables@Value}{>}{0}{, \TotalTables@Value~табл.}{}%
    \ifnumcomp{\TotalBibItems@Value}{>}{0}{, \TotalBibItems@Value~источн.}{}%
    \ifnumcomp{\TotalAppendixes@Value}{>}{0}{, \TotalAppendixes@Value~прил.}{}%

    % Ключевые слова
    \MakeUppercase{\KeyWords@Value}
}{}{}




% SETTINGS


% Вызов ошибки при использовании \eqno{eqn num}
\renewcommand{\eqno}[1]{
    \ClassError{\@className}{%
        Command \protect\eqno{eqn num} is forbidden, use \protect\begin{equation}\label{...}\space.\space.\space.\space\protect\end{equation} instead%
    }{%
        Command \protect\eqno{eqn num} is forbidden, because if it isn't can be multiple equations with same number in report and this report require using \protect\eqref{label} instead a number
    }
}


% Именование структурных элементов
% Содержание
\addto\captionsrussian{\renewcommand{\contentsname}{СОДЕРЖАНИЕ}}
% Список использованных источников
\addto\captionsrussian{\renewcommand{\bibname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}
% Приложение
\addto\captionsrussian{\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}}


% Настройки реферата
% Добавление счетчиков
\regtotcounter{page}
% Счетчик для подсчета общего количества рисунков
\NewTotalDocumentCounter{totalfigures}
% Счетчик для подсчета общего количества таблиц
\NewTotalDocumentCounter{totaltables}
% Счетчик для подсчета количества приложений
\NewTotalDocumentCounter{appendixchapters}
% Связывание счетчиков
\DeclareAssociatedCounters{figure}{totalfigures}
\DeclareAssociatedCounters{table}{}
\DeclareAssociatedCounters{chapter}{}
