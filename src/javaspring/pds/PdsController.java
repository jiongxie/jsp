package javaspring.pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.pds")
public class PdsController extends HttpServlet {
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
    
    PdsCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/pList.pds")) {
      command = new PListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/pds/pList.jsp";
    }
    else if(com.equals("/pInput.pds")) {
      viewPage = "/WEB-INF/pds/pInput.jsp";
    }
    else if(com.equals("/pInputOk.pds")) {
      command = new PInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/pContent.pds")) {
      command = new PContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/pds/pContent.jsp";
    }
    else if(com.equals("/pDownLoad.pds")) {
      command = new PDownLoadCommand();
      command.execute(request, response);
      //viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/pPwdCheck.pds")) {
      request.setAttribute("idx", request.getParameter("idx"));
      //request.setAttribute("pwd", request.getParameter("pwd"));
      request.setAttribute("pag", request.getParameter("pag"));
      viewPage = "/WEB-INF/pds/pPwdCheck.jsp";
    }
    else if(com.equals("/pPwdCheckOk.pds")) {
      command = new PPwdCheckOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/pUpdate.pds")) {
      command = new PUpdateCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/pds/pUpdate.jsp";
    }
    else if(com.equals("/pUpdateOk.pds")) {
      command = new PUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/pBackCheck.pds")) {
      command = new PBackCheckCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    
        

    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
