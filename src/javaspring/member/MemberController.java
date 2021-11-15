package javaspring.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
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
    
    MemberCommand command = null;
    String viewPage = "";
    
    String uri = request.getRequestURI();
    String com = uri.substring(uri.lastIndexOf("/"));
    
    if(com.equals("/login.mem")) {   // 로그인 폼 불러오기
      viewPage = "/WEB-INF/member/login.jsp";
    }
    else if(com.equals("/mInput.mem")) {   // 회원 가입폼 불러오기
      viewPage = "/WEB-INF/member/mInput.jsp";
    }
    else if(com.equals("/mInputOk.mem")) {  // 회원 가입처리
      command = new MInputOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/idCheck.mem")) {  // 아이디 체크
      command = new IdCheckCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/member/idCheck.jsp";
    }
    else if(com.equals("/nickCheck.mem")) {  // 닉네임 체크
      command = new NickCheckCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/member/nickCheck.jsp";
    }
    else if(com.equals("/loginOk.mem")) {  // 로그인 인증창으로 보내기
      command = new LoginOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/memberMain.mem")) {  // 로그인 후, 정회원이상 보여주는 메인화면. 
      viewPage = "/WEB-INF/member/memberMain.jsp";
    }
    else if(com.equals("/loginOut.mem")) {  // 로그아웃시, 이동하는창으로 이동 
      command = new LoginOutCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/mList.mem")) {  // 모든 회원 정보 보기 리스트 
      command = new MListCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/member/mList.jsp";
    }
    else if(com.equals("/mUpdate.mem")) {  // 회원 정보 확인 
      command = new MUpdateCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/member/mUpdate.jsp";
    }
    else if(com.equals("/mUpdateOk.mem")) {  // 회원 정보 변경 
      command = new MUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/mDelete.mem")) {  // 회원 탈퇴신청 처리 
      command = new MDeleteCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/mReset.mem")) {  // 회원 탈퇴 처리(회원정보삭제)
      command = new MResetCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
    }
    else if(com.equals("/pricing2.mem")) {  // 펀드 구매
      command = new MemberMoney();
      command.execute(request, response);
      viewPage = "/WEB-INF/member/pricing2.jsp";
    }
    else if(com.equals("/upMoney.mem")) {  // 펀드 체결
      command = new UpMoneyCommand();
      command.execute(request, response);
      viewPage = "/WEB-INF/message/message.jsp";
      /*
       * viewPage = "/WEB-INF/member/pricing2.jsp";
       */
    }
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}
