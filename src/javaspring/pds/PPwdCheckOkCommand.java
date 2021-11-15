package javaspring.pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PPwdCheckOkCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String mid = (String) session.getAttribute("smid");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String pwd = request.getParameter("pwd");
    int pag = Integer.parseInt(request.getParameter("pag"));

    PdsDao dao = new PdsDao();
    int res = dao.pPwdCheck(mid, idx, pwd);
    
    if(res != 1) {
      request.setAttribute("msg", "pPwdCheckNo");
      request.setAttribute("url", request.getContextPath()+"/pPwdCheck.pds?idx="+idx+"&pag="+pag);
    }
    else {
      request.setAttribute("msg", "pPwdCheckOk");
      request.setAttribute("url", request.getContextPath()+"/pUpdate.pds?idx="+idx+"&pag="+pag);
    }
  }

}
