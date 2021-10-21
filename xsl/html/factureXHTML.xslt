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
			<!--corps de ma page-->
			<xsl:call-template name="base-sommaire"/>
			</body>
		</html>
	</xsl:template>
	<!--
		template name pour les statiques du sommaire
	-->
	<xsl:template name="base-sommaire">
		<h1>Sommaire</h1>
		<ul>
			<xsl:apply-templates select="//facture"/>		
		</ul>
		<hr/>
	</xsl:template>
	<!--
		template match pour la generation de list item pour le sommaire
	-->
	<xsl:template match="facture">
		<li>
			<a href="#facture-{@numfacture}">Facture N&deg;<xsl:value-of select="@numfacture"/></a>
			pour le client <xsl:value-of select="@idclient"/>
		</li>
	</xsl:template>
</xsl:stylesheet>
