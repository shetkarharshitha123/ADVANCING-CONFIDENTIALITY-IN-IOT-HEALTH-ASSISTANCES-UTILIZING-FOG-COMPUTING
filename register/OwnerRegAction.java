/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.register;

import com.connection.DbConnection;
import com.connection.Queries;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */

public class OwnerRegAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
           ResultSet e=Queries.getExecuteQuery("select count(*) from owner where username='"+uname+"'and email='"+email+"'");
           while(e.next()){
              c=e.getInt(1); 
           }
           if(c==0){
           PreparedStatement st=con.prepareStatement("insert into owner value(null,?,?,?,?,?,?,?,?,'waiting')");
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
         response.sendRedirect("OwnerRegister.jsp?msg=success");   
        }   else{
           response.sendRedirect("OwnerRegister.jsp?msg=failed");     
        }
           }else{
               response.sendRedirect("OwnerRegister.jsp?msg=Username/Email Already Exist");
           }
       }catch(Exception e){
         System.out.println(e);  
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
