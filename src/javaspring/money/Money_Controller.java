package javaspring.money;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.don")
public class Money_Controller extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		actionDo(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		actionDo(request,response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//한글처리
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//컨트롤러 -> 인터페이스 만들자
		Money_Command command = null;
		String viewPage = "";
		//확장자 패턴 시작
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"));
		
		//확장자 컨트롤
		if(com.equals("/moneyList.don"))//가계부 리스트 화면 이동
		{
			command = new MoneyListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/money/moneyList.jsp";
		}
		else if(com.equals("/moneyInput.don"))//가계부 입력화면 이동
		{
			command = new MoneyInputCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/money/moneyInput.jsp";
		}
		else if(com.equals("/moneyPartAdd.don"))//사용자정의 내역구분 추가 ajax
		{
			command = new MoneyPartAddCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/moneyInputOk.don"))//가계부 등록 처리!!
		{
			command = new MoneyInputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/thisClickList.don"))//가계부 메인화면에서 해당일자 클릭시 하단에 리스트 뿌려주기 ajax
		{
			command = new MoneyThisClickListCommand();
			command.execute(request, response);
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
