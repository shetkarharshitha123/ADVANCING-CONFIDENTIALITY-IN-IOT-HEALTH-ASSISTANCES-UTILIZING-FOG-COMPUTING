<%-- 
    Document   : Download
    Created on : Mar 8, 2020, 7:20:29 AM
    Author     : KishanVenky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String fname=request.getParameter("fname");
session.setAttribute("fname",fname);
response.sendRedirect("Download2?"+fname);
%>
