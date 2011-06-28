<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>


<xsl:template name="bodytext">

\startbodymatter
\input input/body.tex

  <!--
     Build the hierarchy of headings, starting at Chapter.
     Hierarchy built in headings.xsl, headings defined in headings.tex.
     headings.xsl calls the "prolog", "conbody" and "taskbody" templates. 
     Prolog processing is in prolog.xsl, the others are handled here.
  -->
  <xsl:apply-templates select="chapter"/>

\stopbodymatter

</xsl:template>

<xsl:template match="conbody">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template match="taskbody">

  <xsl:apply-templates/>

</xsl:template>



<xsl:template match="data">
 \type{<xsl:value-of select="."/>}
</xsl:template>

</xsl:stylesheet>
