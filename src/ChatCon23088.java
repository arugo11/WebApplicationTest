import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.usedb.DbInsertBean;
import lib.usedb.DbSelectBean;
import java.util.ArrayList;

@WebServlet("/ChatCon23088")
public class ChatCon23088 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String message = request.getParameter("message");

        //（学籍番号・氏名）
        String id = "AL23088";
        String name = "Yudai Shimanaka";

        if ("Q".equals(message)) {
            // Qの場合: 履歴表示
            DbSelectBean selectBean = new DbSelectBean();
            ArrayList<String[]> logs = selectBean.getRecentLogs();
            request.setAttribute("logs", logs);
            request.setAttribute("myid", id);
            request.getRequestDispatcher("chatView23088.jsp").forward(request, response);
        } else {
            // それ以外: DB登録
            DbInsertBean insertBean = new DbInsertBean();
            boolean result = insertBean.insertLog(id, name, message);
            request.setAttribute("message", message);
            request.setAttribute("result", result);
            request.getRequestDispatcher("chatResult23088.jsp").forward(request, response);
        }
    }
} 