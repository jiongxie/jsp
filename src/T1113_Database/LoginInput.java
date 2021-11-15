package T1113_Database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginInputOk")
public class LoginInput extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    LoginVo vo = new LoginVo();
    
    // null체크후 vo에 담습니다.
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
    
    vo.setMid(mid);
    vo.setPwd(request.getParameter("pwd"));
    vo.setName(request.getParameter("name"));
    
    LoginDao dao = new LoginDao();
    
    int res = dao.loginInput(vo);
    
    PrintWriter out = response.getWriter();
    
    if(res == 1) {
      out.println("<script>");
      out.println("alert('"+mid+"님 가입을 환영합니다.!!');");
      out.println("location.href='"+request.getContextPath()+"/1113_Database/login.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('가입처리 불가!! 다시 가입하세요.');");
      out.println("location.href='"+request.getContextPath()+"/1113_Database/login.jsp';");
      out.println("</script>");
    }
  }
}
