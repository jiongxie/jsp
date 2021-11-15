package javaspring.calendar;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaspring.member.MListCommand;

@WebServlet("*.cd")
public class ScheduleController extends HttpServlet {
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
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    ScheduleCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/calendar.cd")) {  // 달력연습
      viewPage = "/WEB-INF/study/calendar/calendar.jsp";
    }
    else if(com.equals("/schedule.cd")) {  // 스케줄 처음화면(달력)
      command = new ScheduleListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/schedule2/schedule.jsp";
    }
    else if(com.equals("/scContent.cd")) {   // 스케줄 등록창 호출
      command = new ScContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/schedule2/scContent.jsp";
    }
    else if(com.equals("/scContentOk.cd")) {   // 스케줄 등록
      command = new ScContentOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/scDelect.cd")) {   // 스케줄 삭제
      command = new ScDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
