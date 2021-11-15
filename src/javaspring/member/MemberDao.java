package javaspring.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  MemberVo vo = null;

  // 아이디 중복 체크
  public String idCheck(String mid) {
    try {
      sql = "select * from member where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      rs = pstmt.executeQuery();
      if(rs.next()) return mid;  // 이미 사용중인 아이디는 mid값을 리턴
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return "";  // '사용가능아이디'일겨우 공백을 리턴
  }

  // 닉네임 중복 체크처리
  public String nicknameCheck(String nickname) {
    try {
      sql = "select * from member where nickname = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, nickname);
      rs = pstmt.executeQuery();
      if(rs.next()) return nickname;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return "";
  }

  // 회원 가입처리
  public int mInputOk(MemberVo vo) {
    try {
      sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getMid());
      pstmt.setString(2, vo.getPwd());
      pstmt.setString(3, vo.getNickname());
      pstmt.setString(4, vo.getName());
      pstmt.setString(5, vo.getGender());
      pstmt.setString(6, vo.getBirthday());
      pstmt.setString(7, vo.getTel());
      pstmt.setString(8, vo.getAddress());
      pstmt.setString(9, vo.getEmail());
      pstmt.setString(10, vo.getHomepage());
      pstmt.setString(11, vo.getJob());
      pstmt.setString(12, vo.getHobby());
      pstmt.setString(13, vo.getUserinfor());
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

  // 로그인 인증 처리
  public MemberVo loginOk(String mid, String pwd) {
    MemberVo vo = new MemberVo();
    try {
      sql = "select * from member where mid = ? and pwd = ? and userdel = 'NO'";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      pstmt.setString(2, pwd);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        vo.setMid(mid);
        vo.setNickname(rs.getString("nickname"));
        vo.setLevel(rs.getInt("level"));
        
        // 로그인이 방문횟수를 1씩 증가시킨다. 최종 방문일자 업데이트 하기
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        sql = "update member set visitCnt=visitCnt+1, lastDate=now() where mid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mid);
        pstmt.executeUpdate();
        
        // 최종 방문일자 업데이트 하기
//        if(rs != null) rs.close();
//        if(pstmt != null) pstmt.close();
//        sql = "update member set lastDate = now() where mid = ?";
//        pstmt = conn.prepareStatement(sql);
//        pstmt.setString(1, mid);
//        pstmt.executeUpdate();
        
        return vo;
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return null;
  }

  // 전체 회원 정보보기
  public ArrayList<MemberVo> mList(int statNo, int pageSize) {
    ArrayList<MemberVo> vos = new ArrayList<MemberVo>();
    
    try {
      sql = "select * from member order by idx desc limit ?, ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, statNo);
      pstmt.setInt(2, pageSize);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vo = new MemberVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setPwd(rs.getString("pwd"));
        vo.setNickname(rs.getString("nickname"));
        vo.setName(rs.getString("name"));
        vo.setGender(rs.getString("gender"));
        vo.setBirthday(rs.getString("birthday"));
        vo.setTel(rs.getString("tel"));
        vo.setAddress(rs.getString("address"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setJob(rs.getString("job"));
        vo.setHobby(rs.getString("hobby"));
        vo.setUserinfor(rs.getString("userinfor"));
        vo.setUserdel(rs.getString("userdel"));
        vo.setLevel(rs.getInt("level"));
        vo.setVisitCnt(rs.getInt("visitCnt"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setLastDate(rs.getString("lastDate"));
        vo.setMoney(rs.getInt("money"));
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

  // 운용자금 구해오기
  public ArrayList<MemberVo> mmList() {
    ArrayList<MemberVo> mvos = new ArrayList<MemberVo>();
    
    try {
      sql = "select * from member order by idx";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vo = new MemberVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setPwd(rs.getString("pwd"));
        vo.setNickname(rs.getString("nickname"));
        vo.setName(rs.getString("name"));
        vo.setGender(rs.getString("gender"));
        vo.setBirthday(rs.getString("birthday"));
        vo.setTel(rs.getString("tel"));
        vo.setAddress(rs.getString("address"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setJob(rs.getString("job"));
        vo.setHobby(rs.getString("hobby"));
        vo.setUserinfor(rs.getString("userinfor"));
        vo.setUserdel(rs.getString("userdel"));
        vo.setLevel(rs.getInt("level"));
        vo.setVisitCnt(rs.getInt("visitCnt"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setLastDate(rs.getString("lastDate"));
        vo.setMoney(rs.getInt("money"));
        mvos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return mvos;
  }

  
  // 전체 레코드 건수 구해오기
  public int totRecCnt() {
    try {
      sql = "select count(*) from member";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if(rs.next()) return rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return 0;
  }

  //  관리자가 회원등급을 조정처리하는 곳
  public void levelCheck(int idx, int level) {
    try {
      sql = "update member set level = ? where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, level);
      pstmt.setInt(2, idx);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    
  }
 
  //관리자가 회원 금액 올려주는곳
 public int upMoney(int su, String mid) {
   try {
     sql = "update member set money = money + ?  where mid = ?";
     pstmt = conn.prepareStatement(sql);
     pstmt.setInt(1, su);
     pstmt.setString(2, mid);
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
 
// //관리자가 회원 금액 올려주는곳
//public MemberVo upMoney(int su, String mid) {
//  try {
//    sql = "update member set money = money + ?  where mid = ?";
//    pstmt = conn.prepareStatement(sql);
//    pstmt.setInt(1, su);
//    pstmt.setString(2, mid);
//    pstmt.executeUpdate();
//  } catch (SQLException e) {
//    System.out.println("SQL 에러 : " + e.getMessage());
//    e.printStackTrace();
//  } finally {
//    getConn.pstmtClose();
//  }
//  return vo;
//}
//
 // 개별 회원 정보 상세 목록 조회처리
  public MemberVo memberSearch(String mid) {
    try {
      sql = "select * from member where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      rs = pstmt.executeQuery();
      rs.next();
      
      vo = new MemberVo();
      
      vo.setIdx(rs.getInt("idx"));
      vo.setMid(rs.getString("mid"));
      vo.setPwd(rs.getString("pwd"));
      vo.setNickname(rs.getString("nickname"));
      vo.setName(rs.getString("name"));
      vo.setGender(rs.getString("gender"));
      vo.setBirthday(rs.getString("birthday"));
      vo.setTel(rs.getString("tel"));
      vo.setAddress(rs.getString("address"));
      vo.setEmail(rs.getString("email"));
      vo.setHomepage(rs.getString("homepage"));
      vo.setJob(rs.getString("job"));
      vo.setHobby(rs.getString("hobby"));
      vo.setUserinfor(rs.getString("userinfor"));
      vo.setUserdel(rs.getString("userdel"));
      vo.setLevel(rs.getInt("level"));
      vo.setVisitCnt(rs.getInt("visitCnt"));
      vo.setStartDate(rs.getString("startDate"));
      vo.setLastDate(rs.getString("lastDate"));
      vo.setMoney(rs.getInt("money"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vo;
  }

  // 회원 정보 수정하기
  public int mUpdateOk(MemberVo vo) {
    try {
      sql = "update member set pwd=?,nickname=?,name=?,gender=?,birthday=?,tel=?,address=?,email=?,homepage=?,job=?,hobby=?,userinfor=? where mid=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPwd());
      pstmt.setString(2, vo.getNickname());
      pstmt.setString(3, vo.getName());
      pstmt.setString(4, vo.getGender());
      pstmt.setString(5, vo.getBirthday());
      pstmt.setString(6, vo.getTel());
      pstmt.setString(7, vo.getAddress());
      pstmt.setString(8, vo.getEmail());
      pstmt.setString(9, vo.getHomepage());
      pstmt.setString(10, vo.getJob());
      pstmt.setString(11, vo.getHobby());
      pstmt.setString(12, vo.getUserinfor());
      pstmt.setString(13, vo.getMid());
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

  // 회원 탈퇴 신청 처리(userdel = 'ok' 처리)
  public int mDelete(String mid) {
    try {
      sql = "update member set userdel='OK' where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
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

  // 회원 정보 삭제 처리
  public int mReset(String mid) {
    try {
      sql = "delete from member where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
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

  // 최근글 갯수 가져오기
  public int newGuest() {
    int guestCnt = 0;
    sql = "select count(*) from guest where vdate > (date_sub(now(), interval 5 day))";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      guestCnt = rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return guestCnt;
  }
  
  // 새로 가입한회원(준회원) 인원수 출력하기
  public int newMemberCnt() {
    int memberCnt = 0;
    sql = "select count(*) from member where level = 1";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      memberCnt = rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return memberCnt;
  }

  // 탈퇴 신청한 회원 수 구하기
  public int newMemberResetCnt() {
    int memberResetCnt = 0;
    sql = "select count(*) from member where userdel = 'OK'";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      memberResetCnt = rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return memberResetCnt;
  }

  // '준회원'만 보여주기
  public ArrayList<MemberVo> amNewList(String aSw) {
    ArrayList<MemberVo> vos = new ArrayList<MemberVo>();
    try {
      if(aSw.equals("new")) {
        sql = "select * from member where level = 1 order by idx desc";
      }
      else if(aSw.equals("reset")) {
        sql = "select * from member where userDel = 'OK' order by idx desc";
      }
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vo = new MemberVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setPwd(rs.getString("pwd"));
        vo.setNickname(rs.getString("nickname"));
        vo.setName(rs.getString("name"));
        vo.setGender(rs.getString("gender"));
        vo.setBirthday(rs.getString("birthday"));
        vo.setTel(rs.getString("tel"));
        vo.setAddress(rs.getString("address"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setJob(rs.getString("job"));
        vo.setHobby(rs.getString("hobby"));
        vo.setUserinfor(rs.getString("userinfor"));
        vo.setUserdel(rs.getString("userdel"));
        vo.setLevel(rs.getInt("level"));
        vo.setVisitCnt(rs.getInt("visitCnt"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setLastDate(rs.getString("lastDate"));
        
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

	public int nickNameCheck(String nickname) {
		
		return 0;
	}

  public MemberVo moneySearch(String mid) {
    try {
      sql = "select * from member where mid = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      rs = pstmt.executeQuery();
      rs.next();
      
      vo = new MemberVo();
      
      vo.setIdx(rs.getInt("idx"));
      vo.setMid(rs.getString("mid"));
      vo.setPwd(rs.getString("pwd"));
      vo.setNickname(rs.getString("nickname"));
      vo.setName(rs.getString("name"));
      vo.setGender(rs.getString("gender"));
      vo.setBirthday(rs.getString("birthday"));
      vo.setTel(rs.getString("tel"));
      vo.setAddress(rs.getString("address"));
      vo.setEmail(rs.getString("email"));
      vo.setHomepage(rs.getString("homepage"));
      vo.setJob(rs.getString("job"));
      vo.setHobby(rs.getString("hobby"));
      vo.setUserinfor(rs.getString("userinfor"));
      vo.setUserdel(rs.getString("userdel"));
      vo.setLevel(rs.getInt("level"));
      vo.setVisitCnt(rs.getInt("visitCnt"));
      vo.setStartDate(rs.getString("startDate"));
      vo.setLastDate(rs.getString("lastDate"));
      vo.setMoney(rs.getInt("money"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vo;
  }

}
