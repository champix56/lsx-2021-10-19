<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--creation dune variable remplie avec un nouvel arbre xml creer a la volé-->
	<xsl:variable name="stat">
		<factures>
			<xsl:for-each select="//facture">
				<facture>
					<xsl:value-of select="sum(.//stotligne)"/>
				</facture>
			</xsl:for-each>
		</factures>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--def. des formats de pages-->
			<fo:layout-master-set>
				<!--un format simple de page-->
				<fo:simple-page-master master-name="A4-portrait" page-height="297mm" page-width="210mm">
					<fo:region-body margin-top="2cm" margin-bottom="1cm"/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="1cm"/>
				</fo:simple-page-master>
				<!--un format simple de page-->
				<fo:simple-page-master master-name="A4-portrait-garde" page-height="297mm" page-width="210mm">
					<fo:region-body/>
					<fo:region-after extent="1cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--un contenu de page à generer basé sur un format de page simple (ou conditionnel)-->
			<fo:page-sequence master-reference="A4-portrait-garde">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center">
						<fo:page-number/>
					</fo:block>
				</fo:static-content>
				<!--contenu principale de la section de pages generer-->
				<!--le nom des region est par def. xsl-region-[nom de la region]-->
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block margin-top="5cm" text-align="center" color="tomato" font-size="32pt" text-decoration="underline" font-weight="bold">FACTURES</fo:block>
						<fo:block margin-left="4cm" margin-top="1cm">
							<fo:block>Facturier en date du : <fo:inline text-decoration="underline">
									<xsl:value-of select="/factures/@dateeditionXML"/>
								</fo:inline>
							</fo:block>
							<fo:block>pour l'ets : <fo:inline font-weight="900">
									<xsl:value-of select="/factures/@rsets"/>
								</fo:inline>
							</fo:block>
						</fo:block>
						<fo:block margin-top="2cm" text-align="center" color="skyblue" font-size="32pt" text-decoration="underline" font-weight="bold">Sommaire</fo:block>
						<!--creation d'une liste de puces-->
						<fo:list-block margin-left="5cm">
							<xsl:for-each select="/factures/facture">
								<!--une puce de la liste-->
								<fo:list-item>
									<fo:list-item-label color="blue">
										<fo:block>+</fo:block>
									</fo:list-item-label>
									<!--contenu de la puce-->
									<fo:list-item-body margin-left="0.3cm">
										<fo:block>Facture n° <xsl:value-of select="@numfacture"/>
										</fo:block>
									</fo:list-item-body>
								</fo:list-item>
							</xsl:for-each>
						</fo:list-block>
						<fo:block>
							<fo:instream-foreign-object content-height="7cm" content-width="7cm" scaling="uniform">
								<svg width="100%" height="100%" viewBox="-20 -20 140 140" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
									<desc/>
									<defs>
										<symbol id="Axes">
											<line x1="20" y1="0" x2="20" y2="101" stroke="black" stroke-width="2"/>
											<polygon points="20,-1 25,5 15,5"/>
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
									<rect x="15" y="-0.000000000000014210854715202004" width="20" height="100.00000000000001" fill="url(#effetArrondiVertical)"/>
									<use xlink:href="#Axes" x="-15" y="0"/>
								</svg>
							</fo:instream-foreign-object>
						</fo:block>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<xsl:apply-templates select="//facture"/>
		</fo:root>
	</xsl:template>
	<xsl:template match="facture">
		<fo:page-sequence master-reference="A4-portrait">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block text-align="center">
					<fo:table width="12cm" margin-left="4cm">
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell width="2cm">
									<fo:block>
										<fo:external-graphic src="../../XPATH/facture/{/factures/@logourl}" scaling="uniform" content-height="15mm" content-width="15mm"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell width="10cm">
									<fo:block>
										<xsl:value-of select="/factures/@rsets"/>
										<fo:block/>
										<xsl:value-of select="/factures/@adr1ets"/>
										<fo:block/>
										<xsl:value-of select="/factures/@cpets"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="/factures/@villeets"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block>
					<fo:block margin-top="3cm" border="0.3mm solid black" text-align="center" margin-right="2.6cm" margin-left="2.6cm" background-color="skyblue" font-size="23pt" padding="0 0.5mm">Facture N° <xsl:value-of select="@numfacture"/>
					</fo:block>
				</fo:block>
				<fo:table margin-top="1.5cm">
					<fo:table-header background-color="skyblue">
						<fo:table-row>
							<fo:table-cell border="0.3mm solid black">
								<fo:block>ref</fo:block>
							</fo:table-cell>
							<fo:table-cell width="7cm" border="0.3mm solid black">
								<fo:block>designation</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.3mm solid black">
								<fo:block>€ / unit.</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.3mm solid black" width="5cm">
								<fo:block>quant</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.3mm solid black">
								<fo:block>sous-total</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-footer>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="4" text-align="right">
								<fo:block>Montant Total H.T.</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="sum(.//stotligne)"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-footer>
					<fo:table-body>
						<xsl:for-each select=".//ligne">
							<fo:table-row>
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="ref"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="designation"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="phtByUnit"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="nbUnit"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="stotligne"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
</xsl:stylesheet>
