package javaspring.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaspring.member.MemberDao;

public class ContentCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    MemberDao dao = new MemberDao();
    
    // 방명록에 새로 올라온글
    int guestCnt = dao.newGuest();
    request.setAttribute("guestCnt", guestCnt);
    
    // 새로 가입한 회원처리
    int memberCnt = dao.newMemberCnt();
    request.setAttribute("memberCnt", memberCnt);
    
    // 탈퇴 신청한 회원
    int memberResetCnt = dao.newMemberResetCnt();
    request.setAttribute("memberResetCnt", memberResetCnt);
  }

}
