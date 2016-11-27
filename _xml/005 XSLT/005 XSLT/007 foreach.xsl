<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xhtml="http://www.w3.org/1999/xhtml">
<!-- конструкция choose и for-each -->
	
	<xsl:output method="html" />
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Что есть на складе</title>
			</head>
			<body>
				<h1>Что есть на складе</h1>
				<ul>
					<xsl:for-each select="/demo57/item">
						<li>
							<xsl:choose>
								<xsl:when test="@color='красный'">
									<xsl:attribute name="style">
										background-color:#fcc;
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color='синий'">
									<xsl:attribute name="style">
										background-color:#ccf;
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color='желтый'">
									<xsl:attribute name="style">
										background-color:#ffc;
									</xsl:attribute>
								</xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="style">
                    background-color:#ccc;
                  </xsl:attribute>
                </xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="@name" />
						</li>
					</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>