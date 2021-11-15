package javaspring.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
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
    
    BoardCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/bList.bo")) {
      command = new BListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/board/board.jsp";
    }
    if(com.equals("/bList2.bo")) {
      command = new BListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/board/board.jsp";
    }
    else if(com.equals("/bInput.bo")) {
      viewPage = "/WEB-INF/board/bInput.jsp";
    }
    else if(com.equals("/bInputOk.bo")) {
      command = new BInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bContent.bo")) {
      command = new BContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/board/bContent.jsp";
    }
    else if(com.equals("/bDelete.bo")) {
      command = new BDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/abDelete.bo")) {
      command = new ABDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bUpdate.bo")) {
      command = new BUpdateCommand();
      command.execute(request, response);
      String msg = request.getAttribute("msg")==null ? "" : (String) request.getAttribute("msg");
      if(!msg.equals("")) {
        viewPage = "/WEB-INF/message/message.jsp";
      }
      else {
        viewPage = "/WEB-INF/board/bUpdate.jsp";
      }
    }
    else if(com.equals("/bUpdateOk.bo")) {
      command = new BUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bGood.bo")) {
      int idx = Integer.parseInt(request.getParameter("idx"));
      response.getWriter().write(bGood(idx));
      return;
    }
    else if(com.equals("/bContInput.bo")) {
      command = new BContInputCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/bSearch.bo")) {
      command = new BSearchCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/board/bSearch.jsp";
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
