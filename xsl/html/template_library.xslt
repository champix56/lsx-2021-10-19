<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY deg "&#176;">
	<!ENTITY euro "&#8364;">
]>
<!--
	fichier de librairie de template pour inclusion dans differentes transfo xsl
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
		definition minimal du format de nombre
	-->
	<xsl:decimal-format name="format_money" decimal-separator="," grouping-separator=" "/>
	<!--
		template name pour les statiques du sommaire
	-->
	<xsl:template name="base-sommaire">
		<h1>Sommaire</h1>
		<ul>
			<xsl:apply-templates select="//facture" mode="sommaire"/>
		</ul>
		<hr/>
	</xsl:template>
	<!--
		template match pour la generation de list item pour le sommaire
	-->
	<xsl:template match="facture" mode="sommaire">
		<li>
			<a href="#facture-{@numfacture}">
				<xsl:apply-templates select="@type"/> N&deg;<xsl:value-of select="@numfacture"/>
			</a>
			pour le client <xsl:value-of select="@idclient"/>
		</li>
	</xsl:template>
	<!--
		template pour la definition du text Facture/Devis par @type
	-->
	<xsl:template match="@type">
		<xsl:choose>
			<xsl:when test=".='Devis' or .='devis'">Devis</xsl:when>
			<xsl:otherwise>Facture</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
</xsl:stylesheet>
