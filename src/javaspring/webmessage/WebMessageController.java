package javaspring.webmessage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.wm")
public class WebMessageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    actionDo(request, response);
  }
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    actionDo(request, response);
  }
  
  private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    WebMessageCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/webMessage.wm")) {  // 메세지를 총괄 관리
      command = new WMessageCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/webmessage/webMessage.jsp";
    }
    else if(com.equals("/wmInputOk.wm")) {
      command = new WMInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/webDeleteCheck.wm")) {
      command = new WMDeleteCheckCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
        
        

    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
