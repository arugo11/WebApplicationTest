import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleServlet23088 extends HttpServlet {


    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {
    	String input_x=request.getParameter("input_x");
    	String input_y=request.getParameter("input_y");

        int x = Integer.parseInt(input_x); 
        int y = Integer.parseInt(input_y); 

        int result = x + y;
    	response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Calculation</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>計算結果は，" + result + "です．</h2>");
        out.println("</body>");
        out.println("</html>");
    }
}