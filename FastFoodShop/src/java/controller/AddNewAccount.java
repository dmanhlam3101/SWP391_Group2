/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author dmanh
 */
public class AddNewAccount extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
                    
            AccountDAO accdao = new AccountDAO();

            Account account = accdao.checkAccountExist(username);
            if (account == null) {
                //dc add
                switch (role) {
                    case 1:
                        //add customer
                        accdao.addNewAccount(username, password, name, address, phone, 1, 0, 0);
                        request.setAttribute("msg", "Add new account successfully!");
                        request.getRequestDispatcher("admin").forward(request, response);
                        break;
                    case 2:
                        //add seller
                        accdao.addNewAccount(username, password, name, address, phone, 0, 0, 1);
                        request.setAttribute("msg", "Add new account successfully!");
                        request.getRequestDispatcher("admin").forward(request, response);
                        break;
                    case 3:
                        //add shipper
                        accdao.addNewAccount(username, password, name, address, phone, 0, 1, 0);
                        request.setAttribute("msg", "Add new account successfully!");
                        request.getRequestDispatcher("admin").forward(request, response);
                        break;
                }
            } else {
                //ko dc add
                request.setAttribute("error", "Username exist");
                request.getRequestDispatcher("admin").forward(request, response);
            }

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
