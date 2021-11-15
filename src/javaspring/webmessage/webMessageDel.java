package javaspring.webmessage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/webMessageDel")
public class webMessageDel extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    int mflag = Integer.parseInt(request.getParameter("mflag"));
    
    //PrintWriter out = response.getWriter();
    
    response.getWriter().write(messageDel(idx, mflag));
  }

  private String messageDel(int idx, int mflag) {
    WebMessageDao dao = new WebMessageDao();
    dao.messageDel(idx, mflag);
    return "1";
  }
}
