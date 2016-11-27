<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
root - корень
  </xsl:template>

  <xsl:template match="book">
    Ура!
  </xsl:template>

  <!--<xsl:template match="*|@*"> для всех тегов и атрибутов, которые не попали под прошлый match 
    Hello World
  </xsl:template>--> 

</xsl:stylesheet>