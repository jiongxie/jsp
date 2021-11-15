package javaspring.pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PContentCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    PdsDao dao = new PdsDao();
    PdsVo vo = dao.pContent(idx);
    
    //System.out.println("vo : " + vo);
    
    request.setAttribute("vo", vo);
  }

}
