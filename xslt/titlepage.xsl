<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>
<xsl:strip-space elements="*"/>

<xsl:template match="title">

\input tex/titlepage.tex


% Activate the background for the title page 
\setupbackgrounds[page][titlepagebackground]

\dontleavehmode
\blank[6cm]
\startalignment[center]
\ssd <!-- guide title: --> <xsl:value-of select="."/> \par

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
