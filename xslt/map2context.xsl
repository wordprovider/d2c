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
<xsl:include href="prolog.xsl"/>
<xsl:include href="headings.xsl"/>


<!-- <xsl:strip-space elements="*"/> -->

<xsl:template match="bookmap">
  <!-- Initial setup -->
\input input/setup.tex
\starttext

  <!-- Title page -->
  <xsl:apply-templates select="booktitle"/>

  <!-- Frontmatter -->
  <xsl:apply-templates select="frontmatter"/>

  <!-- 
      Body text. There is no equivalent DITA element, so we explicity call the "bodytext"
      template. 
   -->
  <xsl:call-template name="bodytext"/>

\stoptext

</xsl:template>
  
</xsl:stylesheet>
