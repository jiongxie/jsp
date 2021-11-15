package javaspring.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScContentOkCommand implements ScheduleCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ScheduleVo vo = new ScheduleVo();
    int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
    vo.setIdx(idx);
    vo.setMid(request.getParameter("mid"));
    vo.setScdate(request.getParameter("scdate"));
    vo.setTitle(request.getParameter("title"));
    vo.setMemory(request.getParameter("memory"));
    vo.setContent(request.getParameter("content"));
    
    ScheduleDao dao = new ScheduleDao();
    int res = dao.scSearchContent(vo);
    
    if(res == 1) {
      request.setAttribute("msg", "sCheduleOk");
    }
    else {
      request.setAttribute("msg", "sCheduleNo");
    }
    request.setAttribute("url", request.getContextPath()+"/schedule.cd?ymd="+vo.getScdate()+"&mid="+vo.getMid());
  }

}
