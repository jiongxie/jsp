package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
    
    MemberDao dao = new MemberDao();
    
    String sMid = dao.idCheck(mid);
    
    if(sMid.equals("")) { // 사용가능한 아이디
      request.setAttribute("res", 1);
    }
    else {    // 이미 사용중인 아이디
      request.setAttribute("res", 0);
    }
    
    request.setAttribute("mid", mid);
  }

}
