<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
					<fo:table-header>
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
							<fo:table-cell border="0.3mm solid black">
								<fo:block>quant</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.3mm solid black">
								<fo:block>sous-total</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:for-each select=".//ligne">
							<fo:table-row >
								<fo:table-cell border="0.3mm solid black">
									<fo:block>
										<xsl:value-of select="ref"/>
									</fo:block>
								</fo:table-cell >
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
