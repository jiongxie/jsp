package javaspring.webmessage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/webMessageAllDel")
public class webMessageAllDel extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String receiveId = request.getParameter("receiveId");
    response.getWriter().write(messageAllDel(receiveId));
  }

  private String messageAllDel(String receiveId) {
    WebMessageDao dao = new WebMessageDao();
    dao.messageAllDel(receiveId);
    return "1";
  }
}
