package javaspring.money;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoneyInputOkCommand implements Money_Command
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String kumakStr = request.getParameter("kumak").replace(",", "");// 금액 콤마 제거
		Money_Vo vo = new Money_Vo();
		vo.setMid(request.getParameter("mid"));
		vo.setMdate(request.getParameter("ymd"));
		vo.setKumak(Integer.parseInt(kumakStr));
		vo.setKumak_kubun(request.getParameter("kumak_kubun"));
		vo.setTitle(request.getParameter("title"));
		vo.setPart(request.getParameter("part"));
		vo.setJichul_kubun(request.getParameter("jichul_kubun"));

		// System.out.println(vo);

		
		Money_Dao dao = new Money_Dao(); int res = dao.moneyInput(vo);
		
		String ymd = vo.getMdate();
		String[] ymdArr = ymd.split("-");
		int yy = Integer.parseInt(ymdArr[0]);
		int mm = Integer.parseInt(ymdArr[1])-1;
		
		if(res == 1) 
		{ 
			request.setAttribute("msg", "moneyInputOk");
			request.setAttribute("url",request.getContextPath()+"/moneyList.don?yy="+yy+"&mm="+mm); 
		}
		else 
		{
			request.setAttribute("msg", "moneyInputNo"); 
			request.setAttribute("url",request.getContextPath()+"/moneyList.don?yy="+yy+"&mm="+mm); 
		}
		
	}

}
