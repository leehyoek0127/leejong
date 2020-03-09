package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import model.TeamBoardDetail_Action;
import model.TeamBoardListDto;
import model.TeamBoardRepDto;
import model.TeamBoardRepInsert_Action;
import model.TeamBoardRep_Action;

public class TeamBoardRepInsert_Service implements Cominterface {
	static TeamBoardRepInsert_Service impl = new TeamBoardRepInsert_Service();

	public static TeamBoardRepInsert_Service instance() {
		return impl;

	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		
		int t_b_no=Integer.parseInt(request.getParameter("T_B_NO"));
		
		String tb_rep_contents = request.getParameter("TB_REP_CONTENTS");
		tb_rep_contents = new String(tb_rep_contents.getBytes("8859_1"), "utf-8");
		
		
		
		TeamBoardRepDto teamboardrep = new TeamBoardRepDto();
		teamboardrep.setId(id);
		teamboardrep.setT_b_no(t_b_no);
		teamboardrep.setTb_rep_contents(tb_rep_contents);
		
		TeamBoardRepInsert_Action teamBoardRepModel = TeamBoardRepInsert_Action.instance();
		int count = teamBoardRepModel.TeamRepInsert(teamboardrep);

		
		
		return "teamboarddetail.do?command=teamboarddetail&teamBoardNo="+t_b_no;

	}
}
