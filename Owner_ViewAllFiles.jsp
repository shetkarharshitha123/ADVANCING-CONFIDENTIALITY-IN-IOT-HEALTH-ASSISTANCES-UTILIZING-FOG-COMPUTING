<%-- 
    Document   : OWNER
    Created on : Feb 18, 2020, 10:49:57 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Queries"%>
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
 <link href="table.css" rel="stylesheet">
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
                        <a href="OwnerHome.jsp">Home</a>
                    </li>
                    <li>
                        <a href="ViewProfile.jsp">View Profile</a>
                    </li>
                    <li>
                        <a href="Owner_UploadedFiles.jsp">Upload Files</a>
                    </li>
                     <li>
                        <a href="Owner_ViewAllFiles.jsp">View All Files</a>
                    </li>
                    <li>
                        <a href="OWNER.jsp">Log out</a>
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
                    <%String email=(String)session.getAttribute("email");
                    String id=(String)session.getAttribute("id");%>
                    <h2> Owner :<%=email%></h2>
                </div>
                <hr>
                <div class="post-preview">
                    
                    
                   
                    
                           </div>
               
                <div class="post-preview">
                    <h4>File Details Here</h4>
                    <table border="1">
                        <tr>
                            <th>FILE ID</th>
                            <th>FILE NAME</th>
                            <th>DATA</th>
                            <th>UPLOAD DATE</th>
                              <th>STATUS</th>
                        </tr>
                        <%try{
                            String query="select * from file where owner='"+email+"' and status='fognode'";
                            
                            ResultSet r=Queries.getExecuteQuery(query);
                            while(r.next()){
                              %>
                             <tr> 
                                 <td><%=r.getString("fid")%></td>
                                 <td><%=r.getString("fname")%></td>
                                 <td><textarea cols="30" rows="5"><%=r.getString("data")%></textarea></td>
                                 <td><%=r.getString("fdate")%></td>
                                 <td><font color="red">Uploaded To Fog Node</font></td>
                                
                             </tr>
                              
                              <%
                            }
                            
                            
                            
                            
                            
                        }catch(Exception e){
                            out.println(e);
                            
}%>
                    </table>
                    
                    
                    
                    
                </div>
              
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
    