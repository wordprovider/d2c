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

<!-- 
    A hack!
    We use the <data> element to enclose text that needs to be
    escaped for TeX.
-->
<xsl:template match="data">\<xsl:value-of select="."/></xsl:template>


<!-- Paragraph -->
<xsl:template match="p">
  <xsl:apply-templates/> \par
</xsl:template>


<!-- Menus -->
<xsl:template match="menucascade">
   <xsl:apply-templates select="uicontrol" mode="menucascade"/>
</xsl:template>

<!--  
  Qualify with mode="menucascade" because there are none-menu uicontrols which
  must be styled differently.
-->

<!--
<xsl:template match="uicontrol" mode="menucascade-x">
  <xsl:text> {\bf </xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text> 
  <xsl:if test="position()&lt;last()">
    <xsl:text> \wpMenuSeparator </xsl:text>
  </xsl:if>
</xsl:template>
-->

<xsl:template match="uicontrol" mode="menucascade">
  <xsl:choose>
    <xsl:when test="position()&lt;last()">
\wpMenuItem {<xsl:apply-templates/>}<xsl:text/>
    </xsl:when>
    <xsl:otherwise>
\wpMenuItemLast {<xsl:apply-templates/>} 
    </xsl:otherwise>
  </xsl:choose> 
</xsl:template>


</xsl:stylesheet>
