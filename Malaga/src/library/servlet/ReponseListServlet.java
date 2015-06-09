package library.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.model.ReponseFactory;

@WebServlet(name="ReponseList", urlPatterns={"/ReponseList"})
public class ReponseListServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public ReponseListServlet() {
            super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    @Override
    public void destroy() {
            super.destroy();
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

        //init session of request
        HttpSession session = request.getSession();

        //init database classe
        ReponseFactory reponses;

        reponses = (ReponseFactory)session.getAttribute("reponseDB");
        if (reponses == null) {
            //get all books from the database class
            reponses = new ReponseFactory();
            session.setAttribute("reponseDB", reponses);
        }
        
        ReponseFactory reponsesS;

        reponsesS = (ReponseFactory)session.getAttribute("reponseDBS");
        if (reponsesS == null) {
            //get all books from the database class
            reponsesS = new ReponseFactory();
            session.setAttribute("reponseDBS", reponsesS);
        }

        //get the request dispatcher
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/reponseList.jsp");
        
        //forward to the jsp file to display the book list
        dispatcher.forward(request, response);		
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

            //call the doGet method
            this.processRequest(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

            //call the doGet method
            this.processRequest(request, response);
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
