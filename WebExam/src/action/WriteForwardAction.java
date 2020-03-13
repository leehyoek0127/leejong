package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDto;
import svc.GalListService;
import vo.ActionForward;
import vo.GalBoardDto;
import vo.PageInfo;

public class WriteForwardAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 System.out.println("BoardListAction.java");
		 request.setCharacterEncoding("UTF-8");
		
		ArrayList<TeamDto> teamList=new ArrayList<TeamDto>();




		teamList = boardListService.getTeamList();
		//�� ������ ��.
  		int maxPage=(int)((double)listCount/limit+0.95); //0.95�� ���ؼ� �ø� ó��.
  		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
  		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
  		//���� �������� ������ ������ ������ ��.(10, 20, 30 ��...)
  	        int endPage = startPage+10-1;

  		if (endPage> maxPage) endPage= maxPage;

  		PageInfo pageInfo = new PageInfo();
  		pageInfo.setEndPage(endPage);
  		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		request.setAttribute("teamList", teamList);
		ActionForward forward= new ActionForward();
  		forward.setPath("/gal_board_list.jsp");
  		return forward;
  		
	 }
	 
}