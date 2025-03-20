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
import model.Users;
import dal.UsersDao;

/**
 *
 * @author Admin
 */
public class UserSettings extends HttpServlet {

    UsersDao usersDao = new UsersDao();

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
            out.println("<title>Servlet UserSettings</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserSettings at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/view/user/dashboar_user/dashboard_setting.jsp").forward(request, response);
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
            case "account":
                updateUserName_Gmail(request, response);
                break;
            case "pass":
                updatePassWord(request, response);
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

    private void updateUserName_Gmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        String newName = request.getParameter("profile-name");
        String newEmail = request.getParameter("profile-email");

        if (newName == null || newEmail == null || newName.trim().isEmpty() || newEmail.trim().isEmpty()) {
            session.setAttribute("error", "Name and Email cannot be empty.");
            response.sendRedirect(request.getContextPath() + "/user/settings");
            return;
        }

        user.setFull_name(newName);
        user.setEmail(newEmail);

        boolean isUpdated = usersDao.updateUserName_Gmail(user);

        if (isUpdated) {
            // Cập nhật lại session để hiển thị thông tin mới ngay lập tức
            session.setAttribute("user", user);
            session.setAttribute("message", "Profile updated successfully.");
        } else {
            session.setAttribute("error", "Failed to update profile.");
        }

        // Chuyển hướng về trang profile (vẫn giữ dữ liệu mới)
        response.sendRedirect(request.getContextPath() + "/user/settings");
    }

    private void updatePassWord(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int userID = user.getUser_id();
        String currentPassword = request.getParameter("password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        // Kiểm tra các trường có bị null hoặc rỗng không
        if (currentPassword == null || newPassword == null || confirmPassword == null
                || currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {

            session.setAttribute("errorMessage", "All fields are required.");
            response.sendRedirect(request.getContextPath() + "/user/settings?action=pass");
            return;
        }

        // Kiểm tra mật khẩu mới và mật khẩu xác nhận có trùng khớp không
        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("errorMessage", "New password and confirm password do not match.");
            response.sendRedirect(request.getContextPath() + "/user/settings?action=pass");
            return;
        }


        // **Sử dụng hàm kiểm tra mật khẩu hiện tại**
        if (!usersDao.checkCurrentPassword(userID, currentPassword)) {
            session.setAttribute("errorMessage", "Current password is incorrect.");
            response.sendRedirect(request.getContextPath() + "/user/settings?action=pass");
            return;
        }

        // Cập nhật mật khẩu mới
        boolean updateSuccess = usersDao.updatePassword(userID, newPassword);

        if (updateSuccess) {
            session.setAttribute("successMessage", "Password updated successfully.");
        } else {
            session.setAttribute("errorMessage", "Failed to update password. Please try again.");
        }

        response.sendRedirect(request.getContextPath() + "/user/settings?action=pass");
    }

}
