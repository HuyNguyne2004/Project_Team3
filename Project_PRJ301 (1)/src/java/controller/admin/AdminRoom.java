package controller.admin;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.RoomDao;
import model.Rooms;
import constant.CommonCost;

/**
 *
 * @author Admin
 */
public class AdminRoom extends HttpServlet {

    RoomDao roomDao = new RoomDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Rooms> roomList = roomDao.findAll();
        request.setAttribute(CommonCost.SESSION_LIST_ROOM, roomList);
        request.getRequestDispatcher("../view/admin/dashboard_room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addRoom(request, response);
                    break;
                case "edit":
                    editRoom(request, response);
                    break;
                case "search":
                    searchRoom(request, response); // Gọi hàm tìm kiếm
                    return;
                default:
                    break;
            }
        }
    }

    private void addRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            String roomName = request.getParameter("room_name");
            int capacity = Integer.parseInt(request.getParameter("capacity"));

            // Tạo đối tượng Room
            Rooms newRoom = Rooms.builder().room_name(roomName).capacity(capacity).build();

            // Lưu vào database
            roomDao.add(newRoom);

            // Thêm thông báo thành công vào session
            session.setAttribute("successMessage", "✅ Thêm phòng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "❌ Lỗi khi thêm phòng: " + e.getMessage());
        }

        // Chuyển hướng về trang quản lý phòng sau khi xử lý
        response.sendRedirect(request.getContextPath() + "/admin/room");
    }

    private void editRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            int roomId = Integer.parseInt(request.getParameter("room_id"));
            String roomName = request.getParameter("room_name");
            int capacity = Integer.parseInt(request.getParameter("capacity"));

            // Cập nhật đối tượng Room
            Rooms updatedRoom = new Rooms(roomId, roomName, capacity);

            // Cập nhật vào database
            roomDao.update(updatedRoom);

            // Thêm thông báo thành công vào session
            session.setAttribute("successMessage", "✅ Cập nhật phòng thành công!");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "❌ Lỗi khi cập nhật phòng: " + e.getMessage());
        }

        // Chuyển hướng về trang quản lý phòng sau khi xử lý
        response.sendRedirect(request.getContextPath() + "/admin/room");
    }

    @Override
    public String getServletInfo() {
        return "Admin Room Servlet";
    }

    private void searchRoom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchKeyword = request.getParameter("search");

            List<Rooms> roomList;
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                // Gọi DAO để tìm kiếm phòng theo tên hoặc sức chứa
                roomList = roomDao.searchRooms(searchKeyword);
                request.setAttribute("searchKeyword", searchKeyword); // Lưu từ khóa để hiển thị lại trên form
            } else {
                // Nếu không có từ khóa tìm kiếm, lấy toàn bộ danh sách phòng
                roomList = roomDao.findAll();
            }

            // Đưa danh sách kết quả lên request
            request.setAttribute(CommonCost.SESSION_LIST_ROOM, roomList);

            // Chuyển hướng đến trang danh sách phòng
            request.getRequestDispatcher("../view/admin/dashboard_room.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "❌ Lỗi khi tìm kiếm phòng: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/room");
        }
    }

}
