<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"/>
	<xsl:template match="/">numero facture;idclient;date facture;nb art;somme<xsl:for-each select="//facture">
	<!--	Mis en place d'un text non normaliser pour preserver le saut le ligne	-->
<xsl:text>
</xsl:text>
			<xsl:value-of select="@numfacture"/>;<xsl:value-of select="@idclient"/>;<xsl:value-of select="@datefacture"/>;<xsl:value-of select="sum(.//nbUnit)"/>;<xsl:value-of select="sum(.//stotligne)"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
