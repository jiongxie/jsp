package javaspring.webmessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import javaspring.pds.PdsVo;

public class WebMessageDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  WebMessageVo vo = null;

  // 전체/신규/보낸메세지/수신확인~ 받은메세지 가져오기
  public List<WebMessageVo> webMessageList(String mid, int msw) {
    List<WebMessageVo> vos = new ArrayList<WebMessageVo>();
    
    try {
      if(msw == 1) {  // 받은메세지(전체메세지 가져오기)
        sql = "select * from webmessage where receiveId=? and (receiveSw='n' || receiveSw='r') order by idx desc";
      }
      else if(msw == 2) {  // 신규메세지만 가져오기
        sql = "select * from webmessage where receiveId=? and receiveSw='n' order by idx desc";
      }
      else if(msw == 3) {  // 보낸메세지만 가져오기
        sql = "select * from webmessage where sendId=? and sendSw='s' order by idx desc";
      }
      else if(msw == 4) {  // 수신 확인 메세지(보낸 메세지에서만 처리) 가져오기
        sql = "select * from webmessage where sendId=? and receiveSw='n' order by idx desc";
      }
      else if(msw == 5) {  // 휴지통 목록 확인(받은메세지중에서 msw가 'g'로 표시된것들만 확인)
        sql = "select * from webmessage where receiveId=? and receiveSw='g' order by idx desc";
      }
    
      pstmt =conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        vo = new WebMessageVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setSendId(rs.getString("sendId"));
        vo.setSendSw(rs.getString("sendSw"));
        vo.setSendDate(rs.getString("sendDate"));
        vo.setReceiveId(rs.getString("receiveId"));
        vo.setReceiveSw(rs.getString("receiveSw"));
        vo.setReceiveDate(rs.getString("receiveDate"));
        vos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vos;
  }

  // 메세지 입력(보내기)
  public int wmInput(WebMessageVo vo) {
    try {
      sql = "select mid from member where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getReceiveId());
      rs = pstmt.executeQuery();
      if(!rs.next()) return 0;
      if(pstmt != null) pstmt.close();
      
      sql = "insert into webmessage values (default,?,?,?,default,default,?,default,default)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getSendId());
      pstmt.setString(4, vo.getReceiveId());
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }

  // 메세지 한건의 내용보기
  public WebMessageVo webMessageOne(int idx, String mid) {
    vo = new WebMessageVo();
    try {
      sql = "update webmessage set receiveSw='r', receiveDate=now() where idx=? and receiveId=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.setString(2, mid);
      pstmt.executeUpdate();
      if(pstmt != null) pstmt.close();
      
      sql = "select * from webmessage where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      rs.next();
      
      vo.setIdx(rs.getInt("idx"));
      vo.setTitle(rs.getString("title"));
      vo.setContent(rs.getString("content"));
      vo.setSendId(rs.getString("sendId"));
      vo.setSendSw(rs.getString("sendSw"));
      vo.setSendDate(rs.getString("sendDate"));
      vo.setReceiveId(rs.getString("receiveId"));
      vo.setReceiveSw(rs.getString("receiveSw"));
      vo.setReceiveDate(rs.getString("receiveDate"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vo;
  }

  // 받은메세지함에서의 휴지통으로의 이동할때는 receiveSw를 'g'로 처리하고,
  // 보낸메세지함에서의 휴지통이동은 없이 바로 휴지통비우기로 처리하기위해 sendSw의 값을 'x'로 처리한다.
  public void wmDeleteCheck(int idx, int mflag) {
    try {
      if(mflag == 3) { // 보낸메세지에서의 휴지통이동은 sendSw 를 'x'로 처리한다.
        sql = "update webmessage set sendSw = 'x' where idx= ?";
      }
      else if(mflag == 5) { //  휴지통에서 삭제처리(휴지통에는 받은메세지만 휴지통에 있다.) 요청시에는 receiveSw를 'x'로 처리한다.
        sql = "update webmessage set receiveSw = 'x' where idx= ?";
      }
      else {  // 나머지(받은메세지에서의 휴지통 이동은 receiveSw를 'g'로 처리
        sql = "update webmessage set receiveSw = 'g' where idx= ?";
      }
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  // 휴지통의 메세지를 receiveSw의 'g'에서 'x'로 처리
  public void messageDel(int idx, int mflag) {
    try {
      if(mflag == 1) {  // 받은메세지일경우는 receiveSw를 'g'에서 'x'로 변경
        sql = "update webmessage set receiveSw = 'x' where idx= ?";
      }
      else {  // 보낸메세지일경우는 sendSw를 's'에서 'x'로 변경
        sql = "update webmessage set sendSw = 'x' where idx= ?";
      }
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  // 휴지통안에 보관된 받은메세지들의 내용을 삭제한다.(자신의 받은 메세지(receiveId가 자신이다.)중에서 receiveSw의 'g'를 'x'로 바꾼다)
  public void messageAllDel(String receiveId) {
    try {
      sql = "update webmessage set receiveSw = 'x' where receiveId=? and receiveSw='g'";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, receiveId);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }
  
}
