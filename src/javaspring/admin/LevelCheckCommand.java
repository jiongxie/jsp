package javaspring.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MemberDao;

public class LevelCheckCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	System.out.println("levelCheckCommand");
    int idx = Integer.parseInt(request.getParameter("idx"));
    int level = Integer.parseInt(request.getParameter("level"));
    int pag = request.getParameter("pag")=="" ? 1 : Integer.parseInt(request.getParameter("pag"));
    
    System.out.println("idx:" + idx + ",level:" + level + ",pag:"+pag);
    
    MemberDao dao = new MemberDao();
    dao.levelCheck(idx, level);
    
    request.setAttribute("msg", "levelCheckOk");
    request.setAttribute("url", request.getContextPath()+"/amList.ad?pag="+pag);
  }

}
