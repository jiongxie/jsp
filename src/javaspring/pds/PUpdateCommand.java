package javaspring.pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PUpdateCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    int pag = Integer.parseInt(request.getParameter("pag"));

    PdsDao dao = new PdsDao();
    PdsVo vo = dao.pContent(idx);
    
    request.setAttribute("vo", vo);
    request.setAttribute("pag", pag);
  }

}
