<%-- 
    Document   : UserRegAction
    Created on : Mar 8, 2020, 7:05:00 AM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.Queries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

       
       
       String name=request.getParameter("name"); 
       String email=request.getParameter("email");
           String mobile=request.getParameter("mobile"); 
       String dob=request.getParameter("dob");
        String gender=request.getParameter("gender"); 
       String address=request.getParameter("address");
      String uname=request.getParameter("uname"); 
       String pwd=request.getParameter("pwd");
       
         
           Connection con=DbConnection.getConnection();
           int c=0;
           ResultSet e=Queries.getExecuteQuery("select count(*) from user where username='"+uname+"'and email='"+email+"'");
           while(e.next()){
              c=e.getInt(1); 
           }
           if(c==0){
           PreparedStatement st=con.prepareStatement("insert into user value(null,?,?,?,?,?,?,?,?)");
          st.setString(1,name); 
          st.setString(2,email);
          st.setString(3,mobile);
          st.setString(4,dob);
          st.setString(5,gender);
          st.setString(6,address);
          st.setString(7,uname);
          st.setString(8,pwd);
          
          
           int i=st.executeUpdate();
        if(i>0){
         response.sendRedirect("UserRegister.jsp?msg=success");   
        }   else{
           response.sendRedirect("UserRegister.jsp?msg=failed");     
        }
           }else{
               response.sendRedirect("UserRegister.jsp?msg=Username/Email Already Exist");
           }
       }catch(Exception e){
         System.out.println(e);  
       }
%>