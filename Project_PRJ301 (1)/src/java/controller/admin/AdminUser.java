package controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.UsersDao;
import model.Users;
import java.util.List;
import constant.CommonCost;

/**
 * Servlet quản lý người dùng Admin.
 */
public class AdminUser extends HttpServlet {

    private final UsersDao dao = new UsersDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Users> userList = dao.findAll();
        request.getSession().setAttribute("listUser", userList);
        request.getRequestDispatcher("../view/admin/dashboard_user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addUser(request, response);
                    return; // Dừng sau khi xử lý để tránh lỗi sendRedirect()
                case "edit":
                    editUser(request, response);
                    return;
                case "delete":
                    deleteUser(request, response);
                    return;
                case "search":
                    searchUser(request, response); // Gọi hàm tìm kiếm
                    return;
                default:
                    request.getSession().setAttribute("errorMessage", "❌ Hành động không hợp lệ!");
                    response.sendRedirect(request.getContextPath() + "/admin/user");
            }
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            // Kiểm tra xem email đã tồn tại chưa
            if (dao.checkEmailExists(email)) {
                request.getSession().setAttribute("errorMessage", "❌ Email đã tồn tại, vui lòng chọn email khác!");
                response.sendRedirect(request.getContextPath() + "/admin/user");
                return;
            }

            // Tạo đối tượng User
            Users newUser = Users.builder()
                    .full_name(fullName)
                    .email(email)
                    .password(password)
                    .role(role)
                    .status(status)
                    .build();

            // Lưu vào database
            dao.add(newUser);

            // Lưu thông báo vào session
            request.getSession().setAttribute("successMessage", "✅ Thêm người dùng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "❌ Lỗi khi thêm người dùng: " + e.getMessage());
        }

        // Chuyển hướng sau khi xử lý
        response.sendRedirect(request.getContextPath() + "/admin/user");
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String newPassword = request.getParameter("password");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            // Lấy thông tin user hiện tại từ database
            Users existingUser = dao.findById(userId);
            if (existingUser == null) {
                request.getSession().setAttribute("errorMessage", "❌ Không tìm thấy người dùng!");
                response.sendRedirect(request.getContextPath() + "/admin/user");
                return;
            }

            // Nếu người dùng không nhập mật khẩu mới, giữ nguyên mật khẩu cũ
            String finalPassword = (newPassword == null || newPassword.isEmpty()) ? existingUser.getPassword() : newPassword;

            // Cập nhật đối tượng User
            Users updatedUser = Users.builder()
                    .user_id(userId)
                    .full_name(fullName)
                    .email(email)
                    .password(finalPassword)
                    .role(role)
                    .status(status)
                    .build();

            // Cập nhật vào database
            dao.update(updatedUser);

            // Lưu thông báo vào session
            request.getSession().setAttribute("successMessage", "✅ Cập nhật người dùng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "❌ Lỗi khi cập nhật người dùng: " + e.getMessage());
        }

        // Chuyển hướng sau khi xử lý
        response.sendRedirect(request.getContextPath() + "/admin/user");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            boolean isDeleted = dao.delete(userId);

            if (isDeleted) {
                session.setAttribute("successMessage", "✅ Xóa người dùng thành công!");
            } else {
                session.setAttribute("errorMessage", "❌ Không thể xóa người dùng!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "❌ Lỗi khi xóa người dùng: " + e.getMessage());
        }

        // Chuyển hướng sau khi xử lý
        response.sendRedirect(request.getContextPath() + "/admin/user");
    }

    @Override
    public String getServletInfo() {
        return "Admin User Servlet";
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchKeyword = request.getParameter("search");

        List<Users> userList;
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            // Tìm kiếm user theo tên hoặc email
            userList = dao.searchUsers(searchKeyword);
            request.setAttribute("searchKeyword", searchKeyword); // Giữ lại từ khóa trên form
        } else {
            // Nếu không có tìm kiếm, lấy toàn bộ user
            userList = dao.findAll();
        }

        request.getSession().setAttribute(CommonCost.SESSION_USERS, userList);
        request.getSession().setAttribute("searchKeyword", searchKeyword);
        request.getRequestDispatcher("../view/admin/dashboard_user.jsp").forward(request, response);
    }

}
