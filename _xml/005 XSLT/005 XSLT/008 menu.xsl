<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xhtml="http://www.w3.org/1999/xhtml">
<!-- вывести рекурсивно меню в html -->
	
	<xsl:output method="html" />
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Пример меню</title>
			</head>
			<body>
				<h1>Пример меню</h1>
				<ul>
					<xsl:apply-templates select="/menu/menuItem" />
				</ul>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="menuItem">
		<li>
			<a href="{@link}">
				<xsl:value-of select="@title" /> 
			</a>
			<ul>
				<xsl:apply-templates select="menuItem" />
			</ul>
		</li>
	</xsl:template>

</xsl:stylesheet>