package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MUpdateOkCommand implements MemberCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String mid = request.getParameter("mid");
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    String nickname = request.getParameter("nickname")==null ? "" : request.getParameter("nickname");
    String nickname_ = nickname;
    String name = request.getParameter("name")==null ? "" : request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthday");
    String address = request.getParameter("address");
    
    String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
    String email = request.getParameter("email1")+"@"+request.getParameter("email2");
    String homepage = request.getParameter("homepage");
    String job = request.getParameter("job");
    String[] hobbys = request.getParameterValues("hobby");
    String hobby = "";
    for(int i=0; i<hobbys.length; i++) {
      hobby += hobbys[i] + "/";
    }
    hobby = hobby.substring(0, hobby.length()-1);
    String userinfor = request.getParameter("userinfor");
    
    String onickname = request.getParameter("onickname");
    // DB에 저장되는 not null항목은 한번더 체크 처리할것...
    
    // 닉네임 중복체크를 한번더 처리해 준다.
    MemberDao dao = new MemberDao();
    
    if(!onickname.equals(nickname_)) {
      nickname = dao.nicknameCheck(nickname);
      if(!nickname.equals("")) { // 이미 사용중인 닉네임
        request.setAttribute("msg", "nickCheckNo");
        request.setAttribute("url", request.getContextPath()+"/mInput.mem");
        return;
      }
    }
    
    // 닉네임을 정상체크하고나면 아래내용(회원정보수정) 수행한다.
    MemberVo vo = new MemberVo();
    vo.setMid(mid);
    vo.setPwd(pwd);
    vo.setNickname(nickname_);
    vo.setName(name);
    vo.setGender(gender);
    vo.setBirthday(birthday);
    vo.setTel(tel);
    vo.setAddress(address);
    vo.setEmail(email);
    vo.setHomepage(homepage);
    vo.setJob(job);
    vo.setHobby(hobby);
    vo.setUserinfor(userinfor);
    
    int res = dao.mUpdateOk(vo);
    
    if(res == 1) {
      request.setAttribute("msg", "mUpdateOk");
      request.setAttribute("url", request.getContextPath()+"/mUpdate.mem");
    }
    else {
      request.setAttribute("msg", "mUpdateNo");
      request.setAttribute("url", request.getContextPath()+"/mUpdate.mem");
    }
  }

}
