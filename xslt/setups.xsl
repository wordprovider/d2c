<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>


<xsl:template name="setup-initial">

\enableregime[utf]
\setupwhitespace[big]

</xsl:template>


<xsl:template name="setup-body">

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Page numbering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setuppagenumbering [
                      state=start,
                      location={footer,middle},
                      conversion=numbers
                    ]

\setuppagenumber [
                   number=1
                 ] 

</xsl:template>

<xsl:template name="setup-headings">

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Chapter %%%%


\def\MyChapterCommand#1#2% #1 is number, #2 is text
  {\framed[frame=off,bottomframe=on,topframe=on]
     {\vbox{\headtext{chapter} #1\blank#2}}} % \vbox is needed for \blank to work

\setuphead[chapter][command=\MyChapterCommand, style={\ss\bfa}]

\setupheadtext[chapter=Chapter] % used by \headtext

%%%% End Chapter %%%%





\definehead[HeadingLevelI][subject]

\setuphead [HeadingLevelI]
           [
            page=yes,continue=yes
           ]



\definehead[HeadingLevelII][subsubject]
\definehead[HeadingLevelIII][subsubject]
\definehead[HeadingLevelIV][subsubject]
\definehead[HeadingLevelV][subsubject]
\definehead[HeadingTask][subsubject]

</xsl:template>




</xsl:stylesheet>
