<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:include href="variables.xsl"/>
<xsl:include href="frontmatter.xsl"/>
<xsl:include href="titlepage.xsl"/>
<xsl:include href="headings.xsl"/>
<xsl:include href="body.xsl"/>
<<<<<<< HEAD
<xsl:include href="headings.xsl"/>
<!-- Named templates [in form "setup-foo"] containing Context setup markup: -->
<xsl:include href="setups.xsl"/>

<!-- Start transforming! -->
=======
<xsl:template match="*"/>
>>>>>>> development

<xsl:template match="bookmap">

\starttext

  <!-- Initial setup [in setup-initial.xsl] -->
  <xsl:call-template name="setup-initial"/>

  <!-- Title page [titlepage.xsl] -->
  <xsl:apply-templates select="booktitle"/>

  <!-- Frontmatter [frontmatter.xsl] -->
  <xsl:apply-templates select="frontmatter"/>

  <!-- 
      Body text. There is no equivalent DITA element, so we explicity call the "bodytext"
      template [body.xsl]. 
   -->
  <xsl:call-template name="bodytext"/>

</xsl:template>
  
</xsl:stylesheet>
