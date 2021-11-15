package javaspring.calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class ScheduleDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  ScheduleVo vo = null;
  
  // 등록된 일정 보기
  public ScheduleVo scContent(String ymd, String mid) {
    vo = new ScheduleVo();
    
    sql = "select * from schedule2 where scdate = ? and mid = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ymd);
      pstmt.setString(2, mid);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setMemory(rs.getString("memory"));
        vo.setScdate(rs.getString("scdate"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vo;
  }

  // 일정 등록 및 수정 처리 루틴
  public int scSearchContent(ScheduleVo vo) {
    ScheduleVo searchVo = scContent(vo.getScdate(), vo.getMid());
    System.out.println("searchVo " + searchVo);
    
    try {
      if(searchVo.getIdx() == 0) {
        sql = "insert into schedule2 values (default,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vo.getMid());
        pstmt.setString(2, vo.getScdate());
        pstmt.setString(3, vo.getMemory());
        pstmt.setString(4, vo.getTitle());
        pstmt.setString(5, vo.getContent());
      }
      else {
        sql = "update schedule2 set memory=?,title=?,content=? where idx=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vo.getMemory());
        pstmt.setString(2, vo.getTitle());
        pstmt.setString(3, vo.getContent());
        pstmt.setInt(4, vo.getIdx());
      }
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

  // 일정 삭제하기
  public int scDelete(String ymd, String mid) {
    try {
      sql = "delete from schedule2 where scdate=? and mid=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ymd);
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

}
