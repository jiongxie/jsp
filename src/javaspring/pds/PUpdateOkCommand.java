package javaspring.pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PUpdateOkCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ServletContext application = request.getServletContext();
    
    String directory = application.getRealPath("/data/pds");  // 업로드할 화일의 저장될 실제 경로(폴더명)
    int maxSize = 1024 * 1024 * 10;  // 최대 10MByte 까지 허용
    String encoding = "UTF-8";
    
    MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());  // 업로드시킨 파일이 서버에 저장된다.

    // 여러개의 파일이 넘어올 경우에 파일의 정보를 모두 저장시켜야 한다.
    Enumeration fileNames = multipartRequest.getFileNames();
    String fname = "";
    String rfname = "";
    
    while(fileNames.hasMoreElements()) {
      //System.out.println("--------------dkdkdkdkdkkkdkd");
      String file = (String) fileNames.nextElement();
      
      fname += multipartRequest.getOriginalFileName(file)+"/";
      rfname += multipartRequest.getFilesystemName(file)+"/";
    }
    
    // 앞에서 넘겨준 정보를 가져와서, 기존첨부자료와 새로올린 첨부자료를 추가시킨다.
    int idx = Integer.parseInt(multipartRequest.getParameter("idx"));
    int pag = Integer.parseInt(multipartRequest.getParameter("pag"));
    String fnames = multipartRequest.getParameter("fnames");
    String rfnames = multipartRequest.getParameter("rfnames");
    
//    System.out.println("1.fname : " + fname + " , rfname : " + rfname);
    if(fname.equals("null/")) fname = "";
    if(rfname.equals("null/")) rfname = "";
    System.out.println("2.fname : " + fname + " , rfname : " + rfname);
    
    if(fnames != null) {
      fname += fnames;
      rfname += rfnames;
    }
    
    System.out.println("rfname : " + rfname);
    // DB에 저장할 준비를 한다.(Vo에 담는다)
    PdsDao dao = new PdsDao();
    PdsVo vo = new PdsVo();
    
    vo.setIdx(idx);
    
    vo.setMid(multipartRequest.getParameter("mid"));
    vo.setNickname(multipartRequest.getParameter("nickname"));
    vo.setFname(fname);
    vo.setRfname(rfname);
    vo.setTitle(multipartRequest.getParameter("title"));
    vo.setPart(multipartRequest.getParameter("part"));
    vo.setPwd(multipartRequest.getParameter("pwd"));
    vo.setFsize(multipartRequest.getParameter("fsize"));
    vo.setOpensw(multipartRequest.getParameter("opensw"));
    vo.setContent(multipartRequest.getParameter("content"));
    
    int res = dao.pUpdate(vo);
    
    if(res == 1 && rfname != null) {
      request.setAttribute("msg", "pUpdateOk");
      request.setAttribute("url", request.getContextPath()+"/pList.pds?pag="+pag);
    }
    else {
      request.setAttribute("msg", "pUpdateNo");
      request.setAttribute("url", request.getContextPath()+"/pUpdate.pds?idx="+idx+"&pag="+pag);
    }
  }

}
