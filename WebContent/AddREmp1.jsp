<%@page import="com.EmployeeMenu.getset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="assets1/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets1/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="ViewFolder/assets1/css/demo/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="ViewFolder/assets1/images/favicon.png" />
<!--===============================================================================================-->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="ViewFolder/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ViewFolder/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ViewFolder/css/util.css">
	<link rel="stylesheet" type="text/css" href="ViewFolder/css/main.css">
	<link rel="stylesheet" href="register/assets/css/style.css">
<!--===============================================================================================-->
<style>
*{
text-align-last:center;
}
</style>
</head>
<body>
<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                <div class="mdc-card p-0">
                  <h6 class="card-title card-padding pb-0">Add Respective Employees</h6>
                  <br>
                  <form action="SearchEmp.jsp"  style="transform:translate(1300px, 0); border-color: 2px solid black;">
                  <input type="text" name="id1" id="id1" placeholder="Enter your Employee ID" >
                  <a href="SearchEmp.jsp" style=" text-decoration: none;"><button type="submit" name="button" >
                  Submit</button></a>
                  </form>
                  <br>
                  <div class="table-responsive">
                  <form action="AddREmp2" method="post">
                    <table class="table table-hoverable">
                      <thead>
                        <tr>
                          <th class="text-left">ID</th>
                          <th>Name</th>
                          <th>E-mail</th>
                          <th>Contact Number</th>
                          <th>Password</th>
                          <th>Emergency Cont. Number</th>
                          <th>Department</th>
                          <th>Address</th>                      
                          <th>Add?<th>
                        </tr>
                      </thead>
            <% Connection con = DBconnect.dbConnect();	
	  		String add = "Add";
	  		int pid;
	  		if(request.getParameter("pid")!=null)
	  		{
	  			pid = Integer.parseInt(request.getParameter("pid"));
		  		getset.setPid(pid);	
	  		}
	  		else
	  		{
	  			pid = getset.getPid();
	  		}
		  try
		  {
		  		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM employee"); 
		  		ResultSet rs = ps1.executeQuery();
		  		
		  		while(rs.next())
		  		{
		  		PreparedStatement ps2 = con.prepareStatement("SELECT * FROM empasproj"); 
		  		ResultSet rs2 = ps2.executeQuery();
		  		while(rs2.next())
		  		{
		  			if(rs.getInt(1)==rs2.getInt(3) && rs2.getInt(4)==pid)
		  				{
		  					add = "Added";
		  					break;	
		  				}
		  			else
		  			{
		  				add = "Add";
		  			}
		  		}	
		  %>
		  
                      <tbody>
                         
                        <tr>
                          <td class="text-left"><%= rs.getInt(1) %></td>
                          <td><%= rs.getString(2) %></td>
                          <td><%= rs.getString(3) %></td>
                          <td><%= rs.getString(4) %></td>
                          <td><%= rs.getString(5) %></td>
                          <td><%= rs.getString(6) %></td>
                          <td><%= rs.getString(7) %></td>
                          <td><%= rs.getString(8) %></td>
                          <%
                          if(add=="Add")
                          {
                        	  %>
                          <td><a href="AddREmp2.jsp?pid=<%=pid%>&eid=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>"><%=add %></a></td>
                          <%
                          }
                          else
                          {
                          %>
                          <td><%=add %></td>
                          <%
                          }
                          %>
                        </tr>
                      
                      </tbody>
          
                   
              
             <%
		  		}
		    		
		  		
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	  		
          %>
      </table>
       </form>
                     </div>
                </div>
              </div>   
              <br>
					<div>
                  <a href="ViewPro.jsp" style=" text-decoration: none; "><button type="button" name="Back" style="width:100%; font-size: 24px;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Go Back</button></a>
                  </div>  
              <br>
					<div>
                  <a href="AdminMenu.html" style=" text-decoration: none; "><button type="button" name="Main Menu" style="width:100%; font-size: 24px;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Main Menu</button></a>
                  </div>         
</body>
</html>