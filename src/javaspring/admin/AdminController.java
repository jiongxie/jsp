package javaspring.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MListCommand;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
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
    
    AdminCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/admin.ad")) {  // 관리자 메뉴 프레임
      viewPage = "/WEB-INF/admin/admin.jsp";
    }
    else if(com.equals("/leftMenu.ad")) {  // 관리자 왼쪽 메뉴 화면
      viewPage = "/WEB-INF/admin/leftMenu.jsp";
    }
    else if(com.equals("/content.ad")) {   // 관리자 우측 화면
      command = new ContentCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/content.jsp";
    }
    else if(com.equals("/amList.ad")) {    // 회원 리스트 보기
      command = new AMListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/member/amList.jsp";
    }
    else if(com.equals("/levelCheck.ad")) { // 회원 레벨 변경처리
      command = new LevelCheckCommand();
      command.execute(request, response);
      //viewPage = "/amList.ad";
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/agList.ad")) {  // 방명록 정보 보기
      command = new AgListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/guest/agList.jsp";
    }
    else if(com.equals("/memberView.ad")) {  // 회원 정보 상세보기
      command = new MemberViewCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/member/memberView.jsp";
    }
    else if(com.equals("/newGuestList.ad")) {  // 최근(5일) 새로올린 방명록 글 보기
      command = new NewGuestListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/guest/agNewList.jsp";
    }
    else if(com.equals("/newMemberList.ad")) {  // '준회원'만 보여주기
      command = new NewMemberListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/member/amNewList.jsp";
    }
    else if(com.equals("/resetMemberList.ad")) {  // '탈퇴신청회원'만 보여주기
      command = new NewMemberListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/admin/member/amResetList.jsp";
    }
    if(com.equals("/amSurvey.ad")) {  // 관리자 메뉴 프레임
      viewPage = "/WEB-INF/admin/survey/survey.jsp";
    }
    if(com.equals("/agDelete.ad")) {  // 관리자 메뉴 프레임
      viewPage = "/WEB-INF/admin/guest/agList.jsp";
    }
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
