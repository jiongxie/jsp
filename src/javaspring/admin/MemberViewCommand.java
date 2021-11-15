package javaspring.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MemberDao;
import javaspring.member.MemberVo;

public class MemberViewCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid");

    MemberDao dao = new MemberDao();
    
    MemberVo vo = dao.memberSearch(mid);
    
    request.setAttribute("vo", vo);
  }

}
