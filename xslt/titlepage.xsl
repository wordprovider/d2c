<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="title">

  <xsl:text>\dontleavehmode</xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:text>\blank[6cm]</xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:text>\startalignment[center]</xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:text>\ssd </xsl:text><xsl:value-of select="."/><xsl:text> \par </xsl:text>
  <xsl:value-of select="$newline"/>

  <xsl:apply-templates select="../topicmeta"/>
 
  <xsl:text>\stopalignment</xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:text>\page</xsl:text>
  <xsl:value-of select="$newline"/>

</xsl:template>  

<xsl:template match="topicmeta">

  <xsl:text>\ssc Version </xsl:text><xsl:value-of select="prodinfo/vrmlist/vrm/@version"/> 
<xsl:value-of select="$newline"/>

</xsl:template>

</xsl:stylesheet>
