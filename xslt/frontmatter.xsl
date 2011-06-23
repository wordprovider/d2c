<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="topicgroup[@type='frontmatter']">



\startfrontmatter
\setuppagenumbering [
                      state=start,
                      location={footer,middle},
                      conversion=romannumerals,
                      left={--~},
                      right={~--}
                    ] 

  <!-- There are only concept elements in the frontmatter -->
  <xsl:apply-templates select="document(topicref/@href)/concept"/>  

\stopfrontmatter

</xsl:template>

<!-- Specific processing for the concepts in the frontmatter -->
<xsl:template match="concept">

  <xsl:apply-templates/>

</xsl:template>

<xsl:template match="title">

  \title <xsl:value-of select="."/>

</xsl:template>

<xsl:template match="p">

  <xsl:value-of select="."/>
  <xsl:value-of select="$newline"/>

</xsl:template>

</xsl:stylesheet>
