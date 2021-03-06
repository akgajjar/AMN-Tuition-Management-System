<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Students</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->


<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />

<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationbat.js"></script>
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
 <script>  
var request=new XMLHttpRequest();  

	function showStudents(str) {
		
				var request = new XMLHttpRequest();
					  var url = "fetchstudent.jsp?val=" + str;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									document.getElementById("stu").innerHTML=val;
								}

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}

	function selectAll(source) {
		checkboxes = document.getElementsByName('chkstudent[]');
		for(var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>


</head>
<body>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">

select * from batch where status="running";
</sql:query>

<jsp:include page="header.jsp"/>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%
	employee1 e=null;
	if(session!=null)
	{
		if(session.getAttribute("e")!=null)
		{
			e=(employee1)session.getAttribute("e");
%>

<%
 if(e.getEmpdesignation().equalsIgnoreCase("Admin"))
 {
	 %>
	 <jsp:include page="adminheader.jsp"></jsp:include>
	 <%
 }
 else if(e.getEmpdesignation().equalsIgnoreCase("Faculty"))
 {
	 
 
 %>
 	 <jsp:include page="facultyheader.jsp"></jsp:include>
 
 
 <%} 
 else if(e.getEmpdesignation().equalsIgnoreCase("Counsellor"))
 {
	 
 
 %>
 	 <jsp:include page="coucellorheader.jsp"></jsp:include>
 
 <%}
 else if(e.getEmpdesignation().equalsIgnoreCase("Manager"))
 {

 %>
 	 <jsp:include page="managerheader.jsp"></jsp:include>
 
 <%
 }
 else if(e.getEmpdesignation().equalsIgnoreCase("Accountant"))
 {

 %>
 	 <jsp:include page="accountantheader.jsp"></jsp:include>
 
 <%
 }%>
 <br><br>
<%
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	
	%>
	
		<br>
	<h1>
		<b><font color="white">Remove Students From Batch</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">

			<form action="BatchController" method="post" id="batchrem">
				
				<input type="hidden" name="bid"> 
				
				<label class="head">
					Batch</label>
					
					<select name="batch" onchange="showStudents(this.value);"  class="dropdowncss">
										<option value="">--Select Batch For Update--</option>
										<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.batch_id}">${row.batch_name}(${row.cname}) </option>
										</c:forEach>
										</select>
				<br>
				
				
				<div class="w3l-user">
					<label class="head">Students</label>


					<div style="overflow-x: auto;">
						<table name="student" id="stu">


						</table>
						<br> <br>
					</div>
				</div>

				<center>

					<div class="btn">
						<center>
							<input type="submit" value="REMOVE STUDENTS"  name="action">
						</center>
					</div>

				</center>





			</form>
		</div>
	</div>
	<%-- 
	<div class="main">
		<h1>Update Students</h1>
		<br/>
		<div class="w3_agile_main_grids" ng-app>
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="agileits_w3layouts_main_grid">
								<h3>Remove Students</h3>
								<form action="BatchController" method="post">
								<input type="hidden" name="bid" >
									<span>
										<label> Batch</label>
										<select name="batch" onchange="showStudents(this.value);">
										<option value="">--Select Batch For Update--</option>
										<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.batch_id}">${row.batch_name}(${row.cname}) </option>
										</c:forEach>
										</select>
									</span> 
									
									<span> <label>Students</label> <br>
								<br>
								<br>
									<div style="overflow-x: auto;">
										<table name="student" id="stu">
											<tr>
												<th></th>
												<th><b>Student Id</b></th>
												<th>&nbsp;&nbsp;&nbsp;<b>Student Name</b></th>
											</tr>
										</table>
										<br> <br>
									</div>
								</span>




								<center><div class="w3_agileits_submit">
										<input type="submit" value="REMOVE STUDENTS" name="action">
										<input type="reset" value="RESET" name="reset">
									</div></center>
								</form>
							</div>
						</li>
				</ul>
				</div>
			</section>
		</div>
 --%>
<br/>
<jsp:include page="footer.jsp"/>
</body>
</html>