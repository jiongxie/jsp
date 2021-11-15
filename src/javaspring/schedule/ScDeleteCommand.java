package javaspring.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScDeleteCommand implements ScheduleCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String ymd = request.getParameter("ymd");
    String mid = request.getParameter("mid");
    
    ScheduleDao dao = new ScheduleDao();
    
    int res = dao.scDelete(ymd, mid);
    
    if(res == 1) {
      request.setAttribute("msg", "scDeleteOk");
    }
    else {
      request.setAttribute("msg", "scDeleteNo");
    }
    request.setAttribute("url", request.getContextPath()+"/schedule.sc?ymd="+ymd+"&mid="+mid);
  }

}
