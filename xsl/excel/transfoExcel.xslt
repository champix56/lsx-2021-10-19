<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<?mso-application progid="Excel.Sheet"?>
		<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
			<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
				<Author>Champix</Author>
				<LastAuthor>Champix</LastAuthor>
				<Created>2021-10-20T12:42:53Z</Created>
				<Version>16.00</Version>
			</DocumentProperties>
			<OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
				<AllowPNG/>
			</OfficeDocumentSettings>
			<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
				<WindowHeight>8040</WindowHeight>
				<WindowWidth>21570</WindowWidth>
				<WindowTopX>32767</WindowTopX>
				<WindowTopY>32767</WindowTopY>
				<ProtectStructure>False</ProtectStructure>
				<ProtectWindows>False</ProtectWindows>
			</ExcelWorkbook>
			<Styles>
				<Style ss:ID="Default" ss:Name="Normal">
					<Alignment ss:Vertical="Bottom"/>
					<Borders/>
					<Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#000000"/>
					<Interior/>
					<NumberFormat/>
					<Protection/>
				</Style>
				<Style ss:ID="s63">
					<Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
				</Style>
				<Style ss:ID="s73">
					<Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
					<Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="18" ss:Color="#FF0000"/>
				</Style>
				<Style ss:ID="s76">
					<Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="22" ss:Color="#FF0000"/>
					<NumberFormat ss:Format="#,##0.00\ &quot;€&quot;"/>
				</Style>
				<Style ss:ID="s77">
					<NumberFormat ss:Format="#,##0.00\ &quot;€&quot;"/>
				</Style>
			</Styles>
			<Worksheet ss:Name="Feuil1">
				<Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="3" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="60" ss:DefaultRowHeight="15">
					<Column ss:Index="2" ss:Width="61.5"/>
					<Column ss:Index="5" ss:Width="131.25"/>
					<Column ss:AutoFitWidth="0" ss:Width="156.75"/>
					<Column ss:AutoFitWidth="0" ss:Width="56.25"/>
					<Row ss:Height="28.5">
						<Cell ss:MergeAcross="1" ss:StyleID="s63">
							<Data ss:Type="String">Nb de factures</Data>
						</Cell>
						<Cell ss:StyleID="s73">
							<Data ss:Type="Number">11111</Data>
						</Cell>
						<Cell ss:MergeAcross="1" ss:StyleID="s63">
							<Data ss:Type="String">montant total des factures </Data>
						</Cell>
						<Cell ss:StyleID="s76">
							<Data ss:Type="Number">99999.99</Data>
						</Cell>
					</Row>
					<Row>
						<Cell>
							<Data ss:Type="String">Numero</Data>
						</Cell>
						<Cell>
							<Data ss:Type="String">date facture</Data>
						</Cell>
						<Cell>
							<Data ss:Type="String">idclient</Data>
						</Cell>
						<Cell>
							<Data ss:Type="String">nb lignes</Data>
						</Cell>
						<Cell>
							<Data ss:Type="String">Nombre d'articles</Data>
						</Cell>
						<Cell>
							<Data ss:Type="String">montant total</Data>
						</Cell>
					</Row>
					<Row>
						<Cell>
							<Data ss:Type="Number">222</Data>
						</Cell>
						<Cell ss:Index="3">
							<Data ss:Type="Number">3333</Data>
						</Cell>
						<Cell>
							<Data ss:Type="Number">4444</Data>
						</Cell>
						<Cell>
							<Data ss:Type="Number">5555</Data>
						</Cell>
						<Cell ss:StyleID="s77">
							<Data ss:Type="Number">666.66</Data>
						</Cell>
					</Row>
				</Table>
				<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
					<PageSetup>
						<Header x:Margin="0.3"/>
						<Footer x:Margin="0.3"/>
						<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
					</PageSetup>
					<Print>
						<ValidPrinterInfo/>
						<HorizontalResolution>600</HorizontalResolution>
						<VerticalResolution>600</VerticalResolution>
					</Print>
					<Selected/>
					<Panes>
						<Pane>
							<Number>3</Number>
							<ActiveRow>7</ActiveRow>
							<ActiveCol>5</ActiveCol>
						</Pane>
					</Panes>
					<ProtectObjects>False</ProtectObjects>
					<ProtectScenarios>False</ProtectScenarios>
				</WorksheetOptions>
			</Worksheet>
		</Workbook>
	</xsl:template>
</xsl:stylesheet>
