package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MResetCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid");

    MemberDao dao = new MemberDao();
    
    int res = dao.mReset(mid);
    
    if(res == 1) {
      request.setAttribute("msg", "mResetOk");
    }
    else {
      request.setAttribute("msg", "mResetNo");
    }
    request.setAttribute("url", request.getContextPath()+"/amList.ad");
  }

}
