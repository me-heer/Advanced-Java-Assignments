/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mihir.javaheroku;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

/**
 *
 * @author mformihir
 */
public class Signup extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String message = "";
            //username validation
            String username = request.getParameter("username");
            if(username.length() < 6)
                message += "Invalid Username. Minimum length of username should be 6.</br>";
            
            //password validation
            String password = request.getParameter("password");
            if(!Pattern.matches("^[a-z]{6,20}$", password))
                message += "Invalid Password. The password should be 6-20 characters long. </br>";
            if(!Pattern.matches("\\W{1}", password))
                message += "The password should contain at least 1 special symbol.</br>";
            if(!Pattern.matches("\\d{1}", password))
                message += "The password should contain at least 1 digit.</br>";
            if(!Pattern.matches("^[A-Z]+$", password))
                message += "The password should contain at least 1 uppercase letter.</br>";
            
            //confirm password validation
            String confirmPassword = request.getParameter("cpassword");
            if(!confirmPassword.equals(password))
                message += "Password and Confirm Password must be the same. </br>";

            //email validation
            String email = request.getParameter("email");
            if(!Pattern.matches("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)* @[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$",email))
                message += "Invalid E-mail Address. </br>";

            //phone number validation
            String phoneNumber = request.getParameter("phonenumber");
            if(!Pattern.matches("^[0-9]{6,10}$",phoneNumber))
               message += "The phone number should contain 6-10 digits. </br>";
            
            //address validation
            String address = request.getParameter("address");
            String[] testAddress = address.split("\\n");
            if(testAddress.length < 3)
               message += "Address should contain at least 3 lines. </br>";
            
            //hobbies validation
            String[] hobbies = request.getParameterValues("hobbies");
            if(hobbies.length < 3)
                message += "You should have at least 3 hobbies selected. </br>";
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Signup</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Signup at " + request.getContextPath() + "</h1>");
            if(message.length() > 0)
                out.println("<h2>" + message + "</h2>");
            else
                out.println("<h2> SignUp Success! </h2>");
            out.println("</body>");
            out.println("</html>");
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
