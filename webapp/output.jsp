<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello world</title>
</head>
<body>
<h1> こんにちは </h1>
<%
  String name=request.getParameter("MYNAME");
%>
<h2>ようこそ！<%= name %>さん、こんにちは！</h2>
</body>
</html>
