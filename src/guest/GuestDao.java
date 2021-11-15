package guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class GuestDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  private GuestVo vo = null;
  
  // 전체 자료 조회
  public ArrayList<GuestVo> gList(int statNo, int pageSize) {
    ArrayList<GuestVo> vos = new ArrayList<GuestVo>();
    
    try {
      sql = "select * from guest order by idx desc limit ?, ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, statNo);
      pstmt.setInt(2, pageSize);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        GuestVo vo = new GuestVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setName(rs.getString("name"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setVdate(rs.getString("vdate"));
        vo.setHostip(rs.getString("hostip"));
        vo.setContent(rs.getString("content"));
        
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

  // 방문소감 등록하기
  public int gInputOk(GuestVo vo) {
    try {
      sql = "insert into guest values (default,?,?,?,default,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getName());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getHomepage());
      pstmt.setString(4, vo.getHostip());
      pstmt.setString(5, vo.getContent());
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

  // 방명록의 게시글 삭제처리
  public int gDelete(int idx) {
    try {
      sql = "delete from guest where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
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
  
  // 전체 레코드 건수 구하기
  public int totRecCnt() {
    int totRecCnt = 0;
    try {
      sql = "select count(*) from guest";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        totRecCnt = rs.getInt(1);
        return totRecCnt;
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return totRecCnt;
  }

  //최근 올린글 리스트 가져오기
  public ArrayList<GuestVo> newGuestList() {
    ArrayList<GuestVo> vos = new ArrayList<GuestVo>();
    try {
      sql = "select * from guest where vdate > (date_sub(now(), interval 5 day)) order by idx desc";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        GuestVo vo = new GuestVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setName(rs.getString("name"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setVdate(rs.getString("vdate"));
        vo.setHostip(rs.getString("hostip"));
        vo.setContent(rs.getString("content"));
        
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
}
