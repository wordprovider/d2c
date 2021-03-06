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
  Qualify the uicontrols with mode="menucascade" because there are none-menu 
  uicontrols which should be treated separately.
-->

<xsl:template match="uicontrol" mode="menucascade">
  <xsl:choose>
    <xsl:when test="position()&lt;last()">

      <!-- 
         Menu items before the last item.
         Example result:
         \wpMenuItem {File}
      -->
      <xsl:text>\wpMenuItem {</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
    
    </xsl:when>
    <xsl:otherwise>
      
      <!-- 
         The last menu item.
         Example result:
         \wpMenuItemLast {Options}
      -->
      <xsl:text>\wpMenuItemLast {</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
    
    </xsl:otherwise>
  </xsl:choose> 
</xsl:template>


<!--
    *******************
    Non-menu uicontrols 
    *******************
-->

<xsl:template match="uicontrol">

   <!-- 
      Example result:
      \wpUIControl {New}
   -->
  <xsl:text>\wpUIControl {</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text> 

</xsl:template>

<!--
    *********************** 
    End non-menu uicontrols 
    ***********************  
-->




<!-- Step lists in tasks -->

<xsl:template match="steps">
\wpSteps
<xsl:apply-templates select="step"/>
\wpStepsEnd
</xsl:template>

<xsl:template match="step">
\wpStep <xsl:apply-templates/>
\wpStepEnd
</xsl:template>

<xsl:template match="cmd">
\wpCmd <xsl:apply-templates/>
</xsl:template>

<xsl:template match="info">
\wpInfo <xsl:apply-templates/>
</xsl:template>

<xsl:template match="stepresult">
\wpStepResult <xsl:apply-templates/>
</xsl:template>

<!-- 
     *********************
     Choicetables in tasks 
     *********************
-->

<xsl:template match="choicetable">
<!-- The space below this line is necessary! -->

\starttable[|l|l|]
\HL
\VL header1 \VL header2 \VL \NR
\HL
\VL row1 \VL row2 \VL \NR
\stoptable
</xsl:template>

<xsl:template match="chhead">
\HC
\NC \bf {<xsl:value-of select="choptionhd"/>} \NC \bf {<xsl:value-of select="chdeschd"/>} \NC
\HC
</xsl:template>

<xsl:template match="chrow">
\NC <xsl:value-of select="choption"/> \NC <xsl:value-of select="chdesc"/> \NC
</xsl:template>

<!-- *** End choicetables *** -->


<!-- 
     ***********
        Images
     ***********
-->

<xsl:variable name="pxtocm">
  <xsl:text>0.025</xsl:text>
</xsl:variable>

<xsl:template match="image">
  <xsl:choose>

    <xsl:when test="@placement='break'">
    </xsl:when>
    <xsl:otherwise>
    <!--
        If placement isn't 'break' it's 'inline'.
        Example result:
        \wpImageInline {images/ormetis_btn.png}
     -->
     <xsl:text> \wpImageInline {</xsl:text><xsl:value-of select="@href"/><xsl:text>}</xsl:text> 
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- *** End images *** -->

<!--
    ************
    systemoutput
    ************
-->

<xsl:template match="systemoutput">

  <!-- 
     Example output:
     \wpSystemOutput {Scenario(2)}
  -->

  <xsl:text>\wpSystemOutput{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>

</xsl:template>
  

</xsl:stylesheet>
