package javaspring.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MemberDao;
import javaspring.member.MemberVo;

public class NewMemberListCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String aSw = request.getParameter("aSw"); 
    
    MemberDao dao = new MemberDao();
    
    ArrayList<MemberVo> vos = dao.amNewList(aSw);
    
    request.setAttribute("vos", vos);
    request.setAttribute("aSw", aSw);
  }

}
