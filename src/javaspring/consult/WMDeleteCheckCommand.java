package javaspring.consult;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WMDeleteCheckCommand implements WebMessageCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    int mflag = Integer.parseInt(request.getParameter("mflag"));
    
    WebMessageDao dao = new WebMessageDao();
    
    dao.wmDeleteCheck(idx, mflag);  // 받은메세지에서 휴지통으로 옮기기
    
    if(mflag == 3) {  // 보낸메세지에서의 삭제처리 요청...
      System.out.println("mflag : " + mflag);
      System.out.println("idx : " + idx);
      dao.wmDeleteCheck(idx, mflag);  // 받은메세지에서 휴지통으로 옮기기
      request.setAttribute("msg", "wmDeleteCheckOk");
    }
    else if(mflag == 5) { // 휴지통에서 '삭제요청'시에 처리...
      request.setAttribute("msg", "wmDeleteOk");
    }
    else {
      request.setAttribute("msg", "wmDeleteCheckOk");
    }
    request.setAttribute("url", request.getContextPath()+"/webMessage.ct");
  }

}
