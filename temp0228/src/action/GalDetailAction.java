package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.GalDetailService;
import vo.ActionForward;


import vo.GalBoardDto;
import vo.GalRepDto;

 public class GalDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 System.out.println("BoardDetailAction.java");
		
		 
		 
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		GalDetailService boardDetailService = new GalDetailService();
		GalBoardDto article = boardDetailService.getArticle(board_num);
		
		
		
		
		ArrayList<GalRepDto> articlelist = boardDetailService.getArticleRep(board_num);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   	
	   	
	   	request.setAttribute("articlelist", articlelist);
	   	
	   	
   		forward.setPath("/gal_board_view.jsp");
   		return forward;

	 }
	 
}