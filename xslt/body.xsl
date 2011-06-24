<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<!-- 

   Concepts and topichead headings are formatted according to their level.
   This is implemented in body.tex as \headinglevel1, headinglevel2...
   So concepts and topicheads increment the 'level' parameter before passing it on.
   Tasks pass on the same value. They don't use the value to generate a value because they all use \HeadingTask for their headings.

   Example:

   topichead          level 1      \HeadingLevel1
     concept          level 2      \HeadingLevel2
     concept          level 2      \HeadingLevel2
       concept        level 3      \HeadingLevel3
     concept          level 2      \HeadingLevel2
       task           [level 3]    \HeadingTask
         concept      level 3      \HeadingLevel3

-->

<xsl:template match="chapter">

\chapter <xsl:value-of select="@navtitle"/>

  <xsl:apply-templates select="topicref | topichead"> 
    <xsl:with-param name="level" select="1"/>
  </xsl:apply-templates>

</xsl:template>

<xsl:template match="topichead">
  <xsl:param name="level"/>

%topichead  <xsl:value-of select="@navtitle"/>
% \headinglevel<xsl:value-of select="$level"/>

  <xsl:apply-templates select="topicref | topichead"> 
    <xsl:with-param name="level" select="$level+1"/>
  </xsl:apply-templates>


</xsl:template>

<xsl:template match="topicref">
  <xsl:param name="level"/>

% topicref: <xsl:value-of select="@href"/>
% \headinglevel<xsl:value-of select="$level"/>

  <xsl:apply-templates select="topicref | topichead"> 
    <xsl:with-param name="level" select="$level+1"/>
  </xsl:apply-templates>

</xsl:template>





</xsl:stylesheet>
