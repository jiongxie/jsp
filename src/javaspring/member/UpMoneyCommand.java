package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpMoneyCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    int su = Integer.parseInt(request.getParameter("su"));
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
   // 
    MemberDao dao = new MemberDao();
   // MemberVo vo = dao.upMoney(su, mid);
   
    int res = dao.upMoney(su, mid);
    
    
    //request.setAttribute("vo", vo);
    
    if(res == 1) {
      request.setAttribute("msg", "mMoneyOk");
      request.setAttribute("url", request.getContextPath()+"/webmessage/webMessage.wm");
    }
    else {
      request.setAttribute("msg", "mDeleteNo");
      request.setAttribute("url", request.getContextPath()+"/webmessage/webMessage.wm");
    
    }

  }
}
