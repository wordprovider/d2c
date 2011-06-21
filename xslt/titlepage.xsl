<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>
<xsl:strip-space elements="*"/>

<xsl:template match="title">

% Background layer with image
\definelayer[titlepagebackground]
            [
             x=0mm,
             y=0mm,
             width=\paperwidth,
             height=\paperheight
            ]

% Activate the background for the title page 
\setupbackgrounds[page][titlepagebackground]

\dontleavehmode
\blank[6cm]
\startalignment[center]
\ssd <xsl:value-of select="."/> \par

  <xsl:apply-templates select="../topicmeta"/>

\stopalignment
\page

 <xsl:value-of select="$newline"/>

</xsl:template>  

<xsl:template match="topicmeta">

\ssc Version <xsl:value-of select="prodinfo/vrmlist/vrm/@version"/> 
<xsl:value-of select="$newline"/>

</xsl:template>

</xsl:stylesheet>
