<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:include href="variables.xsl"/>
<xsl:include href="titlepage.xsl"/>

<xsl:template match="map">

  <!-- Initial setup -->
\input tex/setup.tex

\starttext

  <xsl:value-of select="$newline"/>
  
  <!-- Title page -->
  <xsl:apply-templates select="title"/>

\stoptext

</xsl:template>

</xsl:stylesheet>
