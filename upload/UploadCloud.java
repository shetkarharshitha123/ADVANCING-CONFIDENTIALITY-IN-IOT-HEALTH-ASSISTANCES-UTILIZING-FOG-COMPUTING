/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.connection.Queries;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class UploadCloud extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
           String fid=request.getParameter("fid");
           String cdata=request.getParameter("cdata");
           String skey=request.getParameter("skey");
           String fname=request.getParameter("fname");
           String data=request.getParameter("data");
           
          String query="update file set enc_data='"+cdata+"',skey='"+skey+"',cdate=now(),status2='uploaded_to_cloud' where fid='"+fid+"'"; 
           
        int i=Queries.getExecuteUpdate(query);
       if(i>0){
              

    File f1 = new File("C:\\Sample\\",fname);
                                FileWriter fw = new FileWriter(f1);
                                fw.write(cdata);
                                fw.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f1, fname);
    
         response.sendRedirect("FN_View_Files.jsp?msg=Success");
            
      }else{
      response.sendRedirect("FN_View_Files.jsp?msg=Failed");
               
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
