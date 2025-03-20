/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import dal.UsersDao;
import constant.CommonCost;

/**
 *
 * @author Admin
 */
public class AuthenticationController extends HttpServlet {

    UsersDao dao = new UsersDao();

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthenticationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthenticationController at " + request.getContextPath() + "</h1>");
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
        //get to action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        //base on action to move
        String url;
        switch (action) {
            case "login":
                url = "view/authen/login.jsp";
                break;
            case "logout":
                url = logOut(request, response);
                break;
            case "sign_up":
                url = "view/authen/signup.jsp";
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
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
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        String url;
        switch (action) {
            case "login":
                url = loginDoPost(request, response);
                break;
            case "sign_up":
                url = signUpDoPost(request, response);
                break;
            case "logout":
                 url = logOut(request, response);
                 break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect(request.getContextPath() + "/" + url);

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

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        String email = request.getParameter("email");
        String password = request.getParameter("pswd");
        Users users = Users.builder().email(email)
                .password(password).build();
        Users isExit = dao.findByUserNameAndPass(users);
        if (isExit != null) {
            request.getSession().setAttribute(CommonCost.SESSION_USERS, isExit);
            url = "home";
        } else {
            request.getSession().setAttribute("error", "Username and pass incorrect");
            url = request.getContextPath() + "/view/authen/login.jsp";
        }
        return url;

    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonCost.SESSION_USERS);
        return "home";
    }

    private String signUpDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url;
        // get about user input information
        String username = request.getParameter("txt");
        String email = request.getParameter("email");
        String password = request.getParameter("pswd");
        // check the username is exits
        Users users = Users.builder()
                .full_name(username)
                .email(email)
                .password(password)
                .build();
        boolean isExitUserName = dao.checkUsernameExits (users);
        //true => back to the register (set Notification error)
        if (isExitUserName){
            request.setAttribute("error","Username exits !!");
            url = "view/authen/login.jsp";
        }
        // false => back to the home (write new users in DB)
        else {
            dao.insert (users);
            url = "home";
        }
        return url;
    }

}
