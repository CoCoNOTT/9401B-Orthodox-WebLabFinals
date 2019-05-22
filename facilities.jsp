<%-- 
    Document   : facilities
    Created on : 05 16, 19, 11:21:44 PM
    Author     : Acer
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <html>
	<head>
	<title>Facilities page</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link rel= "stylesheet" href="../css/font.css"/>
		<link rel="stylesheet" href="../fontawesome/css/all.min.css">
		<link rel= "stylesheet" href="../css/facilities.style.css"/>
	</head>
		
	<body>
            <%
        String user = (String)session.getAttribute("currentuser");
        
        //redirect user to login page if not logged in
        if(user == null){
        	response.sendRedirect("/JSP/login.jsp");
        }
        %>
        
        <%
        String userid;
        String name = request.getParameter("name");
        String grp = request.getParameter("group");
        String adv = request.getParameter("adviser");
        String act = request.getParameter("activity");
        String venue = request.getParameter("venue");
        String noParticipants = request.getParameter("noParticipants");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        
        String janitorres = request.getParameter("janitor");
        String guardres = request.getParameter("guard");
        String staffres = request.getParameter("staff");

        String qty = request.getParameter("quantity");
        
        Class.forName("com.mysql.jdbc.Driver");
    
        Connection con = null;
        Statement st = null;
    
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/room", "root", "");
            st = con.createStatement();
    
            String sql = "INSERT INTO reservation (user_id,name,organization,adviser,activity,venue,event_date,event_time,members,janitor,security,staff,comment,status) VALUES('" + "" + "','" + name + "',"
                    + "'" + grp + "',"
                    + "'" + adv + "', '" + act + "','" + venue + "','" + date + "','" + time + "','" + noParticipants + "',"
                    + "'" + janitorres + "','" + guardres + "','" + staffres + "')";
            int flage = st.executeUpdate(sql);
            out.println("Successfully reserved");
        } catch (Exception e){
            e.printStackTrace();
        }
        %>
	<!-- Navigation start -->
			<nav class="navbar navbar-expand-md navbar-dark">
			<ul class = "navbar-nav mr-auto">
				<div class="logo">
				<li class="nav-item">
					<img src="../pictures/Logo.png" class="img-responsive" alt="Logo">
				</li>
				</div>
				<li class="nav-item">
					<a class="nav-link" href="../Index.html"> Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="facilities.html"> Facilities</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="guidelines.html"> Guidelines</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="reservation.html"> Reservation</a>
				</li>
				</ul>
				
				<ul class = "navbar-nav">
					<div class="user-img ">
						<li class="nav-item-right">			
							<div class="dropdown ">
								<button class="btn btn-secondary btn-circle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
								<img src="../pictures/user1.png" class="img-responsive" alt="Logo">
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" tabindex="-1" href="#">Papa Jones</a>
									<a class="dropdown-item" tabindex="-1" href="#">Profile</a>
									<a class="dropdown-item" tabindex="-1" href="#">Log out</a>
								</ul>
							</div>
						</li>
					</div>
				</ul>
		</nav>
	<!-- Header end -->
	
	<!-- Search box start -->
	
		<div class="col-md-4 offset-md-4">
			<div class="input-group mb-4">
			<input type="text" class="form-control" placeholder="Search...">
				<div class="input-group-append">
					<span class="input-group-text"><i class="fa fa-search"></i></span>
				</div>
			</div>
		</div>
	<!-- Search box end -->
	
	<!-- Button box Start -->
	<div class="col-md-10 offset-md-1">	
		<div class = "row">
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 1</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 2</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 3</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 4</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 5</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 6</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 7</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 8</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 9</button>
			<button class="btn btn-dark btn-lg btn-space" type="button" onclick="#">Floor 10</button>
		</div>
	</div>
	<!-- Button box end -->
	<!--Onclick Room Photo Modal start-->
		<div class="modal fade" id="modalRoomInfo">
		  <div class="modal-dialog modal-xl">
			<div class="modal-content">
			
			<!-- Modal Header-->
			  <div class="modal-header text-center">
				<h1 class="modal-title w-100 font-weight-bold">Facility Information</h3>
				<button type="button" class="close" data-dismiss="modal"><!-- Exit button-->
				</button>
			  </div>
			  
			  
			<!-- Modal Body start -->
			<div class="modal-body">
				<div class = "row">
					<div class="col">
						<!-- Image -->
						<div class="text-center">
							<img src="../pictures/noimg.png">
						</div>	
					</div>
					
					<!-- Facility Description start -->
					<div class="col">
						<h5 id="facilityInfo">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
						Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h5>
					
						<h5 id="facilityInfo">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
						Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h5>
					</div>
					<!-- Facility Description end -->
				</div>
			</div>
			<!-- Modal Body end -->
			  
			  
			<!-- Modal Footer start -->
			  <div class="modal-footer d-flex justify-content-center">
				<button class="btn btn-primary"  data-toggle="modal" data-target="#modalReservation">Reserve room</button>
			  </div>
			  
			</div>
		  </div>
		</div>
	<!-- Onclick Modal End -->
	
	
	
	<!--Reserve Room On Click Modal start-->
		<div class="modal fade" id="modalReservation">
		  <div class="modal-dialog modal-xl">
			<div class="modal-content">
			
			<!-- Modal Header-->
			  <div class="modal-header text-center">
				<h1 class="modal-title w-100 font-weight-bold">Event Information Sheet</h3>
				<button type="button" class="close" data-dismiss="modal"><!-- Exit button-->
				</button>
			  </div>
			  
			  
			<!-- Modal Body start -->
			
			<div class="modal-body">
					<form class="form-group">
					<!-- Form start -->
						<div class="row">	
							<div class="col-lg-6">
								<label>Name</label>
								<input type="name" class="form-control" name="name" placeholder="Name...">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-6">
								<label>Organization/Group/Class:</label>
								<input type="text" class="form-control" id="group" name="group" placeholder="Organization/Group/Class...">
							</div>
							<div class="col-lg-6">
								<label>Adviser:</label>
								<input type="text" class="form-control" id="adviserName" name="adviser" placeholder="Adviser...">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-6">
								<label>Activity/Event:</label>
								<input type="text" class="form-control" id="event" name="activity"  placeholder="Activity/Event...">
							</div>
							<div class="col-lg-6">
								<label>Venue:</label>
								<input type="text" class="form-control" id="venue" name="venue"  placeholder="Venue...">
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-6">
								<label>Date of the event:</label>			
									<input class="form-control" type="date" name="date" id="example-date-input">
							</div>
					
							<div class="col-lg-6">
								<label>Time of the event:</label>
								<input class="form-control" type="time" value="13:45:00" name="time" id="example-time-input">
							</div>
						</div>
						

						
						
						<div class="row">
							<div class="col-lg-6">
								<label>No. of members/Partipant/s:</label>
								<input type="text" class="form-control" id="noParticipants" name="noParticipants" placeholder="Enter No. of members/Partipant/s...">
							</div>
							
						</div>
						
					<div class="row"> 
					<!-- Form start -->
						<div class ="col-lg-3">
						<!-- Checkbox start -->
						<h4>Select "Yes" if needed, "No" if otherwise: </h4>
							<div class="checkbox">
                                            <label>Janitor/s</label>
                                            <select  class="dropdown " id="selector" name="janitor" onchange="selector();">
                                                <option class="dropdown-item" value="Yes" name="Yes">Yes</option>
                                                <option class="dropdown-item" value="No" name="No">No</option>
                                            </select>
                                            <br>
                                            <label>Security Guard</label>
                                            <select  class="dropdown " id="selector" name="guard" onchange="selector();">
                                                <option class="dropdown-item" value="Yes" name="Yes">Yes</option>
                                                <option class="dropdown-item" value="No" name="No">No</option>
                                            </select>
                                            <br>
                                            <label>Staff/s</label>
                                            <select  class="dropdown " id="selector" name="staff" onchange="selector();">
                                                <option class="dropdown-item" value="Yes" name="Yes">Yes</option>
                                                <option class="dropdown-item" value="No" name="No">No</option>
                                            </select>
					</div>
						</div>
						<!-- Checkbox end -->
						
					<!-- Drop down Equipment start -->
					<div class = "col">
						<label><h4>Equipments:</h4></label>
						<br><label><h6>List of Equipments:</h6></label>
						<select  class="dropdown " id="selector" onchange="selector();">
							<option class="dropdown-item" value="Bench">Bench</option>
							<option class="dropdown-item" value="Chair">Chair</option>
							<option class="dropdown-item" value="Platform">Platform</option>
							<option class="dropdown-item" value="Table">Table</option>
							<option class="dropdown-item" value="Triboard">Triboard</option>
							<option class="dropdown-item" value="Divider">Divider</option>
							<option class="dropdown-item" value="Microphone">Microphone</option>
							<option class="dropdown-item" value="Karaoke">Karaoke</option>
							<option class="dropdown-item" value="Projector">Projector</option>
							<option class="dropdown-item" value="Sound System">Sound System</option>
							<option class="dropdown-item" value="TV/DVD">TV/DVD</option>
						</select>
						
						<br><label><h6>Quantity:</h6></label>
					<!-- Quantity Input box-->
						<input type="text" placeholder="Quantity" id="quantity"  value ="1" name="quantity" required><br>
					<!-- Quantity Add button-->
						<input type="button" onclick="addItem()" value="Add">
					<!-- Quantity Delete button-->
						<input type="button" onclick="removeSelectedItem()" value="Remove">	
						
					</div>
					<!-- Drop down Equipment end -->
					
					<!-- Selected Item and quality container -->
					<div class = "col">
						<label><h4>Choosen Equipments:</h4></label><br>
						<div id="demo1" class="output_container">
							<p id="demo"></p>		
						</div>
					</div>
					<!-- Selected Item and quality container -->
					</div>
                                        <input type="submit" class="btn btn-primary btn-block btn-large" name = "submit" value = "submit">
				</form>
				<!-- Form end -->
				
				
				
			</div>
			<!-- Modal Body end -->
			  
			
		  </div>
		</div>
	</div>
	<!-- Reservation Modal End -->



	<!-- Facilities Image Gallery -->
	<section class="gallery-block cards-gallery">
		<div class="container">
				
				<!-- Row 1 -->
				<div class="row mb-3">
					<div class="col-md-4">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo"/></a>
					</div>
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo"/>
						</div>  
					</div>
					 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>  
					</div>
				</div>
			
				<div class="row mb-3"> 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>  
					</div>
					 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>  
					</div>
					 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>  
					</div>    
				</div>
				
				
				<div class="row mb-3"> 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>
					</div>
					 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>
					</div>
					 
					<div class="col-md-4">
						<div class="card">
						<img src="../pictures/noimg.png" alt="Park" class="card-img-top" data-toggle="modal" data-target="#modalRoomInfo">
						</div>  
					</div>
				</div>
		</div>
	</section>
	<!-- Facilities Image Gallery End -->

		<script src="../js/jquery.min.js"></script> 
		<script src="../js/item.js"></script>
		<script src="../js/moment.js"/></script>
		<script src="../js/popper.min.js"></script>	
		<script src="../js/bootstrap.min.js"/></script>
	</body>
</html>
