<html>
<head>
<link rel="stylesheet" type="text/css" href="../index.css">
</head>
<body>

<%
Response.Write "hello"
Dim cnnSimple  ' ADO connection
Dim rstSimple  ' ADO recordset
Set cnnSimple = Server.CreateObject("ADODB.Connection")

' DSN
cnnSimple.Open "localhost"

Set rstSimple = cnnSimple.Execute("SELECT * FROM ShopingCart")

%>
<table width="90%" height="20%">
			<tr>
<%
Do While Not rstSimple.EOF
 %>

				<td class="<%= rstSimple.Fields("tile-size").Value %>-tile">
					<div class="metro-tile <%= rstSimple.Fields("name").Value %> autosize"><%= rstSimple.Fields("description").Value %> </div>
				</td>
<%
i = i+1
If i Mod 3 = 0 then Response.Write "</table><table width=""90%"" height=""20%"">" 

%>

 <%
 rstSimple.MoveNext

Loop
%>
			</tr>
		</table>

<%
' Close our recordset and connection and dispose of the objects rstSimple.Close Set rstSimple = Nothing cnnSimple.Close Set cnnSimple = Nothing

cnnSimple.close
%>

</body>
</html>
