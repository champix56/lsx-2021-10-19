<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<statFactures>
			<factures>
				<nbArt>
					<xsl:value-of select="sum(//nbUnit)"/>
				</nbArt>
				<montantStotMax>
					<xsl:value-of select="max(.//stotligne)"/>
				</montantStotMax>
				<avgStotligne>
					<xsl:value-of select="sum(.//stotligne) div count(.//stotligne)"/>
				</avgStotligne>
			</factures>
			<!--application du templater pour les noeuds //factures selectionnés-->
			<xsl:apply-templates select="//facture">
				<xsl:sort select="@type"/>
				<xsl:sort select="@idclient"/>
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
		<!--<facture type="{@type}">-->
		<xsl:element name="{name()}">
			<xsl:attribute name="type"><!--remplissage conditionnel de la valeur de l'@ttrib--><xsl:choose><xsl:when test="@type='devis' or @type='Devis'">Devis</xsl:when><xsl:otherwise>Facture</xsl:otherwise></xsl:choose></xsl:attribute>
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
		</xsl:element>
		<!--</facture>-->
	</xsl:template>
</xsl:stylesheet>
