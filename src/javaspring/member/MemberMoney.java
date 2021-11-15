package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMoney implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    
    String mid = (String) session.getAttribute("smid");
    
    MemberDao dao = new MemberDao();
    MemberVo vo = dao.moneySearch(mid);
    
    request.setAttribute("vo", vo);
  }
}
