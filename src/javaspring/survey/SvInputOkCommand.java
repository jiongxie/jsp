package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvInputOkCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    SurveyDao dao = new SurveyDao();
    int res = dao.svInput(request, response);
    
    if(res == 1) {
      request.setAttribute("msg", "svInputOk");
      request.setAttribute("url", request.getContextPath()+"/svList.su");
    }
    else {
      request.setAttribute("msg", "svInputNo");
      request.setAttribute("url", request.getContextPath()+"/svInput.su");
    }
  }

}
