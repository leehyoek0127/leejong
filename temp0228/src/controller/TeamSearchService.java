package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.TeamDto;
import model.TeamSearchAction;


public class TeamSearchService implements Cominterface{
	
	static TeamSearchService impl = new TeamSearchService();
	public static TeamSearchService instance() { //instance 메소드가 늘 객체를 리턴하는 것 이것이 싱글톤 패턴 !  static 이 붙어있으므로 한번 만들어 놓으면 계속해서 쓸 수 있으므로 중복이 안되지만 
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String teamtype = request.getParameter("teamtype");
		System.out.println("팀 타입 : "+teamtype);
		String branchcode = request.getParameter("branchcode");
		System.out.println("지점코드 : "+branchcode);
		String word = request.getParameter("word");
		System.out.println("내용 : "+word);
		
		
		TeamDto teamlist = new TeamDto();
		
			
		
		teamlist.setTeamtype(teamtype);
		teamlist.setBranchcode(branchcode);
		teamlist.setWord(word);
		System.out.println("검색내용 :"+teamlist.getTeamtype()+"지점 코드 : "+branchcode+"내용 : " +word);
		
		
		//20200219 팀리스트 검색
		
		
		TeamSearchAction teamlistmodel = TeamSearchAction.instance();
		ArrayList<TeamDto> list = (ArrayList<TeamDto>)teamlistmodel.searchinform(teamlist);
		ArrayList<TeamDto> RegistPlayer = (ArrayList<TeamDto>) teamlistmodel.getRegistPlayer();
		if(list.size()==0) {
			PrintWriter out=response.getWriter();
			out.println("<script>alert('해당하는 내용이 없습니다.');</script>");
			System.out.println("해당하는 내용이 없습니다.");
		}
		else {
		
		request.setAttribute("TeamList", list);
		request.setAttribute("RegistPlayer", RegistPlayer);
		System.out.println(list.get(0).getT_name()+list.get(0).getT_logo()+list.get(0).getT_class());
		System.out.println("last list의 사이즈"+list.size());
		}
		return "team_list.jsp";
	}
}

