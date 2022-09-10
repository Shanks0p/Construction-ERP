<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@page import="com.EmployeeMenu.getset"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Products</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica,
    Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

.main-container {
  padding: 30px;
}

/* HEADING */

.heading {
  text-align: center;
}

.heading__title {
  font-weight: 600;
}

.heading__credits {
  margin: 10px 0px;
  color: #888888;
  font-size: 25px;
  transition: all 0.5s;
}

.heading__link {
  text-decoration: none;
}

.heading__credits .heading__link {
  color: inherit;
}

/* CARDS */

.cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  color:white;
}

.card {
  margin: 20px;
  padding: 20px;
  padding-bottom:0;
  width: 400px;
  min-height: 200px;
  display: grid;
  grid-template-rows: 20px 50px 1fr 50px;
  border-radius: 10px;
  box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.25);
  transition: all 0.2s;
}

.card:hover {
  box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.4);
  transform: scale(1.01);
}

.card__link,
.card__exit,
.card__icon {
  position: relative;
  text-decoration: none;
  color: rgba(255, 255, 255, 0.9);
}

.card__link::after {
  position: absolute;
  top: 25px;
  left: 0;
  content: "";
  width: 0%;
  height: 3px;
  background-color: rgba(255, 255, 255, 0.6);
  transition: all 0.5s;
}

.card__link:hover::after {
  width: 100%;
}

.card__exit {
  grid-row: 1/2;
  justify-self: end;
}

.card__icon {
  grid-row: 2/3;
  font-size: 30px;
}

.card__title {
  grid-row: 3/4;
  font-weight: 400;
  color: #ffffff;
}

.card__apply {
  grid-row: 4/5;
  align-self: center;
}

/* CARD BACKGROUNDS */

.card-1 {
  background: radial-gradient(#1fe4f5, #3fbafe);
}

.card-2 {
  background: radial-gradient(#fbc1cc, #fa99b2);
}

.card-3 {
  background: radial-gradient(#76b2fe, #b69efe);
}

.card-4 {
  background: radial-gradient(#60efbc, #58d5c9);
}

.card-5 {
  background: radial-gradient(#f588d8, #c0a3e5);
}

/* RESPONSIVE */

@media (max-width: 1600px) {
  .cards {
    justify-content: center;
  }
}
.sub-main{
  width: 30%;
  margin:22px;
  float: right;
}

.button-one, .button-two, .button-three{
  text-align: center;
  cursor: pointer;
  font-size:24px;
  margin: 0 0 0 100px;
}
 .button-one {
  padding:20px 60px;
  outline: none;
  background-color: #1c9dff;
  border: none;
  border-radius:5px;
  box-shadow: 0 9px #95a5a6;
  
}

.button-one:hover{
  background-color: #1cbdff;
}

.button-one:active {
  background-color: #1cbdff;
  box-shadow: 0 5px #95a5a6;
  transform: translateY(4px);
}
.icon{

height:20;
width:20;

}

.cards h3{
font-size:28px;
font-weight:500;
text-shadow:0px 0px 7px white;
}

.cards h4{
position:relative;
top:6px;
font-weight:500;
font-size:20px;
}

a:visited{
color:whitesmoke;
}

a:link{
color:white;
}

a:hover{
color:DodgerBlue;
}

</style>
</head>
<body>
<!-- 

GRADIENT BANNER DESIGN BY SIMON LURWER ON DRIBBBLE:
https://dribbble.com/shots/14101951-Banners

-->
<div class="main-container">
  <div class="heading">
    <div class="title">
        <h1><span style="color: #ff9f43">View </span><span style="color: #0abde3">Assigned </span><span>Projects</span></h1>
      </div>
     <div class="sub-main">
      <a href="DeptMenu.html" style="text-decoration: none;"><button class="button-one">Go Back?</button></a>
    </div>
  </div>
<br>
<br>
<br>
<br>
  <br>
    <br>
  <div class="cards">
  <%Connection con = DBconnect.dbConnect();
  int did = getset.getDid();
//BufferedImage bufImg = null;
int count=0;
try
{
	PreparedStatement ps1 = con.prepareStatement("SELECT * FROM project p JOIN deptasproj d ON p.pid=d.pid AND d.did=?");
	ps1.setInt(1,did);
	ResultSet rs = ps1.executeQuery();
	
	
	while(rs.next())
	{ %>
    <div class="card card-1">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                    <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
      
    </div>
    <% if(rs.next())
    	{%>
    <div class="card card-2">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                    <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
    </div>
    <%} 
    if(rs.next())
    	{%>
    <div class="card card-3">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                    <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
    </div>
      <%} 
    if(rs.next())
    	{%>
    <div class="card card-4">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                    <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
    </div>
      <%} 
    if(rs.next())
    	{%>
    <div class="card card-5">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                     <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
     </div>
      <%} 
    if(rs.next())
    	{%>
    <div class="card card-1">
      <p class="card__exit"><i class="fas fa-times"></i></p>
                      <h3>Project ID = <%= rs.getInt(1) %></h3>
			        <h4>Name - <%=rs.getString(2) %>
			        <br><br>Address : <%=rs.getString(3) %>
			        <br><br><a href="DeptProDet.jsp?pid=<%=rs.getInt(1) %>" style="text-decoration: none; " >View Full Details</a></h4>
    </div>
    <%
    	}
	}
    }
		catch(Exception e)
		{
			e.printStackTrace();
		} %>
  </div>
</div>
</body>
</html>