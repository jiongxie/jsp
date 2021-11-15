package javaspring.pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PBackCheckCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    int pag = Integer.parseInt(request.getParameter("pag"));

    PdsDao dao = new PdsDao();
    dao.pDelete(idx);
    
    request.setAttribute("msg", "pDeleteOk");
    request.setAttribute("url", request.getContextPath()+"/pList.pds?pag="+pag);

  }

}
