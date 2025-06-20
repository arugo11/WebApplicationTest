<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>メッセージ登録結果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="container" style="max-width: 480px; margin-top: 60px;">
        <h2 class="text-center mb-4">メッセージ登録結果</h2>
        <%
            String message = (String)request.getAttribute("message");
            Boolean result = (Boolean)request.getAttribute("result");
        %>
        <div class="mb-4">
            <% if (result != null && result) { %>
                <div class="alert alert-success text-center" role="alert">
                    メッセージ「<%= message %>」を登録しました。
                </div>
            <% } else { %>
                <div class="alert alert-danger text-center" role="alert">
                    メッセージ「<%= message %>」の登録に失敗しました。
                </div>
            <% } %>
        </div>
        <div class="d-grid">
            <a href="chat23088.html" class="btn btn-outline-primary">戻る</a>
        </div>
    </div>
</body>
</html> 