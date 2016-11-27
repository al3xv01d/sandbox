<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- выбираем все содержимое документа -->
	<xsl:template match="/">
		<html>
			<body>
				<!-- вставим содержимое документа в обертку -->
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	
	<!-- выбираем все процессинговые инструкции -->
	<xsl:template match="processing-instruction()">
		<div style="color:blue;">
			<!-- выводим "себя"(инструкции) синим -->
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	
	<!-- выбираем все комментарии -->
	<xsl:template match="comment()">
		<div style="color:green;">
			<!-- выводим "себя"(комменты) зеленым -->
			<xsl:value-of select="." />
		</div>
	</xsl:template>
	
	<!-- выбираем корневой элемент pricelist -->
	<xsl:template match="pricelist">
		<!-- выбираем все элементы book -->
		<xsl:apply-templates select="/pricelist/book" />
	</xsl:template>
	
	<!-- выбираем все элементы book с ценой больше 120 -->
	<xsl:template match="book[price &gt; 120]">
		<div style="color:red;">
			<!-- выводим все названия -->
			<xsl:value-of select="title" />
			<!-- вызываем шаблон hello -->
			<xsl:call-template name="hello" />
		</div>
	</xsl:template>
	
	<!-- выбираем все элементы book -->
	<xsl:template match="book">
		<div>
			<!-- выводим все названия -->
			<xsl:value-of select="title" />
		</div>
	</xsl:template>
	
	<!-- создадим именнованный шаблон hello (сработает во время вызова) -->
	<xsl:template name="hello">
		<div>
			Hello, world!
		</div>
	</xsl:template>

</xsl:stylesheet>