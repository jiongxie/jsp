package javaspring.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ABDeleteCommand implements NoticeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
    
    BoardDao dao = new BoardDao();
    
    int res = dao.abDelete(idx);
    
    if(res == 1) {   // 정상적으로 게시글이 삭제되었다.
      request.setAttribute("msg", "boardDeleteOk");
      request.setAttribute("url", request.getContextPath()+"/bList.nt?pag="+pag);
    }
    else {
      request.setAttribute("msg", "boardDeleteNo");
      request.setAttribute("url", request.getContextPath()+"/bContent.nt?idx="+idx+"&pag="+pag);
    }
  }

}

