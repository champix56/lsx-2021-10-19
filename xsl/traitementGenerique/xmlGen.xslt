<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
		template de traitement generique d'un noeud pour sortie identique a l'entree
	-->
	<xsl:template match="*">
		<xsl:element name="{name()}">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="*|text()"/>
		</xsl:element>
	</xsl:template>
	<!--
		template pour sortie des @ttr identique a l'entree
	-->
	<xsl:template match="@*">
		<xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<!--
		template de declenchement du processus de transformation
	-->
	<xsl:template match="/">
		<xsl:apply-templates select="*"/>
	</xsl:template>
</xsl:stylesheet>
