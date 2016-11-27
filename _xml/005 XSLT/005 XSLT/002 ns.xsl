<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://мойсайт/courses/xml/">
<!-- выполнение преобразований с именнованными пространствами имен -->
	
	<!-- выбираем все содержимое документа -->
	<xsl:template match="/">
		<html>
			<head>Книги</head>
			<body>
				<h1>Книги (всего <xsl:value-of select="count(/a:pricelist/a:book)" />)</h1>
				<table border="1">
					<!-- выбираем все элементы book -->
					<xsl:apply-templates select="/a:pricelist/a:book" />
				</table>
			</body>
		</html>
	</xsl:template>
	
	<!-- выбираем все элементы book -->
	<xsl:template match="a:book">
		<tr>
			<!-- выбрать все вложенные узлы от текущего -->
			<xsl:apply-templates select="./a:*" />
			<!-- <xsl:apply-templates select="a:*" /> -->
		</tr>
	</xsl:template>
	
	<!-- выбираем все дочерние элементы элемента book -->
	<xsl:template match="a:book/a:*">
		<td>
			<!-- выводим содержимое этого узла -->
			<xsl:value-of select="." />
		</td>
	</xsl:template>

</xsl:stylesheet>