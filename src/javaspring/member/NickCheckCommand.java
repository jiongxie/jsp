package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NickCheckCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nickname = request.getParameter("nickname")==null ? "" : request.getParameter("nickname");
    
    MemberDao dao = new MemberDao();
    
    String sNickname = dao.nicknameCheck(nickname);
    
    if(sNickname.equals("")) { // 사용가능한 닉네임
      request.setAttribute("res", 1);  // res가 1이면 사용가능한 닉네임이다.
    }
    else {    // 이미 사용중인 닉네임
      request.setAttribute("res", 0);
    }
    
    request.setAttribute("nickname", nickname);
  }

}
