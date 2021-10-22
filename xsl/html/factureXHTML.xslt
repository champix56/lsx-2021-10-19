<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY deg "&#176;">
	<!ENTITY euro "&#8364;">
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="logo">data:image/jpeg;base64,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</xsl:param>
	<!--
		sortie XML pour XHTML(XML+HTML) avec mise place de doctype html (public & system)
	-->
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes"/>
	<!--inclusion de la libray de templates-->
	<!--<xsl:include href="./ressourceImage.xslt"/>-->
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
			.emeteur>div{
				display:inline-block;
			}
			.emeteur img{
				width:2cm;
				height:2cm;
				vertical-align:middle;
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
		template pour la gen du boc de l'emeteur des factures
	-->
	<xsl:template match="@rsets">
		<div class="emeteur">
			<div>
				<img alt="logo" src="{$logo}"/>
			</div>
			<div>
				<xsl:value-of select="."/><br/>
				<xsl:value-of select="../@adr1ets"/><br/>
				<xsl:if test="string-length(../@adr2ets)>0"><xsl:value-of select="../@adr2ets"/><br/></xsl:if>
				<xsl:value-of select="../@cpets"/>&nbsp;<xsl:value-of select="../@villets"/><br/>
			</div>
		</div>
	</xsl:template>
	<!--
		template match pour la generation de contenu de facture
	-->
	<xsl:template match="facture">
		<div class="facture" id="facture-{@numfacture}">
			<xsl:apply-templates select="/factures/@rsets"/>
			<xsl:apply-templates select="@idclient"/>
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
	<!--
		template pour l'id client et la creation de la corelation du clients.xml
	-->
	<xsl:template match="facture/@idclient">
		<div class="destinataire" style="height:auto;padding-top:0;padding-bottom:0;">
			<xsl:variable name="idclient" select="."/>
			<xsl:apply-templates select="document('../../XPATH/facture/clients.xml')/clients/client[@id= $idclient ]"/>
		</div>
	</xsl:template>
	<!--
		template pour le contenu d'un client provenant d'un parent clients
	-->
	<xsl:template match="clients/client">
		<xsl:if test="rs"><xsl:value-of select="rs"/><br/></xsl:if>
		<xsl:value-of select="destinataire"/><br/>
		<xsl:value-of select="adr1"/><br/>
		<xsl:if test="string-length(adr2) > 0"><xsl:value-of select="adr2"/><br/></xsl:if>
		<xsl:value-of select="cp"/>&nbsp;
		<!--ou equiv. : text non normalisé <xsl:text> </xsl:text>-->
		<xsl:value-of select="ville"/>
	</xsl:template>
</xsl:stylesheet>
