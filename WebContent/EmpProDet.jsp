<%@page import="com.EmployeeMenu.getset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Project Details</title>

<link rel="stylesheet" href="bootstrap/empprodet.css">

<style>

body {
    background: #eee;
}

.card {
    border: none;
    position: relative;
    overflow: hidden;
    border-radius: 8px;
    cursor: default;
  
}

.card:before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 100%;
    background-color: #E1BEE7;
    transform: scaleY(1);
    transition: all 0.5s;
    transform-origin: bottom
}

.card:after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 100%;
    background-color: #8E24AA;
    transform: scaleY(0);
    transition: all 0.5s;
    transform-origin: bottom
}

.card:hover::after {
    transform: scaleY(1)
}

.fonts {
    font-size: 11px
}

.social-list {
    display: flex;
    list-style: none;
    justify-content: center;
    padding: 0
}

.social-list li {
    padding: 10px;
    color: #8E24AA;
    font-size: 19px
}

.buttons button:nth-child(odd) {
    border: 1px solid #8E24AA !important;
    color: #8E24AA;
    height: 40px
}

.buttons button:nth-child(odd):hover {
    border: 1px solid #8E24AA !important;
    color: #fff;
    height: 40px;
    background-color: #8E24AA
}

.buttons1 button {
    border: 1px solid #8E24AA !important;
    background-color: #8E24AA;
    color: #fff;
    height: 40px
}

.buttons1 button:hover {
    border: 1px solid #8E24AA !important;
    color: #fff;
    height: 40px;
    background-color: #8E24AA
}

</style>
</head>
<body>
 <%
 Connection con = DBconnect.dbConnect();
//BufferedImage bufImg = null;
int count=0;
int pid = Integer.parseInt(request.getParameter("pid"));
getset.setPid(pid);
try
{
	PreparedStatement ps1 = con.prepareStatement("SELECT * FROM project WHERE pid=?");
	ps1.setInt(1,pid);
	ResultSet rs = ps1.executeQuery();
	if(rs.next())
	{
	%>
<div class="container mt-5" style="position:relative !important; top:4rem;">
    <div class="row d-flex justify-content-center">
        <div class="col-md-7" >
            <div class="card p-3 py-4">	
                <div class="text-center mt-3"> <span class="bg-secondary p-1 px-4 rounded text-white">Project ID : <%=rs.getInt(1) %></span>
                <br> <br>
                    <h5 class="mt-2 mb-0"><%=rs.getString(2) %></h5> <br>
                    <div class="px-4 mt-1">
                        <p class="mt-2 mb-0"><h5 style="display:inline;">Address</h5> : <%=rs.getString(3) %></p>
                    </div>
                    <br>
                    <div class="buttons"> <a href="AddRDept1.jsp"><button class="btn btn-outline-primary px-4">Add Dept.</button></a> <a href="AddTDept1.jsp?pid=<%=pid%>"><button class="btn btn-outline-primary px-4">Add Task to Dept.</button> </a> <a href="ViewEmpTasks1.jsp?pid=<%=getset.getPid() %>"><button class="btn btn-outline-primary px-4">View Tasks</button></a></div>
                	<br><div class="buttons1"> <a href="ViewEmpPro.jsp"><button class="btn btn-outline-primary px-4"> Back</button></a>  <a href="EmpMenu.html"><button class="btn btn-outline-primary px-4"> Main Menu</button></a></div> 
                </div>
            </div>
        </div>
    </div>
</div>
<%
}
}
catch(Exception e)
{
	e.printStackTrace();
} %>
</body>
</html>