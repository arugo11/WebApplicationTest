<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<%!
    // XSS対策：HTMLタグをエスケープするメソッド
    public String escapeHtml(String str) {
        if (str == null) {
            return "";
        }
        str = str.replace("&", "&amp;");
        str = str.replace("<", "&lt;");
        str = str.replace(">", "&gt;");
        str = str.replace("\"", "&quot;");
        str = str.replace("'", "&#39;");
        return str;
    }
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>最新チャットメッセージ20件</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #888; padding: 6px; }
        th { background: #eee; }
        td.center { text-align: center; }
    </style>
</head>
<body>
    <h2>最新チャットメッセージ20件</h2>
    <table>
        <tr>
            <th>発信者</th>
            <th>友達メッセージ</th>
            <th>更新日/時刻</th>
            <th>私のメッセージ</th>
        </tr>
        <%
            ArrayList<String[]> logs = (ArrayList<String[]>)request.getAttribute("logs");
            String myid = (String)request.getAttribute("myid");
            java.util.Date now = new java.util.Date();
            SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat hm = new SimpleDateFormat("HH:mm");
            SimpleDateFormat md = new SimpleDateFormat("MM/dd");
            String today = ymd.format(now);
            for (String[] row : logs) {
                String id = row[0];
                String name = row[1];
                String msg = row[2];
                String writtendate = row[3];
                // writtendate: yyyy-MM-dd HH:mm:ss.SSS
                String datePart = writtendate.substring(0, 10);
                String timePart = writtendate.substring(11, 16);
        %>
        <tr>
            <% if (id.equals(myid)) { %>
                <td></td><td></td>
                <td class="center">
                    <% if (datePart.equals(today)) { %>
                        <%= timePart %>
                    <% } else { %>
                        <%= md.format(java.sql.Date.valueOf(datePart)) %>
                    <% } %>
                </td>
                <td><%= escapeHtml(msg) %></td>
            <% } else { %>
                <td><%= escapeHtml(name) %></td>
                <td><%= escapeHtml(msg) %></td>
                <td class="center">
                    <% if (datePart.equals(today)) { %>
                        <%= timePart %>
                    <% } else { %>
                        <%= md.format(java.sql.Date.valueOf(datePart)) %>
                    <% } %>
                </td>
                <td></td>
            <% } %>
        </tr>
        <% } %>
    </table>
    <a href="chat23088.html">戻る</a>
</body>
</html> 