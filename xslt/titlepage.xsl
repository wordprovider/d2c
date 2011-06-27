<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>


<!-- 
  Two approaches:
    i.   Define TeX commands and do the work in titlepage.tex ["buildtitlepageintex"]
    ii.  Do the work mainly in XSL ["buildtitlepageinxsl"]
-->
<xsl:template match="booktitle">
  <xsl:call-template name="buildtitlepageintex"/>
</xsl:template>

<!-- Use TeX -->

<xsl:template name="buildtitlepageintex">

  <!-- Title -->
  \def\wpGuideTitle{<xsl:value-of select="."/>}

  <!-- Product name -->
  \def\wpProductName{<xsl:value-of select="../bookmeta/prodinfo/prodname"/>}

  <!-- Product version -->
  \def\wpProductVersion{<xsl:value-of select="../bookmeta/prodinfo/vrmlist/vrm/@version"/>}

  <!-- Build the title page! -->
  \input input/titlepage.tex

</xsl:template>

<<<<<<< HEAD
\setupcolors[state=start]

\defineoverlay[WatermarkOverlay]
              [{\framed[frame=off,foregroundcolor=gray]
               {\scale[sx=12,sy=12]
               {\rotate[rotation=20.0]{Draft}}}}]

\setupbackgrounds[page][background=WatermarkOverlay]
=======
<!-- Use XSL -->

<xsl:template name="buildtitlepageinxsl">
>>>>>>> development


\setuppagenumbering[state=stop]
\dontleavehmode
\blank[6cm]
\startalignment[center]
\ssd <!-- guide title: --> <xsl:value-of select="."/>  \par
\blank[4cm]

  <xsl:apply-templates select="../bookmeta"/>

\stopalignment
\page

 <xsl:value-of select="$newline"/>

</xsl:template>  

<xsl:template match="bookmeta">

\ssc <xsl:value-of select="prodinfo/prodname"/> \par
\blank[1cm]
\ssc Version <xsl:value-of select="prodinfo/vrmlist/vrm/@version"/> 
<xsl:value-of select="$newline"/>

%\defineoverlay
%  [titlepagelogo]
%  [{externalfigure[teximages/ormetis_logo.png][width=\overlaywidth,height=\overlayheight]}]
%
%\frame[background={titlepagelogo}]{Hello there!}

</xsl:template>

</xsl:stylesheet>
