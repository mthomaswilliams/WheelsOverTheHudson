<%
dim aboutvisits
response.cookies("AboutVisits").Expires=date+365
numvisits=request.cookies("AboutVisits")
if aboutvisits="" then    
response.cookies("AboutVisits")=1    
else    
    response.cookies("aboutvisits")=aboutvisits+1    
    response.write("Visits Per Page: ")    
    response.write("Contact Page - " & aboutvisits)    
  end if
%>
<!DOCTYPE html>
<html>
<body>
</body>
</html>
