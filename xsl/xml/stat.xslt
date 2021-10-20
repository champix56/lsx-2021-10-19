<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<statFactures>
			<!--application du templater pour les noeuds //factures selectionnés-->
			<xsl:apply-templates select="//facture"/>
		</statFactures>
	</xsl:template>
	<!--definition du model de presenation pour un noeud facture enfnat de factures-->
	<xsl:template match="facture">
		<facture>
			<dateFacture>
				<xsl:value-of select="@datefacture"/>
			</dateFacture>
			<nbArt>
				<xsl:value-of select="sum(lignes/ligne/nbUnit)"/>
			</nbArt>
			<totalFacture>
				<xsl:value-of select="sum(lignes/ligne/stotligne)"/>
			</totalFacture>
			<avgStotligne>
				<xsl:value-of select="sum(lignes/ligne/stotligne) div count(lignes/ligne/stotligne)"/>
			</avgStotligne>
		</facture>
	</xsl:template>
</xsl:stylesheet>
