import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Pluscon23088 extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {
        String input_x=request.getParameter("input_x");
        String input_y=request.getParameter("input_y");
        
        String url;

        try{
            int x = Integer.parseInt(input_x); 
            int y = Integer.parseInt(input_y);  

            url="/plus23088.jsp";
        }catch(NumberFormatException e){
            url="/error.html";
        }

        RequestDispatcher dispatcher
                   =getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}