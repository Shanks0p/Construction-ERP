<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Employee info</title>
</head>
<body>
<%
Connection con = DBconnect.dbConnect();
 int uid =0,eid=0,pid=0;
 String name = request.getParameter("name");
 pid = Integer.parseInt(request.getParameter("pid"));
 eid = Integer.parseInt(request.getParameter("eid"));

try{
	PreparedStatement ps1 = con.prepareStatement("INSERT INTO empasproj VALUES(?,?,?,?)");
	ps1.setInt(1, uid);
	ps1.setString(2, name);
	ps1.setInt(3, eid);
	ps1.setInt(4, pid);
	int i = ps1.executeUpdate();
	if(i>0)
		response.sendRedirect("AddedREmp.html");
	else
		response.sendRedirect("InvNum.html");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>