<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>

<xsl:template match="frontmatter">



\startfrontmatter
\setuppagenumbering [
                      state=start,
                      location={footer,middle},
                      conversion=romannumerals,
                      left={--~},
                      right={~--}
                    ] 

  <!-- There are only concept elements in the frontmatter -->
  <xsl:apply-templates select="document(topicref/@href)/concept" mode="frontmatter"/>  

\stopfrontmatter

</xsl:template>

<!-- Specific processing for the concepts in the frontmatter -->
<xsl:template match="concept" mode="frontmatter">

  <xsl:apply-templates mode="frontmatter"/>

</xsl:template>

<xsl:template match="title" mode="frontmatter">

  \title <xsl:value-of select="."/>

</xsl:template>

<xsl:template match="p" mode="frontmatter">

 <xsl:value-of select="."/> 
  <xsl:value-of select="$newline"/>

</xsl:template>

</xsl:stylesheet>
