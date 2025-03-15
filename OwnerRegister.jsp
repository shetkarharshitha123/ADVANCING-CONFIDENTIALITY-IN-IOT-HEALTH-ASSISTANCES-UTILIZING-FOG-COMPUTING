<%-- 
    Document   : OWNER
    Created on : Feb 18, 2020, 10:49:57 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Advancing Confidentiality</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="index.html">Fog Computing</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                     <li>
                        <a href="User.jsp">User</a>
                    </li>
                    <li>
                        <a href="OWNER.jsp">OWNER</a>
                    </li>
                    <li>
                        <a href="FogNode.jsp">Fog Node</a>
                    </li>
                    <li>
                        <a href="Cloud.jsp">Cloud</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h2>Advancing Confidentiality</h2>
                        <hr class="small">
                        <span class="subheading">In IoT Health Assistance Utilizing Fog Computing</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-preview">
                   Owner Registration Here
                </div>
                <hr>
                <div class="post-preview">
                     <%
                                            String msg=request.getParameter("msg");
                                            if(msg!=null){
                                              if(msg.equals("success")){
                                                 %>
                                                 <font color="green"><h2>Registration Success...!!</h2></font>      
                                                 <%
                                              }else if(msg.equals("failed")){
%>
                                                 <font color="red"><h2>Registration Failed...!!</h2></font>      
                                                 <%
} else{
%>
                                                 <font color="red"><h2>Username/Email Already Exist..!!</h2></font>      
                                                 <%
} 
                                            }
                                            
                                            
                                            %>
                    
                <form action="OwnerRegAction" method="post">
					 <table>
                                 <tr><th>Name:</th><td><input type="text" name="name" required="" style="height:30px;width:220px;"/></td></tr>
                               <tr><th>Email:</th><td><input type="text" name="email" required="" style="height:30px;width:220px;"/></td></tr>
                              <tr><th>Mobile:</th><td><input type="text" name="mobile" required="" style="height:30px;width:220px;"/></td></tr>
                               <tr><th>Date Of Birth</th><td><input type="date" name="dob" required="" style="height:20px;width:206px;"/></td></tr>
                               <tr><th>Gender</th><td><input type="text" name="gender" required="" style="height:30px;width:220px;"/></td></tr>
                           <tr><th>Address</th><td><input type="text" name="address" required="" style="height:30px;width:220px;"/></td></tr>
                               <tr><th>UserName</th><td><input type="text" name="uname" required="" style="height:30px;width:220px;"/></td></tr>
                             <tr><th>Password</th><td><input type="password" name="pwd" required="" style="height:20px;width:206px;"/></td></tr>
                            
                               
                               
                               
                               <tr><th></th><td><input type="submit" value="Register"></td></tr>
                              <tr><th></th><td>Already Have An Account?<a href="OWNER.jsp"> Login</a></td></tr>
                            
                            </table> 
                                                </form>   
                    
                    
                    
                    
                    
                           </div>
                <hr>
                <div class="post-preview">
                   
                    
                </div>
                <hr>
                <div class="post-preview">
                   
                  
                    
                </div>
                <hr>
               
            </div>
        </div>
    </div>

    <hr>

   

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
