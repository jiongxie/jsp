package T1113_Database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginUpdateOk")
public class LoginUpdate extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");

    LoginVo vo = new LoginVo();
    
    vo.setIdx(Integer.parseInt(request.getParameter("idx")));
    vo.setMid(request.getParameter("mid"));
    vo.setPwd(request.getParameter("pwd"));
    vo.setName(request.getParameter("name"));
    
    LoginDao dao = new LoginDao();
    
    int res = dao.loginUpdate(vo);
    
    PrintWriter out = response.getWriter();
    
    if(res == 1) {
      out.println("<script>");
      out.println("alert('자료가 수정되었습니다.');");
      out.println("location.href='"+request.getContextPath()+"/1113_Database/loginMain.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('자료가 수정되지 안았습니다.');");
      out.println("location.href='"+request.getContextPath()+"/1113_Database/loginMain.jsp';");
      out.println("</script>");
    }
  }
}
