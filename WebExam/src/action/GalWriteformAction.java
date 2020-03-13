package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDto;
import svc.GalWriteformService;
import vo.ActionForward;
import vo.PageInfo;

public class GalWriteformAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 System.out.println("BoardListAction.java");
		 request.setCharacterEncoding("UTF-8");
		
		ArrayList<TeamDto> teamList=new ArrayList<TeamDto>();
	  	int page=1;
		int limit=10;
		int listCount=1;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		
		GalWriteformService galWriteformService = new GalWriteformService();
		String id = request.getParameter("id");
		
		
		if(id!="GUEST") {
			teamList = galWriteformService.getteamlistid(id);
		}
		
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
		request.setAttribute("teamList", teamList);
		
		
		ActionForward forward= new ActionForward();
  		forward.setPath("/gal_board_write.jsp");
  		return forward;
  		
	 }
	 
}