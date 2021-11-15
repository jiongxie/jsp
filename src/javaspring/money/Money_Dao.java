package javaspring.money;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;

public class Money_Dao
{
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";

	//사용자가 자주쓰는 타이틀을 그룹바이로 가져온다(입금별,지출별 구분해서)
	public List titleGroupBy(String mid, String kumak_kubun)
	{
		List titleArr = new ArrayList();
		try
		{
			sql = "select title from money where mid = ? and kumak_kubun = ? group by title";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, kumak_kubun);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				titleArr.add(rs.getString(1));
			}
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.rsClose();
		}
		return titleArr;
	}

	//사용자정의 내역구분을 가져온다(입금별,지출별 구분해서)
	public List partTitleGroupBy(String mid, String kumak_kubun)
	{
		List part_titleArr = new ArrayList();
		try
		{
			sql = "select part_title from money_part where mid = ? and part_kubun = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, kumak_kubun);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				part_titleArr.add(rs.getString(1));
			}
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.rsClose();
		}
		return part_titleArr;
	}
	
	//사용자정의 내역구분 추가 - money_title은 중복되도 됨
	public int moneyPartAdd(Money_Part_Vo vo)
	{
		try
		{
			sql = "insert into money_part values(default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPart_title());
			pstmt.setString(3, vo.getPart_kubun());
			pstmt.executeUpdate();
			return 1;
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.pstmtClose();
		}
		return 0;
	}
	
	//가계부 입력처리
	public int moneyInput(Money_Vo vo)
	{
		try
		{
			sql ="insert into money values(default,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMdate());
			pstmt.setInt(3, vo.getKumak());
			pstmt.setString(4, vo.getKumak_kubun());
			pstmt.setString(5, vo.getTitle());
			pstmt.setString(6, vo.getPart());
			pstmt.setString(7, vo.getJichul_kubun());
			pstmt.executeUpdate();
			return 1;
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.pstmtClose();
		}
		
		return 0;
	}

	//화면에 표시할 해당사용자의 해당월의 일자별 입금리스트
	public int userMoneyIpkumList(String smid, String ymd, String kumak_kubun)
	{
		int ipkumTot = 0;
		try
		{
			sql = "select sum(kumak) from money where mid =? and mdate = ? and kumak_kubun=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, smid);
			pstmt.setString(2, ymd);
			pstmt.setString(3, kumak_kubun);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				ipkumTot = rs.getInt(1);
			}
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.pstmtClose();
		}
		return ipkumTot;
	}

	//화면에 표시할 해당사용자의 해당월의 일자별 지출리스트
	public int userMoneyjichulList(String smid, String ymd, String kumak_kubun)
	{
		int jichulkumTot = 0;
		try
		{
			sql = "select sum(kumak) from money where mid =? and mdate = ? and kumak_kubun=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, smid);
			pstmt.setString(2, ymd);
			pstmt.setString(3, kumak_kubun);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				jichulkumTot = rs.getInt(1);
			}
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.pstmtClose();
		}
		return jichulkumTot;
	}
	
	// 해당사용자에 대한 해당월별 지출에대한 현금,신용카드,체크카드 사용내역
	public List<Money_Vo> jichulKubunList(String mid, String ym, String jichul_kubun)
	{
		List<Money_Vo> vos = new ArrayList<Money_Vo>();
		
		try
		{
			sql = "select jichul_kubun,sum(kumak) as 'kumak' "
			+ "from money where mid = ? and date_format(mdate,'%Y-%m') = ? and kumak_kubun = ? "
			+ "group by jichul_kubun "
			+ "order by sum(kumak) desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ym);
			pstmt.setString(3, jichul_kubun);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Money_Vo vo = new Money_Vo();
				vo.setJichul_kubun(rs.getString("jichul_kubun"));
				vo.setKumak(rs.getInt("kumak"));
				vos.add(vo);
			}
			
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.rsClose();
		}
		
		
		return vos;
	}

	//가계부 메인화면에서 해당일자 클릭시 하단에 리스트 뿌려주기
	public List<Money_Vo> moneyThisClickList(String mid, String ymd)
	{
		List<Money_Vo> vos = new ArrayList<Money_Vo>();
		try
		{
			sql = "select * from money where mid = ? and mdate = ? order by kumak_kubun asc,idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ymd);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Money_Vo vo = new Money_Vo();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setMdate(rs.getString("mdate"));
				vo.setKumak(rs.getInt("kumak"));
				vo.setKumak_kubun(rs.getString("kumak_kubun"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setJichul_kubun(rs.getString("jichul_kubun"));
				vos.add(vo);
			}
		} 
		catch (SQLException e)
		{
			System.out.println("sql 에러 : " + e.getMessage());
		}
		finally
		{
			getConn.rsClose();
		}
		
		return vos;
	}
}
