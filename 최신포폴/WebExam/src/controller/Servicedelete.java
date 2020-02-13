package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Actiondelete;

import model.Actionupdate;
import model.Mdto;

public class Servicedelete implements Cominterface {

	static Servicedelete impl = new Servicedelete();

	public static Servicedelete instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String maraname = request.getParameter("maraname");

		Mdto Mdto = new Mdto();
		Mdto.setMaraname(maraname);

		Actiondelete model = Actiondelete.instance();
		model.deleteinform(Mdto);
		return "index.html";
	}
}
