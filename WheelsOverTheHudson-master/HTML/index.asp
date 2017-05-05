<!DOCTYPE html>
<html>

<head>

	<!--Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Clicker+Script|Fascinate+Inline|Griffy|Open+Sans" rel="stylesheet">
	<!--- server link
	<link rel="stylesheet" type="text/css" href="wheels\index.css">
	---->
<!--- For local testing--->
	<link rel="stylesheet" type="text/css" href="index.css">
	<meta charset="UTF-8">
	<title>Wheels Over the Hudson</title>
</head>

<body>
	<div class="nav">
		<!--- nav bar i just did a simple drop down menu. modification we need
to do is get a background color picked/logo and have it span the top of
the page and at the end of the menu and a search box to the website so
that it looks closer to the droid life one--->
		<ul>
			<!-- THIS IS THE HTML FOR THE MENU ICON
########################################################
	<LI>
	<div class="container" onclick="myFunction(this)">
<div class="bar1"></div>
<div class="bar2"></div>
<div class="bar3"></div>
</div>
<script>
function myFunction(x) {
	x.classList.toggle("change");
}
</script>
###########################################################</li>
--->

			<!-- cODE FOR THE DROP DOWN MENU--->
			<!--SLOT FOR THE LOGO
			<li class="dropdown">
				
				<a href="javascript:void(0)" class="logo">Logo</a>
			</li>
			-->
			<li class="dropdown">
				<a href="index.html" class="logo">Home</a>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">Contact</a>
				<div class="dropdown-content">
					<a href="contact/">Contact</a>
					<a href="about/">About</a>

				</div>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">Services</a>
				<div class="dropdown-content">
					<a href="services/"> Bike Repair</a>

				</div>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">Shopping Cart</a>
				<iframe class="dropdown-iframe" src="phpcart/index.php">Your brower does not support iframes</iframe>
			</li>
		</ul>
	</div>
	<div class="metro-surface" align="center">



		<!-- Temporary color to help see the menu bar -->
		<!--Tiles---->
		<!--<span class="start">Start</span>  ##### Why is the class start not defined in css?-->

		<table width="100%" height="20%">
			<tr>
				<th>
				<div class="metro-tile top-tile Bikes ">Rent a Bike
				<div class="invisible"> <strong>T</strong>	</div>
					</div>
			
				</th>
			</tr>
		</table>

		<!-- For scaling only use 3 Tiles per row -->

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

	</div>

	
</body>

</html>
