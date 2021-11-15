package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gInputOk")
public class GinputOk extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name")==null ? "" : request.getParameter("name");
    String email = request.getParameter("email")==null ? "" : request.getParameter("email");
    String homepage = request.getParameter("homepage")==null ? "" : request.getParameter("homepage");
    String content = request.getParameter("content")==null ? "" : request.getParameter("content");
    String hostip = request.getParameter("hostip");
    
    GuestVo vo = new GuestVo();
    
    vo.setName(name);
    vo.setEmail(email);
    vo.setHomepage(homepage);
    vo.setContent(content);
    vo.setHostip(hostip);
    
    GuestDao dao = new GuestDao();
    
    int res = dao.gInputOk(vo);
    
    PrintWriter out = response.getWriter();
    
    if(res != 1) {
      out.println("<script>");
      out.println("alert('방문소감 등록실패~~');");
      out.println("location.href='"+request.getContextPath()+"/guest/gInput.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('방문소감 등록완료!!!');");
      out.println("location.href='"+request.getContextPath()+"/guest/gList.jsp';");
      out.println("</script>");
    }
  }
}
