package javaspring.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleListCommand implements ScheduleCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
    
    if(!ymd.equals("")) {
      String[] strYmd = ymd.split("-");
      request.setAttribute("yy", Integer.parseInt(strYmd[0]));
      request.setAttribute("mm", Integer.parseInt(strYmd[1]) - 1);
      
    }
  }

}
