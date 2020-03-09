package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TeamDto;
import model.TeamList_Action;

public class TeamInfoService implements Cominterface {
	static TeamInfoService impl = new TeamInfoService();
	public static TeamInfoService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("TeamInfo_Service.java ����");
		request.setCharacterEncoding("UTF-8");
		int teamcode = Integer.parseInt(request.getParameter("teamcode"));
		System.out.println("���ڵ� : "+teamcode);
		//20200213 ���� �������ϱ�
		TeamDto team = new TeamDto();
		team.setT_code(teamcode);
		System.out.println("�˻��� �ڵ� : "+ team.getT_code());
		TeamList_Action teamlistmodel = TeamList_Action.instance();
		
		ArrayList<TeamDto> TeamList = (ArrayList<TeamDto>) teamlistmodel.selectTeamOne(team);
		
		request.setAttribute("TeamList", TeamList);
		return "team_info.jsp";

	}
}
