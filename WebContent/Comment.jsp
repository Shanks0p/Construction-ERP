<%@page import="com.EmployeeMenu.getset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comment Section</title>
<style type="text/css">

body{
    margin-top:20px;
    background:#eee;
    overflow:scroll;
}
@media (min-width: 0) {
    .g-mr-15 {
        margin-right: 1.07143rem !important;
    }
}
@media (min-width: 0){
    .g-mt-3 {
        margin-top: 0.21429rem !important;
    }
}

.g-height-50 {
    height: 50px;
}

.g-width-50 {
    width: 50px !important;
}

@media (min-width: 0){
    .g-pa-30 {
        padding: 2.14286rem !important;
    }
}

.g-bg-secondary {
    background-color: #fafafa !important;
}

.u-shadow-v18 {
    box-shadow: 0 5px 10px -6px rgba(0, 0, 0, 0.15);
}

.g-color-gray-dark-v4 {
    color: #777 !important;
}

.g-font-size-12 {
    font-size: 0.85714rem !important;
}

.media-comment {
    margin-top:20px
}

.form-section{
position:relative;
left:45rem;
top:2rem;
}

textarea{
resize:none;
}

input[type="submit"]
{
position:relative;
 top:3rem; 
 right:15.5rem;

 border-radius:10px; 
 cursor:pointer;
 background-color:black;
 color:white;
 font-weight:bolder;
 padding:12px;
 font-size:24px;
}

input[type="button"]
{
position:relative;
 top:-1.6rem; 
 right:-7.5rem;

 border-radius:10px; 
 cursor:pointer;
 background-color:black;
color:white;
 font-weight:bolder;
 padding:12px;
 font-size:24px
}

</style>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<div class="container">
<div class="row">
<%

Connection con = DBconnect.dbConnect();
	
try
{
		int pid;
		if(request.getParameter("pid")!=null)
		{
		 pid = Integer.parseInt(request.getParameter("pid"));
		getset.setPid(pid);
		}
		else
			 pid = getset.getPid();
		
		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM comment WHERE pid=?");
		ps1.setInt(1, getset.getPid());
		ResultSet rs = ps1.executeQuery();
		int count =0;
		while(rs.next())
		{
	count++;
%>
    <div class="col-md-8">
        <div class="media g-mb-30 media-comment">
            <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
              <div class="g-mb-15">
                <h2 class="h5 g-color-gray-dark-v1 mb-0"><%=rs.getString(3) %></h2>
              </div>
        
              <p><%=rs.getString(4) %></p>
        
     
            </div>
        </div>
    </div>

<%

		}
		if(count==0)
		{
			%> <h1>Oops!!!<br><br>No Comments yet</h1>
			<%
		}
		%>
		<div class="form-section">
            <form action="comment1" method="post">
            <label for="cbox">
            <h2>Add Comment : </h2>
            </label>
            <textarea name="cbox" id="cbox" cols="30" rows="4"></textarea>
            <input type="submit" name="submit" value="Submit" class="submit-btn"/>
            <br>
            <br>
           <%
          	int found=0;
           PreparedStatement ps2 = con.prepareStatement("SELECT * FROM dept WHERE name=?");
           ps2.setString(1, getset.getLname());
           rs = ps2.executeQuery();
           if(rs.next())
           {
        	   found=1;
           }
           if(getset.getLname()=="Admin")
           {
           %>
            <a href="ViewPro.jsp" style="text-decoration: none;"><input type="button" name="back" value="Go Back" class="submit-btn"/></a>
            <%
           }
           else if(found==1)
           {
        	   %>
        	    <a href="ViewDeptTasks1.jsp" style="text-decoration: none;"><input type="button" name="back" value="Go Back" class="submit-btn"/></a>
        	   <% 
           }
           else
           {
            %>
             <a href="ViewEmpTasks1.jsp" style="text-decoration: none;"><input type="button" name="back" value="Go Back" class="submit-btn"/></a>
            <%
           }
            %>
            </form>
       </div>
		<%
			
}
catch(Exception e)
{
	e.printStackTrace();
}

%>

</div>
</div>

</body>
</html>