package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MDeleteCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String mid = (String) session.getAttribute("smid");
    
    MemberDao dao = new MemberDao();
    
    int res = dao.mDelete(mid);
    
    if(res == 1) {
      request.setAttribute("msg", "mDeleteOk");
      request.setAttribute("url", request.getContextPath()+"/member/loginOut.mem");
    }
    else {
      request.setAttribute("msg", "mDeleteNo");
      request.setAttribute("url", request.getContextPath()+"/member/memberMain.mem");
    }
  }
}
