package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Team_RegistService implements Cominterface{

	static Team_RegistService teamregi = new Team_RegistService();
	public static Team_RegistService instance() { 
		return teamregi;

	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
