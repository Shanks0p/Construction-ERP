<%@page import="com.EmployeeMenu.getset"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Add Task</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="sidebar/css/style.css">
		
		  <!-- plugins:css -->
    <link rel="stylesheet" href="register/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="register/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="register/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="register/assets/images/favicon.ico" />
	
	<style>

#EmpDept{
      color: black;
      font-family: Arial, Helvetica, sans-serif;
      font-size: 18px;
    }


	 input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0;
}
	</style>
		
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary" style="position:relative; left:30px; padding:40px;" >
	          <i class="fa fa-bars" style="position:relative; font-size:30px; top:-10px; left:-10px;"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4 pt-5">
		  		<h1><a href="#" class="logo">Task</a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="AdminMenu.html" aria-expanded="false">Home</a>
	          </li>
	          <li>
	              <a href="#">About</a>
	          </li>
	          <li>
              <a href="DeptLogin.html" aria-expanded="false" >Pages</a>
	          </li>
	          <li>
              <a href="#">Portfolio</a>
	          </li>
	          <li>
              <a href="#">Contact</a>
	          </li>
	        </ul>


	      </div>
    	</nav>
<%
int eid = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
String rname = request.getParameter("name");
getset.setEid(eid);
getset.setPid(pid);
getset.setRde(rname);
%>
        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">

        
  <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                </div>
	                <h2 class="mb-4">Add New Task</h2>
                <form class="pt-3" action="AddTEmp3" method="post">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" name="title"  id="exampleInputUsername1" placeholder="Enter Title">
                  </div>
                   <div class="form-group">
                    <label for="priority" style="font-size:16px;">Choose level of Priority:</label>
                    <br><br>
						<select name="priority" id="EmpDept" required>
  							<option value="--" selected disabled>--</option>
  							<option value="Minimum">Minimum</option>
  							<option value="Medium">Medium</option>
  								<option value="Maximum">Maximum</option>
						</select>
                  </div>
				<div class="form-group">
                    <textarea name="location" placeholder="Enter Location" rows="4" cols="30" maxlength="500" required></textarea>
                  </div>
                  <div class="form-group">
                  <label for="sd">Select Start Date :</label>&nbsp;
 				 <input type="date" id="sd" name="sd" style="position:relative; top:-10px;" />
 				 <br><br>
 				  <label for="ed">Select End Date:</label>&nbsp;&nbsp;&nbsp;
 				 <input type="date" id="ed" name="ed" style="position:relative; top:-10px;" />
 				 </div>
                  <div class="form-group">
                    <input type="number" class="form-control form-control-lg" name="manpr"  id="exampleInputUsername1" placeholder="Enter required Manpower">
                  </div>
					<br><br>
                  <div class="mt-3">
                    <input type="submit" value="Add Task" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"	>
	          <input type="reset" value="RESET" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">
                  </div>
                  <br>
                  <div>
                  <a href="AdminMenu.html" style=" text-decoration: none;"><button type="button" name="Main Menu" style="width:100%;" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">Main Menu</button></a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
      </div>
		</div>

    <script src="sidebar/js/jquery.min.js"></script>
    <script src="sidebar/js/popper.js"></script>
    <script src="sidebar/js/bootstrap.min.js"></script>
    <script src="sidebar/js/main.js"></script>
     <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="register/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="register/assets/js/off-canvas.js"></script>
    <script src="register/assets/js/hoverable-collapse.js"></script>
    <script src="register/assets/js/misc.js"></script>
    <!-- endinject -->
  </body>
</html>