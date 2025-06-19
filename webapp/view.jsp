<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pbid" class="simple.PlusBean23088" scope="request"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hello world</title>
</head>
<body>
    <jsp:getProperty name="pbid" property="expression"/>
    の計算結果は、<jsp:getProperty name="pbid" property="result"/>です。
</body>
</html>
