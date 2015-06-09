/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.model.*;


/**
 *
 * @author guzman
 */
@WebServlet(name = "ReponseCreateServlet", urlPatterns = {"/ReponseCreate"})
public class ReponseCreateServlet extends HttpServlet {

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
		
        //get session of the request
        HttpSession session = request.getSession();

        //init the simulate DB
        ReponseFactory simulateDB;
        simulateDB = (ReponseFactory)session.getAttribute("reponseDB");
        if (simulateDB == null) {
            //get all books from the database class
            simulateDB = new ReponseFactory();
            session.setAttribute("reponseDB", simulateDB);
        }

        //get book properties from the request
        long id = 0;
        try {
            String str = request.getParameter("id");
            if (str != null) {
                id = Long.parseLong(request.getParameter("id")); 
            }

        } catch(NumberFormatException e){
            RequestDispatcher rd;
            rd = (RequestDispatcher)this.getServletContext().getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
            return;
        }

        String rep1 = request.getParameter("mcm1");
        String rep2 = request.getParameter("mcm2");
        String mcmFinal = request.getParameter("mcmFinal");

        //create a new book object
        Reponse reponse = new Reponse(id, rep1, rep2, mcmFinal);
        //save the book if id == 0, otherwise update it.
        if (id == 0) {            
            simulateDB.createBook(reponse);
        } else {
            simulateDB.updateBook(reponse);
        }
        //redirect to the book list servlet ?mcm1="+rep1+"&mcm2="+rep2+"&mcm3="+mcm
        response.sendRedirect(request.getContextPath() + "/Alumno.jsp");
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
