/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.SellerDAO;
import dao.ShipperDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;

/**
 *
 * @author dmanh
 */
public class SellerOrderController extends HttpServlet {

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
//           int idseller = Integer.parseInt(request.getParameter("idSeller"));
//            System.out.println(idseller);
            int  receiveMoney = new SellerDAO().getReceiveMoney(6);
            OrderDAO dAO = new OrderDAO();
           ShipperDAO shipperDAO = new ShipperDAO();
             List<Order> list2 = dAO.getAllOrder();
            String indexPage = request.getParameter("index");
            String searchName = request.getParameter("searchName");
             List<Order> list = new ArrayList<>();
            if(indexPage == null){
                indexPage = "1";
            }
          
            int index = Integer.parseInt(indexPage);
            
            int count = list2.size();
            int endPage = count / 9;
            if (count % 9 != 0) {
                endPage++;
            } 
            if(searchName == null){
                 list = dAO.getOrderWithpagging(index);
            }else{
                list = dAO.getOrderWithpaggingByPhone(index, searchName);
            }       
            request.setAttribute("page", indexPage);//de khi an vao trang 2 thi trang 2 mau den
            request.setAttribute("endP", endPage);
            request.setAttribute("receivemoney", receiveMoney);
            HttpSession session = request.getSession();
            session.setAttribute("listfood", list);
            request.getRequestDispatcher("sellerOrder.jsp").forward(request, response);
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
