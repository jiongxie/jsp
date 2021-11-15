package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    
    String nickname = (String) session.getAttribute("snickname");
    
    session.invalidate();
    
    request.setAttribute("msg", "loginOutOk");
    request.setAttribute("url", request.getContextPath()+"/login.mem");
    request.setAttribute("val", nickname);
  }

}
