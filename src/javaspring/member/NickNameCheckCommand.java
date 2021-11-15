package javaspring.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NickNameCheckCommand implements MemberCommand
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String nickname = request.getParameter("nickname") == null ? "" : request.getParameter("nickname");
		
		MemberDao dao = new MemberDao();
		
		int res = dao.nickNameCheck(nickname);
		
		if(res == 1)
		{
			request.setAttribute("nickname", nickname);
			request.setAttribute("res", res);
		}
		else if(res == 0)
		{
			request.setAttribute("nickname", nickname);
			request.setAttribute("res", res);
		}
	}

}
