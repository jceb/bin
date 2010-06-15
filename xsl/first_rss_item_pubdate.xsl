<xsl:stylesheet version='1.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
    <xsl:output method='text'></xsl:output>
    <xsl:template match='/'>
        <xsl:value-of select='/*/*/item[1]/pubDate'></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>
