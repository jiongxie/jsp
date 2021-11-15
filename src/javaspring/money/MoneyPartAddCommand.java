package javaspring.money;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoneyPartAddCommand implements Money_Command
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Money_Part_Vo vo = new Money_Part_Vo();
		vo.setMid(request.getParameter("mid"));
		vo.setPart_title(request.getParameter("part_title"));
		vo.setPart_kubun(request.getParameter("part_kubun"));
		
		//System.out.println(vo);
		
		Money_Dao dao = new Money_Dao();
		
		int res = dao.moneyPartAdd(vo);
		
		PrintWriter out = response.getWriter();
		out.println(res);
		out.close();
	}

}
