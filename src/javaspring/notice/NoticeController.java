package javaspring.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.nt")
public class NoticeController extends HttpServlet {
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
    
    NoticeCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/bList.nt")) {
      command = new BListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/notice/bList.jsp";
    }
    if(com.equals("/bList2.nt")) {
      command = new BListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/notice/board.jsp";
    }
    else if(com.equals("/bInput.nt")) {
      viewPage = "/WEB-INF/notice/bInput.jsp";
    }
    else if(com.equals("/bInputOk.nt")) {
      command = new BInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bContent.nt")) {
      command = new BContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/notice/bContent.jsp";
    }
    else if(com.equals("/bDelete.nt")) {
      command = new BDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/abDelete.nt")) {
      command = new ABDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bUpdate.nt")) {
      command = new BUpdateCommand();
      command.execute(request, response);
      String msg = request.getAttribute("msg")==null ? "" : (String) request.getAttribute("msg");
      if(!msg.equals("")) {
        viewPage = "/WEB-INF/message/message.jsp";
      }
      else {
        viewPage = "/WEB-INF/notice/bUpdate.jsp";
      }
    }
    else if(com.equals("/bUpdateOk.nt")) {
      command = new BUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bGood.nt")) {
      int idx = Integer.parseInt(request.getParameter("idx"));
      response.getWriter().write(bGood(idx));
      return;
    }
    else if(com.equals("/bContInput.nt")) {
      command = new BContInputCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bSearch.nt")) {
      command = new BSearchCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/notice/bSearch.jsp";
    }
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
  
  private int bGood(int idx) {
    BoardDao dao = new BoardDao();
    dao.bGood(idx);
    return 1;
  }
}
