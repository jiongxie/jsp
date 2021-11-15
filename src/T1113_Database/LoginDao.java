package T1113_Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LoginDao {
  private Connection conn = null;
  private Statement stmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  LoginVo vo = null;
  
  private String url = "jdbc:mysql://localhost:3306/javaspring";
  private String user = "atom";
  private String password = "1234";
 
  // 생성자를 통한 DB연동
  public LoginDao() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      //System.out.println("드라이버 검색 성공!!!!");
      conn = DriverManager.getConnection(url, user, password);
      //System.out.println("Database 연동 성공!!!!");
    } catch (ClassNotFoundException e) {
      System.out.println("드라이버 검색 실패~~~");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("Database 연동 실패~~");
      e.printStackTrace();
      try {
        conn.close();
      } catch (SQLException e1) {}
    }
  }
  
  public void dbClose() {
    try {
      conn.close();
    } catch (SQLException e) {}
  }
  
  public void stmtClose() {
    if(stmt != null)
      try {
        stmt.close();
        conn.close();
      } catch (SQLException e) {}
  }
  
  public void rsClose() {
    if(rs != null)
      try {
        rs.close();
        if(stmt != null) stmt.close();
        conn.close();
      } catch (SQLException e) {}
  }
  
  // 로그인 체크
  public LoginVo loginCheck(String mid, String pwd) {
    vo = new LoginVo();
    
    try {
      sql = "select idx,name from login where mid = '"+mid+"' and pwd = '"+pwd+"'";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      
      if(rs.next()) {
        vo.setIdx(rs.getInt("idx"));
        vo.setName(rs.getString("name"));
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      if(rs != null)
        try {
          rs.close();
          if(stmt != null) rs.close();
        } catch (SQLException e) {}
    }
    return vo;
  }
  
  // 전체 회원 자료 검색
  public ArrayList<LoginVo> loginList() {
    ArrayList<LoginVo> vos = new ArrayList<LoginVo>();
    
    try {
      sql = "select * from login order by name";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      
      while(rs.next()) {
        vo = new LoginVo();
        
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setName(rs.getString("name"));
        vo.setPwd(rs.getString("pwd"));
        
        vos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      rsClose();
    }
    return vos;
  }

  // 회원가입하기
  public int loginInput(LoginVo vo) {
    try {
      sql = "insert into login values (default,'"+vo.getMid()+"','"+vo.getPwd()+"','"+vo.getName()+"')";
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      stmtClose();
    }
    return 0;
  }

  // 회원탈퇴
  public void logDelete(int idx) {
    try {
      sql = "delete from login where idx = "+idx;
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      stmtClose();
    }
  }
  
  // 한건의 자료 검색
  public LoginVo loginSearch(int idx) {
    vo = new LoginVo();
    
    try {
      sql = "select * from login where idx = " + idx;
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      rs.next();
      
      vo.setIdx(idx);
      vo.setMid(rs.getString("mid"));
      vo.setPwd(rs.getString("pwd"));
      vo.setName(rs.getString("name"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      rsClose();
    }
    return vo;
  }

  // 회원 정보 수정처리
  public int loginUpdate(LoginVo vo) {
    sql = "update login set mid='"+vo.getMid()+"', pwd='"+vo.getPwd()+"', name='"+vo.getName()+"' where idx="+vo.getIdx();
    try {
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      stmtClose();
    }
    return 0;
  }
}
