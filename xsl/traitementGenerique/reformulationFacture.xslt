<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:include href="./xmlGen.xslt"/>
	<!--
		traitement specifique pour la reformulation
	-->	
	<xsl:template match="@type">
		<xsl:attribute name="type">
			<xsl:choose>
				<xsl:when test="contains(.,'evis')">Devis</xsl:when>
				<xsl:otherwise>Facture</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<!--
		reformulation d'une balise facture pour ajout d'un client depuis clients.xml
	-->
	<xsl:template match="facture">
		<xsl:element name="facture">
			<xsl:apply-templates select="@*"/>
			<xsl:variable name="idc"><xsl:value-of select="@idclient"/></xsl:variable>
			<!-- copie profonde noeud + @ttr + children )de l'element qui est selectionné-->
			<xsl:copy-of select="document('clients.xml')/clients/client[@id=$idc]"/>
			<xsl:apply-templates select="*"/>
		</xsl:element>
	</xsl:template>
	<!--
		traitement null d''une balise client pour empecher la generation de la balise et de son contenu
	-->
	<xsl:template match="facture/client"/>
</xsl:stylesheet>
