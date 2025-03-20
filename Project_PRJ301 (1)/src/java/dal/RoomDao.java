/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.LinkedHashMap;
import java.util.List;
import model.Rooms;

/**
 *
 * @author Admin
 */
public class RoomDao extends GenericDAO<Rooms> {

    @Override
    public List<Rooms> findAll() {
        return queryGenericDAO(Rooms.class);
    }

    public static void main(String[] args) {
        RoomDao roomDao = new RoomDao();

        // Test thêm phòng mới
        Rooms newRoom = Rooms.builder().capacity(122).room_name("huy2").build();
        roomDao.add(newRoom);
        System.out.println("Thêm phòng thành công!");

        // Test lấy danh sách phòng
        List<Rooms> rooms = roomDao.findAll();
        if (rooms != null && !rooms.isEmpty()) {
            for (Rooms room : rooms) {
                System.out.println("Room ID: " + room.getRoom_id() + ", Name: " + room.getRoom_name() + ", Capacity: " + room.getCapacity());
            }
        } else {
            System.out.println("No rooms found.");
        }

        // Test cập nhật phòng
        if (!rooms.isEmpty()) {
            Rooms updatedRoom = rooms.get(0);
            updatedRoom.setRoom_name("Phòng B202");
            updatedRoom.setCapacity(100);
            roomDao.update(updatedRoom);
            System.out.println("Cập nhật phòng thành công!");
        }

    }

    public void add(Rooms newRoom) {
        String sql = "INSERT INTO rooms (room_name, capacity) VALUES (?, ?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("room_name", newRoom.getRoom_name());
        parameterMap.put("capacity", newRoom.getCapacity());
        insertGenericDAO(sql, parameterMap);
    }

    public void update(Rooms updatedRoom) {
        String sql = "UPDATE rooms SET room_name = ?, capacity = ? WHERE room_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("room_name", updatedRoom.getRoom_name());
        parameterMap.put("capacity", updatedRoom.getCapacity());
        parameterMap.put("room_id", updatedRoom.getRoom_id());
        updateGenericDAO(sql, parameterMap);
    }

    public List<Rooms> searchRooms(String keyword) {
         String sql = "SELECT * FROM rooms WHERE room_name LIKE ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("room_name","%" + keyword + "%" );
        return queryGenericDAO(Rooms.class, sql, parameterMap);
    }

}
