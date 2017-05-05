<%
dim indexvisits
response.cookies("IndexVisits").Expires=date+365
numvisits=request.cookies("IndexVisits")
if indexvisits="" then    
response.cookies("IndexVisits")=1    
else    
    response.cookies("indexvisits")=indexvisits+1    
    response.write("Visits Per Page: ")    
    response.write("Home Page - " & indexvisits)    
  end if
%>
<!DOCTYPE html>
<html>
<body>
</body>
</html>
