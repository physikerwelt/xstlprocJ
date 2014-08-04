<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:m="http://www.w3.org/1998/Math/MathML"
		xmlns:t="http://ntcir-math.nii.ac.jp/">

	<xsl:output method="text"/>
	<xsl:strip-space elements="*"/>

	<xsl:template match="/">
		<xsl:text>QueryID;TeXQuery&#10;</xsl:text>
		<xsl:apply-templates select="./*"/>
	</xsl:template>

	<xsl:template match="/t:topics/t:topic">

		<xsl:variable name="name" select="./t:num"/>
		<xsl:analyze-string select="$name" regex="NTCIR(\d+)-Math-(\d+)">
			<xsl:matching-substring>
				<xsl:value-of select="regex-group(2)"/>
			</xsl:matching-substring>
			<xsl:non-matching-substring>
				<xsl:value-of select="$name"/>
			</xsl:non-matching-substring>
		</xsl:analyze-string>

		<xsl:text>;$</xsl:text>
		<xsl:value-of select="./t:query/t:formula/m:math/m:semantics/m:annotation"/>
		<xsl:text>$&#10;</xsl:text>

	</xsl:template>
</xsl:stylesheet>
