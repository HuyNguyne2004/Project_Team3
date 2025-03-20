/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.EnrollmentsDAO;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Enrollments;
import model.Users;
import constant.CommonCost;

/**
 *
 * @author Admin
 */
public class UserCourse extends HttpServlet {

    EnrollmentsDAO enrollmentsDAO = new EnrollmentsDAO();

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
            out.println("<title>Servlet UserCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserCourse at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/controller/authen?action=login");// Redirect về trang đăng nhập
            return;
        }
        int studentID = user.getUser_id();
        List<Enrollments> list = enrollmentsDAO.findByStudentID(studentID);
        System.out.println("Enrollments size: " + list.size());
        for (Enrollments e : list) {
            System.out.println("Enrollment: " + e.getEnrollment_id() + ", Course: " + e.getCourse_id() + ", Status: " + e.getStatus());
        }
        session.setAttribute(CommonCost.SESSION_LIST_COURSE_USER, list);
        request.getRequestDispatcher("/view/user/dashboar_user/dashboard_user_course.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        switch (action) {
            case "delete":
                delete(request, response);
                break;
            default:
                throw new AssertionError();
        }

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


    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy enrollment_id từ request
            int enrollment_id = Integer.parseInt(request.getParameter("enrollment_id"));

            // Gọi DAO để cập nhật trạng thái thành 'CANCELLED'
            boolean isDeleted = enrollmentsDAO.delete(enrollment_id);

            // Sử dụng session để lưu thông báo khi redirect
            HttpSession session = request.getSession();
            if (isDeleted) {
                session.setAttribute("message", "Enrollment ID " + enrollment_id + " has been cancelled.");
            } else {
                session.setAttribute("error", "Failed to cancel enrollment ID " + enrollment_id + ".");
            }

            // Chuyển hướng về trang danh sách khóa học sau khi xóa
            response.sendRedirect(request.getContextPath() + "/user/course");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Invalid enrollment ID.");
            response.sendRedirect(request.getContextPath() + "/user/course");
        }
    }


}
