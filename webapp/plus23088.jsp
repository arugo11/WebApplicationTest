<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calculation</title>
</head>
<body>

<%
  String input_x=request.getParameter("input_x");
  String input_y=request.getParameter("input_y");

  int x = Integer.parseInt(input_x); 
  int y = Integer.parseInt(input_y); 

  int result = x + y;
  out.println("<h2>計算結果は，" + result + "です．</h2>");
%>

</body>
</html>
