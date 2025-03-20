/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Admin
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */


// Abstract class GenericDAO that extends DBContext, which presumably manages database connections.
public abstract class GenericDAO<T> extends DBContext {

    // Database-related resources
    protected PreparedStatement statement;
    protected ResultSet resultSet;
    protected Map<String, Object> parameterMap;

    // Constants for logical conditions
    public static final boolean CONDITION_AND = true;
    public static final boolean CONDITION_OR = false;

    // Generic method to query all records from a table mapped to the given class type
    protected List<T> queryGenericDAO(Class<T> clazz) {
        List<T> result = new ArrayList<>();
        try {
            connection = getConnection();  // Get database connection
            String sql = "SELECT * FROM " + clazz.getSimpleName();  // Create SQL query
            statement = connection.prepareStatement(sql);  // Prepare statement
            resultSet = statement.executeQuery();  // Execute query

            // Map each row of the result set to an instance of the class and add to the result list
            while (resultSet.next()) {
                T obj = mapRow(resultSet, clazz);
                result.add(obj);
            }
        } catch (Exception e) {
            System.err.println("Exception in queryGenericDAO: " + e.getMessage());
        } finally {
            closeResources();  // Close resources
        }
        return result;
    }

    // Generic method to query records with a custom SQL and parameters
    protected List<T> queryGenericDAO(Class<T> clazz, String sql, Map<String, Object> parameterHashmap) {
        List<T> result = new ArrayList<>();
        try {
            connection = getConnection();
            List<Object> parameters = new ArrayList<>(parameterHashmap.values());
            statement = connection.prepareStatement(sql);

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index++, value);  // Set each parameter in the statement
            }

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                T obj = mapRow(resultSet, clazz);
                result.add(obj);
            }
        } catch (Exception e) {
            System.err.println("Exception in queryGenericDAO: " + e.getMessage());
        } finally {
            closeResources();
        }
        return result;
    }

    // Helper method to map a row from ResultSet to an instance of the given class type
    private static <T> T mapRow(ResultSet rs, Class<T> clazz) throws Exception {
        T obj = clazz.getDeclaredConstructor().newInstance();  // Create a new instance of the class
        Field[] fields = clazz.getDeclaredFields();

        for (Field field : fields) {
            Object value = getFieldValue(rs, field);  // Get the value of the field from the ResultSet
            field.setAccessible(true);
            field.set(obj, value);  // Set the field's value in the object
        }
        return obj;
    }

    // Helper method to get the value of a field from the ResultSet based on the field type
    private static Object getFieldValue(ResultSet rs, Field field) throws SQLException {
        String fieldName = field.getName();
        Class<?> fieldType = field.getType();

        if (fieldType == String.class) return rs.getString(fieldName);
        if (fieldType == int.class || fieldType == Integer.class) return rs.getInt(fieldName);
        if (fieldType == long.class || fieldType == Long.class) return rs.getLong(fieldName);
        if (fieldType == double.class || fieldType == Double.class) return rs.getDouble(fieldName);
        if (fieldType == boolean.class || fieldType == Boolean.class) return rs.getBoolean(fieldName);
        if (fieldType == float.class || fieldType == Float.class) return rs.getFloat(fieldName);

        return rs.getObject(fieldName);
    }

    // Generic method to update records using a custom SQL and parameters
    protected boolean updateGenericDAO(String sql, Map<String, Object> parameterMap) {
        return executeUpdate(sql, parameterMap);
    }

    // Generic method to delete records using a custom SQL and parameters
    protected boolean deleteGenericDAO(String sql, Map<String, Object> parameterMap) {
        return executeUpdate(sql, parameterMap);
    }

    // Helper method to execute update operations (INSERT, UPDATE, DELETE) with transaction management
    private boolean executeUpdate(String sql, Map<String, Object> parameterMap) {
        try {
            connection = getConnection();
            connection.setAutoCommit(false);  // Start transaction
            statement = connection.prepareStatement(sql);

            int index = 1;
            for (Object value : parameterMap.values()) {
                statement.setObject(index++, value);
            }

            statement.executeUpdate();
            connection.commit();  // Commit transaction
            return true;
        } catch (SQLException e) {
            rollbackTransaction();  // Rollback transaction on error
            e.printStackTrace();
            return false;
        } finally {
            closeResources();  // Close resources
        }
    }

    // Generic method to insert a record and return the generated key
    protected int insertGenericDAO(T object) {
        Class<?> clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();

        StringBuilder sqlBuilder = new StringBuilder("INSERT INTO ")
                .append(clazz.getSimpleName())
                .append(" (");

        List<Object> parameters = new ArrayList<>();
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                if (field.get(object) != null && !"id".equalsIgnoreCase(field.getName())) {
                    sqlBuilder.append(field.getName()).append(", ");
                    parameters.add(field.get(object));
                }
            } catch (IllegalAccessException e) {
                // Log or handle error if needed
            }
        }

        sqlBuilder.setLength(sqlBuilder.length() - 2);  // Remove last comma and space
        sqlBuilder.append(") VALUES (").append("?, ".repeat(parameters.size()));
        sqlBuilder.setLength(sqlBuilder.length() - 2);  // Remove last comma and space
        sqlBuilder.append(")");

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sqlBuilder.toString(), Statement.RETURN_GENERATED_KEYS);

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index++, value);
            }

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();

            int id = resultSet.next() ? resultSet.getInt(1) : 0;  // Get generated key
            connection.commit();
            return id;
        } catch (SQLException e) {
            rollbackTransaction();
            return 0;
        } finally {
            closeResources();
        }
    }

    // Method to find the total number of records in the table for the given class type
    protected int findTotalRecordGenericDAO(Class<T> clazz) {
        String sql = "SELECT COUNT(*) FROM " + clazz.getSimpleName();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            return resultSet.next() ? resultSet.getInt(1) : 0;
        } catch (SQLException e) {
            System.err.println("Exception in findTotalRecordGenericDAO: " + e.getMessage());
            return 0;
        } finally {
            closeResources();
        }
    }

    // Method to find the total number of records matching custom conditions
    protected int findTotalRecordGenericDAO(Class<T> clazz, String sql, Map<String, Object> parameterMap) {
        List<Object> parameters = new ArrayList<>(parameterMap.values());
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index++, value);
            }

            resultSet = statement.executeQuery();
            return resultSet.next() ? resultSet.getInt(1) : 0;
        } catch (SQLException e) {
            System.err.println("Exception in findTotalRecordGenericDAO: " + e.getMessage());
            return 0;
        } finally {
            closeResources();
        }
    }

    // Helper method to rollback a transaction in case of an error
    private void rollbackTransaction() {
        try {
            if (connection != null) {
                connection.rollback();
            }
        } catch (SQLException e) {
            System.err.println("Exception in rollbackTransaction: " + e.getMessage());
        }
    }

    // Helper method to close database resources
    private void closeResources() {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.err.println("Exception in closeResources: " + e.getMessage());
        }
    }
    
      protected int insertGenericDAO(String sql, Map<String, Object> parameterMap) {
        List<Object> parameters = new ArrayList<>();

        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
            Object conditionValue = entry.getValue();

            parameters.add(conditionValue);
        }

        connection = getConnection();
        int id = 0;
        try {
            // Bắt đầu giao dịch và chuẩn bị câu truy vấn
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

            // Thực thi câu truy vấn
            statement.executeUpdate();

            // Lấy khóa chính (ID) được tạo tự động
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            // Xác nhận giao dịch thành công
            connection.commit();
        } catch (SQLException e) {
            try {
                System.err.println("4USER: Bắn Exception ở hàm insert: " + e.getMessage());
                // Hoàn tác giao dịch nếu xảy ra lỗi
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("4USER: Bắn Exception ở hàm insert: " + ex.getMessage());
            }
        } finally {
            // Đảm bảo đóng kết nối và tài nguyên
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                System.err.println("4USER: Bắn Exception ở hàm insert: " + e.getMessage());
            }
        }
        // Trả về ID được tạo tự động (nếu có)
        return id;
    }
      
      

    // Abstract method to be implemented by subclasses to find all records
    public abstract List<T> findAll();

    // Abstract method to be implemented by subclasses to insert a record
//    public abstract int insert(T t);
}
