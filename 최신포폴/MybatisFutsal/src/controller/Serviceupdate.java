package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Actionupdate;
import model.Mdto;

public class Serviceupdate implements Cominterface {

	static Serviceupdate impl = new Serviceupdate();

	public static Serviceupdate instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String maraname = request.getParameter("maraname");
		String maraid = request.getParameter("maraid");
		String marapass = request.getParameter("marapass");

		Mdto Mdto = new Mdto();
		Mdto.setMaraname(maraname);
		Mdto.setMaraid(maraid);
		Mdto.setMarapass(marapass);

		Actionupdate model = Actionupdate.instance();
		ArrayList<Mdto> list = (ArrayList<Mdto>) model.updateinform(Mdto);
		request.setAttribute("data", list);
		return "sangpum_list.jsp";
	}
}
