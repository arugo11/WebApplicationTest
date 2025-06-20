package lib.usedb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DbInsertBean {
    // DB接続情報
    private static final String URL = "jdbc:postgresql://172.21.87.228:5433/test1";
    private static final String USER = "shibaura";
    private static final String PASSWORD = "toyosu";

    public boolean insertLog(String id, String name, String message) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "INSERT INTO T_LOG (ID, NAME, MESSAGE, WRITTENDATE) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, message);
            // JST時刻
            long now = System.currentTimeMillis() + 32400000L;
            pstmt.setTimestamp(4, new Timestamp(now));
            int result = pstmt.executeUpdate();
            return result == 1;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
    }
} 