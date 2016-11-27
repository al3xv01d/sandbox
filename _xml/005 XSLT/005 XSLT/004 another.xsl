<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- выполнение преобразований в новый xml -->
	
	<!-- выбираем все содержимое документа -->
	<xsl:template match="/">
		<mydata>
			<!-- выбираем все книги с атрибутом url -->
			<xsl:apply-templates select="/pricelist/book[@url]" />
		</mydata>
	</xsl:template>
	
	<!-- выбираем все элементы book -->
	<xsl:template match="book">
		<!-- создадим ссылки с атрибутами -->
		<div>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="@url" />
				</xsl:attribute>
				<xsl:value-of select="title" />	
			</a>
		</div>
	</xsl:template>

</xsl:stylesheet>