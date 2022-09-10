<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="register/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="register/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="register/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="register/assets/images/favicon.ico" />
</head>
<body>
<%
Connection con = DBconnect.dbConnect();
 int id = Integer.parseInt(request.getParameter("id"));
try
{
	PreparedStatement ps1 = con.prepareStatement("delete FROM dept where d_id=?");
	ps1.setInt(1,id);
	int i = ps1.executeUpdate();
	
	if(i>0)
	{
		response.sendRedirect("ViewDept.jsp");
	}
	else
	{
		response.sendRedirect("NotFound.html");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("temp.html");
}

%>
</body>
</html>