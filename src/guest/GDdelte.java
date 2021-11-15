package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gDelete")
public class GDdelte extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    GuestDao dao = new GuestDao();
    
    int res = dao.gDelete(idx);
    
    PrintWriter out = response.getWriter();
    
    if(res == 1) {
      out.println("<script>");
      out.println("alert('게시글이 삭제 되었습니다.');");
      out.println("location.href='./guest/gList.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('게시글이 삭제되지 않았습니다.');");
      out.println("location.href='"+request.getContextPath()+"/agDelete.ad';");
      out.println("</script>");
    }
  }
}
