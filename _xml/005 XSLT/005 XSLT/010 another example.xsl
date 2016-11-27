<?xml version="1.0" encoding="utf-8"?>
<!-- выполнение преобразований в новый xml -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" encoding="utf-8" />
	
	<xsl:template match="/">
		<labResult>
			<xsl:comment>Всего <xsl:value-of select="count(/lab5/element)" /> элементов</xsl:comment>
			<xsl:apply-templates select="/lab5/element" />
		</labResult>
	</xsl:template>

	<xsl:template match="element">
		<xsl:element name="{@name}">
			<xsl:value-of select="@value" />
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>	