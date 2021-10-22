<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--def. des formats de pages-->
			<fo:layout-master-set>
				<!--un format simple de page-->
				<fo:simple-page-master master-name="A4-portrait" page-height="297mm" page-width="210mm">
					<fo:region-body background-color="skyblue" margin-top="2cm" margin-bottom="1cm"/>
					<fo:region-before extent="2cm" background-color="tomato"/>
					<fo:region-after extent="1cm" background-color="yellow"/>
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
							<fo:block>Facturier en date du :<xsl:value-of select="/factures/@dateeditionXML"/>
							</fo:block>
							<fo:block>pour l'ets : <xsl:value-of select="/factures/@rsets"/>
							</fo:block>
						</fo:block>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
