<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:a="urn:orsys:factures" xmlns:p="urn:orsys:produits">
<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<div>Mes factures avec ns<xsl:value-of select="/a:factures/@p:dateVersionStock"/></div>
				<hr/>
				<xsl:for-each select="/a:factures/a:facture">
					<div>Facture N° <xsl:value-of select="@numerofacture"/> en date du <xsl:value-of select="@datefacture"/>
						<br/>por le client : <xsl:value-of select="@idclient"/>
					</div>
					<table>
						<tr>
							<th>ref</th>
							<th>designation</th>
							<th>quant</th>
							<th>sous-total</th>
						</tr>
						<xsl:for-each select=".//a:line">
							<tr>
								<td><xsl:value-of select="a:produit/p:ref"/></td>
								<td><xsl:value-of select="a:produit/p:designation"/></td>
								<td><xsl:value-of select="a:quant"/></td>
								<td><xsl:value-of select="stotligne"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
