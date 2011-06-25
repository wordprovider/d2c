<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<!-- 
   Root template for body text processing.
   Doesn't a have an equivalent in DITA so we created a "bodytext" template
-->
   
<xsl:template name="bodytext">

  <xsl:call-template name="setup-body"/>

\startbodymatter  

  <!-- Set up and build the headings [in headings.xsl] -->
  <xsl:call-template name="setup-headings"/>
  <xsl:apply-templates select="chapter"/>


\stopbodymatter

</xsl:template>


</xsl:stylesheet>
