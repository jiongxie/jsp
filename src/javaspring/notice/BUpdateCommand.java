package javaspring.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateCommand implements NoticeCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
    
    BoardDao dao = new BoardDao();
    
    int res = dao.getSearch(idx, pwd);
    
    if(res == 0) {
      request.setAttribute("msg", "passCheckNo");
      request.setAttribute("url", request.getContextPath()+"/bContent.nt?idx="+idx+"&pag="+pag);
    }
    else {
      BoardVo vo = dao.bContent(idx);  // 한건(현재글의 idx와 일치하는 )의 자료 가져오기
      request.setAttribute("vo", vo);
      request.setAttribute("pag", pag);
    }
  }

}
