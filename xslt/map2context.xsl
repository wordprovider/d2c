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

<xsl:template match="*"/>

<xsl:template match="bookmap">
  <!-- Initial setup -->
\input input/setup.tex
\starttext

  <!-- Title page -->
  <xsl:apply-templates select="booktitle"/>

  <!-- Frontmatter -->
  <xsl:apply-templates select="frontmatter"/>

  <!-- Body text. Because there is no equivalant top-level bodytext element in a bookmap, we have to include some text here, rather than keeping it all in the body.xsl file -->
\startbodymatter
\input input/body.tex
 
  <xsl:apply-templates select="chapter"/>

\stopbodymatter

\stoptext

</xsl:template>

</xsl:stylesheet>
