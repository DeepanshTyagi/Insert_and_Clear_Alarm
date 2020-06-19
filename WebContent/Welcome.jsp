<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*
{
  margin:0px;
  padding:0px;
}
body
{
 margin:0px;
  padding:0px;
  background:lightyellow;
  background-size:cover;
  font-family:sans-serif;
}
   .D
   {
   	height:80px;
   	width: 1364px; 
   	background-color:white;
   }
   #img
   {
   	height: 80px;
   	width: 350px;
   }

.i
 {
   width:200px;
   height:30px;
   font-size:15px;  
 }
#s
{
  width:100px;
  height:45px;
  font-size:20px;
}
#img1
{
height:288px;
width:672px;
}
#img2
{
 float:right;
 height:288px;
 width:672px;
}
#img3
{
height:288px;
width:672px;
}
#img4
{
 float:right;
 height:288px;
 width:672px;
}
.D1
 {
   position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  width:420px;
  height:450px;
  padding:60px 50px;
  box-sizing:border-box;
  background:#ff884d;
  border:none;
  outline:none;
  border-radius:30px;
 }
 .D1 th
{
  margin:0px;
  padding:0px;
  font-weight:bold;
}`
.D1 input 
{
   width:100%;
   margin-bottom:20px;
}
.D1 input[type="text"],
.D1 input[type="password"],
.D1 select
{
   border:none;
   border-bottom:1px solid blue;
   background:transparent;
   outline:none;
   height:40px;
   color:green;
   font-size:16px;
}
:: placeholder
{
   color:rgba(255,255,255,.5);
}
.D1 input[type="submit"]
{
    border:none;
	outline:none;
	height:40px;
	color:#fff;
	font-size:16px;
	background:#ff267e;
	cursor:pointer;
	border-radius:20px;
}
.D1 input[type="submit"]:hover
{
  background:#efed40;
  color:#262626;
}
</style>
</head>
<body>

<div class="D">
	<img id="img" src="cdot.jpg">
</div>
<div class="D1">
<form  action="AlarmServlet" method="post">
<table cellpadding="10px" cellspacing="10px" align="center" id="t">
<tr>
<th>Machine Name  :</th>
<td><input class="i" type="text" placeholder="Machine Name" name="mname"/></td>
</tr>
<tr>
<th>IP  :</th>
<td><input class="i" type="text" placeholder="IP" name="ip" /></td>
</tr>
<tr>
<th>Port  :</th>
<td><input class="i" type="text" placeholder="port" name="port" maxlength="5"/></td>
</tr>
<tr>
<th>Status :</th>
<td>
<select class="i" name="status"  required>
<option value="" disabled selected>Select your Status</option>
<option class="o">Critical</option>
<option class="o">Major</option>
<option class="o">Normal</option>
</select></td>
</tr>
<tr>
<th>Category    :</th>
<td><input class="i" type="text" placeholder="category" name="category" required /></td><br/>
</tr>
<tr>
<td><input id="s" type="submit" value="Submit"/></td>
</tr>
</table>
</form>
</div>
<img  src="iot.jpg" id="img1">
<img  src="Tech.jpg" id="img2">
<img  src="Digital-India.jpg" id="img3">
<img  src="digi1.jpg" id="img4">
</body>
</html>