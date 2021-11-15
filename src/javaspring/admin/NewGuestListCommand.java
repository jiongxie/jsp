package javaspring.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestDao;
import guest.GuestVo;

public class NewGuestListCommand implements AdminCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    GuestDao dao = new GuestDao();

    ArrayList<GuestVo> vos = dao.newGuestList();

    request.setAttribute("vos", vos);
  }

}
