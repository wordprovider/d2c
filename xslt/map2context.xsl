<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:include href="variables.xsl"/>
<xsl:include href="frontmatter.xsl"/>
<xsl:include href="titlepage.xsl"/>
<xsl:include href="body.xsl"/>

<xsl:template match="map">
  <!-- Initial setup -->
\input input/setup.tex
\starttext

  <!-- Title page -->
  <xsl:apply-templates select="title" mode="titlepage"/>

  <!-- Frontmatter -->
  <xsl:apply-templates select="topicgroup[@type='frontmatter']"/>

  <!-- Body text -->
  <xsl:apply-templates select="topichead"/>

\stoptext

</xsl:template>

</xsl:stylesheet>
