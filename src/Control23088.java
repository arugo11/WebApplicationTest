import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import simple.PlusBean23088;

public class Control23088 extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {

    	String input_x = request.getParameter("input_x");
        String input_y = request.getParameter("input_y");

        int x = Integer.parseInt(input_x);
        int y = Integer.parseInt(input_y);

    	PlusBean23088 pb = new PlusBean23088();
    	pb.setExpression(x, y);
    	pb.calc(x,y);

    	request.setAttribute("pbid", pb);

    	String url="/view.jsp";
    	RequestDispatcher dispatcher
                   = getServletContext().getRequestDispatcher(url);
    	dispatcher.forward(request, response);
    }
}
