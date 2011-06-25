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
   This is implemented in body.tex as \HeadingLevel1, HeadingLevel2..., HeadingTask.

   Example:

   \Chapter
     topichead          level 1      \HeadingLevel1
       concept          level 2      \HeadingLevel2
       topichead        level 2      \HeadingLevel2
         concept        level 3      \HeadingLevel3 
       concept          level 2      \HeadingLevel2
         concept        level 3      \HeadingLevel4
         task           [level 3]    \HeadingTask
       concept          level 2      \HeadingLevel2
       task             [level 2]    \HeadingTask
         concept        level 3      \HeadingLevel3

-->

<xsl:template match="chapter">

\chapter <xsl:value-of select="@navtitle"/>  

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

%topichead  level <xsl:value-of select="$level"/>  <xsl:value-of select="@navtitle"/>  

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
  
% concept <xsl:value-of select="title"/>  level  <xsl:value-of select="$level"/>

</xsl:template>

<xsl:template match="task">
  <xsl:param name="level"/>
  
% task <xsl:value-of select="title"/>  level <xsl:value-of select="$level"/>

</xsl:template>

<!-- This works 

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

-->



</xsl:stylesheet>
