<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.EmployeeMenu.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee Tasks</title>

<style>

*,
*::before,
*::after {
  box-sizing: unset;
}

body {
  background: #444;
  color: #fff;
  font-family: 'Poppins', sans-serif;
  margin: 0;
}

p {
  margin: 0 0 13px 0;
}

a {
  color: #fff;
}

.center { text-align: center; }

.container {
  width: 95%;
  max-width: 1220px;
  margin: 0 auto;
}

.episode {
  display: grid;
  grid-template-columns: 1fr 3fr;
  position: relative;
}

.episode__number {
  font-size: 7vw;
  font-weight: 600;
  padding: 10px 0;
  position: sticky;
  top: 0;
  text-align: center;
  height: calc(10vw + 20px);
  transition: all 0.2s ease-in;
}

.episode__content {
  border-top: 2px solid #fff;
  display: grid;
  grid-template-columns: 2fr 2fr 2fr 5fr 2fr 2fr 2fr 2fr 2fr;
  grid-gap: 10px;
  padding: 15px 0;
}

.episode__content .title {
  font-weight: 600
}

.episode__content .story {
  line-height: 26px;
}

@media (max-width: 600px) {
  .episode__content {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 576px) {
  .episode__content .story {
    font-size: 15px;
  }
}

</style>

</head>
<body>
<h3 style="position:absolute; left:3rem; top:1rem; font-size:1.5rem;"  ><a href="EmpMenu.html" style="text-decoration:none; color:#FFE743;">Main Menu</a></h3>
<h3 style="position:absolute; right:3rem; top:1rem; font-size:1.5rem;"><a href="EmpProDet.jsp?pid=<%=getset.getPid() %>" style="text-decoration:none; color:#FFE743;">Back</a></h3>
<div class="container">
  <h1 class="center">View Assigned Tasks</h1>
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
  		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM emptask WHERE pid=?");
  		ps1.setInt(1,pid);
  		ResultSet rs = ps1.executeQuery();
  		
  			int count=0;
  		
  		while(rs.next())
  		{
		
  %>
  <article class="episode">
    <div class="episode__number"><%=rs.getInt(1) %></div>
    <div class="episode__content">
      <div class="title">Title</div>
       <div class="title">Assigner</div>
       <div class="title">Priority</div>
       <div class="title"><center>Location</center></div>
       <div class="title">Start Date</div>
       <div class="title">End Date</div>
       <div class="title">Manpower</div>
       <div class="title">Responsible Dept/Emp </div>
        <div class="title">Comment</div>
      <div class="story">
      <p><%=rs.getString(4) %></p>
       </div>
        <div class="story">
      <p><%=rs.getString(5) %></p>
       </div>
       <div class="story">
      <p><%=rs.getString(6) %></p>
       </div>
       <div class="story" style="position:relative; top:-2rem;">
      <p><center><%=rs.getString(7) %></p>
       </center></div>
       <div class="story">
      <p><%=rs.getString(8) %></p>
       </div>
       <div class="story">
      <p><%=rs.getString(9) %></p>
       </div>
       <div class="story">
      <p><%=rs.getString(10) %></p>
       </div>
       <div class="story">
      <p><%=rs.getString(11) %></p>
       </div>
        <div class="story">
      <p><a href="Comment.jsp?pid=<%=rs.getInt("pid") %>">Comment</a></p>
       </div>
       </div>
  </article>
  <%
}
}
catch(Exception e)
{
	e.printStackTrace();
} %>
</div>
</body>
</html>