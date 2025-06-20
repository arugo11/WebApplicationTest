package lib.usedb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class DbSelectBean {
    // DB接続情報
    private static final String URL = "jdbc:postgresql://172.21.87.228:5433/test1";
    private static final String USER = "shibaura";
    private static final String PASSWORD = getDbPassword();

    private static String getDbPassword() {
        String password = System.getenv("DB_PASSWORD");
        if (password == null) {
            System.err.println("環境変数 DB_PASSWORD が設定されていません。");
            return null;
        }
        return password;
    }

    public ArrayList<String[]> getRecentLogs() {
        ArrayList<String[]> logs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "SELECT ID, NAME, MESSAGE, WRITTENDATE FROM T_LOG ORDER BY WRITTENDATE DESC LIMIT 20";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String[] row = new String[4];
                row[0] = rs.getString("ID");
                row[1] = rs.getString("NAME");
                row[2] = rs.getString("MESSAGE");
                row[3] = rs.getTimestamp("WRITTENDATE").toString();
                logs.add(row);
            }
            // 古い順に並べ替え
            Collections.reverse(logs);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
        return logs;
    }
} 