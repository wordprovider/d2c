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
  <xsl:text>\input tex/setup.tex</xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:text>\starttext</xsl:text>
  <xsl:value-of select="$newline"/>
  
  <!-- Title page -->
  <xsl:apply-templates select="title"/>


 

  <xsl:value-of select="$newline"/>
  <xsl:text>\stoptext</xsl:text>

</xsl:template>

</xsl:stylesheet>
