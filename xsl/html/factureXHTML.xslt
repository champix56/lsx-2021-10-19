<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY deg "&#176;">
	<!ENTITY euro "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<!--
		sortie XML pour XHTML(XML+HTML) avec mise place de doctype html (public & system)
	-->
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes"/>
	<!--inclusion de la libray de templates-->
	<xsl:include href="./template_library.xslt"/>
	<!--
		instance de template principal pour noeud de sortie pricinpale
	-->
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
			<head>
				<title>Enter your title here</title>
				<style type="text/css">
			.facture{
				page-break-before:always;
				min-height:27cm;
				width:21cm;
				border:1px solid black;
			}
			.emeteur,.destinataire{
				border:1px solid black;
				height:18mm;
				padding:1cm;
				width:80mm;
				font-size:16pt;
			}
			.destinataire{
				margin-left:100mm;
				margin-top:15mm;
				
			}
			.numero-facture{
				width:70%;
				margin-left:15%;
				margin-bottom:15mm;
				margin-top:15mm;
				padding: 2mm 0;
				text-align:center;
				border:1px solid black;
				background-color:#8DADEF;
				font-size:16pt;
			}
			table{
				width:80%;
				margin-left:10%;
			 
			}
			thead *,tbody *{
				border: 1px solid black;
			}
			thead{
				background-color:#8DADEF;
			}
			tfoot td{
				text-align:right;
				font-style:italic;
			}
			tfoot *{
				border:none;
			}
			.center{text-align:center;}
		</style>
			</head>
			<body>
				<!--
					utilisation du total avec liste de noeuds specifique en param
					<table>
						<xsl:call-template name="total">
							<xsl:with-param name="baseNode" select="//facture[@idclient=234]"/>
						</xsl:call-template>
					</table>
				-->
				<!--corps de ma page-->
				<xsl:call-template name="base-sommaire"/>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
	<!--
		template match pour la generation de contenu de facture
	-->
	<xsl:template match="facture">
		<div class="facture" id="facture-{@numfacture}">
			<div class="emeteur">ECO-NOME<br/>10 rue lambada<br/>56000 Vannes</div>
			<div class="destinataire">Paul Auchon<br/>12 rue lambda<br/>56410 Erdeven</div>
			<xsl:apply-templates select="@numfacture"/>
			<xsl:apply-templates select="lignes"/>
		</div>
	</xsl:template>
	<!--
		template pour le bandeau de numero de facture
	-->
	<xsl:template match="@numfacture">
		<div class="numero-facture">
			<xsl:apply-templates select="../@type"/> N&deg; <xsl:value-of select="."/>
		</div>
	</xsl:template>
	<!--
		template pour generer le corps statique du tableau facture/lignes
	-->
	<xsl:template match="lignes">
		<table cellspacing="0">
			<thead>
				<tr>
					<th>Ref</th>
					<th>designation</th>
					<th>Quant</th>
					<th>&euro;/unit.</th>
					<th>sous-total</th>
				</tr>
			</thead>
			<tfoot>
				<xsl:call-template name="total"/>
			</tfoot>
			<tbody>
				<xsl:apply-templates select="ligne"/>
			</tbody>
		</table>
	</xsl:template>
	<!--
		template pour chaque ligne de tableau lignes/ligne
	-->
	<xsl:template match="ligne">
		<tr>
			<td class="center">
				<xsl:value-of select="ref"/>
			</td>
			<td>
				<xsl:value-of select="designation"/>
			</td>
			<td class="center">
				<xsl:value-of select="nbUnit"/>
			</td>
			<td class="center">
				<xsl:value-of select="phtByUnit"/>&euro;</td>
			<th>
				<xsl:value-of select="stotligne"/>&euro;</th>
		</tr>
	</xsl:template>
	<!--
		template de generation du contenu de total pour un tableau
			@params baseNode situation de context de noeuds pour les calcul de totaux
	-->
	<xsl:template name="total">
		<xsl:param name="baseNode" select="."/>
		<xsl:param name="tva_pourcent" select="20"/>
		<!--variables (constantes) pour precalcul arrondi des valeurs à sommer-->
		<xsl:variable name="montantHT" select="round(sum($baseNode//stotligne) * 100) div 100"/>
		<xsl:variable name="montantTVA" select="round($montantHT * ($tva_pourcent div 100) * 100) div 100"/>
		<tr>
			<td colspan="4">Sous-total</td>
			<th>
				<xsl:value-of select="format-number($montantHT,'0,00', 'format_money')"/> &euro;
			</th>
		</tr>
		<tr>
			<td colspan="4">TVA</td>
			<th>
				<xsl:value-of select="format-number($montantTVA,'0,00', 'format_money')"/> &euro;
			</th>
		</tr>
		<tr>
			<td colspan="4">Total T.T.C.</td>
			<th><xsl:value-of select="format-number($montantTVA + $montantHT,'0,00', 'format_money')"/> &euro;</th>
		</tr>
	</xsl:template>
</xsl:stylesheet>
