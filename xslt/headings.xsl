<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>


<!--    
   These transforms build the hierarchy of levels.
   \Chapter is the root level.
   We can implement chapters as headings or as separate pages.
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

<!-- Add the chapter headings then look for topicrefs|topicheads beneath them.
     A chapter "heading" can in fact be a separate chapter page.
 -->
<xsl:template match="chapter">

  <!-- 
      Chapter as separate page.
      ========================
  -->
  
  <!-- Set up the chapter title -->
\def\wpChapterHeadingText{<xsl:value-of select="@navtitle"/>}

  <!-- Build the chapter page! -->
\input input/chapterpage.tex

  <!--
     Chapter as heading.
     ==================
  -->

<!-- \chapter{<xsl:value-of select="@navtitle"/>} --> 

  <!-- Start building the hierarchy below the chapters --> 

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

\wpHeadingLevel<xsl:number value="$level" format="I"/> <xsl:text> </xsl:text> <xsl:value-of select="@navtitle"/>  

  <xsl:apply-templates select="topicref | topichead">
    <xsl:with-param name="level" select="$level+1"/>
  </xsl:apply-templates>

</xsl:template>

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

<xsl:template match="concept">
  <xsl:param name="level"/>
  
\wpHeadingLevel<xsl:number value="$level" format="I"/> <xsl:text> </xsl:text> <xsl:value-of select="title"/> 

  <xsl:apply-templates select="prolog"/>
  <xsl:apply-templates select="conbody"/>

</xsl:template>

<xsl:template match="task">
  <xsl:param name="level"/>
  
\wpHeadingTask <xsl:text> </xsl:text> <xsl:value-of select="title"/>

  <xsl:apply-templates select="prolog"/>
  <xsl:apply-templates select="taskbody"/>

</xsl:template>

</xsl:stylesheet>
