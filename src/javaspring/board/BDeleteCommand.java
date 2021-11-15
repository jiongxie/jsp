package javaspring.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BDeleteCommand implements BoardCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
    
    BoardDao dao = new BoardDao();
    
    int res = dao.bDelete(idx, pwd);
    
    if(res == 1) {   // 정상적으로 게시글이 삭제되었다.
      request.setAttribute("msg", "boardDeleteOk");
      request.setAttribute("url", request.getContextPath()+"/bList.bo?pag="+pag);
    }
    else {
      request.setAttribute("msg", "boardDeleteNo");
      request.setAttribute("url", request.getContextPath()+"/bContent.bo?idx="+idx+"&pag="+pag);
    }
  }

}
