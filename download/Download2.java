/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.download;

import com.connection.Queries;
import com.file.upload.decryption;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KishanVenky
 */
public class Download2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String email=(String)session.getAttribute("email");
            String id=(String)session.getAttribute("fname");
            /* TODO output your page here. You may use following sample code. */
           
            String fname = null, fkey = null;
            InputStream is = null;
String query="select * from file where fname='" + id+ "'";
ResultSet rt=Queries.getExecuteQuery(query);
            if (rt.next()) {
                fname = rt.getString("fname");
                fkey = rt.getString("skey");
                is = (InputStream) rt.getAsciiStream("enc_data");
            } else {
                out.println("error while retreiving data");
            }
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String temp = null;
            StringBuffer sb = new StringBuffer();
            while ((temp = br.readLine()) != null) {
                sb.append(temp + "\n");
            }
            Queries.getExecuteUpdate("insert into download values(null,'"+email+"','"+fname+"',now())");
            String content = new decryption().decrypt(sb.toString(), fkey);
            response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
            out.write(content);
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
