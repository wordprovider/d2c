<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="booktitle">



% Activate the background for the title page 
% \setupbackgrounds[page][titlepagebackground]

\setuppagenumbering[state=stop]
\dontleavehmode
\blank[6cm]
\startalignment[center]
\ssd <!-- guide title: --> <xsl:value-of select="."/> \par
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
