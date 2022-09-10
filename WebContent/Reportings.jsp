<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="HoverCard2/style.css">

    <title>Card Hover Effect</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <link rel="stylesheet" type="text/css" media="screen" href="HoverCard2/style.css" />

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"

        crossorigin="anonymous">
        
<style>
*{

}
    
 .btn-gradient-primary {
    background: -webkit-gradient(linear, left top, right top, from(#da8cff), to(#9a55ff));
    background: linear-gradient(to right, #da8cff, #9a55ff);
    border: 0;
    -webkit-transition: opacity 0.3s ease;
    transition: opacity 0.3s ease;
    color:white;
    cursor: pointer;
}

.btn-lg, .btn-group-lg > .btn {
  padding: 2rem 3rem;
  font-size: 1 rem;
  border-radius: 0.1875rem; }
       
       .auth-form-btn {
       font-weight:bolder;
  height: 50px;
  line-height: 0.2; }
             
h2{
  font-size:45px;
  font-family: 'Abel', sans-serif;
  text-align:center;
  color:rgb(255,255,255);
  text-shadow: 0 0 4px rgb(255,255,255);
  transform: translatey(35px);
}

.footer{
  position: absolute;
  bottom: 120px;
  marging: 10px;
  width: 100%;
   text-align: center;
}



</style>

</head>

<body>

    <div class="container" style="display:flex; justify-content:center; ">

       
		<% Connection con = DBconnect.dbConnect();
		  		
		  try
		  {
		  		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM reports"); 
		  		ResultSet rs = ps1.executeQuery();
		  		
		  			int count=0;
		  		
		  		while(rs.next())
		  		{
						count++;
		  			if(rs.getString(2)!=null)
		  			{
		  			
		  %>
		  
        <div class="card" style="position:relative; height:40px; ">

<a href="AddTEmp2.jsp?id=<%=rs.getInt(1)%>&pid=<%=request.getParameter("pid") %>&name=<%=rs.getString(2) %>" style="text-decoration:none;">
            <div class="slide slide1" style="margin-right:60px;" >

                <div class="content">

                   <div class="icon">

                       <!--   <i class="fa fa-user-circle" aria-hidden="true"></i> -->
                       <h2>ID : <%=rs.getInt(1) %></h2>
                    </div> 
                </div>

            </div>

            <div class="slide slide2">

                <div class="content">

                    <h3>

                       Name : <%=rs.getString(2) %>

                    </h3>

                    <p><b>Email</b> : <%=rs.getString(3) %></p>
                    <p><b>Contact</b> : <%=rs.getString(4) %></p>
                    <p><b>Post</b> : <%=rs.getString(7) %></p>
                    <p><b>Address</b> : <%=rs.getString(8) %></p>

                </div>

            </div>
        </a>
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

    </div>
    <div class="footer" style="padding:0px;">
    
    <br>
					<div class="btn-gradient-primary">
                  <a href="ViewPro.jsp" style=" text-decoration: none; "><button type="button" name="back" style="width:100%; font-size: 24px;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Back</button></a>
                  </div>
    
    <br>
					<div class="btn-gradient-primary">
                  <a href="AdminMenu.html" style=" text-decoration: none; "><button type="button" name="Main Menu" style="width:100%; font-size: 24px;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Main Menu</button></a>
                  </div>
	</div>   
</body>

</html>
<!-- partial -->
  
</body>
</html>