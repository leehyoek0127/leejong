package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.TeamDto;
import model.TeamSearchAction;


public class TeamSearchService implements Cominterface{
	
	static TeamSearchService impl = new TeamSearchService();
	public static TeamSearchService instance() { //instance �޼ҵ尡 �� ��ü�� �����ϴ� �� �̰��� �̱��� ���� !  static �� �پ������Ƿ� �ѹ� ����� ������ ����ؼ� �� �� �����Ƿ� �ߺ��� �ȵ����� 
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String teamtype = request.getParameter("teamtype");
		System.out.println("�� Ÿ�� : "+teamtype);
		String branchcode = request.getParameter("branchcode");
		System.out.println("�����ڵ� : "+branchcode);
		String word = request.getParameter("word");
		System.out.println("���� : "+word);
		
		
		TeamDto teamlist = new TeamDto();
		
			
		
		teamlist.setTeamtype(teamtype);
		teamlist.setBranchcode(branchcode);
		teamlist.setWord(word);
		System.out.println("�˻����� :"+teamlist.getTeamtype()+"���� �ڵ� : "+branchcode+"���� : " +word);
		
		
		//20200219 ������Ʈ �˻�
		
		
		TeamSearchAction teamlistmodel = TeamSearchAction.instance();
		ArrayList<TeamDto> list = (ArrayList<TeamDto>)teamlistmodel.searchinform(teamlist);
		ArrayList<TeamDto> RegistPlayer = (ArrayList<TeamDto>) teamlistmodel.getRegistPlayer();
		if(list.size()==0) {
			PrintWriter out=response.getWriter();
			out.println("<script>alert('�ش��ϴ� ������ �����ϴ�.');</script>");
			System.out.println("�ش��ϴ� ������ �����ϴ�.");
		}
		else {
		
		request.setAttribute("TeamList", list);
		request.setAttribute("RegistPlayer", RegistPlayer);
		System.out.println(list.get(0).getT_name()+list.get(0).getT_logo()+list.get(0).getT_class());
		System.out.println("last list�� ������"+list.size());
		}
		return "team_list.jsp";
	}
}

