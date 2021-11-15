package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvUpdateCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    String sdate = request.getParameter("sdate");
    
    SurveyDao dao = new SurveyDao();
    
    int res = dao.svUpdateOk(request, response);
    
    if(res == 1) {
      request.setAttribute("msg", "svUpdateOk");
    }
    else {
      request.setAttribute("msg", "svUpdateNo");
    }
    request.setAttribute("url", request.getContextPath()+"/svContent.su?idx="+idx+"&sdate="+sdate);
    
  }

}
