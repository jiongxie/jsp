package javaspring.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.JavaspringProc;

public class BoardDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  BoardVo vo = null;

  // 게시판 전체자료 검색
  public List<BoardVo> bList(int startNo, int pageSize) {
    List<BoardVo> vos = new ArrayList<BoardVo>();
    
    try {
      sql = "select * from board order by idx desc limit ?, ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startNo);
      pstmt.setInt(2, pageSize);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        BoardVo vo = new BoardVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setName(rs.getString("name"));
        vo.setTitle(rs.getString("title"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setPwd(rs.getString("pwd"));
        
        vo.setWdate(rs.getDate("wdate"));     // 날짜만 저장된다.
        vo.setwCdate(rs.getString("wdate"));  // 날짜와 시간이 저장된다.
        
        JavaspringProc jp = new JavaspringProc(); // 날짜를 시간형식으로 계산하기위한 메소드를 포함한 클래스
        int res = jp.timeDiff(vo.getwCdate());
        vo.setwNdate(res);  // 시간차를 숫자형식으로 받아서 wNdate필드에 담았다.
        
        vo.setReadnum(rs.getInt("readnum"));
        vo.setHostip(rs.getString("hostip"));
        vo.setGood(rs.getInt("good"));
        vo.setContent(rs.getString("content"));
        
        // 현재 게시글에 해당하는 모든 댓글의 수를 구해와서 vo에 담아준다.
        vo.setReplyCount(replyCount(rs.getInt("idx")));
        
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

  // 현 게시글에 해당하는 댓글의 '갯수'를 구하는 메소드
  private int replyCount(int idx) {
    try {
      sql = "select count(*) from board_cont where board_idx = ?";
      PreparedStatement pstmt2 = conn.prepareStatement(sql);
      pstmt2.setInt(1, idx);
      ResultSet rs2 = pstmt2.executeQuery();
      if(rs2.next()) return rs2.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    }
    return 0;
  }

  // 게시글 저장하기
  public int bInputOk(BoardVo vo) {
    try {
      sql = "insert into board values (default,?,?,?,?,?,default,0,?,0,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getName());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getEmail());
      pstmt.setString(4, vo.getHomepage());
      pstmt.setString(5, vo.getPwd());
      pstmt.setString(6, vo.getHostip());
      pstmt.setString(7, vo.getContent());
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

  // 한건의 자료 가져오기
  public BoardVo bContent(int idx) {
    vo = new BoardVo();
    
    try {
      sql = "select * from board where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      rs.next();
      
      vo.setIdx(idx);
      vo.setName(rs.getString("name"));
      vo.setTitle(rs.getString("title"));
      vo.setEmail(rs.getString("email"));
      vo.setHomepage(rs.getString("homepage"));
      vo.setPwd(rs.getString("pwd"));
      vo.setWdate(rs.getDate("wdate"));
      vo.setReadnum(rs.getInt("readnum"));
      vo.setHostip(rs.getString("hostip"));
      vo.setGood(rs.getInt("good"));
      vo.setContent(rs.getString("content"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vo;
  }

  // 글 조회쉬 1씩 증가하기
  public void readNumUpdate(int idx) {
    try {
      sql = "update board set readnum = readnum + 1 where idx = ?";
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

  // 전체 레코드 건수 구하기
  public int totRecCnt() {
    int totRecCnt = 0;
    try {
      sql = "select count(*) from board";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      totRecCnt = rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return totRecCnt;
  }

  // 게시글 삭제 프로그램.
  public int bDelete(int idx, String pwd) {
    // 비밀번호 체크 처리
    int res = getSearch(idx, pwd);
    if(res == 0) return 0;  // idx와 비밀번호가 다르면 0으로 돌려보낸다.
    
    try {
      sql = "delete from board where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
      return 1;  // 정상적인 삭제처리후는 1을 리턴한다.
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }

  // 개별자료 검색 처리....(idx와 비밀번호가 같은지를 체크한다.)
  public int getSearch(int idx, String pwd) {
    try {
      sql = "select idx from board where idx = ? and pwd = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.setString(2, pwd);
      rs = pstmt.executeQuery();
      if(rs.next()) return 1; // idx와 비밀번호가 일치하면 1을 돌려준다.
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return 0;
  }

  // 게시글 내용 수정하기
  public int bUpdateOk(BoardVo vo, int idx) {
    try {
      sql = "update board set name=?,title=?,email=?,homepage=?,pwd=?,hostip=?,content=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getName());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getEmail());
      pstmt.setString(4, vo.getHomepage());
      pstmt.setString(5, vo.getPwd());
      pstmt.setString(6, vo.getHostip());
      pstmt.setString(7, vo.getContent());
      pstmt.setInt(8, idx);
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

  // aJax를 이용한 좋아요 숫자 증가루틴....
  public void bGood(int idx) {
    try {
      sql = "update board set good = good + 1 where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
      
      if(pstmt != null) pstmt.close();
      
     // sql = "update board set readnum = readnum - 1 where idx = ?";
      //pstmt = conn.prepareStatement(sql);
      //pstmt.setInt(1, idx);
      //pstmt.executeUpdate();
      
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  // 댓글 입력처리
  public void bContInput(BoardContVo cVo) {
    try {
      sql = "insert into board_cont values (default,?,?,?,default,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cVo.getBoard_idx());
      pstmt.setString(2, cVo.getMid());
      pstmt.setString(3, cVo.getNickname());
      pstmt.setString(4, cVo.getHostip());
      pstmt.setString(5, cVo.getContent());
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  public List<BoardContVo> contList(int idx) {
    List<BoardContVo> cVos = new ArrayList<BoardContVo>();
    
    try {
      sql = "select * from board_cont where board_idx=? order by idx";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        BoardContVo cVo = new BoardContVo();
        cVo.setIdx(rs.getInt("idx"));
        cVo.setBoard_idx(rs.getInt("board_idx"));
        cVo.setMid(rs.getString("mid"));
        cVo.setNickname(rs.getString("nickname"));
        cVo.setWdate(rs.getString("wdate"));
        cVo.setHostip(rs.getString("hostip"));
        cVo.setContent(rs.getString("content"));
        cVos.add(cVo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return cVos;
  }

  // 댓글삭제(aJax처리)
  public void replyDel(int idx) {
    try {
      sql = "delete from board_cont where idx = ?";
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

  // 검색기를 통한 '글제목/글쓴이/글내용' 검색 처리
  public List<BoardVo> getBSearch(String search, String searchString) {
    List<BoardVo> vos = new ArrayList<>();
    
    try {
      sql = "select * from board where " + search + " like ? order by idx desc";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "%"+searchString+"%");
      rs = pstmt.executeQuery();
      while(rs.next()) {
        BoardVo vo = new BoardVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setName(rs.getString("name"));
        vo.setTitle(rs.getString("title"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setPwd(rs.getString("pwd"));
        
        vo.setWdate(rs.getDate("wdate"));     // 날짜만 저장된다.
        vo.setwCdate(rs.getString("wdate"));  // 날짜와 시간이 저장된다.
        
        System.out.println("1.res : ");
        JavaspringProc jp = new JavaspringProc(); // 날짜를 시간형식으로 계산하기위한 메소드를 포함한 클래스
        int res = jp.timeDiff(vo.getwCdate());
        System.out.println("2.res : " + res);
        vo.setwNdate(res);  // 시간차를 숫자형식으로 받아서 wNdate필드에 담았다.
        
        vo.setReadnum(rs.getInt("readnum"));
        vo.setHostip(rs.getString("hostip"));
        vo.setGood(rs.getInt("good"));
        vo.setContent(rs.getString("content"));
        
        // 현재 게시글에 해당하는 모든 댓글의 수를 구해와서 vo에 담아준다.
        vo.setReplyCount(replyCount(rs.getInt("idx")));
        
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

  // 검색대상에 대한 총 자료수 조회
  public int totSearchRecCnt(String search, String searchString) {
    try {
      sql = "select count(*) from board where " + search + " like ? order by idx desc";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "%"+searchString+"%");
      rs = pstmt.executeQuery();
      rs.next();
      return rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    }
    return 0;
  }

	public int abDelete(int idx) {
    
    try {
      sql = "delete from board where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
      return 1;  // 정상적인 삭제처리후는 1을 리턴한다.
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
	}
}
