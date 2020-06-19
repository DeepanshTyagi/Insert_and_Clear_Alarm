<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://127.0.0.1:5432/Alarm";
String userId = "postgres";
String password = "123456";

try {
Class.forName(driverName);
} 
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement psmt=null;
%>
<head>
<style>
body
{

  margin:0px;
  padding:0px;
  background:url("digi1.jpg");
  background-size:cover;
  font-family:sans-serif;
}
.D
   {
   	height:80px;
   	width: 1360px; 
   	background-color:white;
   }
  #img
   {
   	height: 80px;
   	width: 350px;
   }
  #head
  {
  color:Yellow;
  background-color:lightblue;
  }
  
#b1
    {
    border:none;
	outline:none;
	height:30px;
	width: 150px;
	color:#fff;
	font-size:20px;
	background:#ff267e;
	cursor:pointer;
	border-radius:5px;
	position: absolute;
	margin-left:430px;
    }
    #b1:hover
    {
    	background:#efed40;
       color:#262626;
    }
    #b2
    {
    	border:none;
	outline:none;
	height:30px;
	width: 150px;
	color:#fff;
	font-size:20px;
	background:#D35600;
	cursor:pointer;
	border-radius:5px;
	position: absolute;
	margin-left: 600px;
    }
    #b2:hover
    {
    	background:#efed40;
       color:#262626;
    }
    #b3
    {
    	border:none;
	outline:none;
	height:30px;
	width: 150px;
	color:#fff;
	font-size:20px;
	background:lightgreen;
	cursor:pointer;
	border-radius:5px;
	position: absolute;
	margin-left: 760px;
    }
    #b3:hover
    {
    	background:#efed40;
       color:#262626;
    }
  h1
{
 animation-duration:2000ms;
 animation-name:blink;
 animation-iteration-count :5;
 animation-direction:alternate;
 color:red;
}
@keyframes blink
{
 from
 {
  opacity :1;
  color:green;
 }
 to
 {
   opacity :0 ;
   color:red;
 }
}

  </style>
  </head>
  <body>
 <div class="D">
	<img id="img" src="cdot.jpg">
</div>
<div id="D4">
</br>
<table  cellpadding="5" cellspacing="5" border="1" id="Table 1" align="center">
<form name="myform">
<tr>

</tr>
<tr bgcolor="#ff884d">
<td></td>
<td><b>Machine Name</b></td>
<td><b>IP</b></td>
<td><b>Port</b></td>
<td><b>Status</b></td>
<td><b>Generation Time</b></td>
<td><b>Last Updated</b></td>
<td><b>Category</b></td>
</tr>

<%
try
{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM alarm2";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
%>
<tr bgcolor="#ffbb99">
<td><input type="checkbox" id="check" name="check_list"></td>
<td><%=resultSet.getString("mname") %></td>
<td><%=resultSet.getString("ip") %></td>
<td><%=resultSet.getString("port") %></td>
<td><%=resultSet.getString("status") %></td>
<td><%=resultSet.getString("insert_time") %></td>
<td><%=resultSet.getString("last_update") %></td>
<td><%=resultSet.getString("category") %></td>
</tr>
<% 
}

}
catch (Exception e) 
{
e.printStackTrace();
}
%>
</form>
</table>
</br>

<form action="ShowInformation.jsp" method="post">
<input id="b1" type="button" value="Select All" onClick="CheckAll(document.myform.check_list)" name="suball" id="checkall">
<input id="b2" type="button" value="DeSelect All" onClick="UnCheckAll(document.myform.check_list)" name="desall">
<input id="b3" type="submit" value="Clear Alarm" name="clrala" onClick="GetSelected()">

</form>
</div>
<script>
var message;
function CheckAll(chk)
{
for (i = 0; i < chk.length; i++)
	chk[i].checked = true ;
}
function UnCheckAll(chk)
{
for (i = 0; i < chk.length; i++)
	chk[i].checked = false ;
}
function GetSelected()
{
    //Reference the Table.
    var grid = document.getElementById("Table 1");
    //Reference the CheckBoxes in Table.
    var checkBoxes = grid.getElementsByTagName("INPUT");
    message = " Status  \n";

    //Loop through the CheckBoxes.
    for (var i = 0; i < checkBoxes.length; i++) 
        {
        if (checkBoxes[i].checked) 
            {
            var row = checkBoxes[i].parentNode.parentNode;
            message = row.cells[4].innerHTML;
           }
        }
    if(message=="Critical")
    {
      alert("Your Database Updated Sucessfully Click on 'OK' to View Updated Information");
      <%
      int ar=0;
      Connection conn = null;
      PreparedStatement pstmt=null;
      Statement st2 = null;
      ResultSet rs2 = null;
      try
      {
    	  
    	 conn=DriverManager.getConnection(connectionUrl,userId,password);
      	 String sql1="UPDATE alarm2 SET status='Normal',last_update=NOW() where status='Critical'"; 
      	 pstmt = conn.prepareStatement(sql1);
     	 ar=pstmt.executeUpdate();
      }
       catch(Exception ex1)
       {
    	   ex1.printStackTrace();  
       }
      %>
    }
    else
    {
     alert("Message is Not in  Critical Status");
    }
}

</script>
</body>
