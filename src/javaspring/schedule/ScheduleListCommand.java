package javaspring.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleListCommand implements ScheduleCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ScheduleDao dao = new ScheduleDao();

    //= dao.scheduleList();
  }

}
