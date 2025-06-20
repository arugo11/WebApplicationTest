<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>最新チャットメッセージ20件</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/style.css">
    <style>
        .my-message-row {
            background: #e3f2fd !important;
        }
    </style>
</head>
<body>
    <div class="container" style="max-width: 700px; margin-top: 40px;">
        <h2 class="text-center mb-4">最新チャットメッセージ20件</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>発信者</th>
                        <th>友達メッセージ</th>
                        <th>更新日/時刻</th>
                        <th>私のメッセージ</th>
                    </tr>
                </thead>
                <tbody>
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
                            String datePart = writtendate.substring(0, 10);
                            String timePart = writtendate.substring(11, 16);
                            boolean isMine = id.equals(myid);
                    %>
                    <tr class="<%= isMine ? "my-message-row" : "" %>">
                        <% if (isMine) { %>
                            <td></td><td></td>
                            <td class="text-center table-primary">
                                <% if (datePart.equals(today)) { %>
                                    <%= timePart %>
                                <% } else { %>
                                    <%= md.format(java.sql.Date.valueOf(datePart)) %>
                                <% } %>
                            </td>
                            <td class="table-primary"><%= msg %></td>
                        <% } else { %>
                            <td><%= name %></td>
                            <td><%= msg %></td>
                            <td class="text-center">
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
                </tbody>
            </table>
        </div>
        <div class="d-grid mt-3">
            <a href="chat23088.html" class="btn btn-outline-primary">戻る</a>
        </div>
    </div>
</body>
</html> 