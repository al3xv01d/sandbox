<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- выполнение преобразований в новый xml -->
	
	<!-- выбираем все содержимое документа -->
	<xsl:template match="/">
		<mydata>
			<xsl:apply-templates select="/pricelist/book" />
		</mydata>
	</xsl:template>
	
	<!-- выбираем все элементы book -->
	<xsl:template match="book">
		<!-- создадим новый узел-элемент, в name выражение xpath заключим в фигурные скобки, 
    т.к по умолчанию ожидается строка -->
		<xsl:element name="{concat('item', position())}">
			<xsl:value-of select="title" />
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>