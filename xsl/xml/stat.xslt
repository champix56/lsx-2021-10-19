<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<statFactures>
			<!--application du templater pour les noeuds //factures selectionnés-->
			<xsl:apply-templates select="//facture">
				<xsl:sort select="@type" />				
				<xsl:sort select="@idclient" />
			</xsl:apply-templates>
		</statFactures>
	</xsl:template>
	<xsl:template match="@datefacture">
		<dateFacture>
			<xsl:value-of select="."/>
		</dateFacture>
	</xsl:template>
	<!--definition du model de presenation pour un noeud facture enfnat de factures-->
	<xsl:template match="facture">
		<facture type="{@type}">
			<xsl:apply-templates select="@datefacture"/>
			<nbArt>
				<xsl:value-of select="sum(.//nbUnit)"/>
			</nbArt>
			<totalFacture>
				<xsl:value-of select="sum(.//stotligne)"/>
			</totalFacture>
			<avgStotligne>
				<xsl:value-of select="sum(lignes/ligne/stotligne) div count(lignes/ligne/stotligne)"/>
			</avgStotligne>
		</facture>
	</xsl:template>
</xsl:stylesheet>
