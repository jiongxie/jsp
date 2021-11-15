package javaspring.money;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoneyThisClickListCommand implements Money_Command
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String mid = request.getParameter("mid");
		String ymd = request.getParameter("mdate");
		
		Money_Dao dao = new Money_Dao();
		
		List<Money_Vo> vos = dao.moneyThisClickList(mid,ymd);
		
		DecimalFormat fmt = new DecimalFormat("###,###");
		String data = "";
		
		if(vos.size() > 0)
		{
			for(int i=0; i<vos.size(); i++)
			{
				Money_Vo vo = vos.get(i);
				data += "<div class='row'>";
				data += "<div class='col-sm-2' style='background-color:#1c140d;text-align: center;font-size: 2em;'>";
				data += "<span class='badge badge-warning'>" + vo.getPart() + "</span>";
				data += "</div>";
				data += "<div class='col-sm-7' style='background-color:#1c140d;text-align: center;font-size: 2em;'>";
				data += vo.getTitle();
				data += "</div>";
				data += "<div class='col-sm-3' style='background-color:#1c140d;text-align: center;font-size: 2em;'>";
				if(vo.getKumak_kubun().equals("입금"))
				{
					data += "<font color='#67D5B5'>";
					data +=  fmt.format(vo.getKumak())+"원";
					data += "</font>";
				}
				else
				{
					data += "<font color='#EE7785'>";
					data +=  fmt.format(vo.getKumak())+"원";
					data += "</font>";
				}
				data += "</div>";
				data += "</div>";
			}
		}
		else
		{
			data += "<div class='row'>";
			data += "<div class='col-sm-12' style='background-color:#1c140d;text-align: center;font-size: 4em;'>";
			data += "해당 데이터가 없습니다";
			data += "</div>";
			data += "</div>";
		}
		
		PrintWriter out = response.getWriter();
		out.println(data);
		out.close();
	}

}
