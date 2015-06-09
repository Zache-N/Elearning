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


@WebServlet(name="ReponseEdit", urlPatterns={"/ReponseEdit"})
public class ReponseEditServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public ReponseEditServlet() {
            super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    @Override
    public void destroy() {
            super.destroy(); 
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

        //get session of the request
        HttpSession session = request.getSession();

        //init the simulate DB
        ReponseFactory simulateDB;
        ReponseFactory simulateDBS;
        simulateDB = (ReponseFactory)session.getAttribute("reponseDB");
        simulateDBS = (ReponseFactory)session.getAttribute("reponseDBS");


        //get the id of the request
        Long id = null;
        if(request.getParameter("id") != null)
            id = Long.valueOf(request.getParameter("id"));


        //get the book from simulated DB
        Reponse reponse = new Reponse();
        Reponse reponseS = new Reponse();
        if(id != null)
            reponse = simulateDB.findBook(id.longValue());
        	reponseS = simulateDBS.findBook(id.longValue());
        //set the book objekt in the request
        request.setAttribute("reponse", reponse);
        request.setAttribute("reponseS", reponseS);

        //get the request dispatcher
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Alumno.jsp");

        //forward to the jsp file to display the book list
        dispatcher.forward(request, response);	


    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        processRequest(request, response);

    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        processRequest(request, response);

    }
    

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occure
     */
    @Override
    public void init() throws ServletException {
            // Put your code here
    }

}
