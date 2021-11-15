package javaspring.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BContInputCommand implements NoticeCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardContVo cVo = new BoardContVo();
    
    int board2_idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
    
    cVo.setBoard2_idx(board2_idx);
    cVo.setMid(request.getParameter("mid"));
    cVo.setNickname(request.getParameter("nickname"));
    cVo.setHostip(request.getParameter("hostip"));
    cVo.setContent(request.getParameter("content"));
    
    BoardDao dao = new BoardDao();
    dao.bContInput(cVo);
    
    //request.setAttribute("idx", board2_idx);
    //request.setAttribute("pag", pag);
    
    request.setAttribute("msg", "bContInputOk");
    request.setAttribute("url", request.getContextPath()+"/bContent.nt?idx="+board2_idx+"&pag="+pag);
  }

}
