package javaspring.pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pUpdFileDel")
public class PUpdFileDel extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    String fnames = request.getParameter("fnames");    // vo.fname에서 받아옴(업로드 파일명들)
    String rfnames = request.getParameter("rfnames");  // vo.rfname에서 받아옴(실제 서버에 저장된 파일명들)
    String fname = request.getParameter("fname");
    String rfname = request.getParameter("rfname");
    
    //System.out.println("rfname : " + rfname);
    
    // 파일 삭제처리 루티
    ServletContext application = request.getServletContext();
    String directory = application.getRealPath("/data/pds/");
    new File(directory + rfname).delete();  // 선택한 파일을 서버에서 삭제처리한다.
    
    // DB에서 삭제한 파일 정보를 다시 지워준다.(fnames, rfnames)
    PdsVo vo = new PdsVo();
    vo.setIdx(idx);
    //vo.setFname(fnames.replace(fname+"/", ""));  // 삭제된 파일의 정보를 fname필드와 rfname필드에서 제거한다.
    //vo.setFname(fnames.substring(0, fnames.lastIndexOf(fname+"/")));  // 삭제된 파일의 정보를 fname필드와 rfname필드에서 제거한다.
    vo.setFname(fnames.substring(0, fnames.lastIndexOf(fname+"/"))+fnames.substring(fnames.lastIndexOf(fname+"/")+(fname.length()+1)));
    vo.setRfname(rfnames.replace(rfname+"/", ""));
    
    response.getWriter().write(updFileDel(vo));
  }

  // 삭제된 파일의 정보를 DB에서 제거(Update)시키는 작업처리
  private String updFileDel(PdsVo vo) {
    PdsDao dao = new PdsDao();
    dao.updFileDel(vo);
    return vo.getFname();
  }
}
