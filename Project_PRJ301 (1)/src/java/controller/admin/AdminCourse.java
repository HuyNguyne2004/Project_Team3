package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Courses;
import dal.CourseDao;
import java.util.List;
import constant.CommonCost;
import model.Users;
import dal.UsersDao;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

public class AdminCourse extends HttpServlet {

    private final CourseDao dao = new CourseDao();
    private final UsersDao usersDao = new UsersDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Courses> listCourses = dao.findAll();
        request.getSession().setAttribute(CommonCost.SESSION_LIST_COURSE, listCourses);
        request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "edit":
                editCourse(request, response);
                return;
            case "delete":
                deleteCourse(request, response);
                return;
            case "add":
                addCourse(request, response);
                return;
            case "search":
                searchCourse(request, response);
                return;
            default:
                listCourses(request, response);
                return;
        }
    }

    private void editCourse(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Lấy thông tin từ request
            String courseIdStr = request.getParameter("course_id");
            String instructorIdStr = request.getParameter("instructor_id");
            String maxStudentsStr = request.getParameter("max_students");
            String roomIdStr = request.getParameter("room_id");

            // Kiểm tra dữ liệu đầu vào
            if (courseIdStr == null || instructorIdStr == null || maxStudentsStr == null || roomIdStr == null
                    || courseIdStr.isEmpty() || instructorIdStr.isEmpty() || maxStudentsStr.isEmpty() || roomIdStr.isEmpty()) {
                request.setAttribute("errorMessage", "Invalid input data. Please check all fields.");
                request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
                return;
            }

            int courseId = Integer.parseInt(courseIdStr);
            int instructorId = Integer.parseInt(instructorIdStr);
            int maxStudents = Integer.parseInt(maxStudentsStr);
            int roomId = Integer.parseInt(roomIdStr);

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String schedule = request.getParameter("schedule");
          

            // Kiểm tra instructor có tồn tại không
            if (!usersDao.isInstructorExist(instructorId)) {
                request.setAttribute("errorMessage", "Instructor ID does not exist.");
                request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
                return;
            }
            // Cập nhật course
            Courses updatedCourse = Courses.builder()
                    .course_id(courseId)
                    .title(title)
                    .description(description)
                    .instructor_id(instructorId)
                    .schedule(schedule)
                    .max_students(maxStudents)
                    .room_id(roomId)
                    .build();

            dao.update(updatedCourse);
            request.getSession().setAttribute("successMessage", "Course updated successfully!");
            System.out.println("✅ Success message set in session: Course updated successfully!");
            response.sendRedirect(request.getContextPath() + "/admin/course");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format.");
            request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
        }
    }

    private void addCourse(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Lấy thông tin từ request
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int instructorId = Integer.parseInt(request.getParameter("instructor_id"));
            String schedule = request.getParameter("schedule");
            int maxStudents = Integer.parseInt(request.getParameter("max_students"));
            int roomId = Integer.parseInt(request.getParameter("room_id"));

            // Kiểm tra instructor có tồn tại không
            if (!usersDao.isInstructorExist(instructorId)) {
                request.setAttribute("errorMessage", "Instructor ID does not exist.");
                request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
                return;
            }
            // Tạo course mới
            Courses newCourse = Courses.builder()
                    .title(title)
                    .description(description)
                    .instructor_id(instructorId)
                    .schedule(schedule)
                    .max_students(maxStudents)
                    .room_id(roomId)
                    .build();

            dao.insert(newCourse);
            // Thêm thông báo thành công vào session
            request.getSession().setAttribute("successMessage", "Course added successfully!");

            // Chuyển hướng về trang danh sách khóa học
            response.sendRedirect(request.getContextPath() + "/admin/course");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format.");
            request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
        }
    }

    private void deleteCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        dao.delete(course_id);
        response.sendRedirect(request.getContextPath() + "/admin/course");
    }

    private void listCourses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Courses> listCourses = dao.findAll();
        request.setAttribute("listCourse", listCourses);
        request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
    }

    private void searchCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchKeyword = request.getParameter("searchKeyword");

        List<Courses> courseList;
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            // Gọi DAO để tìm kiếm theo course_name
            courseList = dao.searchCoursesByName(searchKeyword);
            request.setAttribute("searchKeyword", searchKeyword); // Giữ lại từ khóa tìm kiếm trên giao diện
        } else {
            // Nếu không nhập từ khóa, lấy toàn bộ danh sách khóa học
            courseList = dao.findAll();
        }

        request.setAttribute(CommonCost.SESSION_LIST_COURSE, courseList);
        request.getRequestDispatcher("/view/admin/dashboard_course.jsp").forward(request, response);
    }

}
