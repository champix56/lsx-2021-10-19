<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="iso-8859-1"/>
<xsl:template match="/">

<html>
	<head>
		<title></title>
	</head>
	<body>
	
	<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="1000px" viewBox="-20 -20 500 500"  xmlns:xlink="http://www.w3.org/1999/xlink">

		<desc>
			
		</desc>

		<defs>
			<symbol  id="Axes">
				<line x1="20" y1="0" x2="20" y2="101" stroke="black" stroke-width="2"/>
				<polygon points="20,-1 25,5 15,5" />
				<text x="112" y="115">X</text>
				<line x1="20" y1="100" x2="120" y2="100" stroke="black" stroke-width="2"/>
				<polygon points="121,100 115,95 115,105"/>
				<text x="5" y="10">Y</text>
						
				<rect x="40" y="97.5" width="1" height="5" style="fill:black"/>
				<text x="35" y="115">10</text>
				<rect x="70" y="97.5" width="1" height="5" style="fill:black"/>
				<text x="65" y="115">20</text>
				<rect x="100" y="97.5" width="1" height="5" style="fill:black"/>
				<text x="95" y="115">30</text>
				
				<rect x="18.5" y="20" width="5" height="1" style="fill:black"/>
				<text x="3" y="25">10</text>
				<rect x="18.5" y="50" width="5" height="1" style="fill:black"/>
				<text x="3" y="55">20</text>
				<rect x="18" y="80" width="5" height="1" style="fill:black"/>
				<text x="3" y="85">30</text>
			</symbol>
			
			<linearGradient id="effetArrondiVertical" x1="0%" x2="100%" y1="20%" y2="0">
				<stop offset="0%" stop-color="#B7CA79"/>
				<stop offset="80%" stop-color="#677E52"/>
			</linearGradient>
		</defs>
		<xsl:variable name="pas" select="100 div 74.625"/>
		<xsl:variable name="pasC" select="100 div 1.5"/>
			<!-- barres -->
			<xsl:for-each select="facturation/factures/facture">
				<xsl:variable name="hauteurCalculee" select="ligneAvg * $pas"/>
				<xsl:variable name="hauteurCalculeeC" select="prixAvgArticle * $pasC"/>
				<xsl:variable name="hauteurCalculeeC2" select="following-sibling::facture/prixAvgArticle * $pasC"/>
				
				<rect x="{30 * (position()-1)+15}" y="{100 - $hauteurCalculee}" width="20" height="{$hauteurCalculee}" fill="url(#effetArrondiVertical)" />
				<circle r="2" cx="{30 * (position()-1)+25}" cy="{100 - $hauteurCalculeeC}" fill="#FF5900"/>
				<xsl:if test="following-sibling::facture">
				<line x1="{30 * (position()-1)+25}" y1="{100 - $hauteurCalculeeC}" x2="{(30 * position())+25}" y2="{100 - $hauteurCalculeeC2}" stroke="#FF5900" stroke-width="1"/>
				</xsl:if>
			</xsl:for-each>
		<!-- points & lignes-->
		
		
		
		<use xlink:href="#Axes" x="-15" y="0" />
		

</svg>


	
	</body>
</html>

</xsl:template>

</xsl:stylesheet>
