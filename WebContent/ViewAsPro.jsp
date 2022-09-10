<%@page import="com.EmployeeMenu.getset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Assigned Projects</title>
  <link rel="stylesheet" type="text/css" href="ViewFolder/css/util.css"> 
	<link rel="stylesheet" type="text/css" href="ViewFolder/css/main.css">
	 <link rel="stylesheet" href="register/assets/css/style.css">	
    <style>
        @import url('https://fonts.googleapis.com/css?family=Exo:700');
@import url('https://fonts.googleapis.com/css?family=Abel');
body {
  background-color: #dfe6e9;
  -webkit-transform: perspective(900px);
  -webkit-transform-style: preserve-3d;
}
.title{
  width:100%;
  text-align: center;
}
.title h1{
  font-size:50px;
  font-family: 'Exo', sans-serif;
}
.card1 {
  text-align:center;
  position: absolute;
  left: 100px;
  width: 250px;
  height: 350px;
  margin-top: 10px;
  margin-bottom: 10px;
  background: linear-gradient(rgb(225,150,58),rgb(227,144,91));
  transition:.6s;
  
  transform: rotatex(75deg) translatey(-200px) translatez(-100px);
  box-shadow: 0px 20px 60px rgba(0,0,0, 0.5);
}
.card1:hover{
  transform: rotatex(0deg);
  transform: rotatez(0deg);
  transition:.6s;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
}
.card1 img{
  transform: translateY(15px);
  width:200px;
  height:120px;
}
h3{
  font-size:25px;
  font-family: 'Abel', sans-serif;
  color:rgb(255,255,255);
  text-shadow: 0 0 4px rgb(255,255,255);
  transform: translatey(10px);
}

h4{
  font-size:20px;
  font-family: 'Abel', sans-serif;
  color:rgb(255,255,255);
  text-shadow: 0 0 2px rgb(255,255,255);
  transform: translatey(10px);
}

p{
  
  font-family: 'Abel', sans-serif;
  color: white;
  text-align:center;
  width:220px;
  transform: translatex(12px);
}


.card2 {
  text-align:center;
  position: absolute;
  left: 550px;
  width: 250px;
  height: 350px;
  margin-top: 10px;
  margin-bottom: 10px;
  background: linear-gradient(rgb(93,94,170),rgb(93,66,103));
  animation: animate 1s linear infinite;
  transition:.6s;
  
  transform: rotatex(75deg) translatey(-200px) translatez(-100px);
  box-shadow: 0px 20px 60px rgba(0, 0, 0, 0.5);
}
.card2:hover{
   transform: rotatex(0deg);
  transition:.6s;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
}
.card2 img{
  transform: translateY(15px);
  width:180px;
  height:150px;
}
.card3 {
  text-align:center;
  position: absolute;
  left: 1000px;
  width: 250px;
  height: 350px;
  margin-top: 10px;
  margin-bottom: 10px;
  background: linear-gradient(#ff5252, #b33939);
  transition:.6s;
  
  transform: rotatex(75deg) translatey(-200px) translatez(-100px);
  box-shadow: 0px 20px 60px rgba(0, 0, 0, 0.5);
}
.card3:hover{
   transform: rotatex(0deg);
  transition:.6s;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
}
.card3 img{
  transform: translateY(15px);
  width:200px;
  height:120px;
}
.footer{
  position: absolute;
  top: 500px;
  marging: 10px;
  width: 100%;
   text-align: center;
}
.footer h2{
  font-size:18px;
  font-family: 'Exo', sans-serif;
  
}
        </style>
</head>
<body>
    <div class="title">
        <h1><span style="color: #ff9f43">View </span><span style="color: #0abde3">Assigned </span><span>Projects</span></h1>
      </div>
<%
Connection con = DBconnect.dbConnect();
int eid = getset.getEid();
//BufferedImage bufImg = null;
int count=0;
try{
PreparedStatement ps1 = con.prepareStatement("SELECT * FROM project p JOIN empasproj e WHERE p.pid=e.pid AND e.eid=?");
	ps1.setInt(1,eid);
	ResultSet rs = ps1.executeQuery();
//	Blob img=null;
	//ServletOutputStream sos=null;
	//byte[] imgData=null;
	while(rs.next())
	{
%>
    <%
    if(rs.getString(2)!=null)
    {   
    	count++;
    	//img = rs.getBlob(4);
		//imgData = rs.getBytes(4);
		//imgData = img.getBytes(1, (int) img.length());
		////response.setContentType("image/jpg");
		//OutputStream os = response.getOutputStream();
		//sos = response.getOutputStream();
//    //InputStream is = img.getBinaryStream(1, img.length());
  //  //bufImg = ImageIO.read(is);
		
    %>
      <div class="card1">
        <img src=<% //bufImg %> height="50" width="80" />
        <h3>Project ID = <%= rs.getInt(1) %></h3>
        <h4>Name - <%=rs.getString(2) %>
        <br><br>Address : <%=rs.getString(3) %></h4>
      </div>
<%
}
    if(rs.next())
    {
    	count++;
    %>
      <div class="card2">
 		<img src=<% //bufImg %> height="50" width="50" />
        <h3>Project ID = <%= rs.getInt(1) %></h3>
        <h4>Name - <%=rs.getString(2) %>
        <br><br>Address : <%=rs.getString(3) %></h4>
      </div>
      
            <%
		// os.flush();
		//os.close();
	
	} 
    if(rs.next())
    {
    	%>
      <div class="card3">
		 <img src=<% //bufImg %> height="50" width="80" />
        <h3>Project ID = <%= rs.getInt(1) %></h3>
        <h4>Name - <%=rs.getString(2) %>
        <br><br>Address : <%=rs.getString(3) %></h4>
      </div>
    	<%
    }
	}	
}
catch(Exception e)
{
	  e.printStackTrace();
}
      %>
      <br>
      <div class="footer" style=" background-color:#dfe6e9; padding:0px; position:relative;">
      <br>
					<div>
                  <a href="EmpMenu.html" style=" text-decoration: none; "><button type="button" name="Back" style="width:100%; font-size: 24px;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Go Back</button></a>
                  </div>  
      </div>
 
</body>
</html>