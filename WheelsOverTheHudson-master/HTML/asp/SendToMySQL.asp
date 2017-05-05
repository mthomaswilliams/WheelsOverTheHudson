
<% 

dim sname 
sname= request.form("sname")
dim sgrade 
sgrade= request.form("sgrade")
set conn =Server.createObject("ADODB.Connection") 
conn.Open "DSN=test;UID=sb;PWD="
set rs=Server.createObject("ADODB.recordset") 

response.write(sname)
SQLstate="insert into Stable values ('" & sname & "'," & sgrade & ")"
'Response.Write SQLstate
rs.open SQLstate,conn 
%>
