<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="prolog">
wibble
  <xsl:apply-templates/>
</xsl:template>

<!--
    Doesn't work without the following template. Why? 
    The default template should fire on "metadata", which then
    calls "keywords".
-->
<xsl:template match="metadata">
  <xsl:apply-templates/>
</xsl:template>


<!-- 
  Build the index entries. Result:
  
  \index{foo}
  \index{foo2+subfoo2}
  \index{foo3+subfoo3+subsubfoo3}
--> 
<xsl:template match="keywords">
  <!-- Call the top-level index entry -->
  <xsl:apply-templates select="indexterm" mode="toplevel"/>
</xsl:template>

<!-- Top-level entry: \index{subentries...} -->
<xsl:template match="indexterm" mode="toplevel">
  <xsl:value-of select="$newline"/> 
  <xsl:text>\index{</xsl:text>
  <xsl:value-of select="text()[1]"/>
  <!-- Add the subentries -->
  <xsl:apply-templates select="indexterm" mode="sublevel"/>
  <xsl:text>}</xsl:text>

</xsl:template>

<!-- Sub-level entry: +[entrytext] -->
<xsl:template match="indexterm" mode="sublevel">
  <xsl:text>+</xsl:text><xsl:value-of select="text()[1]"/>
  <!-- Recursively call this template for sub-subentries -->
  <xsl:apply-templates select="indexterm" mode="sublevel"/>
</xsl:template>

</xsl:stylesheet>
