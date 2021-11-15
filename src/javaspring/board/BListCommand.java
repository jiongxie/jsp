package javaspring.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BListCommand implements BoardCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardDao dao = new BoardDao();
    
    // 블록페이지를 위한 준비 시작
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.totRecCnt();
    int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (int) totRecCnt/pageSize + 1;
    int startNo = (pag - 1) * pageSize;
    int curScrNo = totRecCnt - startNo;
    int blockSize = 3; // 블록의 크기를 3으로 지정함.
    // 블록페이지를 위한 준비 끝
    
    List<BoardVo> vos = dao.bList(startNo, pageSize);
    
    request.setAttribute("vos", vos);
    
    // 블록페이지를 위해 넘겨주는 변수들
    request.setAttribute("pag", pag);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrNo", curScrNo);
    request.setAttribute("blockSize", blockSize);
  }

}
