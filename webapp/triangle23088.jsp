<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello world</title>
</head>
<body>

<%
  int num_stages=Integer.parseInt(request.getParameter("num_stages"));
  int i,j;
  for(i=1;i<=num_stages;i++){
    for(j=1;j<=i;j++){
      out.println("*");
    }
    out.println("<br>");
  }
%>
</body>
</html>
