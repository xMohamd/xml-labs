<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Employee Information</title>
        <style type="text/css">
          body {
          font-family: Arial, sans-serif;
          background-color: #f4f4f4;
          margin: 0;
          padding: 0;
          }
          h1 {
          text-align: center;
          color: #333;
          }
          table {
          border-collapse: collapse;
          width: 100%;
          background-color: #fff;
          border-radius: 8px;
          overflow: hidden;
          box-shadow: 0 4px 6px rgba(0,0,0,0.1);
          }
          th, td {
          border: 1px solid #ddd;
          padding: 12px;
          text-align: left;
          }
          th {
          background-color: #f2f2f2;
          }
          tr:nth-child(even) {
          background-color: #f9f9f9;
          }
          tr:hover {
          background-color: #f0f0f0;
          }
        </style>
      </head>
      <body>
        <h1>Employee Information</h1>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>ISBN</th>
              <th>Email</th>
              <th>Phone Numbers</th>
              <th>Address</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="employees/employee" />
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="employee">
    <tr>
      <td>
        <xsl:value-of select="name" />
      </td>
      <td>
        <xsl:value-of select="@isbn" />
      </td>
      <td>
        <xsl:value-of select="email" />
      </td>
      <td>
        <xsl:for-each select="phones/phone">
          <xsl:value-of select="concat(@type, ': ', .)" />
                    <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
      </td>
      <td>
        <xsl:value-of
          select="concat(addresses/address/Street, ', ', addresses/address/City, ', ', addresses/address/Country)" />
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>