package javaspring.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BContentCommand implements NoticeCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

    BoardDao dao = new BoardDao();
    
    dao.readNumUpdate(idx);
    
    BoardVo vo = dao.bContent(idx);
    
    request.setAttribute("vo", vo);
    request.setAttribute("pag", pag);
    request.setAttribute("pageSize", pageSize);
    
    // 댓글처리 작업
    List<BoardContVo> cVos = dao.contList(idx);  // 부모게시글의 idx로 댓글의 board_idx와 일치하는 모든 자료를 가져온다.
    System.out.println("cVos : " + cVos);
    request.setAttribute("cVos", cVos);
  }

}
