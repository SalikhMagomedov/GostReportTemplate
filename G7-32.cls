% This package designed and commented in russian koi8-r encoding.
%
% ����� ���������� �� ���� 7.32-2001 "��ޣ� � ������-����������������� ������"
% �� ������ ���� 2.105-95
% ����� - ������� �����, � ������� ������ �������� latex-gost-request@ice.ru,
%  "extreport.cls", "lastpage.sty" � ����������� RU.TEX
% �������� GPL
% ��� �������, ��������� � ��������� ����: mailto:alxt@yandex.ru
% ���������� ���������� � ��������� - ������ ������,
% ��������� ����� �� ������ mydebianblog@gmail.com

% ���������:
%  a4paper, a5paper - ������ ������. ��-���������- a4paper.
%  econom - ��������� ��������. ��-��������� ���.
%  10pt, 12pt, 14pt - �����. ��-���������- 14pt
%  draft, final - ��� ������. ��-���������- final
%  usehyperref - � DVI/PDF ��� ������ ����� �������. ��-��������� ���.
%  usepscyr    - ������������ ��������� ����� PsCyr. ��-��������� ���.
%  cp866,koi8-r,cp1251 - ��������� ������. ��-��������� koi8-r.

% � ���������� � ����������� ����� ���������� \subsection{} � \subsubsection{}
% ���� \nsubsection � \nsubsubsection (������ ��� ����������),
% ������� ������ �����, ������ ������, �� �� ��������� � ���������� -
% ������ � ��������� ��� ����������, � �������� ����

% ��� ���������� ������:
% hyperref    - �����ң����� ������ �������, � ���������� unicode (���� usehyperref)
% mathtext    - ��� ������� ���� � ��������
% fontenc     - ��������� ������� - T2A
% inputenc    - ������� ��������� - �������� ����������
% babel       - ��������� ������ - ������� � ����������
% geometry    - ������������� ������ �����
% fancyhdr    - ������������� �����������
% indentfirst - �������� ������ � ������� ������
% footmisc    - ������������� ������ ������ ����� ��������
% caption2    - ��������� ���� ���������� ������ � ��������
% amssymb     - ��� ������� "������ ��� �����" "������ ��� �����"
% ������������ ������ ������� extsizes.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{G7-32}[2003/07/01 v1.0 Non Standard LaTeX document class]

\input{GostBase.clo}

\RequirePackage[left=30mm,right=15mm,top=20mm,bottom=20mm,headsep=0pt]{geometry}
% \RequirePackage[left=20mm,right=10mm,top=20mm,bottom=20mm,headsep=0pt]{geometry}
\RequirePackage{G7-32}

% \renewcommand{\baselinestretch}{1.0}

\setlength{\parindent}{1.25cm}

\endinput
% End of file `G7-32.cls'.
