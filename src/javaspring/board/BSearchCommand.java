package javaspring.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BSearchCommand implements BoardCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String search = request.getParameter("search");
    String searchString = request.getParameter("searchString");
    
    BoardDao dao = new BoardDao();
    
    // 블록페이지를 위한 준비 시작
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.totSearchRecCnt(search,searchString);
    int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (int) totRecCnt/pageSize + 1;
    int startNo = (pag - 1) * pageSize;
    int curScrNo = totRecCnt - startNo;
    int blockSize = 3; // 블록의 크기를 3으로 지정함.
    // 블록페이지를 위한 준비 끝
    
    
    List<BoardVo> vos = dao.getBSearch(search, searchString);
    
    if(search.equals("title")) search = "글제목";
    else if(search.equals("name")) search = "글쓴이";
    else search = "글내용";
    
    request.setAttribute("vos", vos);
    request.setAttribute("search", search);
    request.setAttribute("searchString", searchString);
    request.setAttribute("searchCount", vos.size());
    request.setAttribute("pag", pag);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totPage", totPage);
  }

}
