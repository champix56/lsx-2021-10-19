<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<!--def. des formats de pages-->
			<fo:layout-master-set>
			<!--un format simple de page-->
				<fo:simple-page-master master-name="A4-portrait" page-height="297mm" page-width="210mm">
					<fo:region-body background-color="skyblue"></fo:region-body>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--un contenu de page à generer basé sur un format de page simple (ou conditionnel)-->
			<fo:page-sequence master-reference="A4-portrait">
				<!--contenu principale de la section de pages generer-->
				<!--le nom des region est par def. xsl-region-[nom de la region]-->
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block text-align="center" font-style="italic" text-decoration="underline">DEMAT &amp; DEGEMER MAT im Breizh</fo:block>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
