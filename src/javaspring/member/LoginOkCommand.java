package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    
    MemberDao dao = new MemberDao();
    MemberVo vo = dao.loginOk(mid, pwd);
    
    HttpSession session = request.getSession();
    
    if(vo != null) {
      session.setAttribute("smid", vo.getMid());
      session.setAttribute("snickname", vo.getNickname());
      session.setAttribute("slevel", vo.getLevel());
      
      request.setAttribute("msg", "loginOk");
      request.setAttribute("url", request.getContextPath()+"/memberMain.mem");
      request.setAttribute("val", vo.getNickname());
    }
    else {
      request.setAttribute("msg", "loginNo");
      request.setAttribute("url", request.getContextPath()+"/login.mem");
    }
  }

}
