package javaspring.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.admin.AMListCommand;
import javaspring.admin.AdminCommand;
import javaspring.admin.AgListCommand;
import javaspring.admin.ContentCommand;
import javaspring.admin.LevelCheckCommand;
import javaspring.admin.MemberViewCommand;
import javaspring.admin.NewGuestListCommand;
import javaspring.admin.NewMemberListCommand;

@WebServlet("*.su")
public class SurveyController extends HttpServlet {
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
    
    SurveyCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/svList.su")) {
      command = new SvListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/svList.jsp";
    }
    else if(com.equals("/svInput.su")) {
      viewPage = "/WEB-INF/admin/survey/svInput.jsp";
    }
    else if(com.equals("/svInputOk.su")) {
      command = new SvInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/svAnswerInput.su")) {
      command = new SvAnswerInputCommand();
      command.execute(request, response);
      if(request.getAttribute("msg") == "svSearchInputNo") {
        viewPage = "/WEB-INF/message/message.jsp";
      }
      else {
        viewPage = "/WEB-INF/admin/survey/svAnswerInput.jsp";
      }
        
    }
    else if(com.equals("/svAnswerInputOk.su")) {
      command = new SvAnswerInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/svResult.su")) {
      command = new SvResultCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/svResult.jsp";
    }
    else if(com.equals("/chartAnalysis.su")) {
      command = new ChartAnalysisCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/chartAnalysis.jsp";
    }
    else if(com.equals("/svContent.su")) {
      command = new SvContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/svContent.jsp";
    }
    else if(com.equals("/svUpdateOk.su")) {
      command = new SvUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/svDelete.su")) {
      command = new SvDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/savList.su")) {
      command = new SavListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/savList.jsp";
    }
    else if(com.equals("/svAnswerDelete.su")) {
      command = new SvAnswerDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/svAnswerTotalPrint.su")) {
      command = new SvAnswerTotalPrintCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/survey/svAnswerTotalPrint.jsp";
    }


    
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
