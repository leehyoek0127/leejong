package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.PlayerRegistDto;
import model.PlayerRegist_Action;


public class TeamPlayer_Service implements Cominterface {
	static TeamPlayer_Service impl = new TeamPlayer_Service();

	public static TeamPlayer_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("TeamRanking_Service.java 접근");
		request.setCharacterEncoding("UTF-8");
		int t_code = Integer.parseInt(request.getParameter("teamcode"));
		PlayerRegistDto Player = new PlayerRegistDto();
		Player.setT_code(t_code);
		System.out.println("팀 코드 "+t_code);
		PlayerRegist_Action playerlist = PlayerRegist_Action.instance();	
		ArrayList<PlayerRegistDto> PlayerList =  (ArrayList<PlayerRegistDto>) playerlist.getPlayerList(Player);
		System.out.println("플레이어리스트에 잘 들어갔는지 0번재 플레이어 골로 확인" +PlayerList.get(0).getPlayer_goals());
		request.setAttribute("PlayerList", PlayerList);
		System.out.println("TeamPlayer_Service에 입력 성공");
		return "team_players.jsp";

	}
}
