<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- пример сортировки -->
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Пример сортировки</title>
			</head>
			<body>
				<ul>
					<xsl:apply-templates select="/pricelist/book">
						<xsl:sort select="price" data-type="number" />
					</xsl:apply-templates>
				</ul>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="book">
		<li>
			<xsl:for-each select="*">
				<xsl:value-of select="name()" />
				<xsl:text>: </xsl:text>
				<xsl:value-of select="." />
				<br />
			</xsl:for-each>
		</li>
	</xsl:template>

</xsl:stylesheet>