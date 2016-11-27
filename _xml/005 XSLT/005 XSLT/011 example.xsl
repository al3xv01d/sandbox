<?xml version="1.0" encoding="utf-8"?>
<!-- вывести списком, кадый нечетный - выделить серым фоном -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="utf-8" />
	
	<xsl:template match="/">
		<html>
			<body>
				<ul>
				<xsl:apply-templates select="/lab52/element" />
				</ul>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="element">
		<li>
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<xsl:attribute name="style">
						background-color:#ccc;
					</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:text>Name: </xsl:text>
			<xsl:value-of select="@name" />
			<xsl:text> - Value: </xsl:text>
			<xsl:value-of select="@value" />
		</li>
	</xsl:template>
	

</xsl:stylesheet>	