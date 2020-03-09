package controller;

import java.io.PrintWriter;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.TeamDto;
import model.TeamRegistAction;



public class TeamRegistService implements Cominterface {

	static TeamRegistService impl = new TeamRegistService();

	public static TeamRegistService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//Random random = new Random();
		
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		
		String t_name = request.getParameter("t_name");
		t_name = new String(t_name.getBytes("8859_1"), "utf-8");
		String t_type = request.getParameter("t_type");
		t_type = new String(t_type.getBytes("8859_1"), "utf-8");
		String uniform_h_t = request.getParameter("t_h_uniform_t");
		uniform_h_t = new String(uniform_h_t.getBytes("8859_1"), "utf-8");
		String uniform_h_b = request.getParameter("t_h_uniform_b");
		uniform_h_b = new String(uniform_h_b.getBytes("8859_1"), "utf-8");
		String uniform_h_s = request.getParameter("t_h_uniform_s");
		uniform_h_s = new String(uniform_h_s.getBytes("8859_1"), "utf-8");
		String uniform_a_t = request.getParameter("t_a_uniform_t");
		uniform_a_t = new String(uniform_a_t.getBytes("8859_1"), "utf-8");
		String uniform_a_b = request.getParameter("t_a_uniform_b");
		uniform_a_b = new String(uniform_a_b.getBytes("8859_1"), "utf-8");
		String uniform_a_s = request.getParameter("t_a_uniform_s");
		uniform_a_s = new String(uniform_a_s.getBytes("8859_1"), "utf-8");
		String t_email = request.getParameter("t_email");
//		String email1 = request.getParameter("email1");
//		String email2 = request.getParameter("email2");
		String t_logo = request.getParameter("t_logo");
		t_logo = new String(t_logo.getBytes("8859_1"), "utf-8");
		//int t_code =  random.nextInt(1000000);
		
		TeamDto TeamDto = new TeamDto();
		
		TeamDto.setId(id);
		TeamDto.setT_name(t_name);
		TeamDto.setT_class(t_type);
		TeamDto.setT_uniform_home("상의 - "+uniform_h_t+" 하의 - "+uniform_h_b+" 스타킹 - "+uniform_h_s);
		TeamDto.setT_uniform_away("상의 - "+uniform_a_t+" 하의 - "+uniform_a_b+" 스타킹 - "+uniform_a_s);
		TeamDto.setT_email(t_email);
		TeamDto.setT_logo(t_logo);
		//TeamDto.setT_code(t_code);
		
		TeamRegistAction model = TeamRegistAction.instance();
		System.out.println("TeamRegistService 접근3");
		model.insertinform(TeamDto);
		System.out.println("TeamRegistService 접근4");
		return "registResult.jsp";
	}

}
