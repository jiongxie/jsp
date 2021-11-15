package javaspring.money;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoneyInputCommand implements Money_Command
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String mid = request.getParameter("mid");//접속중인 사용자아이디(세션)
		String ymd = request.getParameter("ymd");//해당 처리일자
		String kumak_kubun = request.getParameter("kumak_kubun");//입금 or 지출 인지 ?
		
		Money_Dao dao = new Money_Dao();
		
		List titleArr = dao.titleGroupBy(mid,kumak_kubun);//사용자가 자주쓰는 타이틀을 그룹바이로 가져온다(입금별,지출별 구분해서)
		List part_titleArr = dao.partTitleGroupBy(mid,kumak_kubun);//사용자정의 내역구분을 가져온다(입금별,지출별 구분해서)
		
		
		/*======================= setAttribute ========================*/
		request.setAttribute("ymd", ymd);
		request.setAttribute("kumak_kubun", kumak_kubun);
		request.setAttribute("titleArr", titleArr);
		request.setAttribute("part_titleArr", part_titleArr);
	}

}
