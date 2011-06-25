<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<!--    
   The next few transforms build the hierarchy of levels.
   \Chapter is the root level.
   Concepts and topichead headings are formatted according to their level.
   Tasks always have the same heading.
   This is implemented in body.tex as \HeadingLevelI, HeadingLevelII..., HeadingTask.

   Why use a Roman numeral? Because TeX won't accept \Heading1, \Heading2..., and
   the Roman numeral is the same in any language.

   Example:

   \Chapter
     topichead          level 1      \HeadingLevelI
       concept          level 2      \HeadingLevelII
       topichead        level 2      \HeadingLevelII
         concept        level 3      \HeadingLevelIII 
       concept          level 2      \HeadingLevelII
         concept        level 3      \HeadingLevelIV
         task           [level 3]    \HeadingTask
       concept          level 2      \HeadingLevelII
       task             [level 2]    \HeadingTask
         concept        level 3      \HeadingLevelIII

-->

<xsl:template name="bodytext">

\startbodymatter
\input input/body.tex
 
  <xsl:apply-templates select="chapter"/>

\stopbodymatter

</xsl:template>

<xsl:template match="chapter">

\chapter{<xsl:value-of select="@navtitle"/>}  

  <xsl:apply-templates select="topicref | topichead"> 
    <xsl:with-param name="level" select="1"/>
  </xsl:apply-templates>

</xsl:template>

<!-- 
  The topichead transform adds a heading at the current level,
  then augments the level and calls the next topichead|topicref.
-->
<xsl:template match="topichead">
  <xsl:param name="level"/>

\HeadingLevel<xsl:number value="$level" ordinal="yes" format="I" lang="en"/> <xsl:text> </xsl:text> <xsl:value-of select="@navtitle"/>  

  <xsl:apply-templates select="topicref | topichead">
    <xsl:with-param name="level" select="$level+1"/>
  </xsl:apply-templates>

</xsl:template>
<!-- End topichead -->

<!--
  The topicref transform calls the concept/task element
  and passes it the current level, then augments the level
  and calls the next topicref|topichead.
-->
<xsl:template match="topicref">
  <xsl:param name="level"/>

  <xsl:apply-templates select="document(@href)/concept | document(@href)/task">
    <xsl:with-param name="level" select="$level"/>
  </xsl:apply-templates> 
  
  <xsl:apply-templates select="topicref | topichead">
    <xsl:with-param name="level" select="$level+1"/>
  </xsl:apply-templates>

</xsl:template>
<!-- End topicref -->
<!-- End of hierarchy-building transforms -->

<xsl:template match="concept">
  <xsl:param name="level"/>
  
\HeadingLevel<xsl:number value="$level" ordinal="yes" format="I" lang="en"/> <xsl:text> </xsl:text> <xsl:value-of select="title"/>  

</xsl:template>

<xsl:template match="task">
  <xsl:param name="level"/>
  
\HeadingTask <xsl:text> </xsl:text> <xsl:value-of select="title"/>

</xsl:template>


</xsl:stylesheet>
