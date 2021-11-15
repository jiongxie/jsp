package javaspring.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MemberDao;
import javaspring.member.MemberVo;

public class AMListCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    MemberDao dao = new MemberDao();
    
    // 페이징 처리(이전/다음) 시작(한페이지분량 : 5건)
    int pageSize = 5; //한페이지 분량
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int totRecCnt = dao.totRecCnt();  // 총레코드 건수를 구한다.
    int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (int)(totRecCnt/pageSize) + 1;  // 총 페이지 수
    int statNo = (pag - 1) * pageSize;  // 해당 페이지의 시작 인덱스 번호
    int curScrNo = totRecCnt - statNo;   // 화면에 표시하는 게시글의 번호
    // 페이징 처리 끝..
    
    ArrayList<MemberVo> vos = dao.mList(statNo, pageSize);
    ArrayList<MemberVo> mvos = dao.mmList();
    
    
    request.setAttribute("vos", vos);
    request.setAttribute("mvos", mvos);
    request.setAttribute("pag", pag);
    request.setAttribute("curScrNo", curScrNo);
    request.setAttribute("totPage", totPage);
  }

}
