<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="company">
    Название компании: <xsl:value-of select="./@name" /><br/>
    Год создания: <xsl:value-of select="/company/year" />
  </xsl:template>

</xsl:stylesheet>
