/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Admin
 */
import java.sql.*;
import dal.DBContext;

public class RegisterDAO extends DBContext {

    // 🟢 1️⃣ Kiểm tra số lượng học viên tối đa của khóa học
    public int getMaxStudents(int courseId) {
        String sql = "SELECT max_students FROM courses WHERE course_id = ?;";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_students");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Nếu không tìm thấy khóa học
    }

    // 🟢 2️⃣ Kiểm tra xem sinh viên đã đăng ký khóa học chưa
    public boolean isStudentEnrolled(int studentId, int courseId) {
        String sql = "SELECT COUNT(*) FROM enrollments WHERE student_id = ? AND course_id = ?;";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true; // Sinh viên đã đăng ký
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Chưa đăng ký
    }

    public boolean registerCourse(int studentId, int courseId) {
        // 🛑 Kiểm tra trạng thái sinh viên
        String studentStatus = getStudentStatus(studentId);
        if ("BLOCKED".equalsIgnoreCase(studentStatus)) {
            System.out.println("❌ Sinh viên bị chặn (BLOCKED), không thể đăng ký khóa học.");
            return false;
        }

        // 🔍 Kiểm tra số lượng sinh viên trước khi đăng ký
        int maxStudents = getMaxStudents(courseId);
        if (maxStudents == -1) {
            System.out.println("❌ Không tìm thấy khóa học.");
            return false;
        } else if (maxStudents == 0) {
            System.out.println("❌ Lớp học đã đầy! Không thể đăng ký.");
            return false;
        }

        // 🔍 Kiểm tra xem sinh viên đã đăng ký chưa
        if (isStudentEnrolled(studentId, courseId)) {
            System.out.println("❌ Sinh viên đã đăng ký khóa học này!");
            return false;
        }

        // 📝 SQL chèn vào bảng enrollments
        String insertSql = "INSERT INTO enrollments (student_id, course_id, enrolled_date, status) VALUES (?, ?, CURRENT_TIMESTAMP, 'ENROLLED');";

        // 🛠️ SQL cập nhật max_students trong bảng courses
        String updateSql = "UPDATE courses SET max_students = max_students - 1 WHERE course_id = ? AND max_students > 0;";

        try (Connection conn = getConnection(); PreparedStatement insertStmt = conn.prepareStatement(insertSql); PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {

            // ✅ Thêm vào enrollments
            insertStmt.setInt(1, studentId);
            insertStmt.setInt(2, courseId);

            int insertResult = insertStmt.executeUpdate();
            if (insertResult == 0) {
                System.out.println("❌ INSERT thất bại!");
                return false;
            }
            System.out.println("✅ INSERT thành công!");

            // ✅ Cập nhật max_students
            updateStmt.setInt(1, courseId);
            int updateResult = updateStmt.executeUpdate();
            if (updateResult == 0) {
                System.out.println("❌ Không thể giảm số lượng học viên (có thể đã đầy).");
                return false;
            }

            System.out.println("✅ Đăng ký thành công, số lượng học viên cập nhật!");
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 🟢 4️⃣ Hủy đăng ký khóa học
    public boolean unregisterCourse(int studentId, int courseId) {
        // Kiểm tra xem sinh viên đã đăng ký chưa
        if (!isStudentEnrolled(studentId, courseId)) {
            System.out.println("❌ Sinh viên chưa đăng ký khóa học này.");
            return false;
        }

        // SQL xóa đăng ký khóa học
        String deleteSql = "DELETE FROM enrollments WHERE student_id = ? AND course_id = ?;";

        // SQL cập nhật lại max_students
        String updateSql = "UPDATE courses SET max_students = max_students + 1 WHERE course_id = ?;";

        try (Connection conn = getConnection(); PreparedStatement deleteStmt = conn.prepareStatement(deleteSql); PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {

            // Xóa khỏi enrollments
            deleteStmt.setInt(1, studentId);
            deleteStmt.setInt(2, courseId);
            int deleteResult = deleteStmt.executeUpdate();

            if (deleteResult == 0) {
                System.out.println("❌ Xóa đăng ký thất bại!");
                return false;
            }
            System.out.println("✅ Xóa đăng ký thành công!");

            // Cập nhật lại max_students
            updateStmt.setInt(1, courseId);
            updateStmt.executeUpdate();

            System.out.println("✅ Cập nhật lại số lượng sinh viên thành công!");
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        RegisterDAO registerDAO = new RegisterDAO();

        int studentId = 101;  // Giả sử sinh viên có ID = 5
        int courseId = 1011;   // Giả sử khóa học có ID = 2

        // 🟢 1️⃣ Kiểm tra số lượng học viên tối đa
        int maxStudents = registerDAO.getMaxStudents(courseId);
        if (maxStudents == -1) {
            System.out.println("❌ Không tìm thấy khóa học!");
        } else {
            System.out.println("📌 Số lượng học viên tối đa của khóa học: " + maxStudents);
        }

        // 🟢 2️⃣ Kiểm tra xem sinh viên đã đăng ký chưa
        boolean enrolled = registerDAO.isStudentEnrolled(studentId, courseId);
        if (enrolled) {
            System.out.println("✅ Sinh viên đã đăng ký khóa học này.");
        } else {
            System.out.println("❌ Sinh viên chưa đăng ký khóa học này.");
        }

        // 🟢 3️⃣ Đăng ký khóa học
        System.out.println("\n🔹 Đang thực hiện đăng ký khóa học...");
        boolean success = registerDAO.registerCourse(studentId, courseId);
        if (success) {
            System.out.println("✅ Đăng ký khóa học thành công!");
        } else {
            System.out.println("❌ Đăng ký khóa học thất bại.");
        }

        // 🟢 4️⃣ Hủy đăng ký khóa học
        System.out.println("\n🔹 Đang thực hiện hủy đăng ký khóa học...");
        boolean cancelSuccess = registerDAO.unregisterCourse(studentId, courseId);
        if (cancelSuccess) {
            System.out.println("✅ Hủy đăng ký thành công!");
        } else {
            System.out.println("❌ Hủy đăng ký thất bại.");
        }
    }

    public String getStudentStatus(int studentId) {
        String sql = "SELECT status FROM users WHERE user_id = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString("status"); // Trả về trạng thái: ACTIVE, BLOCKED, ...
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "UNKNOWN"; // Mặc định nếu không tìm thấy
    }

}
