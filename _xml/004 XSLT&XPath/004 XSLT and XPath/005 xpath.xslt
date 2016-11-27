<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/pricelist/book">
    <xsl:value-of select="author"/> <!--от текущего взяли дочерний ./select-->
  </xsl:template>
</xsl:stylesheet>