{smcl}
{* *! version 0.0.1  07.04.2016}
{viewerdialog dzhwchana "dialog dzhwchana"}{...}
{vieweralsosee "[DZHW] shit" "Verlinkung zum Manual"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[DZHW] shit" "help DZHWshit"}{...}
{title:Title}

{p2colset 5 20 22 2}{...}
{p2col :dzhwchana {hline 2}}�ndert Variablennamen f�r DZHW-Datens�tze
{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:dzhwchana} [{varlist}] 
{{cmd:,}
{cmd: newname | oldname}}

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Option}
{synopt :{opt new:name}} nutzt neuen DZHW-Variablennammen f�r Variablen{p_end}
{synopt :{opt old:name}} nutzt alte DZHW-Variablennammen f�r Variablen{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}


{marker description}{...}
{title:Description}


{pstd}
{cmd:dzhwchana} �ndert den Variablenname der {varlist} in die neuen (nach der Logik des FDZ gesetzten) 
oder in alten (nach der Logik der Prim�rforschungprojekte gesetzten) Variablennamen um. Hierf�r m�ssen
die {help char} [dzhwnewvarname| dzhwoldvarname] der Variablen gesetzt sein und der Datensatz muss als 
DZHW-Datensatz getagt (_dta[dzhwdataset]== true) sein.




