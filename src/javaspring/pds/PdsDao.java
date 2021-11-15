package javaspring.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;

public class PdsDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  PdsVo vo = null;

  // 총 레코드 건수 구하기
  public int totRecCnt() {
    try {
      sql = "select count(*) from pds";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      return rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    }
    return 0;
  }

  // 전체 자료 출력을 위한 준비
  public List<PdsVo> pList(int startNo, int pageSize, String part) {
    List<PdsVo> vos = new ArrayList<PdsVo>();
    
    try {
      if(part.equals("전체")) {
        sql = "select * from pds order by idx desc limit ?,?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, startNo);
        pstmt.setInt(2, pageSize);
      }
      else {
        sql = "select * from pds where part=? order by idx desc limit ?,?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, part);
        pstmt.setInt(2, startNo);
        pstmt.setInt(3, pageSize);
      }
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vo = new PdsVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setNickname(rs.getString("nickname"));
        vo.setFname(rs.getString("fname"));
        vo.setRfname(rs.getString("rfname"));
        vo.setTitle(rs.getString("title"));
        vo.setPart(rs.getString("part"));
        vo.setPwd(rs.getString("pwd"));
        vo.setFdate(rs.getString("fdate"));
        vo.setFsize(rs.getString("fsize"));
        vo.setDownnum(rs.getInt("downnum"));
        vo.setOpensw(rs.getString("opensw"));
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

  // 업로드된 파일의 정보를 DB에 저장하는곳
  public int pInput(PdsVo vo) {
    try {
      sql = "insert into pds values (default,?,?,?,?,?,?,?,default,?,0,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getMid());
      pstmt.setString(2, vo.getNickname());
      pstmt.setString(3, vo.getFname());
      pstmt.setString(4, vo.getRfname());
      pstmt.setString(5, vo.getTitle());
      pstmt.setString(6, vo.getPart());
      pstmt.setString(7, vo.getPwd());
      pstmt.setString(8, vo.getFsize());
      pstmt.setString(9, vo.getOpensw());
      pstmt.setString(10, vo.getContent());
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

  // 개별 자료 정보 가져오기
  public PdsVo pContent(int idx) {
    try {
      sql = "select * from pds where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        vo = new PdsVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setNickname(rs.getString("nickname"));
        vo.setFname(rs.getString("fname"));
        vo.setRfname(rs.getString("rfname"));
        vo.setTitle(rs.getString("title"));
        vo.setPart(rs.getString("part"));
        vo.setPwd(rs.getString("pwd"));
        vo.setFdate(rs.getString("fdate"));
        vo.setFsize(rs.getString("fsize"));
        vo.setDownnum(rs.getInt("downnum"));
        vo.setOpensw(rs.getString("opensw"));
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

  // 다운로드수 증가하기
  public void updateDownNum(int idx) {
    try {
      sql = "update pds set downnum = downnum + 1 where idx = ?";
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

  public int pPwdCheck(String mid, int idx, String pwd) {
    sql = "select idx from pds where mid=? and idx=? and pwd=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      pstmt.setInt(2, idx);
      pstmt.setString(3, pwd);
      rs = pstmt.executeQuery();
      if(rs.next()) return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return 0;
  }

  // 삭제된 파일의 정보를 기존 테이블에 업데이트처리한다.
  public void updFileDel(PdsVo vo) {
    try {
      sql = "update pds set fname = ?, rfname = ? where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getFname());
      pstmt.setString(2, vo.getRfname());
      pstmt.setInt(3, vo.getIdx());
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  // 자료파일을 DB에서 삭제처리한다.
  public void pDelete(int idx) {
    try {
      sql = "delete from pds where idx = ?";
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

  // 자료파일 수정하기
  public int pUpdate(PdsVo vo) {
    try {
      sql = "update pds set fname=?,rfname=?,title=?,part=?,pwd=?,fsize=?,opensw=?,content=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getFname());
      pstmt.setString(2, vo.getRfname());
      pstmt.setString(3, vo.getTitle());
      pstmt.setString(4, vo.getPart());
      pstmt.setString(5, vo.getPwd());
      pstmt.setString(6, vo.getFsize());
      pstmt.setString(7, vo.getOpensw());
      pstmt.setString(8, vo.getContent());
      pstmt.setInt(9, vo.getIdx());
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
