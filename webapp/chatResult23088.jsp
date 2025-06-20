<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>メッセージ登録結果</title>
</head>
<body>
    <h2>メッセージ登録結果</h2>
    <%
        String message = (String)request.getAttribute("message");
        Boolean result = (Boolean)request.getAttribute("result");
    %>
    <p>
        <% if (result != null && result) { %>
            メッセージ「<%= message %>」を登録しました。
        <% } else { %>
            メッセージ「<%= message %>」の登録に失敗しました。
        <% } %>
    </p>
    <a href="chat23088.html">戻る</a>
</body>
</html> 