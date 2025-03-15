/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.connection.DbConnection;
import com.connection.Queries;
import com.encAnddec.encryption;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@MultipartConfig(maxFileSize=16*1024*1024)
public class UploadAction extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
           HttpSession session=request.getSession();
           String owner=(String)session.getAttribute("email");
           
           final String filepath="C://Sample//";
            //secrek key generation
                   KeyGenerator keyGen = KeyGenerator.getInstance("AES");
                                keyGen.init(128);
                                SecretKey secretKey = keyGen.generateKey();
                                System.out.println("secret key:" + secretKey);
                                //converting secretkey to String
                                byte[] be = secretKey.getEncoded();//encoding secretkey
                                String skey = Base64.encode(be);
           
          MultipartRequest r=new MultipartRequest(request,filepath);
           
          String fid=r.getParameter("fid");
            String owner1=r.getParameter("owner");
              String fname=r.getParameter("fname");
                
                  File p=r.getFile("file");
                        
            BufferedReader br=new BufferedReader(new FileReader(p));      
             StringBuffer sb=new StringBuffer();     
                  String temp=null;
                  
                  while((temp=br.readLine())!=null){
                      sb.append(temp);
                  }
                  String data=sb.toString();
                  String cipher=encryption.encrypt(data, secretKey);
           Connection con=DbConnection.getConnection();
           int c=0;
           ResultSet r1=Queries.getExecuteQuery("select count(*) from file where fname='"+fname+"'");
           while(r1.next()){
              c=r1.getInt(1); 
           }
           if(c==0){
            PreparedStatement pst=con.prepareStatement("insert into file values(null,?,?,?,?,?,?,?,now(),?,?)");
          pst.setString(1,fid); 
           pst.setString(2,owner); 
            pst.setString(3,fname); 
            pst.setString(4,data); 
             pst.setString(5,"waiting"); 
              pst.setString(6,"waiting"); 
               pst.setString(7,"fognode"); 
               
                 pst.setString(8,"waiting"); 
                pst.setString(9,"waiting"); 
              
            int i=pst.executeUpdate();
            if(i>0){
                
           response.sendRedirect("Owner_UploadedFiles.jsp?msg=success");   
            }else{
              response.sendRedirect("Owner_UploadedFiles.jsp?msg=failed");    
            }
           }else{
             response.sendRedirect("Owner_UploadedFiles.jsp?msg=already Exist");  
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
