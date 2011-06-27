<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="text" indent="no"/>


<xsl:template name="bodytext">

\startbodymatter
\input input/body.tex
 
  <xsl:apply-templates select="chapter"/>

\stopbodymatter

</xsl:template>
</xsl:stylesheet>
