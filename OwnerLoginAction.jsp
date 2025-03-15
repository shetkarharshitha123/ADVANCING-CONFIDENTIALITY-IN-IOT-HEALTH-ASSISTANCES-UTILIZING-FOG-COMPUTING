<%-- 
    Document   : uSERnaction
    Created on : Mar 12, 2019, 11:56:37 PM
    Author     : Acer
--%>

<%@page import="com.connection.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%try{
            String uname=request.getParameter("uname");
            String pwd=request.getParameter("pwd");
            String query="select * from owner where username='"+uname+"'and password='"+pwd+"'";
           ResultSet rs=Queries.getExecuteQuery(query);
          if(rs.next()){
          
        String email=rs.getString("email"); 
              String id=rs.getString("id");
                         session.setAttribute("email",email);
           session.setAttribute("id",id);
              %>
              <script type="text/javascript">
                  window.alert("Login Successful.....!!");
                  window.location="OwnerHome.jsp";
                 </script>
              <%
          }else{
 
 %>
              <script type="text/javascript">
                  window.alert("Login Failed.....!!");
                  window.location="OWNER.jsp";
                 </script>
              <%
}
          
        }catch(Exception e){
            out.println(e);
        }%>