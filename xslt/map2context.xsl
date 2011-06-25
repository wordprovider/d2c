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

<!-- 
   The following imported stylesheets contain named templates which mainly contain Context setup code.
   We use XSL instead of \input\*.tex because sometimes we need to mix in some XSL processing.
-->
<xsl:include href="setup-initial.xsl"/>
<xsl:include href="setup-body.xsl"/>

<!-- Start transforming! -->

<xsl:template match="*"/>

<xsl:template match="bookmap">

\starttext

  <!-- Initial setup [in setup-initial.xsl] -->
  <xsl:call-template name="initialsetup"/>

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
