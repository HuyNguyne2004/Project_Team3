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
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.Users;
import dal.EnrollmentsDAO;
import java.security.Timestamp;
import java.time.LocalDateTime;
import model.Enrollments;
import model.Courses;
import java.util.Random;
import dal.CourseDao;
import dal.RegisterDAO;

/**
 *
 * @author Admin
 */
public class RegisterCourse extends HttpServlet {

    EnrollmentsDAO enrollmentsDAO = new EnrollmentsDAO();
    CourseDao courseDao = new CourseDao();

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
            out.println("<title>Servlet RegisterCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterCourse at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        RegisterDAO registerDAO = new RegisterDAO(); // Tạo đối tượng RegisterDAO

        // 🟢 1️⃣ Lấy courseId từ request
        int courseId;
        try {
            courseId = Integer.parseInt(request.getParameter("courseId"));
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "⚠️ Mã khóa học không hợp lệ! Vui lòng thử lại.");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        // 🟢 2️⃣ Kiểm tra xem khóa học có tồn tại không
        int maxStudents = registerDAO.getMaxStudents(courseId);
        if (maxStudents == -1) {
            request.getSession().setAttribute("error", "⚠️ Khóa học không hợp lệ hoặc không tồn tại!");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        // 🟢 3️⃣ Lấy thông tin user từ session
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            request.getSession().setAttribute("error", "🔒 Bạn cần đăng nhập trước khi đăng ký khóa học!");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        int studentId = user.getUser_id();

        // 🛑 3️⃣.1 Kiểm tra nếu user bị BLOCKED
        String userStatus = registerDAO.getStudentStatus(studentId);
        if ("BLOCKED".equalsIgnoreCase(userStatus)) {
            request.getSession().setAttribute("error", "⛔ Bạn đã bị khóa tài khoản và không thể đăng ký khóa học!");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        // 🟢 4️⃣ Kiểm tra xem sinh viên đã đăng ký chưa
        if (registerDAO.isStudentEnrolled(studentId, courseId)) {
            request.getSession().setAttribute("error", "⚠️ Bạn đã đăng ký khóa học này trước đó!");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        // 🟢 5️⃣ Kiểm tra số lượng học viên trong lớp
        if (maxStudents == 0) {
            request.getSession().setAttribute("error", "🚫 Lớp học đã đầy! Không thể đăng ký.");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
            return;
        }

        // 🟢 6️⃣ Thực hiện đăng ký khóa học
        boolean success = registerDAO.registerCourse(studentId, courseId);

        if (!success) {
            request.getSession().setAttribute("error", "⚠️ Đã xảy ra lỗi khi đăng ký khóa học. Vui lòng thử lại sau.");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_error.jsp");
        } else {
            request.getSession().setAttribute("success", "✅ Bạn đã đăng ký khóa học thành công!");
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_success.jsp?courseId=" + courseId);
        }
    }

}
