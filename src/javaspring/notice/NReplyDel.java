package javaspring.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nReplyDel")
public class NReplyDel extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));  // 이곳 idx는 댓글의 idx를 의미함.
    
    //PrintWriter out = response.getWriter();
    
    response.getWriter().write(replyDel(idx));
  }

  private String replyDel(int idx) {
    BoardDao dao = new BoardDao();
    dao.replyDel(idx);
    
    return "1";
  }
}
