<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="topicref">
  <xsl:apply-templates select="document(@href)/*"/>
  <xsl:value-of select="name()"/> 
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates/> 
</xsl:template>
<!-- 
<xsl:template match="concept">
  <xsl:apply-templates/>
</xsl:template> -->

<xsl:template match="*">
  <xsl:value-of select="name()"/> 
  <xsl:text>&#xa;</xsl:text>
  <xsl:for-each select="@*">
    <xsl:value-of select="name(parent::*)"/><xsl:text>:</xsl:text><xsl:value-of select="name()"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:for-each>
  <xsl:apply-templates/> 
</xsl:template>

<!-- 
<xsl:template match="@*">
 <xsl:text>attribute: </xsl:text><xsl:value-of select="name()"/><xsl:text> : </xsl:text><xsl:value-of select="name()"/>
  <xsl:apply-templates/> 
</xsl:template>
-->

<!-- Stop the default template from outputting a node's text. We want to control the output. --> 
<xsl:template match="text()"/>


</xsl:stylesheet>
