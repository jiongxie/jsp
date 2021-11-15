package javaspring.pds;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PListCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PdsDao dao = new PdsDao();
    
    // 블록페이지를 위한 준비 시작
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.totRecCnt();
    int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (int) totRecCnt/pageSize + 1;
    int startNo = (pag - 1) * pageSize;
    int curScrNo = totRecCnt - startNo;
    int blockSize = 3; // 블록의 크기를 3으로 지정함.
    // 블록페이지를 위한 준비 끝
    
    String part = request.getParameter("part")==null ? "전체" : request.getParameter("part");
    
    List<PdsVo> vos = dao.pList(startNo, pageSize, part);

    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrNo", curScrNo);
    
    request.setAttribute("part", part);
  }

}
