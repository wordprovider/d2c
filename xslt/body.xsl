<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<<<<<<< HEAD
<!-- 
   Root template for body text processing.
   Doesn't a have an equivalent in DITA so we created a "bodytext" template.
-->
   
<xsl:template name="bodytext">

  <xsl:call-template name="setup-body"/>

\startbodymatter  

  <!-- Set up and build the headings [in headings.xsl] -->
  <xsl:call-template name="setup-headings"/>
  <xsl:apply-templates select="chapter"/>


\stopbodymatter

</xsl:template>

=======

<xsl:template name="bodytext">

\startbodymatter
\input input/body.tex

  <!--
     Build the hierarchy of headings, starting at Chapter.
     Hierarchy built in headings.xsl, headings defined in headings.tex.
     headings.xsl calls the "prolog", "conbody" and "taskbody" templates, 
     which bring us back to this file [see below].
  -->
  <xsl:apply-templates select="chapter"/>

\stopbodymatter

</xsl:template>

<xsl:template match="prolog">

\CONTEXT

</xsl:template>
>>>>>>> development

</xsl:stylesheet>
