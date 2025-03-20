package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.EnrollmentsDAO;
import java.util.List;
import model.Enrollments;
import constant.CommonCost;
import java.sql.Timestamp;  // ✅ Đúng package
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Users;
import dal.UsersDao;
import model.Courses;
import dal.CourseDao;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Locale;

/**
 *
 * @author Admin
 */
public class AdminEnrollments extends HttpServlet {

    EnrollmentsDAO dao = new EnrollmentsDAO();
    UsersDao usersDao = new UsersDao();
    CourseDao courseDao = new CourseDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Enrollments> enrollmentList = dao.findAll();
        List<Courses> listCourses = courseDao.findAll();
        request.getSession().setAttribute(CommonCost.SESSION_LIST_COURSE, listCourses);
        request.setAttribute(CommonCost.SESSION_LIST_ENROLLMENTS, enrollmentList);
        request.getRequestDispatcher("../view/admin/dashboard_enrollments.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addEnrollment(request);
                    break;
                case "edit":
                    editEnrollment(request);
                    break;
                case "delete":
                    deleteEnrollment(request, response);
                    break;
                case "search":
                    searchEnrollment(request, response);
                    return;
                default:
                    break;
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/enrollments");
    }

    private void addEnrollment(HttpServletRequest request) {
        try {
            int studentId = Integer.parseInt(request.getParameter("student_id"));
            int courseId = Integer.parseInt(request.getParameter("course_id"));
            String status = request.getParameter("status");

            // Lấy ngày giờ hiện tại
            Timestamp enrolledDate = Timestamp.valueOf(LocalDateTime.now());

            // Tạo đối tượng Enrollment
            Enrollments newEnrollment = Enrollments.builder()
                    .student_id(studentId)
                    .course_id(courseId)
                    .status(status)
                    .enrolled_date(enrolledDate)
                    .build();

            // Lưu vào database
            dao.add(newEnrollment);

            // ✅ Thêm thông báo thành công vào session
            request.getSession().setAttribute("successMessage", "Thêm enrollment thành công!");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi thêm enrollment: " + e.getMessage());

            // ❌ Thêm thông báo lỗi vào session
            request.getSession().setAttribute("errorMessage", "Lỗi khi thêm enrollment!");
        }
    }

    private void editEnrollment(HttpServletRequest request) {
        try {
            int enrollmentId = Integer.parseInt(request.getParameter("enrollment_id"));
            int studentId = Integer.parseInt(request.getParameter("student_id"));
            int courseId = Integer.parseInt(request.getParameter("course_id"));
            String enrolledDateStr = request.getParameter("enrolled_date");
            String status = request.getParameter("status");

            // Chuyển đổi ngày từ String thành Timestamp
            DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
            LocalDateTime localDateTime = LocalDateTime.parse(enrolledDateStr, formatter);
            Timestamp enrolledDate = Timestamp.valueOf(localDateTime);

            // Cập nhật đối tượng Enrollment
            Enrollments updatedEnrollment = new Enrollments(enrollmentId, studentId, courseId, enrolledDate, status);

            // Cập nhật vào database
            dao.update(updatedEnrollment);

            // ✅ Thêm thông báo thành công vào session
            request.getSession().setAttribute("successMessage", "Cập nhật enrollment thành công!");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi cập nhật enrollment: " + e.getMessage());

            // ❌ Thêm thông báo lỗi vào session
            request.getSession().setAttribute("errorMessage", "Lỗi khi cập nhật enrollment!");
        }
    }

    private void deleteEnrollment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            int enrollmentId = Integer.parseInt(request.getParameter("enrollment_id"));
            boolean isDeleted = dao.delete(enrollmentId);

            if (isDeleted) {
                session.setAttribute("successMessage", "Enrollment deleted successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to delete enrollment.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred while deleting enrollment: " + e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void searchEnrollment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchIdStr = request.getParameter("search"); // Lấy dữ liệu từ form tìm kiếm
            List<Enrollments> enrollmentList;

            if (searchIdStr != null && !searchIdStr.trim().isEmpty()) {
                try {
                    int enrollmentId = Integer.parseInt(searchIdStr);
                    Enrollments enrollment = dao.findById(enrollmentId); // Tìm kiếm theo ID

                    if (enrollment != null) {
                        enrollmentList = List.of(enrollment);
                    } else {
                        enrollmentList = List.of(); // Không tìm thấy -> danh sách rỗng
                    }

                    request.setAttribute("searchKeyword", searchIdStr); // Giữ lại từ khóa trên form
                } catch (NumberFormatException e) {
                    // Nếu nhập không phải số, trả về danh sách rỗng
                    enrollmentList = List.of();
                    request.setAttribute("errorMessage", "❌ Vui lòng nhập số hợp lệ!");
                }
            } else {
                // Nếu không có từ khóa tìm kiếm, lấy toàn bộ danh sách enrollments
                enrollmentList = dao.findAll();
            }

            request.setAttribute(CommonCost.SESSION_LIST_ENROLLMENTS, enrollmentList);
            request.getRequestDispatcher("../view/admin/dashboard_enrollments.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi tìm kiếm enrollment: " + e.getMessage());
            request.getRequestDispatcher("../view/admin/dashboard_enrollments.jsp").forward(request, response);
        }
    }

}
