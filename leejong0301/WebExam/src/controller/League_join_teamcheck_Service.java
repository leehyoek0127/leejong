package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LeagueDto;
import model.LeagueResultDto;
import model.League_join_step2_Action;
import model.League_join_teamcheck_Action;
import model.PlayerRegistDto;

public class League_join_teamcheck_Service implements Cominterface {
	static League_join_teamcheck_Service impl = new League_join_teamcheck_Service();

	public static League_join_teamcheck_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String team_name=request.getParameter("team_name");
		team_name= new String(team_name.getBytes("8859_1"), "utf-8");
		int t_code=Integer.parseInt(request.getParameter("team_code"));
		int league_code=Integer.parseInt(request.getParameter("league_code"));
		String id=request.getParameter("id");
		System.out.println("앞의아이디: ㅇㅇㅇㅇ"+id);
		String leagueteamresult="false";
		LeagueResultDto leagueResultDto = new LeagueResultDto();
		leagueResultDto.setLeague_code(league_code);
		leagueResultDto.setT_code(t_code);
		
		PlayerRegistDto playerRegistDto = new PlayerRegistDto();
		playerRegistDto.setId(id);
		playerRegistDto.setLeague_code(league_code);
		playerRegistDto.setT_code(t_code);
		League_join_teamcheck_Action leaguemodel = League_join_teamcheck_Action.instance();
		ArrayList<LeagueResultDto> leagueteamcheck = (ArrayList<LeagueResultDto>) leaguemodel.leagueteamcheck(leagueResultDto);
		ArrayList<PlayerRegistDto> playerleaguecheck = (ArrayList<PlayerRegistDto>)leaguemodel.playerleaguecheck(playerRegistDto);
		
//		League_BranchList_Action leaguebranchmodel = League_BranchList_Action.instance();
//		ArrayList<BranchDto> LeagueBranchList = (ArrayList<BranchDto>) leaguebranchmodel.getLeagueBranchList();
		System.out.println("가져온리그코드있냐 : "+leagueteamcheck.get(0).getLeague_code());
		
		if(!leagueteamcheck.isEmpty()) {
			leagueteamresult="true";
		}else {
			leagueteamresult="false";
		}
		
		if(!playerleaguecheck.isEmpty()) { //이미 등록된 회원입니다.
			leagueteamresult+="+";
		}
		
		return leagueteamresult;

	}
}