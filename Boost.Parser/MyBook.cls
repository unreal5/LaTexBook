%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyBook}[2023/09/02 v0.0.1 MyBook]
\newcommand{\@baseclass}{ctexbook} % Base class name

% Set the default options
\PassOptionsToClass{a4paper}{\@baseclass}
\PassOptionsToClass{fontsize=11pt}{\@baseclass}
\PassOptionsToClass{parskip=half}{\@baseclass}
\PassOptionsToClass{headings=optiontoheadandtoc}{\@baseclass}

% Pass through any other options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}} 

\ProcessOptions\relax % Process the options

\LoadClass{\@baseclass} % Load the base class
%定义版面
%\RequirePackage[centering,text={18cm,23cm},showframe=false]{geometry}
%\RequirePackage[text={15cm,25cm},centering,headsep=20pt,top=0.8in,bottom = 0.8in,letterpaper,showframe=false]{geometry}
\RequirePackage[a4paper,inner=1.45cm,outer=2.45cm,top=2.45cm,bottom=3cm]{geometry} 

\RequirePackage{pslatex}                              
\RequirePackage[sc]{mathpazo}                         
\RequirePackage{helvet}
\linespread{1.07} 
\RequirePackage{xcolor}
\RequirePackage[scaled=0.83]{beramono}
\RequirePackage{chancery}
\RequirePackage{fancyhdr}
\RequirePackage{pstricks,fontawesome} %fontawesome for eyes
\RequirePackage{xparse}
\RequirePackage[many]{tcolorbox} 
\tcbuselibrary{skins,breakable}
\RequirePackage{tikz,tkz-tab}
\usetikzlibrary{positioning,shadows,backgrounds,calc}%
\RequirePackage{tikzpagenodes}
\RequirePackage{xargs} 
\RequirePackage{varwidth}

\definecolor{styrmitcrverdecomentario}{rgb}{0,0.5019,0}
\definecolor{colortitulo}{RGB}{0,0,122}     
\definecolor{colordominante}{RGB}{0,0,122}
\definecolor{colordominanteF}{RGB}{68,0,170}
\definecolor{colordominanteD}{RGB}{137,46,55} %暗红
\definecolor{mostaza}{RGB}{231,196,25}
\definecolor{amarilloM}{RGB}{248,199,90}
\definecolor{amarilloD}{RGB}{251,237,121}
\definecolor{azulF}{rgb}{.0,.0,.3}
\definecolor{grisD}{rgb}{.3,.3,.3}
\definecolor{grisF}{rgb}{.6,.6,.6}
\definecolor{grisamarillo}{RGB}{248,248,245} 
\definecolor{miverde}{RGB}{44,162,67}
\definecolor{verdep}{RGB}{166,206,58}
\definecolor{verdencabezado}{RGB}{166,206,58}
\definecolor{verdeF}{RGB}{5,92,8}
\colorlet{mygray}{black!20}

\definecolor{morado}{RGB}{80,12,207} % 
\definecolor{moradoB}{RGB}{136,0,170}

%设置英文字体
\RequirePackage{amssymb} % Must be loaded before unicode-math
\RequirePackage[force]{filehook} % Fixes an error
\RequirePackage{unicode-math} % Math fonts in xetexorluatex
\setromanfont[ % Libertinus Serif font
    Scale=1.04
]{Libertinus Serif}

\setsansfont[ % Libertinus Sans font
    Scale=1
]{Libertinus Sans}

\setmonofont[ % Libertinus Mono font
    Scale=.89,
    Path=./fonts/mononoki/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-BoldItalic,
    %Contextuals=AlternateOff   
]{mononoki}%{Liberation Mono}

\setmathfont{Libertinus Math} % Libertinus Math font

%定制章
\usepackage[explicit]{titlesec}

\makeatletter
\definecolor{myblue}{RGB}{0,0,122}
%节
% 以下定义节的格式为突出空白部分，对于内页过小的情况，效果不好，暂时注释。
%\renewcommand{\@seccntformat}[1]{\llap{\textcolor{black}{\csname the#1\endcsname}\hspace{1em}}}%

%\renewcommand{\section}{\@startsection{section}{1}{\z@}%\z@，移动距离为0，正为编号向内移动，负为向外移动。
%{4ex \@plus 1ex \@minus -.4ex}%标题前
%{2ex \@plus.2ex \@minus -.2ex}%标题后
%{\color{black}\normalfont\Large\sffamily\bfseries}}%
%
%\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
%{3ex \@plus 0.1ex \@minus -.4ex}
%{1ex \@plus.2ex }
%{\color{black}\normalfont\large\sffamily\bfseries}}%
%
%\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
%{2ex \@plus 0.1ex \@minus -.2ex}
%{0.5ex \@plus.2ex }
%{\color{black}\normalfont\sffamily}}%
%                 
%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
%{2ex \@plus.2ex \@minus .2ex}
%{0.2ex}
%{\normalfont\sffamily\bfseries}}%
\makeatother  

%############定义目录############%
\usepackage{framed}
\usepackage{titletoc}
\usepackage{calc}
\definecolor{doc}{RGB}{0,60,110}

%############结束定义目录############%

%定义页眉、页脚
% Page number command
\newcommand{\leftpagenumber}{%
    \begin{tikzpicture}[remember picture, overlay]
            %页号
            \node[below ,text=colordominanteF,font=\bfseries\fontsize{16}{16}\selectfont] at ([shift={(1cm,2cm)}]current page.south west) {\thepage};
            %页面上边输出右页要显示的内容（当前为左页）
            \node[below right,font=\small\upshape,text=azulF] at ([shift={(1.5cm,-1cm)}]current page.north west) {\begin{varwidth}{\linewidth}\rightmark\end{varwidth}};
            \node[text=azulF] at([shift={(7mm,0mm)}]current page.west){\rotatebox{90}{\parbox{\paperheight}{\centering\bfseries\large\leftmark}}};
    \end{tikzpicture}
}

\newcommand{\rightpagenumber}{%
    \begin{tikzpicture}[remember picture, overlay]
	        %页号
	        \node[below ,text=colordominanteF,font=\bfseries\fontsize{16}{16}\selectfont] at ([shift={(-1.cm,2cm)}]current page.south east) {\thepage};
	        %页面上边输出左页要显示的内容（当前为右页）
	        \node[below left,font=\small\upshape,text=azulF] at ([shift={(-1.5cm,-1cm)}]current page.north east) {\begin{varwidth}{\linewidth}\leftmark\end{varwidth}};
            \node[text=azulF] at([shift={(-7mm,0mm)}]current page.east){\rotatebox{-90}{\parbox{\paperheight}{\centering\bfseries\large\rightmark}}};                
    \end{tikzpicture}
}

\fancyhead[OR]{\rightpagenumber}
\fancyhead[OC,OL]{}
\fancyfoot[OL,OC,OR]{}%页脚空
\fancyfoot[EL,EC,ER]{}

\fancyhead[EL]{\leftpagenumber}
\fancyhead[EC,ER]{}
\renewcommand{\headrulewidth}{0pt}

%超链接
\RequirePackage{hyperref} % Required for hyperlinks
\RequirePackage{bookmark} % Required for pdf bookmarks

\PassOptionsToPackage{hyphens}{url} % Break long URLs and use hyphens to separate the pieces

% Color settings should be done in the next \hypersetup
\hypersetup{ % Set up hyperref options
    unicode, % Use unicode for links
    pdfborder={0 0 0}, % Suppress border around pdf
    %xetex,
    %pagebackref=true,
    %hyperfootnotes=false, % We already use footmisc
    bookmarksdepth=section,
    bookmarksopen=true, % Expand the bookmarks as soon as the pdf file is opened
    %bookmarksopenlevel=4,
    linktoc=all, % Toc entries and numbers links to pages
    breaklinks=true,
    colorlinks=true,
    linkcolor=azulF,
}
%\makeatletter
%\makeatletter

\RequirePackage[inline]{enumitem} % Used to customise lists (in particular, we don't want to put whitespace between items)
\renewcommand{\labelitemi}{\textbullet} % Use a bullet for the first level of \item's
\renewcommand{\labelitemii}{\small$\blacktriangleright$} % Use a black triangle for the second level of \item's

\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\setlist[description]{noitemsep}

%定义代码相关
% Listings code
\RequirePackage{listings} % Code
%\RequirePackage{minted} (must be loaded before scrhack)

\renewcommand*{\lstlistingname}{代码}
\renewcommand*{\lstlistingnamestyle}{\bfseries}
% Configure the listings
\definecolor{listingkeywords}{rgb}{0.0, 0.0, 1.0}
\definecolor{listingidentifiers}{rgb}{0, 0, 0}
\definecolor{listingcomments}{rgb}{0.25, 0.5, 0.5}
\definecolor{listingstrings}{rgb}{0.73, 0.13, 0.13}
\definecolor{listingnumbers}{rgb}{0.25, 0.25, 0.25}
% Define a fancy style
\lstnewenvironment{code}[1][]
{
    \lstset{
        language=[11]C++,
        columns=fixed,%fullflexible
        aboveskip=0.7\topskip,
        belowskip=0.7\topskip,
        basicstyle=\ttfamily,
        commentstyle=\color{listingcomments}\itshape,
        keywordstyle=\color{blue!75!black}\bfseries,
        numberstyle=\scriptsize\color{listingnumbers}\ttfamily,
        stringstyle=\color{listingstrings},
        identifierstyle=\color{listingidentifiers},
        backgroundcolor=\color{white},
        breakatwhitespace=false,
        breaklines=true,
        captionpos=t,
        keepspaces=true,
        showspaces=false,
        showstringspaces=false,
        showtabs=false,
        %numbers=left,
        %numbersep=1em,
        %frame=lines,
        %frame=l,   
        frame=none,
        framerule=.7pt,
        emph=[2]{override,final,std,move,forward},
        emphstyle=[2]{\color{cyan}\bfseries},       
        emph=[3]{UPROPERTY,UFUNCTION,UENUM,UCLASS,USTRUCT},
        emphstyle=[3]{\color{orange!70!black}\bfseries},
        emph=[4]{BlueprintType,EditDefaultsOnly,BlueprintReadOnly},
        emphstyle=[4]{\color{cyan!70!blue}},
        tabsize=2,
        numbers=none,
        %escapeinside=``,
        captionpos=b,%标题的位置
        #1
    }
}{}

\newcommand{\ci}[1]{
    \lstinline[language=C++,breakatwhitespace=false,breaklines,basicstyle=\ttfamily,identifierstyle=\color{blue},keywordstyle=\color{blue}\bfseries]{#1}%
}

\newcommand{\cppsign}{$C^{++}$}
\newcommand{\cpp}[1][11]{$C^{++ \mathbf{#1}}$}
\newcommand{\cssign}{$C{\#}$}



%定义盒子
%开始 note-------------------------------------------------------
\newtcolorbox{notebox}[1][]{%
    arc=0mm,breakable,
    enhanced,colback=white,
    boxrule=0pt,
    top=1mm, %Separación vertical - inicia texto
    bottom=1mm,
    left=25pt,
    enlarge top by=\baselineskip/2+1mm,
    enlarge top at break by=0mm,pad at break=2mm,
    fontupper={\begin{tikzpicture}[overlay]
    \node[draw=colordominanteF,line width=1pt,circle,fill=white,font=\sffamily\bfseries,inner sep=2pt,outer sep=0pt] at (-15pt,3pt){\textcolor{colordominanteF}{N}};\end{tikzpicture}}~\normalfont,  %"note..."+texto del cuerpo
    %Borde y círculo
    overlay first={
        \draw[color=white,line width=0.5pt] (frame.north west)--([xshift=0pt]frame.north east)--([xshift=0pt]frame.south east)--([xshift=0pt]frame.south west)--(frame.north west);
    },
    %Borde y círculo
    overlay first={
        \draw[color=white,line width=0.5pt] (frame.north west)--([xshift=0pt]frame.north east)--([xshift=0pt]frame.south east)--([xshift=0pt]frame.south west)--(frame.north west);
    },
    %Borde cambio de página
    overlay last={\draw[color=white,line width=0.5pt] (frame.north west)--([xshift=0pt]frame.north east)--([xshift=0pt]frame.south east)--([xshift=0pt]frame.south west)--(frame.north west);}
    #1}
%-
\newenvironment{note}[1][]{\bigskip\begin{notebox}#1}{\end{notebox}}
% 结束 note

\tcbuselibrary{xparse,hooks,skins,breakable,theorems}
%%%marker环境
\newtcolorbox{marker}[1][]{enhanced,before skip=2mm,
    after skip=3mm,fontupper=\rmfamily,
    boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
    colback=yellow!50,colframe=yellow!20!black,
    sharp corners,rounded corners=southeast,
    arc is angular,arc=3mm,underlay={%
        \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
        \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
        \path[fill=yellow!50!black,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
    drop fuzzy shadow,#1
}


%修改目录
%\contentsmargin{0cm}
%\titlecontents{chapter}[2.8cm]
%{\addvspace{30pt}\begin{tikzpicture}[remember picture, overlay]\draw[fill=white,draw=white] (-4,-.1) rectangle (0.0,0.5);\pgftext[left,x=-3.35cm,y=0.2cm]{\color{azulF}\Huge\sc\bfseries \ \thecontentslabel};\end{tikzpicture}\color{verdeF}\large\sc\bfseries}{}
%{}{\;\titlerule*[10pt]{$\cdot$}\;\Large\sc\bfseries \thecontentspage }[\addvspace{4pt}]
%
%
%\titlecontents{section}[2.4pc]{\addvspace{2pt}}
%{\contentslabel[\color{azulF}\thecontentslabel]{2.4pc}}
%{}
%{\titlerule*[6pt]{$\cdot$}\small \color{azulF}\thecontentspage}
%[\addvspace{2pt}]
%
%\titlecontents{subsection}[4.8pc]{\addvspace{2pt}}
%{\contentslabel[\color{myblue}\thecontentslabel]{2.4pc}}
%{}
%{\titlerule*[4pt]{$\cdot$}\small \color{azulF}\thecontentspage}
%[\addvspace{2pt}]


%%%%%%%%%%%%%%%%% TOC

\makeatletter
\definecolor{toc@color}{RGB}{50,153,187}
\definecolor{toc@bkcolor}{RGB}{255,153,0}

%\renewcommand\chaptermark[1]{\markboth{\textcolor{white}{#1}}{}}不要修改，页眉、页脚依赖\markboth
\renewcommand{\@pnumwidth}{3em}% To avoid a badbox for documents with more than 100 pages
\tikzset{toc rectangle/.style={color=toc@color,fill=toc@color}}    
\contentsmargin{-1.5cm}%


% Chapter style in the TOC
\titlecontents{chapter}[.8cm] %目录右移距离
{\addvspace{30pt}%
\begin{tikzpicture}[remember picture, overlay]%
    \draw[toc rectangle] (-4.5,-.1) rectangle (-1.5,.5);%
    \pgftext[left,x=-3.5cm,y=0.2cm]{\color{white}\large\bfseries\thecontentslabel};%
\end{tikzpicture}%
\large\bfseries\color{toc@bkcolor!80!black}}%
{\hspace{-1.cm}}%影响标题位置
{}
{\;\titlerule*[6pt]{$\cdot$}\;\large\bfseries 第~\thecontentspage~页}%
[\addvspace{.0cm}]%标题后竖直距离


% Section style in the TOC
\titlecontents{section}[1.cm]
{\addvspace{5pt}}
{%
\color{toc@color!80!black}\contentslabel[\thecontentslabel]{2pc}\color{black}}
{}
{\hfill\normalsize\color{toc@color!80!black}\thecontentspage\color{black}}
[\addvspace{0pt}]


% Subsection style in the TOC
\titlecontents{subsection}[1.5cm]
{\addvspace{1pt}\small\normalfont\sffamily\footnotesize}
{}
{}
{\hfill\small\color{azulF}\thecontentspage\color{azulF}}
[\addvspace{2pt}]


% Correct spacing between page header and TOC
\renewcommand{\tableofcontents}{%
\chapter*{\contentsname}%
\markboth{\contentsname}{}
% \def\@leftmark{\contentsname}%
\vspace{-30pt}%
\@starttoc{toc}}

\makeatother
