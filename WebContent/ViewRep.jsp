<%@page import="com.EmployeeMenu.getset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Reportings</title>
</head>

<style>

@import "bourbon@5.*";
 html {
	 box-sizing: border-box;
}
 *, *:before, *:after {
	 box-sizing: inherit;
}
 body {
	 font-family: Segoe-UI;
	 color: rgba(0, 0, 0, .87);
}
 a {
	 color: rgba(38, 137, 13, 1);
}
 a:hover, a:focus {
	 color: rgba(4, 106, 56, 1);
}
 .container {
	 margin: 5% 3%;
}
 @media (min-width: 48em) {
	 .container {
		 margin: 2%;
	}
}
 @media (min-width: 75em) {
	 .container {
		 margin: 2em auto;
		 max-width: 75em;
	}
}
 .responsive-table {
	 width: 100%;
	 margin-bottom: 1.5em;
	 border-spacing: 0;
}
 @media (min-width: 48em) {
	 .responsive-table {
		 font-size: 0.9em;
	}
}
 @media (min-width: 62em) {
	 .responsive-table {
		 font-size: 1em;
	}
}
 .responsive-table thead {
	 position: absolute;
	 clip: rect(1px 1px 1px 1px);
	/* IE6, IE7 */
	 padding: 0;
	 border: 0;
	 height: 1px;
	 width: 1px;
	 overflow: hidden;
}
 @media (min-width: 48em) {
	 .responsive-table thead {
		 position: relative;
		 clip: auto;
		 height: auto;
		 width: auto;
		 overflow: auto;
	}
}
 .responsive-table thead th {
	 background-color: #98c1d9;
	 border: 1px solid white;
	 font-weight: normal;
	 text-align: center;
	 color: #293241;
}
 .responsive-table thead th:first-of-type {
	 text-align: left;
}
 .responsive-table tbody, .responsive-table tr, .responsive-table th, .responsive-table td {
	 display: block;
	 padding: 0;
	 text-align: left;
	 white-space: normal;
}
 @media (min-width: 48em) {
	 .responsive-table tr {
		 display: table-row;
	}
}
 .responsive-table th, .responsive-table td {
	 padding: 0.5em;
	 vertical-align: middle;
}
 @media (min-width: 30em) {
	 .responsive-table th, .responsive-table td {
		 padding: 0.75em 0.5em;
	}
}
 @media (min-width: 48em) {
	 .responsive-table th, .responsive-table td {
		 display: table-cell;
		 padding: 0.5em;
	}
}
 @media (min-width: 62em) {
	 .responsive-table th, .responsive-table td {
		 padding: 0.75em 0.5em;
	}
}
 @media (min-width: 75em) {
	 .responsive-table th, .responsive-table td {
		 padding: 0.75em;
	}
}
 .responsive-table caption {
	 margin-bottom: 1em;
	 font-size: 1em;
	 font-weight: bold;
	 text-align: center;
}
 @media (min-width: 48em) {
	 .responsive-table caption {
		 font-size: 1.5em;
	}
}
 .responsive-table tfoot {
	 font-size: 0.8em;
	 font-style: italic;
}
 @media (min-width: 62em) {
	 .responsive-table tfoot {
		 font-size: 0.9em;
	}
}
 @media (min-width: 48em) {
	 .responsive-table tbody {
		 display: table-row-group;
	}
}
 .responsive-table tbody tr {
	 margin-bottom: 1em;
}
 @media (min-width: 48em) {
	 .responsive-table tbody tr {
		 display: table-row;
		 border-width: 1px;
	}
}
 .responsive-table tbody tr:last-of-type {
	 margin-bottom: 0;
}
 @media (min-width: 48em) {
	 .responsive-table tbody tr:nth-of-type(even) {
		 background-color: rgba(0, 0, 0, .12);
	}
}
 .responsive-table tbody th[scope="row"] {
	 background-color: rgba(38, 137, 13, 1);
	 color: black;
}
 @media (min-width: 30em) {
	 .responsive-table tbody th[scope="row"] {
		 border-left: 1px solid white;
		 border-bottom: 1px solid white;
	}
}
 @media (min-width: 48em) {
	 .responsive-table tbody th[scope="row"] {
		 background-color: transparent;
		 color: rgba(0, 0, 1, 0.87);
		 text-align: left;
	}
}
 .responsive-table tbody td {
	 text-align: right;
}
 @media (min-width: 48em) {
	 .responsive-table tbody td {
		 border-left: 1px solid white;
		 border-bottom: 1px solid white;
		 text-align: center;
	}
}
 @media (min-width: 48em) {
	 .responsive-table tbody td:last-of-type {
		 border-right: 1px solid white;
	}
}
 .responsive-table tbody td[data-type=currency] {
	 text-align: right;
}
 .responsive-table tbody td[data-title]:before {
	 content: attr(data-title);
	 float: left;
	 font-size: 0.8em;
	 color: rgba(0, 0, 0, .54);
}
 @media (min-width: 30em) {
	 .responsive-table tbody td[data-title]:before {
		 font-size: 0.9em;
	}
}
 @media (min-width: 48em) {
	 .responsive-table tbody td[data-title]:before {
		 content: none;
	}
}
 

</style>

<body bgcolor=cornflowerblue>

<h3 style="position:absolute; left:3rem; top:1rem; font-size:1.5rem;"  ><a href="AdminMenu.html" style="text-decoration:none; color:#073b4c;">Main Menu</a></h3>
<h3 style="position:absolute; right:3rem; top:1rem; font-size:1.5rem;"><a href="ViewPro.jsp?pid=<%=getset.getPid() %>" style="text-decoration:none; color:#073b4c;">Back</a></h3>

<div class="container">
  <table class="responsive-table">
    <caption style="color:biege;">View Reportings</caption>
    <thead>
      <tr>
        <th scope="col">Report ID</th>
        <th scope="col">Date</th>
        <th scope="col">Reporter</th>
        <th scope="col">Weather</th>
        <th scope="col">Weather Impact</th>
        <th scope="col">Accident</th>
        <th scope="col">Injuries</th>
        <th scope="col">WorkDone</th>
        <th scope="col">Description</th>
        <th scope="col">Equipment Used</th>
        <th scope="col">Material Delivery</th>
        <th scope="col">Material Quantity</th>
      </tr>
    </thead>
    <tbody>
    <%
    Connection con = DBconnect.dbConnect();
    int pid = 0;
    if(request.getParameter("pid")!=null){
    	pid = Integer.parseInt(request.getParameter("pid"));
    	getset.setPid(pid);
    }
    else
    {
    	pid = getset.getPid();
    }
    try
	  {
	  		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM reports WHERE pid=?");
	  		ps1.setInt(1, pid);
	  		ResultSet rs = ps1.executeQuery();
	  		while(rs.next())
	  		{
	  		
    %>
    
      <tr>
        <th scope="row" style="font-size:24px;"><center><%=rs.getInt(1) %></center></th>
        <td ><%=rs.getString(3) %></td>
        <td ><%=rs.getString(4) %></td>
        <td ><%=rs.getString(5) %></td>
        <td ><%=rs.getString(6) %></td>
        <td ><%=rs.getString(7) %></td>
        <td ><%=rs.getString(8) %></td>
        <td ><%=rs.getString(9) %>%</td>
        <td ><%=rs.getString(10) %></td>
        <td ><%=rs.getString(11) %></td>
        <td ><%=rs.getString(12) %></td>
        <td ><%=rs.getString(13) %></td>
      </tr>
      
      <%
	  		}
	  }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
      %>
    </tbody>
  </table>
</div>

</body>
</html>