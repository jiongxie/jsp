package T1113_Database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logDelete")
public class LogDelete extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    HttpSession session = request.getSession();
    String mid = (String) session.getAttribute("smid");
    
    session.invalidate();
    
    LoginDao dao = new LoginDao();
    
    dao.logDelete(idx);
    
    PrintWriter out = response.getWriter();
    
    out.println("<script>");
    out.println("alert('"+mid+"님 탈퇴 되셨습니다.!');");
    out.println("location.href='"+request.getContextPath()+"/1113_Database/login.jsp';");
    out.println("</script>");
  }
}
